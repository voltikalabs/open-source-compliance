# Replacing Qt Libraries in a J2Outdoor Android Package

These instructions preserve the recipient's ability to use modified LGPL Qt
libraries. Release engineering must test and update them for every published ABI.

## Prerequisites

- The J2Outdoor APK supplied with the release (an AAB must first be converted to
  the generated device APK set).
- ABI-compatible replacement Qt shared libraries built from the corresponding
  source identified by that J2Outdoor release.
- Android SDK Build Tools (`zipalign`, `apksigner`) and a Java `keytool`.
- An Android device that permits installation from the user's chosen source.

## Procedure

1. Treat the APK as a ZIP archive and extract it into a working directory.
2. Select the device ABI, for example `lib/arm64-v8a/`.
3. Replace only the intended LGPL Qt files such as
   `libQt6Core_arm64-v8a.so`; preserve the expected filenames and ABI.
4. Remove the old APK signature entries under `META-INF`, then recreate the
   unsigned APK without adding an extra parent directory. Keep native `.so`
   entries uncompressed; Android packages with direct native-library loading
   may not run if those entries are deflated.
5. Run `zipalign -P 16 -f -v 4 input-unsigned.apk output-aligned.apk`, and then
   run `zipalign -c -P 16 -v 4 output-aligned.apk` to verify it.
6. Create or select a user-controlled signing key with `keytool`.
7. Run `apksigner sign --ks user-key.jks output-aligned.apk`.
8. Verify it using `apksigner verify --verbose output-aligned.apk`.
9. Uninstall the official package if Android reports a signature conflict, then
   install the user-signed package with `adb install output-aligned.apk`.
10. Confirm that the replacement library's SHA-256 differs from the originally
    packaged file, launch the application, exercise the affected function, and
    retain a test record containing the device, Android version, ABI, hashes,
    signature verification, installation result, and observed behavior.

The distributor does not provide its private release-signing key. Android allows
the recipient to sign the modified package using a recipient-controlled key.
J2Outdoor 1.0.0 does not distribute a custom EULA. If one is adopted later, it
must not prohibit this operation or reverse engineering performed for debugging
modifications to LGPL-covered libraries.
