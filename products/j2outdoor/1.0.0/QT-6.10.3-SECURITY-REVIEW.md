# Qt 6.10.3 Security Review

Review date: 2026-09-29

Scope: official Qt security advisories published after the Qt 6.10.3 release,
matched against the native libraries in the audited J2Outdoor Android
`arm64-v8a` candidate. The review must be repeated immediately before every
release because new advisories may be published later.

## Required patch set

| Advisory | Shipped surface | Decision |
|---|---|---|
| CVE-2026-6210 | Qt SVG (`libQt6Svg` and SVG plugins) | Apply the official Qt 6.10 patch. |
| CVE-2026-76151 | Qt Network (`libQt6Network`) | Apply the official Qt 6.10 patch. J2Outdoor uses `QNetworkAccessManager`. |
| CVE-2026-78253 | Qt Core XML stream implementation (`libQt6Core`) | Apply the official Qt 6.10 patch as defense-in-depth. |
| CVE-2026-79616 | Qt Quick (`libQt6Quick`) | Apply the official Qt 6.10 patch as defense-in-depth. |

The unmodified Qt 6.10.3 binaries installed by the Qt Online Installer do not
contain these later patches. Keeping patch files beside corresponding source is
necessary for LGPL source delivery, but it is not sufficient: the final app
must be built with Qt libraries compiled from the patched source.

The official patch files and their hashes are under
`source/patches/qt-6.10.3`. They were verified to apply cleanly to the
published `qt-everywhere-src-6.10.3.tar.xz` archive with SHA-256
`CBC81E726B0FF3C0CDB0219BF74545E91CEC013C4A8503C20F93F83D73DFF5D2`.

## Reviewed but not applicable

| Advisory | Reason |
|---|---|
| dr_wav issue announced 2026-03-12 | Fixed by Qt 6.10.3. |
| CVE-2025-14576 | Fixed in Qt 6.10.2 and later. |
| CVE-2025-14575 | Qt 6.10.3 is outside the affected version range. |
| CVE-2026-9499 | The Qt5Compat library is not shipped. |
| CVE-2026-15037 | The QtXml library and QDom APIs are not shipped or used. |
| CVE-2026-11573 | Fixed before Qt 6.10.3. |
| CVE-2026-13326 | The Qt NFC module is not shipped. |
| CVE-2026-19248 | The QtXml library and QDom APIs are not shipped or used. |

## Patched build evidence

The required QtBase, QtDeclarative, and QtSvg patches were compiled for Android
`arm64-v8a`. The installed Core, Network, QML, Quick, and SVG library hashes,
toolchain details, and generated SBOM coverage are recorded in
`QT-6.10.3-PATCHED-BUILD.md`.

## Release evidence still required

- Configure J2Outdoor against that patched Qt installation.
- Confirm the final AAB/APK contains the patched libraries, not the Online
  Installer originals, by recording their SHA-256 hashes.
- Run the application regression suite and physical-device smoke tests.
- Publish the pristine source archive, all four patches, patch hashes, exact Qt
  configuration/build commands, and the final native-library inventory.
