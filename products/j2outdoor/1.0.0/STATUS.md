# J2Outdoor 1.0.0 release status

Status date: 2026-09-30

J2Outdoor 1.0.0 is currently a pre-release staging candidate. The APK/AAB
hashes in this directory are verification evidence and must not be submitted to
Google Play as the production release.

The corrected staging package includes the Qt Multimedia Android classes,
passes package/signature/16 KiB ZIP-alignment checks, and passed physical-device
startup, storefront, navigation, background/resume, and embedded-license tests.

Production DNS/TLS, final production build, production regression/relinking,
Google Play-generated artifact verification, public-policy reconciliation, and
release-owner approval remain pending.

The following earlier production-candidate hashes are superseded because that
packaging omitted `Qt6AndroidMultimedia.jar` and crashed during Qt Multimedia
JNI startup:

- APK: `B839F78D266BED7F4815C52AFB25C02763619B58B6CBF790B49B10801A93C555`
- AAB: `F821A65BAAB656D5B11B5333948F0FA2EB4D19A717D95A84A3CD90859733C0D1`
