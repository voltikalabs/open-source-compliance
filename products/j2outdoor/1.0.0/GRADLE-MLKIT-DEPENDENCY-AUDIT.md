# Gradle Runtime and Google ML Kit Dependency Audit

Audit date: 2026-10-01

## Scope

This audit covers the resolved `releaseRuntimeClasspath` exported from the
J2Outdoor 1.0.0 Android production release project. It supplements the native
library inventory and Qt SPDX SBOMs; it does not classify build-host tools that
are not distributed in the APK/AAB.

The audited graph has 69 resolved coordinates: 65 cached AAR/JAR binaries and
four metadata/BOM/constraint-only coordinates. Direct runtime dependencies are
fixed at:

- `androidx.core:core:1.16.0`
- `com.google.mlkit:text-recognition:16.0.1`

Kotlin standard-library variants are forced to `1.8.22`. No dynamic (`+`),
snapshot, or version-range declaration was found in the Android application
build file or resolved runtime graph. Exact coordinates and cached artifact
hashes are recorded in:

- `GRADLE-RUNTIME-COMPONENTS.txt`
- `GRADLE-RUNTIME-ARTIFACT-SHA256SUMS.txt`

The evidence was generated from the exported release dependency tree by the
versioned audit script in the private application source repository.

## License and terms classification

The following resolved families were reviewed as Apache-2.0-covered runtime
components: AndroidX, Kotlin and Kotlin Coroutines, JSpecify, JetBrains
annotations, `javax.inject`, and Guava `listenablefuture`. A generic complete
Apache License 2.0 text is now distributed in the application and compliance
bundle. Exact versions remain in the generated component inventory.

Google ML Kit, Google Play services, and ODML artifacts are not represented as
open-source merely because their AARs contain open-source software. Their use
is tracked under the ML Kit and Google APIs terms. Firebase and Google Data
Transport support artifacts are retained in the resolved inventory. The exact
`com.google.mlkit:text-recognition:16.0.1` AAR contains a
`third_party_licenses.txt` bundle; a byte-for-byte extracted copy is now
distributed in the in-app license viewer and compliance materials.

- ML Kit AAR SHA-256:
  `DA753265D02479A8CFE4DBF891BA7D189248E7C8430B6F72BD4D532C757A69B3`
- Extracted third-party license text SHA-256:
  `B7D81734E6144858BE69BA7538C0F4FCB9CC6A904437AF90D6186ABFE2A9627C`
- Resolved-transitive supplemental license text SHA-256:
  `56DA276DD9EF6B547E99BDC3982CE99FB49AA32355B227AC2E317FF61DA3BB5A`

The main bundle contains 198 named entries. Comparing all 16 resolved AARs that
carry embedded license indexes found five additional names: AndroidX
architecture core, AndroidX architecture, Android SDK, AndroidX collection
JVM, and AndroidX annotation JVM. Their exact embedded texts are distributed
in a supplemental file. The extracted bundles are intentionally separate from
Google's product/API terms.

## ML Kit implementation and disclosure review

J2Outdoor uses the bundled Latin Text Recognition v2 artifact. Google's
Android integration documentation identifies `text-recognition:16.0.1` as the
bundled option: the model is statically linked into the application instead of
being downloaded on first use. This matches the packaged OCR model assets and
the successful offline-style physical capture test.

Google's ML Kit terms state that API input and output are processed on-device
and are not sent to Google servers. They also state that ML Kit may contact
Google for bug fixes, updated models, and accelerator compatibility, and sends
performance/utilization metrics.

Google's Android data-disclosure page states that all ML Kit features collect:

- device information, including manufacturer, model, OS version/build, and
  available ML accelerators;
- application package name and version; and
- performance/utilization information for diagnostics and usage analytics.

For bundled features, Google additionally lists a per-installation identifier
that is not intended to identify a user or physical device. Google states that
the listed data is encrypted in transit with HTTPS and is not transferred to
third parties. Accordingly, the release Data Safety worksheet classifies App
info/performance diagnostics and Device or other IDs as collected for SDK
diagnostics/analytics. It does not classify the KTP image or raw OCR output as
collected because the reviewed app flow keeps those on-device and does not pass
them to the customer-save payload.

The disclosure page says it describes the latest SDK versions. Google's
release notes still list `com.google.mlkit:text-recognition:16.0.1` as the
current bundled Text Recognition release on the audit date, so applying that
disclosure to J2Outdoor is the conservative and supported result.

## Official references reviewed

- ML Kit Terms (last modified 2025-05-14):
  https://developers.google.com/ml-kit/terms
- ML Kit Android data disclosure (last modified 2025-05-14):
  https://developers.google.com/ml-kit/android-data-disclosure
- Text Recognition v2 Android integration:
  https://developers.google.com/ml-kit/vision/text-recognition/v2/android
- ML Kit release notes:
  https://developers.google.com/ml-kit/release-notes
- Google APIs Terms of Service (last modified 2021-11-09):
  https://developers.google.com/terms/

## Result and remaining external action

The current resolved runtime graph is inventoried, version-fixed, checksummed,
and classified. Required Apache and exact ML Kit third-party license texts have
been added to the distributed legal resources. The embedded/public privacy
language and Data Safety working answers have been updated for ML Kit
diagnostics and identifiers.

The only remaining ML Kit action is procedural: enter the verified answers in
the actual Play Console Data Safety form and retain the submitted record. A
fresh signed APK/AAB must be produced because the added legal resources and
legal-document version change the application binary; the new artifacts must
then replace the superseded hashes in the release records.
