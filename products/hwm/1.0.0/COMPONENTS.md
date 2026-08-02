# HWM 1.0.0 Android arm64-v8a Component Manifest

This manifest describes the signed HWM 1.0.0 Android `arm64-v8a` APK audited
for this release. HWM application code and original assets are proprietary and
are not included in this compliance repository.

| Component | Version/build | Distribution model | License/notices |
|---|---|---|---|
| HWM application | 1.0.0 | Original application binary | Proprietary HWM application terms |
| Qt libraries and plugins | 6.10.3, unmodified | Separate shared libraries in APK | LGPLv3; LGPLv3 and GPLv3 texts included |
| QtKeychain | 0.15.0 | Linked application dependency | BSD 3-Clause |
| OpenSSL | Android OpenSSL package pinned at `b71f1470962019bd89534a2919f5925f93bc5779` | Separate shared libraries | Apache 2.0 |
| LLVM libc++ | Android NDK r27c / 27.2.12479018 | `libc++_shared.so` | NDK sysroot third-party notice included |

Target configuration: package ID `id.web.voltikalabs.hwm`, Android API 28
minimum, `arm64-v8a`, Release. The audited library list and signed APK hash are
recorded in `native-libraries.txt` and `SHA256SUMS.txt`.
