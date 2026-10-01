# J2Outdoor 1.0.0 release status

Status date: 2026-10-01

The dependency/ML Kit audit is complete. The signed v11 production APK/AAB
contain the refreshed legal resources and privacy text and passed package,
signature, native-library, and 16 KiB alignment checks. The exact v11 APK was
installed successfully and passed owner-performed manual startup,
administrator-login, production-connectivity, primary-navigation,
embedded-license, and Privacy Policy checks. Instrumented log/OCR and relinking
evidence remains tied to the immediately preceding v10 baseline.

The v10 production baseline includes the Qt Multimedia Android classes and passed
package, signature, and 16 KiB alignment checks. That APK was
update-installed and passed cold startup, foreground-activity, and PID-scoped
fatal/JNI/native-link checks on a physical Android 16 arm64-v8a device. It also
rendered the production storefront and passed Home, Categories, Cart, More,
and background/resume testing.

Production relinking also passed on v10: QtSvg was replaced in that APK,
the package was realigned, recipient-signed, installed, launched without a
fatal/JNI/native-link error, and the official APK was restored. The embedded
license index and notice opened successfully, and the owner manually opened all
application pages and reported normal behavior. The owner also authenticated as
an administrator and passed Dashboard, Rentals, Items, Customers, More,
Android runtime camera permission, in-app capture, and on-device OCR on the
exact production APK. The sample identity fields remained editable, Save
Customer was not invoked, the customer list remained empty, and no scan file
remained in private cache after restart. Test screenshots containing the sample
identity image were deleted. Google Play-generated artifact verification and
final store checks remain pending. Owner approval is recorded in
`OWNER-APPROVAL.md`. The public
Privacy Policy v3 is reconciled with the new embedded document version
`2026-10-01-v11-draft` without publishing individual staff names.

The audit classified all 69 resolved Gradle runtime coordinates and recorded
SHA-256 hashes for 65 AAR/JAR binaries; four coordinates are metadata-only. It
also added the exact ML Kit 16.0.1 AAR third-party license bundle and a generic
Apache-2.0 text to the distributed legal resources. Current Google disclosure
states that OCR input/output remains on-device while ML Kit collects
device/application information, performance/utilization metrics, and a bundled
feature's per-installation identifier for diagnostics/usage analytics. These
facts are now reflected in the privacy materials and signed v11 resources.

The signed v11 APK SHA-256 is
`A1BFC7BD97E9E7C543F241BC381A04C772E56D62E800C32BA2AED959D0F78C67` and
the signed v11 AAB SHA-256 is
`7E2C1F4228AD01930BB9114102AE4C1791B6E90757D6233ED2EBB95B47F1B99A`.
Google Play-generated artifact verification and Data Safety submission remain
pending. Owner approval is complete. The v11 archive is prepared for the
`j2outdoor-1.0.0-v11-rc1` prerelease; see `RELEASE-ARCHIVE.md` for contents,
publication status, and the ongoing retention commitment.

The following earlier production-candidate hashes are superseded because that
packaging omitted `Qt6AndroidMultimedia.jar` and crashed during Qt Multimedia
JNI startup:

- APK: `B839F78D266BED7F4815C52AFB25C02763619B58B6CBF790B49B10801A93C555`
- AAB: `F821A65BAAB656D5B11B5333948F0FA2EB4D19A717D95A84A3CD90859733C0D1`
