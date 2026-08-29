---
id: "791"
slug: its-impossible-to-donate-to-animal-shelters-due-to-comp
title: "It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/1adxzgi7b1-its-impossible-to-donate-to-animal-shelt"
category: other
date: "2026-01-17"
tags: [Other]
country: Russia
tech: [Go, Chi router, PostgreSQL, TimescaleDB extension, Open Banking API integration, Rust receipt-verifier service, S3-compatible cold storage, Docker, Coolify]
---
# It's impossible to donate to animal shelters due to complete distrust in charity fundraisers. There is no service with guaranteed transparency and audit

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A donation-collection service for Russian animal shelters where every contribution is tied to a specific campaign, every campaign is tied to a declared use, every disbursement is tied to an uploaded document, and an independent audit layer — run by the service, not the shelter — verifies the trail so a donor who wants to give can do so without taking the fundraiser on faith.

The shelter page is public. The donation page shows the campaign, the declared use, and the current total. The donor's receipt page shows exactly where their money went and the document the audit layer accepted as proof. An independent auditor can replay the trail through a read-only API. The donor does not have to trust the shelter — they trust the trail, and the trail is auditable by someone who is neither donor nor shelter.

**One-liner:** A donation trail for Russian animal shelters that is produced by an independent audit layer rather than by the shelter itself, so a donor who wants to give can inspect where the money went before sending it.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Individual Russian donors | Want to give but stay on the sideline because fundraisers cannot be trusted to report honestly. |
| Russian animal shelters (lost trust) | Have donors who drifted away and need an auditable channel to recover them. |
| Russian animal shelters (no trust yet) | Need a launch surface that earns trust through evidence rather than through a brand. |
| Independent auditors | Need read access to a replayable donation trail to verify a shelter's claims. |
| Repeat donors | Want to track the specific shelter they supported across multiple donations. |
| Shelter volunteers | Want to publish a transparent report without taking on the accountant role themselves. |

## Jobs To Be Done

1. **Functional job** — Send a donation to a specific shelter campaign and have a receipt that names where the money went, not just a thank-you email.
2. **Functional job** — Find a shelter whose fundraising I can verify before I send money, rather than guess which fundraiser is honest.
3. **Functional job** — Replay the donation trail of a shelter I care about to see how money has actually been spent over time.
4. **Emotional job** — Stop the feeling that donating to an animal shelter is a leap of faith.
5. **Social job** — Be a donor who can show the trail to friends who ask whether the shelter is honest.

## Success Metrics

- **Donor repeat rate** — share of donors who make a second donation within 90 days. The service only earns trust if donors come back; a one-time spike is the wrong signal.
- **Audit flag rate** — share of uploaded documents the independent audit layer flagged for mismatch against the declared expense category. A low rate is the goal, and the rate has to be honest.
- **Document coverage** — share of disbursements that have at least one uploaded document backing them. A trail without documents is not a trail.
- **Time-to-receipt** — median time from a donor's payment to the per-donor receipt page being live. Receipts that arrive days later destroy the trust the receipt is supposed to prove.
- **Audit-API pull rate** — share of registered shelters that received at least one read-only audit pull in a quarter, which is the signal that an independent party is actually using the audit lane.
- **Shelter onboarding completion** — share of shelters that complete onboarding and publish a first campaign within 14 days of registration, which tells the service whether onboarding is too heavy.

## Pricing & Monetization

The source names no fee, no percentage and no tier. What the architecture fixes is the cost shape: the service could charge the shelter a flat monthly fee, a percentage per donation, or a per-campaign fee; or it could charge the donor a small convenience fee. The source does not pick one. Any choice must be evaluated against the audit-flag rate and the donor repeat rate, because the service's value depends on the audit being perceived as independent rather than as a revenue source.

## Competitive Landscape

- **Existing Russian charity-fundraising platforms (the names the source does not provide)** — accept donations but do not produce an independent audit trail per contribution, which is the gap the source names.
- **Personal fundraising pages on social networks (VK, Telegram)** — reach donors without producing any audit layer at all; the trust model is the network, not the evidence.
- **Direct shelter bank transfers** — full transparency to anyone the shelter chooses to share with, but no independent third party to verify, and no public receipt the donor can keep.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the regulatory path (Russian charity-fundraising rules, personal-data handling, payment-processor licensing) before launching with real donations.
- [ ] Define what the audit layer flags as a mismatch — declared expense category, document type, amount range, date window — so two reviewers would agree on the same flag.
- [ ] Decide whether the service ever publishes a shelter whose audit-flag rate is high (so donors can see it), or silently deactivates them, since either choice affects the trust model.
- [ ] Confirm the document retention policy is compatible with Russian personal-data rules and with the payment-processor's recordkeeping requirements.
- [ ] Decide whether private donations are visible in aggregate to the shelter, or only to the service's audit layer, since either choice changes what the shelter can learn.
- [ ] Validate with five Russian animal shelters that the per-campaign, per-donation transparency model fits how they actually fundraise, or whether aggregate-only is the only shape shelters will adopt.
