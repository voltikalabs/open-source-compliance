param(
    [string]$AppRoot = 'D:/Projects/VoltikaLabs/Github/repo/j2-outdoor',
    [string]$OutputRoot = 'D:/Projects/VoltikaLabs/Github/repo/j2-outdoor/build/release-archive-v11'
)
$ErrorActionPreference = 'Stop'
$repo = Split-Path $PSScriptRoot -Parent
$public = Join-Path $repo 'products/j2outdoor/1.0.0'
$stage = Join-Path $OutputRoot 'payload'
New-Item -ItemType Directory -Force -Path $stage | Out-Null
if (Get-ChildItem $stage -Force) { throw 'Use an empty output payload directory.' }
$inputs = @(
    @('build/papp-ssl/src/android-build/build/outputs/apk/release/android-build-release-signed.apk', 'J2Outdoor-1.0.0-v11-arm64-signed.apk', 'A1BFC7BD97E9E7C543F241BC381A04C772E56D62E800C32BA2AED959D0F78C67'),
    @('build/papp-ssl/src/android-build/build/outputs/bundle/release/android-build-release.aab', 'J2Outdoor-1.0.0-v11-arm64.aab', '7E2C1F4228AD01930BB9114102AE4C1791B6E90757D6233ED2EBB95B47F1B99A'),
    @('build/qt-source/qt-everywhere-src-6.10.3.tar.xz', 'qt-everywhere-src-6.10.3.tar.xz', 'CBC81E726B0FF3C0CDB0219BF74545E91CEC013C4A8503C20F93F83D73DFF5D2')
)
foreach ($item in $inputs) {
    $source = Join-Path $AppRoot $item[0]
    if ((Get-FileHash $source).Hash -ne $item[2]) { throw "Unexpected input hash: $($item[1])" }
    Copy-Item -LiteralPath $source -Destination (Join-Path $stage $item[1])
}
Copy-Item -LiteralPath $public -Destination (Join-Path $stage 'compliance') -Recurse
Copy-Item -LiteralPath (Join-Path $repo 'sources/qt/6.10.3') -Destination (Join-Path $stage 'qt-source-metadata') -Recurse
$forbidden = Get-ChildItem $stage -Recurse -File | Where-Object { $_.Extension -in '.keystore','.jks','.p12','.pem','.idsig' -or $_.Name -match '^\.env|EULA-DRAFT' }
if ($forbidden) { throw 'Unexpected sensitive file type in archive.' }
$manifest = Get-ChildItem $stage -Recurse -File | Sort-Object FullName | ForEach-Object {
    $relative = [IO.Path]::GetRelativePath($stage, $_.FullName).Replace('\','/')
    '{0}  {1}' -f (Get-FileHash $_.FullName).Hash, $relative
}
$manifest | Set-Content (Join-Path $stage 'ARCHIVE-FILE-SHA256SUMS.txt') -Encoding utf8
Add-Type -AssemblyName System.IO.Compression.FileSystem
$zip = Join-Path $OutputRoot 'J2Outdoor-1.0.0-v11-compliance-complete.zip'
if (Test-Path $zip) { throw 'Archive already exists; do not overwrite it.' }
[IO.Compression.ZipFile]::CreateFromDirectory($stage, $zip, [IO.Compression.CompressionLevel]::NoCompression, $false)
$archive = [IO.Compression.ZipFile]::OpenRead($zip)
try {
    foreach ($entry in $archive.Entries) {
        if ($entry.Name -eq 'ARCHIVE-FILE-SHA256SUMS.txt') { continue }
        $stream = $entry.Open()
        $sha = [Security.Cryptography.SHA256]::Create()
        try { $hash = [Convert]::ToHexString($sha.ComputeHash($stream)) } finally { $stream.Dispose(); $sha.Dispose() }
        if ("$hash  $($entry.FullName)" -notin $manifest) { throw "Archive verification failed: $($entry.FullName)" }
    }
    if ($archive.Entries.Count -ne ($manifest.Count + 1)) { throw 'Archive entry count mismatch.' }
} finally { $archive.Dispose() }
$assets = @($zip, (Join-Path $stage $inputs[0][1]), (Join-Path $stage $inputs[1][1]))
$assetHashes = $assets | ForEach-Object { '{0}  {1}' -f (Get-FileHash $_).Hash, [IO.Path]::GetFileName($_) }
$assetHashes | Set-Content (Join-Path $OutputRoot 'RELEASE-ASSET-SHA256SUMS.txt') -Encoding utf8
Write-Output "Verified archive: $zip"
Write-Output "Payload files: $($manifest.Count)"
$assetHashes
