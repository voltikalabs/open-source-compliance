# J2Outdoor 1.0.0 v11 candidate archive

This archive is a production-configured release candidate, not a Google Play
approved or submitted release. Owner approval has been recorded. Google Play
Data safety submission and Play-generated package checks remain pending.
The owner has confirmed that account verification is complete and app creation
is available.

Publication verified: all four Release assets are public. Their GitHub SHA-256
digests match the local files in `RELEASE-ASSET-SHA256SUMS.txt`. The immutable
ZIP contains the checklist and status snapshot from before publication;
current repository documents record later progress.

Release tag: `j2outdoor-1.0.0-v11-rc1`.

Release URL:
https://github.com/voltikalabs/open-source-compliance/releases/tag/j2outdoor-1.0.0-v11-rc1

## Contents

The complete ZIP contains the signed APK and AAB, public compliance inventory,
Qt SPDX SBOMs, resolved Gradle component inventory, notices and licenses, exact
Qt 6.10.3 source archive, security patches and build scripts, artifact and file
checksums, embedded rental/privacy terms in both languages, public Privacy
Policy, owner approval, relinking instructions and test evidence, and a checklist
snapshot with outstanding Play tasks explicitly left open.

The APK and AAB are also provided individually as Release assets. Their bytes
are unchanged from the audited v11 candidate. The proprietary application
source, signing keys, credentials, customer data, and inactive EULA draft are
not included. The embedded terms retain their original `v11-draft` version so
that the archived document matches the signed binary.

Application source revision used as provenance:
`939f24e8c5dcc8c789e519381083ab24a2525709` (repository baseline; this records
the audit context, not an independently proven reproducible binary build).

The relinking device test applies to the v10 baseline; v11 uses the same
reviewed Qt library set and has separate manual acceptance evidence.

## Integrity and retention

`RELEASE-ASSET-SHA256SUMS.txt` identifies downloadable assets, and
`ARCHIVE-FILE-SHA256SUMS.txt` inside the ZIP covers its payload files.
Verify the AAB hash against the eventual Play upload before describing it as
the exact submitted Play artifact. A new build requires new hashes and review.

Voltika Labs will retain this versioned release and corresponding sources for
as long as recipients may exercise their license rights and any longer period
required by applicable law. Keep a local copy in addition to GitHub. Do not
overwrite or remove published version assets during routine cleanup; publish
corrections as a new candidate. If hosting changes, preserve access and update
the durable compliance links. Availability is an ongoing responsibility, not
a guarantee supplied by GitHub.
