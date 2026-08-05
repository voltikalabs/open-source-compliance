# Replacing Qt Libraries in a MyMobileApp Android Package

These instructions preserve the recipient's ability to use modified LGPL Qt
libraries. Release engineering must test and update them for every published ABI.

## Prerequisites

- The MyMobileApp APK supplied with the release (an AAB must first be converted to the
  generated device APK set).
- ABI-compatible replacement Qt shared libraries built from the corresponding
  source identified by that MyMobileApp release.
- Android SDK Build Tools (`zipalign`, `apksigner`) and a Java `keytool`.
- An Android device that permits installation from the user's chosen source.

## Procedure

1. Treat the APK as a ZIP archive and extract it into a working directory.
2. Select the device ABI, for example `lib/arm64-v8a/`.
3. Replace only the intended LGPL Qt files such as
   `libQt6Core_arm64-v8a.so`; preserve the expected filenames and ABI.
4. Recreate the unsigned APK without adding an extra parent directory.
5. Run `zipalign -p -f 4 input-unsigned.apk output-aligned.apk`.
6. Create or select a user-controlled signing key with `keytool`.
7. Run `apksigner sign --ks user-key.jks output-aligned.apk`.
8. Verify it using `apksigner verify --verbose output-aligned.apk`.
9. Uninstall the official package if Android reports a signature conflict, then
   install the user-signed package with `adb install output-aligned.apk`.
10. Exercise the modified library and retain the test record.

The distributor does not provide its private release-signing key. Android allows
the recipient to sign the modified package using a recipient-controlled key.
The EULA must not prohibit this operation or reverse engineering performed for
debugging modifications to LGPL-covered libraries.
