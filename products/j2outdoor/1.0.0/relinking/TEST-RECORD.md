# Android LGPL Relinking Test Record

This record documents the physical-device engineering proof. Repeat the same
test against the final production candidate after its DNS/TLS release gate is
open, without recording device identifiers or user data.

- Test date: 2026-09-30
- Tester: owner-authorized, Codex-assisted engineering test
- Device model: Samsung SM-A566B
- Android version / API: Android 16 / API 36
- ABI: arm64-v8a
- Original APK filename and SHA-256: `android-build-debug.apk`, `470EB615C717CD31D147AE786B033D88F07CC708762C5497A5EB3253F929B776`
- API profile: staging
- Replaced Qt library: `lib/arm64-v8a/libQt6Svg_arm64-v8a.so`
- Original packaged library SHA-256: `8810F2D33F1BF423A6348A321208749AA1D82CA735DC87D4689CF2D6B05305A5`
- Replacement library SHA-256: `E86AA6B2A07CEE702EE624E33FD5468ADD4A4587398E3A0411E414B7D182A3AE`
- Replacement Qt source/build reference: Qt 6.10.3 plus the archived patches and build process in `compliance/QT-6.10.3-PATCHED-BUILD.md`
- Repacked APK SHA-256: `B80D98077E7E47DA9136EA20CD489859BC5E2193E37925F3799795CC02B4F2AA`
- Test signing-certificate SHA-256: `1e2305a68a8eefd06f5062927548f84bf8b0c2a0b0de520e311c93b788cfaad1` (Android debug test key; not the release signer)
- `zipalign -c -P 16 -v 4` result: verification successful
- `apksigner verify --verbose` result: v3 verified, one signer
- Installation result: `adb install -r` succeeded without clearing application data
- Application launch result: passed; process remained alive and Android crash buffer was empty
- Function exercised: application startup, Qt/JNI loading, staging storefront retrieval, promotion/category/product rendering
- Outcome and observations: passed. The replacement hash differed from the packaged hash, the modified APK installed and ran, staging data remained visible, and no `JNI_ERR`, unresolved symbol, `UnsatisfiedLinkError`, or `ClassNotFoundException` was observed.

The test key is recipient-controlled test material. Do not commit a keystore,
password, device identifier, customer data, or other secret with this record.

## Production final repetition

The same procedure was repeated against the exact production release candidate:

- Test date: 2026-09-30
- Device model: Samsung SM-A566B
- Android version / API: Android 16 / API 36
- ABI: arm64-v8a
- Original signed APK SHA-256: `8E0C5BA0267A2A69BEB8B740C67EE005C5B2E735548CAA4EE68E255DEFBE6005`
- API profile: production
- Replaced Qt library: `lib/arm64-v8a/libQt6Svg_arm64-v8a.so`
- Original packaged library SHA-256: `8810F2D33F1BF423A6348A321208749AA1D82CA735DC87D4689CF2D6B05305A5`
- Replacement library SHA-256: `E86AA6B2A07CEE702EE624E33FD5468ADD4A4587398E3A0411E414B7D182A3AE`
- Relinked test APK SHA-256: `1AA45662C9BFD33957874951D92B367D0C67460F947FDEB7041FB7444A582AA0`
- Test signing-certificate SHA-256: `1e2305a68a8eefd06f5062927548f84bf8b0c2a0b0de520e311c93b788cfaad1`
- APK signature verification: Android v3, one signer, passed
- 16 KiB ZIP alignment verification: passed
- Installation: official APK uninstalled and test-signed APK installed successfully
- Runtime: process remained alive as the top resumed activity; J2Outdoor Home UI was present
- PID-scoped fatal/JNI/class/native-link scan: passed
- Restore: test APK uninstalled; exact official production APK reinstalled and launched successfully
- Outcome: passed. The final production package permits replacement, repackaging,
  user signing, installation, and execution with a modified LGPL Qt library.
