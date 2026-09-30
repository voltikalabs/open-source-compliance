# J2Outdoor 1.0.0 release status

Status date: 2026-09-30

J2Outdoor 1.0.0 is currently an audited production release candidate. The
APK/AAB were built explicitly for the production API environment after the
production DNS/TLS gate passed.

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
Privacy Policy is reconciled with embedded document version
`2026-09-30-v10-draft` without publishing individual staff names.

The following earlier production-candidate hashes are superseded because that
packaging omitted `Qt6AndroidMultimedia.jar` and crashed during Qt Multimedia
JNI startup:

- APK: `B839F78D266BED7F4815C52AFB25C02763619B58B6CBF790B49B10801A93C555`
- AAB: `F821A65BAAB656D5B11B5333948F0FA2EB4D19A717D95A84A3CD90859733C0D1`
