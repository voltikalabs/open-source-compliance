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
The official production APK then rendered the production storefront and passed
Home, Categories, Cart, More, and background/resume testing while retaining the
same process, with no fatal error afterward. The embedded license index listed
all expected entries and the J2Outdoor notice opened. The owner subsequently
reported manually opening all application pages and observing normal behavior.
The owner then authenticated as an administrator without exposing credentials.
Dashboard, Rentals, Items, Customers, and More passed against the intentionally
empty/default production dataset. Android runtime camera permission, in-app
capture, and on-device OCR extracted the expected name, village, and
regency/city from a sample identity image into editable fields. Save Customer
was intentionally not invoked and the customer list remained empty. After
restart, no `id-card-scan` file remained in private cache and a PID-scoped fatal
signal/exception scan returned no match. Source review confirmed that the save
payload excludes the image, NIK, and raw OCR text. Test screenshots containing
the sample identity image were deleted. Checkout, export/import, and backup
operations were not independently instrumented in this record.

The APK and AAB also contain identical hashes for the reviewed Qt and OpenSSL
shared libraries. See `PACKAGED-NATIVE-SHA256SUMS.txt`.

Google Play App Signing may sign generated APKs using a certificate different
from the local upload key. After upload, the Play-generated artifacts must be
downloaded and checked again for identity, permissions, signatures, native
libraries, and 16 KiB alignment.
