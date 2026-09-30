# J2Outdoor 1.0.0 Open-Source Compliance

J2Outdoor application code and original assets are proprietary. This directory
provides notices and compliance materials for the open-source components
distributed with J2Outdoor 1.0.0 for Android `arm64-v8a`.

## Build summary

- Release status: signed v11 production candidate built and audited; Google
  Play submission and Play-generated artifact verification remain
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
  `A1BFC7BD97E9E7C543F241BC381A04C772E56D62E800C32BA2AED959D0F78C67`
- Audited production signed AAB SHA-256:
  `7E2C1F4228AD01930BB9114102AE4C1791B6E90757D6233ED2EBB95B47F1B99A`
- Signer certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`

The APK/AAB hashes above identify the signed v11 package containing the exact
ML Kit third-party licenses, the resolved-transitive supplemental licenses, a
generic Apache-2.0 text, and privacy version `2026-10-01-v11-draft`. Physical
device and relinking results are retained as a baseline from the immediately
preceding v10 candidate; the exact v11 APK has not been physically installed.

## Corresponding Qt source

The exact Qt 6.10.3 corresponding source is documented at:

https://github.com/voltikalabs/open-source-compliance/tree/main/sources/qt/6.10.3

## Distribution artifacts

The hashes identify the audited production release candidate. The AAB must not
be treated as the completed Play release until release-owner approval, Data
Safety submission, and Google Play-generated artifact checks are recorded.

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
