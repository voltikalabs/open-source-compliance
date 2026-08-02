param(
    [Parameter(Mandatory = $true)]
    [string]$OutputDirectory
)

$ErrorActionPreference = "Stop"
$version = "6.10.3"
$expectedSha256 = "cbc81e726b0ff3c0cdb0219bf74545e91cec013c4a8503c20f93f83d73dff5d2"
$url = "https://download.qt.io/archive/qt/6.10/6.10.3/single/qt-everywhere-src-6.10.3.tar.xz"

$destinationDirectory = [System.IO.Path]::GetFullPath($OutputDirectory)
[System.IO.Directory]::CreateDirectory($destinationDirectory) | Out-Null
$archive = Join-Path $destinationDirectory "qt-everywhere-src-$version.tar.xz"

Write-Host "Downloading the exact Qt $version corresponding source archive..."
Invoke-WebRequest -Uri $url -OutFile $archive

$actualSha256 = (Get-FileHash -LiteralPath $archive -Algorithm SHA256).Hash.ToLowerInvariant()
if ($actualSha256 -ne $expectedSha256) {
    throw "Qt source SHA-256 mismatch. Expected $expectedSha256, received $actualSha256"
}

Write-Host "Verified: $archive"
Write-Host "SHA-256: $actualSha256"
