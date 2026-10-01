# Customer local encryption status

Status date: 2026-10-01

The published v11 APK/AAB use the former proprietary `J2N1` local customer
telephone protection and must not be submitted to Google Play while the export
review remains unresolved.

Source remediation for the next candidate replaces `J2N1` with the versioned
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

A new signed Android candidate, package audit, regression check, public archive,
and any applicable export classification/reporting record are still required.
This document does not reclassify or modify the immutable v11 release assets.
