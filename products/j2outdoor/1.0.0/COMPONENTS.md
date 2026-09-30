# J2Outdoor 1.0.0 Android arm64-v8a Component Manifest

This manifest describes the signed J2Outdoor 1.0.0 Android `arm64-v8a` APK
audited for this release. J2Outdoor application code and original assets are
proprietary and are not included in this compliance repository.

| Component | Version/build | Distribution model | License/notices |
|---|---|---|---|
| J2Outdoor application | 1.0.0 | Original application binary | Proprietary J2Outdoor application terms |
| Qt libraries and plugins | 6.10.3, unmodified | Separate shared libraries in APK | LGPLv3; LGPLv3 and GPLv3 texts included |
| QtKeychain | Version embedded in J2Outdoor 1.0.0 | Linked application dependency | BSD 3-Clause |
| Lucide icons | Version embedded in J2Outdoor 1.0.0 | Icons embedded in application resources | ISC; Feather-derived icons retain their MIT notice |
| Lobster Two | Version embedded in J2Outdoor 1.0.0 | Font embedded in application resources | SIL Open Font License 1.1 |
| Plus Jakarta Sans | Version embedded in J2Outdoor 1.0.0 | Font embedded in application resources | SIL Open Font License 1.1 |
| OpenSSL | Android OpenSSL package used by J2Outdoor 1.0.0 | Separate shared libraries | Apache 2.0 |
| LLVM libc++ | Android NDK r27c / 27.2.12479018 | `libc++_shared.so` | NDK sysroot third-party notice included |
| Google ML Kit Text Recognition | 16.0.1 plus resolved transitive dependencies | Android runtime dependency with bundled Latin OCR model | Google ML Kit and Google APIs terms; exact AAR third-party and supplemental transitive license bundles included |
| AndroidX/Kotlin runtime graph | 69 resolved coordinates; see runtime inventory | AAR/JAR dependencies packaged into or supporting the Android application | Apache-2.0-covered families and Google-distributed SDK components; exact classifications and hashes included |

Target configuration: package ID `id.web.voltikalabs.j2outdoor`, Android API
28 minimum, `arm64-v8a`, Release. The audited library list and signed APK hash
are recorded in `native-libraries.txt` and `SHA256SUMS.txt`.

The complete resolved Gradle graph, cached artifact hashes, ML Kit disclosure
review, generic Apache License 2.0 text, and exact ML Kit AAR third-party
license bundle are included in this directory.
