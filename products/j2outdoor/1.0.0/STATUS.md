# J2Outdoor 1.0.0 release status

Status date: 2026-10-01

The dependency/ML Kit audit is complete, but J2Outdoor 1.0.0 currently has no
uploadable final artifact. The last audited APK/AAB were built explicitly for
production and remain useful historical evidence, but are superseded by the
v11 legal-resource update described below.

The production package includes the Qt Multimedia Android classes and passes
package, signature, and 16 KiB alignment checks. The exact final APK was
update-installed and passed cold startup, foreground-activity, and PID-scoped
fatal/JNI/native-link checks on a physical Android 16 arm64-v8a device. It also
rendered the production storefront and passed Home, Categories, Cart, More,
and background/resume testing.

Production relinking also passed: QtSvg was replaced in the exact final APK,
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
final release-owner approval remain pending. The public
Privacy Policy v3 is reconciled with the new embedded document version
`2026-10-01-v11-draft` without publishing individual staff names.

The audit classified all 69 resolved Gradle runtime coordinates and recorded
SHA-256 hashes for 65 AAR/JAR binaries; four coordinates are metadata-only. It
also added the exact ML Kit 16.0.1 AAR third-party license bundle and a generic
Apache-2.0 text to the distributed legal resources. Current Google disclosure
states that OCR input/output remains on-device while ML Kit collects
device/application information, performance/utilization metrics, and a bundled
feature's per-installation identifier for diagnostics/usage analytics. These
facts are now reflected in the privacy materials. A new signed production
APK/AAB and refreshed inventory are required before Play upload.

The following earlier production-candidate hashes are superseded because that
packaging omitted `Qt6AndroidMultimedia.jar` and crashed during Qt Multimedia
JNI startup:

- APK: `B839F78D266BED7F4815C52AFB25C02763619B58B6CBF790B49B10801A93C555`
- AAB: `F821A65BAAB656D5B11B5333948F0FA2EB4D19A717D95A84A3CD90859733C0D1`
