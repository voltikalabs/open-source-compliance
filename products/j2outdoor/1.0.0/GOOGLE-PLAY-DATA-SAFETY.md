# Google Play Data Safety Working Sheet

Engineering review date: 2026-10-10

Current approved source policy: Privacy Policy `2026-10-10-v13`; not yet embedded in the archived signed APK/AAB. Re-verify every answer against the actual production build before submission.

This worksheet maps the current J2Outdoor 1.0.0 implementation to Google Play's
Data safety questions. It is not a console submission and must be checked
against the production backend, Google Play SDK Index disclosures, and the
exact questions displayed in Play Console before submission.

## Public URLs

- Privacy Policy:
  `https://github.com/voltikalabs/open-source-compliance/blob/main/products/j2outdoor/1.0.0/PRIVACY-POLICY.md`
- Account deletion:
  `https://github.com/voltikalabs/open-source-compliance/blob/main/products/j2outdoor/1.0.0/ACCOUNT-DELETION.md`

These URLs become valid only after the public compliance repository changes are
committed and pushed.

## Top-level answers

| Play Console question | Working answer | Evidence / condition |
|---|---|---|
| Does the app collect or share required user-data types? | Yes | Rental and administrator-account data can leave the device for J2 Outdoor's server or a user-selected WhatsApp flow. |
| Is all user data encrypted in transit? | Yes for the reviewed production API path | The production API endpoint presented valid TLS. WhatsApp transport is operated by WhatsApp/Meta. Reverify when endpoints or transport behavior change. |
| Can users request deletion? | Yes | In-app profile link and the external deletion-request page. |
| Independent security review? | No unless completed separately | Do not claim an external assessment without evidence. |

## Data-type mapping

`Collected` below means transmitted off the device to J2 Outdoor or another
service. Data processed only ephemerally on the device is recorded separately
and must be reclassified if logging, backup, analytics, or upload behavior
changes.

| Google Play category / type | Working classification | Purpose | Required or optional | Notes to verify |
|---|---|---|---|---|
| Personal info — Name | Collected | App functionality; account management; rental processing | Required when a rental proceeds or for an administrator account | Request-stage behavior must match backend. |
| Personal info — Email address | Collected for administrator accounts | Account management; security | Required for a remote administrator account | Confirm customer flow does not collect email. |
| Personal info — User IDs | Collected for administrator accounts | Account management; security | Required | Includes username or internal account ID. |
| Personal info — Phone number | Collected when supplied or when a rental proceeds | Communication; rental processing | Context-dependent | WhatsApp number and stored customer telephone number. |
| Personal info — Address | Collected in limited form when a rental proceeds | Rental processing; fraud prevention | Context-dependent | Limited to village and regency/city; no full KTP address. Confirm Play's current subtype wording. |
| Financial info — Purchase history | Collected | Rental, payment, deposit, refund, and accounting records | Required for completed transactions | Do not classify payment-card or bank credentials unless the implementation begins collecting them. |
| Photos and videos — Photos | Collected when administrators upload product photos | App functionality; catalog management | Optional | Product media is uploaded to the J2 Outdoor service. Do not classify KTP photos as an app feature: the current customer workflow has no KTP capture/selection and does not run OCR. Confirm Play's current subtype and collection answers against production behavior. |
| Photos and videos — Videos | Collected when administrators upload product videos | App functionality; catalog management | Optional | Product videos are uploaded to the J2 Outdoor service. Verify the server and retention behavior for the production release. |
| App activity — App interactions | Not known to be collected for analytics | — | — | Confirm no production analytics or interaction telemetry exists. |
| App info and performance — Diagnostics | Collected by ML Kit | Diagnostics; usage analytics; SDK reliability and compatibility | SDK-controlled | Google lists device/app information and performance/utilization metrics for all ML Kit features. |
| Device or other IDs | Collected by ML Kit | Diagnostics; usage analytics | SDK-controlled | For bundled features, Google lists a per-installation identifier not intended to identify a user or physical device. |

Historical note: an earlier production candidate was tested with camera capture
and on-device KTP OCR on 2026-09-30. That test does not describe the current
J2Outdoor customer workflow, which enters customer details manually and does
not expose KTP capture/selection or invoke OCR. Keep this as historical test
evidence only; do not use it as a current feature or Data Safety justification.

## Sharing assessment

- Customers do not create or use an application account. Customer Personal
  Data is associated with a request or rental record only. Account-management
  answers apply solely to authorized administrator accounts.

- J2 Outdoor administrators and the technical operator act for the same service;
  access by them is not described as a sale.
- A user can intentionally send a prepared message to WhatsApp. Confirm the
  current Play definition and user-initiated-transfer exception in the console
  before deciding whether the relevant types are marked as “shared.”
- The current J2Outdoor customer workflow does not invoke ML Kit and does not
  pass it KTP images or OCR text. ML Kit remains bundled as a reusable framework
  dependency; conservatively classify SDK device/app information,
  per-installation identifier, diagnostics, and utilization data as collected
  until the dependency is removed or current SDK disclosures are verified for
  the exact release. Google states these data are encrypted in transit with
  HTTPS and are not transferred to third parties.
- No data-sale claim may be selected unless production behavior remains
  consistent with the Privacy Policy.

## Retention and deletion answers

- Unconverted request drafts: delete 30 days after last activity.
- Verified account deletion: invalidate credentials and sessions and delete
  account/profile data no longer required within 30 days.
- Minimum transaction and accounting records: retain 10 years after the end of
  the relevant financial year.
- Legal hold: retain only relevant records while an active transaction,
  suspected fraud, audit, dispute, or legal proceeding remains open.
- After retention or hold: securely delete or permanently de-identify.
- Current workflow: customer details are entered manually; J2Outdoor does not
  capture/select KTP images or run OCR. Do not retain KTP images or OCR output.

## Submission gates

- [x] Publish and open both public URLs without authentication (HTTP 200
      verified on 2026-09-30).
- [x] Confirm production TLS for the reviewed API endpoint.
- [ ] Confirm every production backend field against this table.
- [ ] Confirm that logs, crash reporting, backups, and analytics do not add data
      types omitted above.
- [x] Review the current official ML Kit Android data disclosure, terms,
      release notes, and all 69 resolved runtime coordinates. No separately
      invoked analytics or crash-reporting SDK appears in the resolved graph.
- [ ] Verify the WhatsApp user-initiated sharing answer against the current form.
- [ ] Complete the Play Console form from the verified table and retain dated
      screenshots or an exported record of the submitted answers.
- [ ] Have the business owner approve the published policy, retention schedule,
      operational facts, and final console answers. Limited Indonesian legal
      advice remains recommended for higher-risk rental practices.
