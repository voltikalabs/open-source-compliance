# J2Outdoor U.S. export classification assessment

Assessment date: 2026-10-02

## Reviewed artifact

- Product: J2Outdoor 1.0.0 for Android `arm64-v8a`
- Package ID: `id.web.voltikalabs.j2outdoor`
- Distribution profile: Google Play, Indonesia
- APK SHA-256:
  `2DAC3A77203E08F6CDBB3E5782D4B3A41CD5859E41671306DFAAC4451AE253B3`
- AAB SHA-256:
  `5C967785C6F5E0B43FACE7AC41764ACB3F3B5B1EADCF5873A200988FC7F03920`

## Product facts

J2Outdoor is an application-specific rental-operations product. Its primary
functions are equipment catalog presentation, inventory and availability,
rental requests and records, customer administration, payments, returns, and
operational synchronization. It is not marketed or designed as an information
security product, general communications product, networking product,
cryptographic library or SDK, VPN, encrypted messenger, digital-forensics tool,
penetration-testing tool, or government-customized product.

Cryptography is limited to supporting those rental functions:

- standard TLS protects application/API transport;
- standard AES-256-GCM protects locally stored customer telephone numbers;
- the backend independently uses standard authenticated encryption for stored
  customer data;
- operating-system credential storage protects local key material; and
- SHA-256/HMAC-SHA-256 support integrity, lookup, and key separation.

The user cannot expose, configure, replace, or repurpose the cryptographic
algorithms, keys, protocols, or interfaces. The signed candidate contains the
standard `J2A1` AES-GCM format and no former `J2N1` marker.

## Classification analysis

BIS guidance for 5A002.a explains that an item is within Category 5 Part 2 when
information security is a primary function, it is a digital communications or
networking system, or it is a computer or other item having information storage
or processing as a primary function. The same guidance gives an application
used by a local automotive repair shop to communicate securely about repair
status as an example outside Category 5 Part 2 because secure communication is
limited to the repair service. It also lists business-process automation,
supply-chain management, inventory, and delivery applications among examples
that are not Category 5 Part 2 when encryption is ancillary to the application.

Official reference:

- BIS, 5A002.a.1-a.5:
  https://www.bis.gov/learn-support/encryption-controls/5a002-a.1-a.5
- BIS, Encryption controls:
  https://www.bis.gov/learn-support/encryption-controls
- BIS, Decontrol guidance:
  https://www.bis.gov/learn-support/encryption-controls/decontrol

J2Outdoor closely matches the application-specific business/rental examples:
secure storage and transport support the rental workflow and are not offered as
independent security or communications functionality.

No other Commerce Control List category applicable to the reviewed rental
application was identified in this engineering review. On the reviewed facts,
the reasonable classification basis for the exact artifact is **EAR99**, not
ECCN 5D002 or mass-market 5D992.c.

## Reporting and Play Console conclusion

Because this assessment places the application outside Category 5 Part 2 and
does not rely on License Exception ENC, an ENC classification request, CCATS,
and annual ENC self-classification report are not identified as requirements
for this exact artifact.

The Google Play U.S. export-law certification may be selected for the reviewed
APK/AAB on this documented EAR99 basis. This does not remove obligations
concerning sanctioned destinations, restricted parties, prohibited end uses,
or changes in product functionality. Google Play availability is intended to
be limited to Indonesia.

## Reassessment triggers

Repeat this assessment before release if J2Outdoor adds or materially changes
any of the following:

- general encrypted messaging, file transfer, VPN, networking, or security
  functionality;
- a cryptographic API, library, SDK, user-configurable algorithm, key, or
  protocol;
- non-standard or unpublished cryptography;
- penetration, surveillance, digital-forensics, military, intelligence, or
  government-customized functionality;
- distribution scope or end users that create sanctions or restricted-party
  concerns; or
- any fact on which this assessment relies.

## Record status

The product owner confirmed the local rental-operations scope and instructed
completion of this assessment on 2026-10-02. The source, signed artifact,
package audit, and embedded encryption/legal markers were reviewed against that
scope.

This is a documented engineering classification assessment, not a CCATS
determination or formal legal opinion from BIS or export counsel.
