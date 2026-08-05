# MyMobileApp 1.0.0 Android arm64-v8a Component Manifest

This manifest describes the signed MyMobileApp 1.0.0 Android `arm64-v8a` APK
audited for this release. MyMobileApp application code and original assets are
proprietary and are not included in this compliance repository.

| Component | Version/build | Distribution model | License/notices |
|---|---|---|---|
| MyMobileApp application | 1.0.0 | Original application binary | Proprietary MyMobileApp application terms |
| Qt libraries and plugins | 6.10.3, unmodified | Separate shared libraries in APK | LGPLv3; LGPLv3 and GPLv3 texts included |
| QtKeychain | 0.15.0 | Linked application dependency | BSD 3-Clause |
| Lucide icons | Version embedded in MyMobileApp 1.0.0 | Icons embedded in application resources | ISC; Feather-derived icons retain their MIT notice |
| OpenSSL | Android OpenSSL package used by MyMobileApp 1.0.0 | Separate shared libraries | Apache 2.0 |
| LLVM libc++ | Android NDK r27c / 27.2.12479018 | `libc++_shared.so` | NDK sysroot third-party notice included |

Target configuration: package ID `id.web.voltikalabs.mymobileapp`, Android API
28 minimum, `arm64-v8a`, Release. The audited library list and signed APK hash
are recorded in `native-libraries.txt` and `SHA256SUMS.txt`.
