# Android Artifact Verification

Verification date: 2026-09-30

This record covers the locally generated J2Outdoor 1.0.0 **production** release
candidate for Android `arm64-v8a`. It does not cover APKs later generated and
signed by Google Play.

- Package ID: `id.web.voltikalabs.j2outdoor`
- Minimum SDK: 28
- Target and compile SDK: 36
- Signed APK SHA-256:
  `8E0C5BA0267A2A69BEB8B740C67EE005C5B2E735548CAA4EE68E255DEFBE6005`
- Signed AAB SHA-256:
  `A553004DC754E55E3B3849D961A8C9E15FA2166C622E0E19129B71711C5CFDE7`
- Local signing certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`
- APK signature: Android v3, one signer, verified
- AAB signature: JAR signature verified
- APK 16 KiB ZIP alignment: passed
- Native ELF 16 KiB alignment: 96 passed, 0 failed
- Qt Multimedia Android class indicator in DEX: present
- Packaged permissions: camera, internet, network state, and Android's generated
  non-exported dynamic-receiver permission

The exact production APK was update-installed on a physical Android 16
arm64-v8a device. It passed cold startup, remained the top resumed activity,
and produced no PID-scoped fatal exception, JNI, class-loading, or native-link
error. A production relinking proof also passed: QtSvg was replaced in this
exact APK, realigned, recipient-signed, installed, and launched without a
fatal/JNI/class/native-link error; the official APK was restored afterward.
The relinked test APK SHA-256 was
`1AA45662C9BFD33957874951D92B367D0C67460F947FDEB7041FB7444A582AA0`.
Broader storefront, navigation, background/resume, embedded-license, camera/OCR,
authentication, checkout, export/import, and backup tests remain release gates
for this exact artifact.

The APK and AAB also contain identical hashes for the reviewed Qt and OpenSSL
shared libraries. See `PACKAGED-NATIVE-SHA256SUMS.txt`.

Google Play App Signing may sign generated APKs using a certificate different
from the local upload key. After upload, the Play-generated artifacts must be
downloaded and checked again for identity, permissions, signatures, native
libraries, and 16 KiB alignment.
