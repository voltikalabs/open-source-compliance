param(
    [Parameter(Mandatory=$true)][string]$TargetCommit,
    [string]$OutputRoot = 'D:/Projects/VoltikaLabs/Github/repo/j2-outdoor/build/release-archive-v11'
)
$ErrorActionPreference = 'Stop'
$api = 'https://api.github.com/repos/voltikalabs/open-source-compliance'
$tag = 'j2outdoor-1.0.0-v11-rc1'
# Retrieve existing GitHub authentication into memory; never log or persist it.
$credentialOutput = "protocol=https`nhost=github.com`n`n" | git credential fill
if ($LASTEXITCODE -ne 0) { throw 'GitHub credential retrieval failed.' }
$tokenLine = $credentialOutput | Where-Object { $_.StartsWith('password=') } | Select-Object -First 1
if (-not $tokenLine) { throw 'No existing GitHub credential available.' }
$headers = @{ Authorization = 'Bearer ' + $tokenLine.Substring(9); Accept = 'application/vnd.github+json'; 'X-GitHub-Api-Version' = '2022-11-28' }
$credentialOutput = $null; $tokenLine = $null
$releases = Invoke-RestMethod "$api/releases" -Headers $headers
$release = $releases | Where-Object tag_name -eq $tag | Select-Object -First 1
$notes = @'
Owner-approved J2Outdoor 1.0.0 v11 production candidate for Android arm64-v8a.

This is NOT a completed Google Play release. Account verification, actual Data safety submission, final listing checks, and Play-generated package verification remain pending.

Assets include the unchanged audited signed AAB and verification APK, plus a complete compliance ZIP containing exact Qt source, patches, build scripts, SBOMs, notices, inventory, rental/privacy documents, owner approval, relinking evidence, and the current checklist. No proprietary application source or signing credentials are included.

Verify downloads against RELEASE-ASSET-SHA256SUMS.txt. Preserve these bytes for the eventual Play submission or create a new candidate if rebuilding.

Archive contents and retention: https://github.com/voltikalabs/open-source-compliance/blob/main/products/j2outdoor/1.0.0/RELEASE-ARCHIVE.md
'@
if (-not $release) {
    $body = @{tag_name=$tag;target_commitish=$TargetCommit;name='J2Outdoor 1.0.0 v11 - compliance candidate';body=$notes;draft=$true;prerelease=$true} | ConvertTo-Json
    $release = Invoke-RestMethod "$api/releases" -Headers $headers -Method Post -ContentType 'application/json' -Body $body
    Write-Output "Created draft release $($release.id)"
}
$paths = @(
    (Join-Path $OutputRoot 'J2Outdoor-1.0.0-v11-compliance-complete.zip'),
    (Join-Path $OutputRoot 'payload/J2Outdoor-1.0.0-v11-arm64-signed.apk'),
    (Join-Path $OutputRoot 'payload/J2Outdoor-1.0.0-v11-arm64.aab'),
    (Join-Path $OutputRoot 'RELEASE-ASSET-SHA256SUMS.txt')
)
foreach ($path in $paths) {
    $name = [IO.Path]::GetFileName($path)
    $hash = (Get-FileHash $path).Hash.ToLowerInvariant()
    $assets = Invoke-RestMethod "$api/releases/$($release.id)/assets" -Headers $headers
    $asset = $assets | Where-Object name -eq $name | Select-Object -First 1
    if (-not $asset) {
        Write-Output "Uploading $name ($((Get-Item $path).Length) bytes)"
        $upload = 'https://uploads.github.com/repos/voltikalabs/open-source-compliance/releases/' + $release.id + '/assets?name=' + [Uri]::EscapeDataString($name)
        $asset = Invoke-RestMethod $upload -Headers $headers -Method Post -ContentType 'application/octet-stream' -InFile $path -TimeoutSec 3600
    }
    if ($asset.size -ne (Get-Item $path).Length -or $asset.digest -ne "sha256:$hash") {
        throw "Remote digest/size mismatch or unavailable for $name; draft left unpublished."
    }
    Write-Output "Verified GitHub SHA-256: $name"
}
if ($release.draft) {
    $release = Invoke-RestMethod "$api/releases/$($release.id)" -Headers $headers -Method Patch -ContentType 'application/json' -Body (@{draft=$false;prerelease=$true;make_latest='false'} | ConvertTo-Json)
}
Write-Output "PUBLISHED: $($release.html_url)"
