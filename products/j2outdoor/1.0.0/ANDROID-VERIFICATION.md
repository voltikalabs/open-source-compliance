# Android Artifact Verification

Verification date: 2026-09-30

This record covers the corrected locally generated J2Outdoor 1.0.0 **staging**
candidate for Android `arm64-v8a`. It is verification evidence only and is not
approved for Google Play. Final production and Play-generated APKs must be
audited separately.

- Package ID: `id.web.voltikalabs.j2outdoor`
- Minimum SDK: 28
- Target and compile SDK: 36
- Signed APK SHA-256:
  `8B207E56420464E2A9E2A374ECB590DF6F1DF8541113F1AB7629CA13C3679970`
- Signed AAB SHA-256:
  `A23B6120547A4E4EFCCCC98BC31ACB115B5CDD0EFDDA9BC027FA40535836D6FA`
- Local signing certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`
- APK signature: Android v3, one signer, verified
- AAB signature: JAR signature verified
- APK 16 KiB ZIP alignment: passed
- Native ELF 16 KiB alignment: 96 passed, 0 failed
- Qt Multimedia Android class indicator in DEX: present
- Packaged permissions: camera, internet, network state, and Android's generated
  non-exported dynamic-receiver permission

The release-signed staging APK passed cold startup, storefront retrieval,
primary navigation, background/resume, and embedded-license tests on a physical
Android 16 arm64-v8a device without a fatal Qt/JNI/class-loading error.

The APK and AAB also contain identical hashes for the reviewed Qt and OpenSSL
shared libraries. See `PACKAGED-NATIVE-SHA256SUMS.txt`.

After production DNS/TLS passes, generate and audit a new explicit production
build. Google Play App Signing may sign generated APKs using a certificate
different from the local upload key. After upload, the Play-generated artifacts
must be downloaded and checked again for identity, permissions, signatures,
native libraries, and 16 KiB alignment.
