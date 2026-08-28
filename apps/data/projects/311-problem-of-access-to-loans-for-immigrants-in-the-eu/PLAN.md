---
id: "311"
slug: problem-of-access-to-loans-for-immigrants-in-the-eu
title: Problem of access to loans for immigrants in the EU
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/mebr1a5hi1-problem-of-access-to-loans-for-immigrant"
category: finance
date: "2025-11-12"
tags: [Finance, Immigration, Other]
country: Portugal
tech: [Next.js, TypeScript, Postgres, Plaid (EU), Stripe, Resend, Vercel]
---
# Problem of access to loans for immigrants in the EU

## Tech Stack

- **Web app:** Next.js 14 (App Router), TypeScript, deployed on Vercel with EU-region hosting for GDPR.
- **Database:** Postgres (Neon EU region) for applicants, documents metadata, alternative credit file, lender applications.
- **Document storage:** encrypted S3-compatible EU bucket (Hetzner Object Storage, EU region); per-document keys, server-side encryption.
- **Bank / rent verification:** Plaid EU for bank linking where available; rent and utility bills via document upload + manual review.
- **Lender routing:** per-lender adapter that takes the JSON file and posts to the lender's intake API or via a manual ops queue.
- **Notifications:** Resend for email; Twilio for SMS status updates.

## Architecture

A Next.js app serves the applicant console (authed RSC), the document upload UI, and the application tracker. The alternative credit file builder reads uploaded documents and parsed bank/rent data, normalises them into a portable JSON shape, and writes the file to Postgres. The lender router reads the file and dispatches to each lender's adapter; the result is a list of offers the applicant can act on.

```
Browser ─▶ Next.js console ─┐
                            ├─▶ Postgres (applicants, file, applications)
Document uploads ───────────┤
Plaid EU bank link ─────────┤
                            │
                            └─▶ File builder ─▶ Lender adapters
                                                       │
                                                       └─▶ Offers + tracker
```

## Milestones

1. **M0 — Spec freeze + Portugal data sources.** NIF, residence permit, rent contract templates. End of week 1.
2. **M1 — Applicant profile + document upload.** Encrypted at rest, audit log visible. End of week 3.
3. **M2 — Alternative credit file v1.** Rent payments, employer verification, identity proof in a portable JSON. End of week 5.
4. **M3 — Lender router + 3 lender integrations.** Per-lender adapter, ops queue for manual review. End of week 8.
5. **M4 — 50-applicant pilot in Lisbon + Porto.** End of week 12.

## Risks

- **Lender network depth** — Portugal has a small neobank market; without 3+ lenders, the router returns nothing and the product feels broken. Mitigation is the manual ops queue fallback that processes the file by hand.
- **Document fraud** — fake rent contracts and payslips are common; mitigation is a layered check (cross-reference employer NIF, landlord NIF, utility bill at the same address).
- **GDPR right-to-erasure** — applicants must be able to delete their file and all derived lender applications; the data model needs to support hard delete across the lender-side views too.
