[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$SourceDirectory,

    [string]$PatchDirectory = (Join-Path $PSScriptRoot 'patches\qt-6.10.3')
)

$ErrorActionPreference = 'Stop'

$sourceRoot = (Resolve-Path -LiteralPath $SourceDirectory).Path
$patchRoot = (Resolve-Path -LiteralPath $PatchDirectory).Path
$hashFile = Join-Path $patchRoot 'SHA256SUMS.txt'

$patches = @(
    @{ Module = 'qtbase'; Name = 'CVE-2026-76151-qtbase-6.10.diff' },
    @{ Module = 'qtbase'; Name = 'CVE-2026-78253-qtbase-6.10.diff' },
    @{ Module = 'qtdeclarative'; Name = 'CVE-2026-79616-qtdeclarative-6.10.diff' },
    @{ Module = 'qtsvg'; Name = 'CVE-2026-6210-qtsvg-6.10.diff' }
)

$expectedHashes = @{}
foreach ($line in Get-Content -LiteralPath $hashFile) {
    if ($line -match '^([0-9A-Fa-f]{64})\s+(.+)$') {
        $expectedHashes[$Matches[2]] = $Matches[1].ToUpperInvariant()
    }
}

foreach ($entry in $patches) {
    $modulePath = Join-Path $sourceRoot $entry.Module
    $patchPath = Join-Path $patchRoot $entry.Name

    if (-not (Test-Path -LiteralPath $modulePath -PathType Container)) {
        throw "Missing Qt module source directory: $modulePath"
    }
    if (-not (Test-Path -LiteralPath $patchPath -PathType Leaf)) {
        throw "Missing security patch: $patchPath"
    }

    $actualHash = (Get-FileHash -Algorithm SHA256 -LiteralPath $patchPath).Hash
    if ($expectedHashes[$entry.Name] -ne $actualHash) {
        throw "SHA-256 mismatch for $($entry.Name)"
    }

    & git -C $modulePath apply --reverse --check $patchPath 2>$null
    if ($LASTEXITCODE -eq 0) {
        Write-Host "Already applied: $($entry.Name)"
        continue
    }

    & git -C $modulePath apply --check $patchPath
    if ($LASTEXITCODE -ne 0) {
        throw "Patch does not apply cleanly: $($entry.Name)"
    }

    & git -C $modulePath apply $patchPath
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to apply patch: $($entry.Name)"
    }

    Write-Host "Applied: $($entry.Name)"
}

Write-Host 'Qt 6.10.3 security patch set applied successfully.'
