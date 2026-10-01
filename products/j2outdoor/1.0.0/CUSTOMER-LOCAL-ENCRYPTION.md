# Customer local encryption status

Status date: 2026-10-01

The published v11 APK/AAB use the former proprietary `J2N1` local customer
telephone protection and must not be submitted to Google Play while the export
review remains unresolved.

Source remediation for the new production candidate replaces `J2N1` with the versioned
`J2A1` format using standard AES-256-GCM through platform crypto providers.
Each record uses a fresh 12-byte nonce, a 16-byte authentication tag, and the
format prefix as authenticated additional data. The master key remains held
through the operating-system credential facility. Purpose-separated
HMAC-SHA-256 keys are used for encryption and telephone lookup hashes.

The synchronization API contract is unchanged: telephone numbers use the
existing `phoneNumber` JSON field over HTTPS. The backend independently uses
its existing AES-GCM storage format, so this mobile remediation requires no
backend source or database migration.

Legacy `J2N1` decoding is intentionally omitted because the production and
pre-release local customer datasets were confirmed empty. Tests cover AES-GCM
round trips, randomized ciphertext, tamper and wrong-key rejection, rejection
of legacy records, lookup hashes, and the encrypted local database boundary.

A signed production candidate was generated and audited on 2026-10-02. Binary
inspection found `J2A1`, did not find `J2N1`, and confirmed the embedded v12
legal resources. Its APK SHA-256 is
`2DAC3A77203E08F6CDBB3E5782D4B3A41CD5859E41671306DFAAC4451AE253B3`
and its AAB SHA-256 is
`5C967785C6F5E0B43FACE7AC41764ACB3F3B5B1EADCF5873A200988FC7F03920`.

The product-function assessment in `EXPORT-CLASSIFICATION-EAR99.md` records
EAR99 as the reasonable engineering classification for the exact candidate;
no ENC classification request, CCATS, or annual ENC report was identified as
applicable. Production-device smoke testing and publication of the new exact
artifacts remain required. This document does not reclassify or modify the
immutable v11 release assets.
