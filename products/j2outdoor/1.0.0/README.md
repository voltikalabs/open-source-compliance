# J2Outdoor 1.0.0 Open-Source Compliance

J2Outdoor application code and original assets are proprietary. This directory
provides notices and compliance materials for the open-source components
distributed with J2Outdoor 1.0.0 for Android `arm64-v8a`.

## Build summary

- Release status: pre-release; production endpoint and final Play artifact are
  not yet approved
- Android package ID: `id.web.voltikalabs.j2outdoor`
- Qt version: 6.10.3
- Qt linking: separate Android shared libraries
- Qt source modifications: four official post-release security patches
- Qt packaging provenance: corrected signed staging APK and AAB built from the
  reviewed patched Qt installation; matching stripped library hashes are
  recorded below
- Android ABI: `arm64-v8a`
- Minimum Android API: 28
- Audited staging signed APK SHA-256 (verification only):
  `8B207E56420464E2A9E2A374ECB590DF6F1DF8541113F1AB7629CA13C3679970`
- Audited staging signed AAB SHA-256 (verification only):
  `A23B6120547A4E4EFCCCC98BC31ACB115B5CDD0EFDDA9BC027FA40535836D6FA`
- Signer certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`

## Corresponding Qt source

The exact Qt 6.10.3 corresponding source is documented at:

https://github.com/voltikalabs/open-source-compliance/tree/main/sources/qt/6.10.3

## Distribution artifacts

No artifact represented by the current hashes is approved for Google Play.
They identify the corrected staging verification candidate. After production
DNS/TLS and final regression gates pass, this directory must be regenerated
from an explicit production build before distribution.

The final signed Android App Bundle (`.aab`) submitted to Google Play and an
optional signed verification APK may later be published as GitHub Release
assets. They are intentionally not stored as Git blobs.

Signing keystores, signing passwords, service credentials, and other private
release secrets are never published. Publishing the compiled APK or AAB does
not publish the proprietary J2Outdoor application source code.

## Documents

- [Open-source notice](NOTICE.txt)
- [Current release status](STATUS.md)
- [Component manifest](COMPONENTS.md)
- [Android relinking instructions](ANDROID-RELINKING.md)
- [Audited native-library inventory](native-libraries.txt)
- [Signed APK audit summary](audit-report.txt)
- [Signed AAB audit summary](audit-report-aab.txt)
- [Signed artifact checksums](SHA256SUMS.txt)
- [Packaged Qt and OpenSSL hashes](PACKAGED-NATIVE-SHA256SUMS.txt)
- [Android artifact verification](ANDROID-VERIFICATION.md)
- [Account deletion instructions](ACCOUNT-DELETION.md)
- [Privacy Policy](PRIVACY-POLICY.md)
- [Qt 6.10.3 security patch set](../../../sources/qt/6.10.3/SECURITY-PATCHES.md)
- [Patched Qt Android build hashes](../../../sources/qt/6.10.3/PATCHED-ANDROID-BUILD.md)
