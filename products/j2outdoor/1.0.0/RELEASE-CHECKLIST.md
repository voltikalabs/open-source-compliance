# J2Outdoor 1.0.0 Release Compliance Checklist

Last updated: 2026-10-01

Owner approval is complete; see `OWNER-APPROVAL.md`. Actual Play Console
submission and final store checks remain separate gates.

This is the engineering source of truth for the Android `arm64-v8a` release.
Complete it again for every version, ABI, and store. A checked item means that
evidence exists for the current release source or candidate; it does not by
itself constitute legal advice.

## Progress dashboard

| Priority | Workstream | Status | Evidence / next action |
|---|---|---|---|
| P0 | Distribution model | Complete | J2Outdoor remains proprietary and Qt is shipped as replaceable shared libraries under LGPLv3. |
| P0 | Open-source notices and inventory | Production candidate complete | The production APK/AAB inventories match the current hashes and include the Qt Multimedia Android classes. |
| P0 | Corresponding Qt 6.10.3 source | Complete | Source release and SHA-256 are documented at the durable compliance URL. |
| P0 | Android permission minimization | Complete for signed candidate | Final candidate contains camera, internet, network-state, and Android's generated non-exported receiver permission. |
| P0 | Qt security/CVE review | Patched package proof complete | Four official patches were compiled for Android arm64-v8a. Deployment provenance, build hashes, SBOMs, and matching stripped APK/AAB library hashes are recorded. |
| P0 | Final Play artifact | Production candidate audited | Exact production APK/AAB pass packaging, signature, inventory, and alignment checks. Play-generated artifact verification remains after upload. |
| P0 | Account deletion | Published and publicly reachable | The privacy, deletion, and compliance URLs returned HTTP 200 without authentication; final store-listing reconciliation remains. |
| P0 | Privacy Policy and Data safety | Owner approved; Play submission pending | Embedded v11 and public v3 include ML Kit device/app diagnostics and per-installation identifiers. Actual Play Console submission remains. |
| P1 | SBOM and resolved dependencies | Complete for signed v11 candidate | All 69 resolved Gradle runtime coordinates are classified; 65 cached binaries are checksummed, four coordinates are metadata-only, and exact ML Kit third-party licenses are packaged as distributed resources. |
| P1 | LGPL relinking proof | v10 production baseline passed | QtSvg was replaced in the immediately preceding v10 production APK, stored uncompressed, realigned, recipient-signed, installed, and run on Android 16/arm64-v8a; the official APK was then restored. The reviewed Qt library set is unchanged in v11. |
| P1 | Functional/security regression | v11 manual device acceptance and package audit complete | The exact v11 APK installed successfully and passed owner-performed startup, administrator login, production connectivity, primary navigation, license-entry, and Privacy Policy checks. Automated/assisted v10 baseline checks covered background/resume, fatal/JNI/native-link errors, runtime camera permission, capture, and on-device OCR. Checkout, export/import, and backup operations were not independently instrumented. |
| P1 | Owner/store review | Owner approved; store checks pending | J2Outdoor understands and approves the operational facts, store terms, Privacy Policy, Data safety answers, and release bundle. Verify final store listing, publisher identity, and compliance URLs during Play setup. |
| P2 | Release archive and publication | v11 candidate published | Complete ZIP, signed APK/AAB, and checksums are published under `j2outdoor-1.0.0-v11-rc1`. GitHub asset digests match the local archive. Exact Play-upload reconciliation remains pending. |

The previous signed APK/AAB include `2026-09-30-v10-draft` and remain only as
physical-device/relinking baseline evidence. The signed v11 candidate includes
the dependency-license resources and `2026-10-01-v11-draft` privacy update;
its refreshed hashes and inventories are recorded below.

## Current evidence

- Public compliance bundle:
  `https://github.com/voltikalabs/open-source-compliance/tree/main/products/j2outdoor/1.0.0`
- Corresponding Qt source:
  `https://github.com/voltikalabs/open-source-compliance/releases/tag/qt-6.10.3-source`
- Permission policy: `android/AndroidManifest.xml`
- Release audit workflow: `scripts/audit-android-package.ps1`
- Qt security review: `compliance/QT-6.10.3-SECURITY-REVIEW.md`
- Patched Qt binary evidence: `compliance/QT-6.10.3-PATCHED-BUILD.md`
- Superseded production signed APK SHA-256 (must not be uploaded):
  `B839F78D266BED7F4815C52AFB25C02763619B58B6CBF790B49B10801A93C555`
- Superseded production signed AAB SHA-256 (must not be uploaded):
  `F821A65BAAB656D5B11B5333948F0FA2EB4D19A717D95A84A3CD90859733C0D1`
- Superseded v10 physical-test APK SHA-256 (must not be uploaded):
  `8E0C5BA0267A2A69BEB8B740C67EE005C5B2E735548CAA4EE68E255DEFBE6005`
- Superseded v10 physical-test AAB SHA-256 (must not be uploaded):
  `A553004DC754E55E3B3849D961A8C9E15FA2166C622E0E19129B71711C5CFDE7`
- Signed v11 production APK SHA-256:
  `A1BFC7BD97E9E7C543F241BC381A04C772E56D62E800C32BA2AED959D0F78C67`
- Signed v11 production AAB SHA-256:
  `7E2C1F4228AD01930BB9114102AE4C1791B6E90757D6233ED2EBB95B47F1B99A`
- Signer certificate SHA-256:
  `dab7a4b834009e753005697fcb2789cc2e035fd99dbfd49ad35dfdf7c2b0fec5`
- Final Android verification: `compliance/ANDROID-FINAL-ARTIFACT-VERIFICATION.md`
- Corrected staging verification:
  `compliance/ANDROID-STAGING-CANDIDATE-VERIFICATION.md`
- Data safety working sheet: `compliance/GOOGLE-PLAY-DATA-SAFETY.md`
- Physical-device relinking record: `compliance/relinking/TEST-RECORD.md`

## Build and dependency gates

- [x] Build from a clean release directory with the reviewed Qt version.
- [x] Record fixed resolved versions for all 69 Gradle runtime coordinates and
      SHA-256 hashes for all 65 cached AAR/JAR binaries; four remaining
      coordinates are metadata/BOM/constraint-only.
- [x] Extract the final APK/AAB or desktop package and create an inventory.
- [x] Export and review the resolved Gradle runtime dependency tree, including
      every AAR/JAR and transitive license; confirm bundled ML Kit 16.0.1.
- [x] Confirm Qt libraries are separate shared libraries.
- [x] Confirm no GPL-only Qt module or plugin is present in the audited candidate.
- [x] Confirm debug/profiling plugins are absent from the audited candidate.
- [x] Record the compiler, NDK/SDK, Qt version, ABI, and build configuration.
- [x] Generate SHA-256 hashes for the signed candidate binaries and source archive.

## Notices and application terms

- [x] Verify the in-app Open Source Licenses page opens every embedded text.
- [x] Include `NOTICE.txt`, LGPLv3, GPLv3, QtKeychain, Lucide, Lobster Two,
      Plus Jakarta Sans (SIL OFL 1.1), Android OpenSSL, OpenSSL, Android NDK, and every additional
      third-party notice in the distributed package.
- [x] Verify the current ML Kit and Google APIs terms, Android disclosure,
      integration guide, and release notes; keep Google product terms separate
      from the exact AAR's embedded third-party open-source license bundle.
- [x] Reconcile `ID-CARD-OCR-PRIVACY.md` with the prepared public privacy policy.
- [x] Exercise runtime camera permission, capture, and local OCR on the v10
      production physical-test baseline; confirm the customer is not saved
      when Save is not invoked and that no scan file remains in the private
      cache after restart.
- [x] Reconcile verified production behavior and the current ML Kit disclosure
      with the working Data Safety answers; actual Play Console submission and
      final store checks remain external gates; owner approval is recorded.
- [x] Record that J2Outdoor 1.0.0 does not distribute a custom EULA; the
      inactive internal draft is excluded from application resources and public terms.
- [x] Confirm the distributed rental/privacy terms do not restrict LGPL
      replacement, relinking, or reverse engineering needed to debug modifications.
- [x] Identify and embed a durable compliance URL in the application.
- [ ] Add the same durable compliance URL to the Google Play store listing.

## Corresponding source and replacement rights

- [x] Download, hash, and retain the exact Qt 6.10.3 corresponding source.
- [x] Include all security/local Qt patches and complete build/configuration
      scripts in the corresponding-source bundle.
- [x] Publish the Qt 6.10.3 source bundle at the durable compliance URL.
- [x] Publish release-specific Android relinking instructions.
- [x] Replace a Qt library, repackage, self-sign, and run the result on a device.
- [x] Record the relinking test date, device, Android version, ABI, and outcome.
- [x] Confirm neither DRM nor service logic prevents modified staging or production builds running.
- [x] Repeat the relinking proof against the v10 production physical-test
      baseline; confirm the reviewed Qt shared-library set is unchanged in v11.

## Environment promotion gate

- [x] Use `staging` as the default Android release-script profile while blockers remain.
- [x] Verify staging DNS/HTTPS reachability and public storefront data on a physical device.
- [x] Provision and verify production DNS, valid TLS, and the intended backend release.
- [x] Build production explicitly with `-ApiEnvironment production`; never promote a cached staging APK/AAB.
- [x] Repeat the release-candidate package and page-level checks on production:
      alignment, startup, storefront, primary customer navigation,
      background/resume, embedded notices, and relinking passed; the owner
      reported all application pages opening normally.
- [x] Authenticate as an administrator and exercise Dashboard, Rentals, Items,
      Customers, More, runtime camera permission, in-app capture, and local OCR
      on the v10 production physical-test baseline without retaining the sample
      identity image.

## Release archive

Candidate release:
https://github.com/voltikalabs/open-source-compliance/releases/tag/j2outdoor-1.0.0-v11-rc1

The project owner reports Play Console account verification complete and
Create app available. App creation, AAB upload, Data safety submission, and
Play-generated package checks are still pending. The immutable ZIP contains
the pre-publication checklist snapshot; this checklist records subsequent progress.

- [x] Archive the v11 candidate binary, inventory, SBOM, notices, source, patches,
      hashes, rental/privacy terms, relinking instructions, and completed checklist together.
      Complete ZIP published and verified; the checklist snapshot preserves
      outstanding Play checks. Final shipped-artifact reconciliation remains.
- [x] Publish candidate APK/AAB as GitHub prerelease assets and record hashes.
- [ ] Publish the exact Play AAB and optional verification APK as release assets,
      not Git blobs, and record their SHA-256 hashes in the version directory.
- [x] Confirm that no keystore, signing password, service credential, or other
      private release secret is present in the repository or release assets.
- [ ] Keep the archive available for as long as recipients may exercise their
      license rights and for any longer period required by applicable law.
      Ongoing commitment: retain versioned GitHub Release assets and a local
      backup; see the public `RELEASE-ARCHIVE.md` retention policy.
- [x] Establish the public archive, local backup, and retention commitment.
- [x] Obtain documented business-owner approval of the operational facts,
      store terms, Privacy Policy, Data safety answers, and release bundle.
      J2Outdoor has understood and approved these materials as recorded on
      2026-10-01. See `OWNER-APPROVAL.md` for scope and remaining store checks.
