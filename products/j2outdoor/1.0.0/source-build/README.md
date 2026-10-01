# Corresponding Qt Source Delivery

Each J2Outdoor binary release must be accompanied by the complete corresponding
source for the exact LGPL-covered Qt binaries shipped in that release.

For Qt 6.10.3, retain the official Qt 6.10.3 source archives covering every
deployed module and plugin, plus:

- every modification or patch applied by Voltika Labs;
- the Qt configuration arguments and toolchain files;
- Android SDK/NDK and compiler versions;
- build commands for every shipped ABI;
- the final binary inventory and SHA-256 hashes; and
- enough installation information to run a build using replacement libraries.

Do not rely solely on Qt's latest-download page. Copy the exact upstream archive
to infrastructure controlled by the distributor and keep it tied to the J2Outdoor
release. A written offer is a legal alternative in some circumstances, but it
must be reviewed by counsel and honored for the required period.

Official Qt source index: https://download.qt.io/archive/qt/6.10/6.10.3/single/

For this release, run `download-qt-source.ps1 -OutputDirectory <release-dir>`.
It downloads `qt-everywhere-src-6.10.3.tar.xz` (approximately 1.2 GiB) and
rejects it unless its SHA-256 is
`cbc81e726b0ff3c0cdb0219bf74545e91cec013c4a8503c20f93f83d73dff5d2`.
The archive is deliberately kept out of Git; copy the verified file into the
release archive and distributor-controlled compliance hosting.

Qt 6.10.3 requires the post-release security patches listed in
`../QT-6.10.3-SECURITY-REVIEW.md`. Apply the verified patch set with:

```powershell
.\apply-qt-security-patches.ps1 -SourceDirectory <extracted-qt-source>
```

Do not describe a release as patched merely because the patch files are
published. The distributed Qt shared libraries must be compiled from that
patched source, and their hashes must be recorded in the final inventory.

For a reproducible Android `arm64-v8a` build, run:

```powershell
.\build-patched-qt-android.ps1 `
    -SourceArchive <qt-everywhere-src-6.10.3.tar.xz> `
    -WorkDirectory C:\qtp `
    -AndroidSdk <Android-SDK-directory> `
    -AndroidNdk <Android-NDK-27.2.12479018-directory> `
    -OpenSslRoot <android-openssl-ssl_3-arm64-v8a-directory>
```

The script verifies the upstream archive, extracts only the required modules,
applies the four verified patches, and builds QtBase, QtShaderTools,
QtDeclarative, and QtSvg. It installs SPDX SBOM files under `install/sbom` and
writes hashes for the patched Core, Network, QML, Quick, and SVG shared
libraries to `QT-PATCHED-BINARY-SHA256SUMS.txt`.

`OpenSslRoot` must contain `libcrypto_3.so` and `libssl_3.so` for the target
ABI. OpenSSL headers may be in `OpenSslRoot/include` or in the sibling shared
`include` directory used by KDAB's Android OpenSSL package. The script passes
the real header and library paths explicitly, configures Qt with runtime
OpenSSL support, and rejects a cached QtBase configuration where SSL is
disabled.

On Windows, keep `WorkDirectory` at 60 characters or fewer. Qt Quick Controls
generates long plugin filenames and deeper paths can fail even when the source
and compiler are otherwise valid. A short dedicated path such as `C:\qtp` is
recommended.
