# J2Outdoor 1.0.0 Open-Source Compliance

> Release status (2026-11-05): the current production-upload candidate is
> version name `1.0.0`, version code `8`, and embeds approved privacy policy
> `2026-10-10-v13`. It is awaiting Google Play production-access approval; it
> is not yet a Play-distributed artifact.

J2Outdoor application code and original assets are proprietary. This directory
provides notices and compliance materials for the open-source components
distributed with J2Outdoor 1.0.0 for Android `arm64-v8a`.

## Build summary

- Release status: signed production-upload candidate built and audited;
  Google Play production-access approval, AAB upload, and Play-generated
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
- Android version code: `8`
- Embedded legal-document version: `2026-10-10-v13`
- Audited production signed APK SHA-256:
  `4B61BD9DCCC4B650AE920B94D5DD7D4B3E303D178682D1DE3A8C5019AE52257E`
- Audited production signed AAB SHA-256:
  `9C4C35008B5B2C11CEEF019FA00E298538F8650261323B4592AAFD15FE8B91F5`
- Signer certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`

The APK/AAB hashes above identify the current local production-upload
candidate. Package identity, local signatures, native-library inventory,
absence of GPL-only/debug indicators, Qt Multimedia Android classes, and the
embedded v13 legal-document version were audited. Historical v10/v11/v12
evidence remains available as baseline evidence and does not identify this
candidate.

## Corresponding Qt source

The exact Qt 6.10.3 corresponding source is documented at:

https://github.com/voltikalabs/open-source-compliance/tree/main/sources/qt/6.10.3

## Distribution artifacts

The hashes identify the current local production-upload candidate. The preceding
v11 APK/AAB and complete compliance ZIP remain published in the
[v11 prerelease](https://github.com/voltikalabs/open-source-compliance/releases/tag/j2outdoor-1.0.0-v11-rc1).
See [archive contents and retention](RELEASE-ARCHIVE.md). They are Release
assets, not Git blobs. The current artifacts have not yet been published or
uploaded to Play. Google Play production-access approval, AAB submission, Data
Safety reconciliation, and Play-generated artifact checks remain pending.

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
- [Current production-upload candidate](PRODUCTION-RELEASE.md)
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
