# Google Play Data Safety Working Sheet

Engineering review date: 2026-10-01

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
| Photos and videos — Photos | Not collected by the reviewed OCR flow | On-device app functionality | Optional input | KTP image is selected/captured and processed temporarily on device. Reclassify if it is uploaded, backed up, or logged. |
| App activity — App interactions | Not known to be collected for analytics | — | — | Confirm no production analytics or interaction telemetry exists. |
| App info and performance — Diagnostics | Collected by ML Kit | Diagnostics; usage analytics; SDK reliability and compatibility | SDK-controlled | Google lists device/app information and performance/utilization metrics for all ML Kit features. |
| Device or other IDs | Collected by ML Kit | Diagnostics; usage analytics | SDK-controlled | For bundled features, Google lists a per-installation identifier not intended to identify a user or physical device. |

On 2026-09-30, the exact production APK was exercised on a physical Android
16 device. Android runtime camera permission, in-app capture, and on-device OCR
worked with a sample image. The extracted name, village, and regency/city were
shown in editable fields. Save Customer was not invoked, the customer list
remained empty, and no `id-card-scan` file remained in the private cache after
restart. Source review confirmed that the customer-save payload excludes the
image, NIK, and raw OCR text. Test screenshots containing the sample identity
image were deleted after verification.

## Sharing assessment

- Customers do not create or use an application account. Customer Personal
  Data is associated with a request or rental record only. Account-management
  answers apply solely to authorized administrator accounts.

- J2 Outdoor administrators and the technical operator act for the same service;
  access by them is not described as a sale.
- A user can intentionally send a prepared message to WhatsApp. Confirm the
  current Play definition and user-initiated-transfer exception in the console
  before deciding whether the relevant types are marked as “shared.”
- ML Kit's on-device OCR input and output are not intentionally sent to Google,
  but SDK device/app information, per-installation identifier, diagnostics, and
  utilization data are classified as collected. Google states that these data
  are encrypted in transit with HTTPS and are not transferred to third parties.
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
- Do not retain NIK, KTP images, full KTP address, or raw OCR output.

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
