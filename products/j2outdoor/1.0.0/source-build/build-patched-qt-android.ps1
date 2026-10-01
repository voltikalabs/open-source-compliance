[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceArchive,

    [Parameter(Mandatory = $true)]
    [string]$WorkDirectory,

    [Parameter(Mandatory = $true)]
    [string]$AndroidSdk,

    [Parameter(Mandatory = $true)]
    [string]$AndroidNdk,

    [Parameter(Mandatory = $true)]
    [string]$OpenSslRoot,

    [string]$QtHostPath = 'C:\Qt\6.10.3\mingw_64',
    [string]$CMakeExe = 'C:\Qt\Tools\CMake_64\bin\cmake.exe',
    [string]$NinjaDirectory = 'C:\Qt\Tools\Ninja',
    [string]$Abi = 'arm64-v8a',
    [int]$AndroidApi = 28,
    [int]$ParallelJobs = 4
)

$ErrorActionPreference = 'Stop'
$expectedArchiveHash = 'CBC81E726B0FF3C0CDB0219BF74545E91CEC013C4A8503C20F93F83D73DFF5D2'
$modules = @('qtbase', 'qtshadertools', 'qtdeclarative', 'qtsvg')

function Invoke-Checked {
    param(
        [Parameter(Mandatory = $true)]
        [scriptblock]$Command,
        [Parameter(Mandatory = $true)]
        [string]$Description
    )

    & $Command
    if ($LASTEXITCODE -ne 0) {
        throw "$Description failed with exit code $LASTEXITCODE"
    }
}

function Configure-Build-InstallModule {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,
        [Parameter(Mandatory = $true)]
        [string]$SourceRoot,
        [Parameter(Mandatory = $true)]
        [string]$BuildRoot,
        [Parameter(Mandatory = $true)]
        [string]$Prefix
    )

    $sourcePath = Join-Path $SourceRoot $Name
    $buildPath = Join-Path $BuildRoot "$Name-build"
    New-Item -ItemType Directory -Force -Path $buildPath | Out-Null

    Push-Location $buildPath
    try {
        if (-not (Test-Path -LiteralPath (Join-Path $buildPath 'CMakeCache.txt'))) {
            $configureModule = Join-Path $Prefix 'bin\qt-configure-module.bat'
            Invoke-Checked -Description "Configure $Name" -Command {
                & $configureModule $sourcePath -- -G Ninja
            }
        }

        Invoke-Checked -Description "Build $Name" -Command {
            & $CMakeExe --build . --parallel $ParallelJobs
        }
        Invoke-Checked -Description "Install $Name" -Command {
            & $CMakeExe --install .
        }
    }
    finally {
        Pop-Location
    }
}

$archivePath = (Resolve-Path -LiteralPath $SourceArchive).Path
$sdkPath = (Resolve-Path -LiteralPath $AndroidSdk).Path
$ndkPath = (Resolve-Path -LiteralPath $AndroidNdk).Path
$openSslPath = (Resolve-Path -LiteralPath $OpenSslRoot).Path
$hostPath = (Resolve-Path -LiteralPath $QtHostPath).Path
$cmakePath = (Resolve-Path -LiteralPath $CMakeExe).Path
$ninjaPath = (Resolve-Path -LiteralPath $NinjaDirectory).Path
$workRoot = [System.IO.Path]::GetFullPath($WorkDirectory)
if ($workRoot.Length -gt 60) {
    throw 'WorkDirectory must resolve to a path of 60 characters or fewer because generated Qt Quick Controls files can exceed the Windows path limit.'
}
$sourceParent = Join-Path $workRoot 'source'
$sourceRoot = Join-Path $sourceParent 'qt-everywhere-src-6.10.3'
$buildRoot = Join-Path $workRoot 'build'
$installPrefix = Join-Path $workRoot 'install'

foreach ($requiredOpenSslFile in @(
    'libcrypto_3.so',
    'libssl_3.so'
)) {
    $requiredOpenSslPath = Join-Path $openSslPath $requiredOpenSslFile
    if (-not (Test-Path -LiteralPath $requiredOpenSslPath -PathType Leaf)) {
        throw "Required Android OpenSSL file is missing: $requiredOpenSslPath"
    }
}

# KDAB's Android OpenSSL package keeps headers in ssl_3/include and normally
# exposes them below each ABI through a symlink. Archive extraction on Windows
# can leave that ABI-local symlink unusable, so prefer the real shared header
# directory when it is available.
$openSslIncludePath = Join-Path $openSslPath 'include'
$sharedOpenSslIncludePath = Join-Path (Split-Path -Parent $openSslPath) 'include'
if (Test-Path -LiteralPath (Join-Path $sharedOpenSslIncludePath 'openssl\ssl.h') -PathType Leaf) {
    $openSslIncludePath = $sharedOpenSslIncludePath
}
if (-not (Test-Path -LiteralPath (Join-Path $openSslIncludePath 'openssl\ssl.h') -PathType Leaf)) {
    throw "Required Android OpenSSL header is missing below: $openSslIncludePath"
}

$actualArchiveHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $archivePath).Hash
if ($actualArchiveHash -ne $expectedArchiveHash) {
    throw "Qt source archive SHA-256 mismatch. Expected $expectedArchiveHash, got $actualArchiveHash"
}

New-Item -ItemType Directory -Force -Path $sourceParent, $buildRoot, $installPrefix | Out-Null

foreach ($module in $modules) {
    $modulePath = Join-Path $sourceRoot $module
    if (-not (Test-Path -LiteralPath $modulePath -PathType Container)) {
        Invoke-Checked -Description "Extract $module" -Command {
            & tar -xf $archivePath -C $sourceParent "qt-everywhere-src-6.10.3/$module"
        }
    }
}

& (Join-Path $PSScriptRoot 'apply-qt-security-patches.ps1') -SourceDirectory $sourceRoot

$env:Path = "$ninjaPath;$([System.IO.Path]::GetDirectoryName($cmakePath));$env:Path"
$qtbaseBuild = Join-Path $buildRoot 'qtbase-build'
New-Item -ItemType Directory -Force -Path $qtbaseBuild | Out-Null

Push-Location $qtbaseBuild
try {
    if (-not (Test-Path -LiteralPath (Join-Path $qtbaseBuild 'CMakeCache.txt'))) {
        $qtbaseConfigure = Join-Path $sourceRoot 'qtbase\configure.bat'
        Invoke-Checked -Description 'Configure qtbase' -Command {
            & $qtbaseConfigure `
                -prefix $installPrefix `
                -qt-host-path $hostPath `
                -android-sdk $sdkPath `
                -android-ndk $ndkPath `
                -android-abis $Abi `
                -release `
                -opensource `
                -confirm-license `
                -openssl-runtime `
                -nomake examples `
                -nomake tests `
                -- -G Ninja `
                "-DANDROID_PLATFORM=android-$AndroidApi" `
                "-DOPENSSL_ROOT_DIR=$openSslPath" `
                "-DOPENSSL_INCLUDE_DIR=$openSslIncludePath" `
                "-DOPENSSL_CRYPTO_LIBRARY=$(Join-Path $openSslPath 'libcrypto_3.so')" `
                "-DOPENSSL_SSL_LIBRARY=$(Join-Path $openSslPath 'libssl_3.so')"
        }
    }

    $qtbaseCache = Get-Content -Raw -LiteralPath (Join-Path $qtbaseBuild 'CMakeCache.txt')
    if ($qtbaseCache -notmatch '(?m)^QT_FEATURE_ssl:INTERNAL=ON\r?$' -or
        $qtbaseCache -notmatch '(?m)^QT_FEATURE_openssl:INTERNAL=ON\r?$') {
        throw 'QtBase was configured without OpenSSL/SSL support. Use a fresh WorkDirectory and a valid Android OpenSslRoot.'
    }

    Invoke-Checked -Description 'Build qtbase' -Command {
        & $cmakePath --build . --parallel $ParallelJobs
    }
    Invoke-Checked -Description 'Install qtbase' -Command {
        & $cmakePath --install .
    }
}
finally {
    Pop-Location
}

foreach ($module in @('qtshadertools', 'qtdeclarative', 'qtsvg')) {
    Configure-Build-InstallModule `
        -Name $module `
        -SourceRoot $sourceRoot `
        -BuildRoot $buildRoot `
        -Prefix $installPrefix
}

$binaryNames = @(
    "libQt6Core_$Abi.so",
    "libQt6Network_$Abi.so",
    "libQt6Qml_$Abi.so",
    "libQt6Quick_$Abi.so",
    "libQt6Svg_$Abi.so"
)
$hashOutput = Join-Path $workRoot 'QT-PATCHED-BINARY-SHA256SUMS.txt'
$hashLines = foreach ($binaryName in $binaryNames) {
    $binaryPath = Join-Path $installPrefix "lib\$binaryName"
    if (-not (Test-Path -LiteralPath $binaryPath -PathType Leaf)) {
        throw "Expected patched Qt binary is missing: $binaryPath"
    }
    $hash = (Get-FileHash -Algorithm SHA256 -LiteralPath $binaryPath).Hash
    "$hash  $binaryName"
}
$hashLines | Set-Content -LiteralPath $hashOutput -Encoding ascii

Write-Host "Patched Qt Android build installed at: $installPrefix"
Write-Host "Binary hashes written to: $hashOutput"
