---
id: "892"
slug: the-absence-of-a-single-trusted-service-for-solving-eve
title: The absence of a single trusted service for solving everyday tasks
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/c371yg3cu1-the-absence-of-a-single-trusted-service"
category: freelance
date: "2025-10-16"
tags: [Freelance]
country: Russia
---
# The absence of a single trusted service for solving everyday tasks

## Tech Stack

- **Customer-facing app:** React + TypeScript PWA (mobile-first), served by TanStack Start; the customer describes a task, tracks status, accepts or rejects the result, and triggers dispute mediation.
- **Concierge console:** a separate React + TypeScript web app at `console.platform.example`, role-gated to concierges; the concierge reads the task, picks the contractor, and drives the assignment to completion.
- **Contractor app:** a simple Telegram-bot interface plus a thin web view for document upload and status updates; no separate contractor mobile app in v1.
- **Backend:** Node.js + TanStack Start server functions for the customer / concierge / contractor flows; SQLite via Drizzle ORM for transactional state, hosted on a single Coolify instance.
- **Payments + escrow:** a Russian partner bank with a custodial escrow account; the customer pre-authorises the platform to debit the escrow on task acceptance; the contractor is paid out of the escrow on acceptance.
- **Verification:** a Russian background-check partner for passport + INN + court-record checks; the contractor profile surfaces a "verified" badge only after all three pass.
- **Notifications:** Resend for email; Telegram for the contractor side; SMS via a Russian SMS provider for the customer-side urgent alerts.
- **Dispute workflow:** an internal SLA-tracked queue with a 24 h response target; documented appeal path for the customer.

## Architecture

```
Customer (PWA)        Concierge (web console)     Contractor (Telegram)
       │                       │                          │
       │                       │                          │
       ▼                       ▼                          ▼
+-----------------------------------------------------------+
|                TanStack Start (API + customer PWA)        |
|                                                            |
|  ┌────────────┐  ┌────────────┐  ┌────────────────────────┐|
|  │ /api/task  │  │ /api/admin │  │ /api/contractor        │|
|  │  intake    │  │  console   │  │  (Telegram webhook)    │|
|  └─────┬──────┘  └─────┬──────┘  └─────────┬──────────────┘|
|        │               │                   │               |
|        ▼               ▼                   ▼               |
|  ┌──────────────────────────────────────────────────────┐  |
|  │              Drizzle / SQLite (tasks, escrow,        │  |
|  │              contractors, disputes, payouts)         │  |
|  └──────────────────────────────────────────────────────┘  |
|        │                                                   |
|        ▼                                                   |
|  Russian partner bank — custodial escrow account           |
+-----------------------------------------------------------+
```

## Milestones

1. **M0 — Spec + legal entity freeze.** Russian LLC incorporated; custodial escrow account opened with a partner bank; SPEC.md approved. End of week 3.
2. **M1 — Customer intake + task state machine.** PWA intake form (free text + category + budget band + time); task state machine (`intake → matching → assigned → in-progress → delivered → accepted | disputed`). End of week 6.
3. **M2 — Concierge console.** Matching view, contractor pool with verification badges, SLA-tracked queue, dispute queue. End of week 8.
4. **M3 — Contractor onboarding + verification.** Telegram bot; identity verification pipeline (passport + INN + court records) via the background-check partner; "verified" badge on profile. End of week 10.
5. **M4 — Escrow + payouts.** Customer pre-authorisation flow; escrow debit on acceptance; contractor payout cycle (twice monthly); Russian tax compliance (self-employed receipts). End of week 13.
6. **M5 — Pilot.** Launch in Moscow and St Petersburg, four task categories (car service, delivery, legal, childcare), 50 pilot customers + 100 verified contractors. End of week 18.

## Risks

- **Concierge hiring is the scaling choke point.** Matching + dispute mediation cannot be fully automated in v1. Mitigation: a documented concierge playbook; each new hire compounds capacity instead of just adding hands.
- **Contractor verification at scale.** Passport + INN + background check costs ₽1,500–₽3,000 per contractor and takes 3–5 days. Mitigation: batch verification with the Russian background-check partner; "verified" badge visible at the contractor-card level so the cost is justified by trust.
- **Escrow float is a working-capital and regulatory burden.** Holding customer money requires a Russian custodial escrow account and ties up cash. Mitigation: 1:1 match float against pending tasks; partner bank handles the regulatory reporting.
- **Dispute outcomes.** A wrong concierge decision damages trust. Mitigation: documented dispute playbook with a 24 h SLA, an appeal path, and a quarterly audit of dispute outcomes by the founders.
- **Trust-building with new customers.** The first 50 customers are the hardest because the author persona explicitly distrusts aggregators. Mitigation: a "first task free or refunded" guarantee during the pilot, plus a public dashboard of acceptance rate and dispute outcomes.
- **Pricing calibration.** The author gave no number. Mitigation: anchor on comparable Russian services and on ROI math; A/B-test the per-task fee during the pilot.
- **Geography expansion.** The concierge model depends on a dense verified-contractor pool, which is hard to bootstrap in smaller cities. Mitigation: phase-2 expansion tied to concierge hiring; do not promise coverage outside Moscow / St Petersburg.
