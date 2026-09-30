# Patched Qt 6.10.3 Android Build

Build verification date: 2026-09-30

The four patches in `SECURITY-PATCHES.md` were applied to the verified Qt
6.10.3 source and compiled for Android `arm64-v8a`, API 28, with Android NDK
27.2.12479018 and Clang 18.0.3 in Release mode. Qt Network was configured for
runtime OpenSSL 3.1.8 support. The installed headers confirm
`QT_FEATURE_ssl=1`, `QT_FEATURE_opensslv30=1`, and
`QT_FEATURE_openssl_linked=-1`.

```text
BB0188B9F44732D47DB2903CB560EB23D17642678EE95276159164AC895E06E9  libQt6Core_arm64-v8a.so
C85BD38ABC0AF3D34CA5180D5226BDE14DD4F21FD04E1E12D252402D69AEC9DE  libQt6Network_arm64-v8a.so
690512FA9C840E5EF4AC20C82E13E78FC1D56A0BA69EB4E09984A34FB10095FE  libQt6Qml_arm64-v8a.so
B4877B2A14E408FAE18816E4223398F41799D23B5FF371F16AD66AFA3432CA8B  libQt6Quick_arm64-v8a.so
E86AA6B2A07CEE702EE624E33FD5468ADD4A4587398E3A0411E414B7D182A3AE  libQt6Svg_arm64-v8a.so
```

SPDX SBOMs were generated for QtBase, QtShaderTools, QtDeclarative, and QtSvg.
These hashes identify the approved patched build inputs for J2Outdoor. The
final product directory will separately record hashes extracted from the
distributed AAB/APK. The earlier build with Qt SSL disabled remains rejected
and must not be distributed.
