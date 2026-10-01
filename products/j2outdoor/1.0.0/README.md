# J2Outdoor 1.0.0 Open-Source Compliance

J2Outdoor application code and original assets are proprietary. This directory
provides notices and compliance materials for the open-source components
distributed with J2Outdoor 1.0.0 for Android `arm64-v8a`.

## Build summary

- Release status: signed AES production candidate built and audited; production
  device smoke, publication, Google Play submission, and Play-generated
  artifact verification remain
- Android package ID: `id.web.voltikalabs.j2outdoor`
- Qt version: 6.10.3
- Qt linking: separate Android shared libraries
- Qt source modifications: four official post-release security patches
- Qt packaging provenance: signed production APK and AAB built from the
  reviewed patched Qt installation; matching stripped library hashes are
  recorded below
- Android ABI: `arm64-v8a`
- Minimum Android API: 28
- Audited production signed APK SHA-256:
  `2DAC3A77203E08F6CDBB3E5782D4B3A41CD5859E41671306DFAAC4451AE253B3`
- Audited production signed AAB SHA-256:
  `5C967785C6F5E0B43FACE7AC41764ACB3F3B5B1EADCF5873A200988FC7F03920`
- Signer certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`

The APK/AAB hashes above identify the signed AES candidate containing the exact
ML Kit third-party licenses, supplemental licenses, `J2A1` AES-256-GCM, and
privacy version `2026-10-01-v12-draft`. Package, signature, 16 KiB alignment,
native-library, AES-marker, and embedded-resource checks passed. The staging
AES build successfully saved and displayed a customer telephone number. The
earlier v11 page-level and v10 instrumented OCR/relinking results remain
baseline evidence until the exact production APK smoke test is complete.

## Corresponding Qt source

The exact Qt 6.10.3 corresponding source is documented at:

https://github.com/voltikalabs/open-source-compliance/tree/main/sources/qt/6.10.3

## Distribution artifacts

The hashes identify the newly audited AES production candidate. The preceding
v11 APK/AAB and complete compliance ZIP remain published in the
[v11 prerelease](https://github.com/voltikalabs/open-source-compliance/releases/tag/j2outdoor-1.0.0-v11-rc1).
See [archive contents and retention](RELEASE-ARCHIVE.md). They are Release
assets, not Git blobs. The new AES artifacts have not yet been published.
Production-device smoke,
Google Play submission, Data safety declarations, and Play-generated artifact
checks remain pending.

Source remediation for the next candidate replaces the proprietary local
customer-data cipher with standard AES-256-GCM. It does not modify the
immutable v11 assets; see
[customer local encryption status](CUSTOMER-LOCAL-ENCRYPTION.md) and the
[U.S. export classification assessment](EXPORT-CLASSIFICATION-EAR99.md).

Signing keystores, signing passwords, service credentials, and other private
release secrets are never published. Publishing the compiled APK or AAB does
not publish the proprietary J2Outdoor application source code.

## Documents

- [Owner approval](OWNER-APPROVAL.md)
- [U.S. export classification assessment](EXPORT-CLASSIFICATION-EAR99.md)
- [Release archive and retention](RELEASE-ARCHIVE.md)
- [Release checklist snapshot](RELEASE-CHECKLIST.md)
- [Qt module SPDX SBOMs](sbom/)
- [Embedded rental/privacy terms](legal/)
- [Relinking test record](relinking/TEST-RECORD.md)
- [Qt build scripts and patches](source-build/)

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
- [Gradle and ML Kit dependency audit](GRADLE-MLKIT-DEPENDENCY-AUDIT.md)
- [Resolved Gradle runtime components](GRADLE-RUNTIME-COMPONENTS.txt)
- [Gradle runtime artifact hashes](GRADLE-RUNTIME-ARTIFACT-SHA256SUMS.txt)
- [Generic Apache License 2.0](licenses/Apache-2.0.txt)
- [ML Kit 16.0.1 third-party licenses](licenses/Google-ML-Kit-Text-Recognition-16.0.1-Third-Party-Licenses.txt)
- [ML Kit resolved-transitive supplemental licenses](licenses/Google-ML-Kit-Resolved-Transitive-Supplemental-Licenses.txt)
- [Account deletion instructions](ACCOUNT-DELETION.md)
- [Privacy Policy](PRIVACY-POLICY.md)
- [Qt 6.10.3 security patch set](../../../sources/qt/6.10.3/SECURITY-PATCHES.md)
- [Patched Qt Android build hashes](../../../sources/qt/6.10.3/PATCHED-ANDROID-BUILD.md)
