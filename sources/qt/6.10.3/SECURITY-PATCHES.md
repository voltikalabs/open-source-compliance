# Qt 6.10.3 Post-Release Security Patches

Review date: 2026-09-29

The following official Qt 6.10 patches are part of J2Outdoor's corresponding
source material for the next 1.0.0 release candidate:

| Apply order | Module | Advisory | Patch |
|---|---|---|---|
| 1 | `qtbase` | CVE-2026-76151 | `patches/CVE-2026-76151-qtbase-6.10.diff` |
| 2 | `qtbase` | CVE-2026-78253 | `patches/CVE-2026-78253-qtbase-6.10.diff` |
| 3 | `qtdeclarative` | CVE-2026-79616 | `patches/CVE-2026-79616-qtdeclarative-6.10.diff` |
| 4 | `qtsvg` | CVE-2026-6210 | `patches/CVE-2026-6210-qtsvg-6.10.diff` |

The patch set was verified to apply cleanly to
`qt-everywhere-src-6.10.3.tar.xz` with SHA-256
`cbc81e726b0ff3c0cdb0219bf74545e91cec013c4a8503c20f93f83d73dff5d2`.

Apply each patch from the corresponding module directory, for example:

```text
git -C qtbase apply ../patches/CVE-2026-76151-qtbase-6.10.diff
git -C qtbase apply ../patches/CVE-2026-78253-qtbase-6.10.diff
git -C qtdeclarative apply ../patches/CVE-2026-79616-qtdeclarative-6.10.diff
git -C qtsvg apply ../patches/CVE-2026-6210-qtsvg-6.10.diff
```

Paths may need adjustment depending on where the `patches` directory is copied
relative to the extracted Qt source. Verify every patch hash before applying
it, and retain the exact Qt configuration and build commands with the product
release evidence.

The verified Android build produced from this patch set is documented in
`PATCHED-ANDROID-BUILD.md`. Final product packages must be checked independently
to confirm that they contain those patched libraries.
