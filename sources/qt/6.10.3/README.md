# Qt 6.10.3 Corresponding Source

Voltika Labs products listed in this repository use the official Qt 6.10.3
release. Product manifests identify any additional patches applied to the Qt
binaries shipped by that product.

## Source archive

`qt-everywhere-src-6.10.3.tar.xz` must be uploaded as an asset of the GitHub
Release tagged `qt-6.10.3-source`:

https://github.com/voltikalabs/open-source-compliance/releases/tag/qt-6.10.3-source

Expected SHA-256:

```text
cbc81e726b0ff3c0cdb0219bf74545e91cec013c4a8503c20f93f83d73dff5d2
```

The archive is intentionally not committed to Git because it is approximately
1.2 GiB. Use `download-qt-source.ps1` to download and verify the exact archive
before uploading it as a release asset.

## Post-release security patches

J2Outdoor's next 1.0.0 release candidate is required to build Qt from the
official source archive plus the four official Qt 6.10 patches under
[`patches`](patches). Their purpose, applicability, order, and SHA-256 hashes
are documented in [`SECURITY-PATCHES.md`](SECURITY-PATCHES.md) and
[`SHA256SUMS.txt`](SHA256SUMS.txt).

Publishing patches is not proof that a binary contains them. The final product
inventory must record hashes of Qt libraries compiled from the patched source.

The verified Android build configuration and shared-library hashes are recorded
in [`PATCHED-ANDROID-BUILD.md`](PATCHED-ANDROID-BUILD.md).
