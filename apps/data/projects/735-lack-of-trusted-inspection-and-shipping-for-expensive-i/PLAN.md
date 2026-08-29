---
id: "735"
slug: lack-of-trusted-inspection-and-shipping-for-expensive-i
title: Lack of trusted inspection and shipping for expensive items when selling between cities. Willing to pay $80–130 per deal.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/c1i0ydfpt1-lack-of-trusted-inspection-and-shipping"
  captured: "2026-06-06"
category: logistics
date: "2026-06-06"
tags: [Logistics, Transportation, Business, Retail, Other]
country: Russia
wtp:
  raw: $80–130 per deal
  currency: USD
  min: 80
  max: 130
  period: deal
  mrrMid: 105
tech: [Flutter mobile app for inspectors, Ruby on Rails API, PostgreSQL, S3 media storage with signed URLs, Escrow payment provider integration, Carrier tracking APIs]
---
# Lack of trusted inspection and shipping for expensive items when selling between cities. Willing to pay $80–130 per deal.

## Tech Stack

- **Inspector app:** Flutter, because the inspector works offline in a garage or workshop and the app must capture photos, video and a working-test clip, queue them, and upload when signal returns. Media capture on a phone is the whole job.
- **API:** Ruby on Rails — the deal lifecycle here is a state machine over booking, inspection, packaging, handover, delivery and payment release, which is ordinary CRUD-plus-workflow, not a latency problem.
- **Database:** PostgreSQL, for the deal, report and dispute records that may be referenced months later in an insurance case.
- **Media:** S3-compatible storage with signed URLs so buyer and seller can view the report without the files being public.
- **Payments:** an escrow provider integration rather than holding funds directly — handling money for private high-value deals is a licensing question, not a feature.
- **Carriers:** tracking API integration so the recorded tracking number is verified rather than typed in and trusted.

## Architecture

The deal is the central object and it advances through states, each one gated by evidence: booked, inspected (report exists), packed, handed over (carrier tracking number verified against the carrier API), delivered, released. The inspector app writes evidence into a state; the API refuses to advance a state without it. Both buyer and seller read the same report via signed links, and payment release is triggered by the delivery event from the carrier, not by either party's word. Nothing here needs a novel component — the difficulty is operational, in having an inspector near the seller on the day.

## Milestones

1. **M0 — Report template.** Define the inspection report from the author's own seven steps: existence, listing match, serial number, accessories, completeness, working test, packaging. End of week 2.
2. **M1 — Inspector app.** Offline-first capture of photos, video and the working test against a checklist; upload on reconnect. End of week 5.
3. **M2 — Deal state machine + carrier handover.** Booking, report publication to both parties, tracking-number verification against a carrier API. End of week 8.
4. **M3 — Escrow leg.** Funds held on booking, released on the carrier's delivery event, with a dispute hold. End of week 11.
5. **M4 — First real deal.** Run Sergei's ESAB welding machine case end to end: inspection, 3–7 day carrier, released payment. End of week 13.
6. **M5 — Second city.** Recruit inspectors in one more city and measure whether a booking can be filled within 48 hours. End of week 18.

## Risks

- **Inspector supply is the business.** The technology is a checklist and a camera; the constraint is having a trusted person able to reach a seller's address in a given city on a given day. The author's own deal involves a buyer in a remote region. If inspector density is thin, the 3–7 day speed advantage over the marketplace's 3–4 weeks disappears in scheduling delay, which is the only reason the service beats the alternative.
- **Trust in the inspector is unearned at launch.** The product asks a buyer to release ~$1,500 partly on a stranger's report. Cargo surveyors carry accreditation for exactly this reason; a new consumer service starts with none, and the source says nothing about how that credibility gets established.
- **Unit economics at $80–130.** That fee must cover an inspector's travel and time, media storage, escrow fees and support. On a $1,000 item there is no room for a second visit or a re-inspection, so a failed visit likely eats the margin on the deal.
- **Liability boundary after handover.** The service verifies condition at the seller's door; the carrier moves the item. When a verified machine arrives damaged, the report is evidence but not insurance. The author lists insurance support as part of what he is paying for, without defining who underwrites it.
- **Low per-user frequency.** He states the problem does not arise weekly — only when trading something expensive remotely. Repeat revenue per user is low, so acquisition cost has to be recovered on close to a single deal.
