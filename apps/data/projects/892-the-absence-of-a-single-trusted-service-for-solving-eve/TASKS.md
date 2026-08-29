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

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (customer PWA chrome, concierge console table, contractor card with verification badge)
- [ ] Incorporate a Russian LLC; open a custodial escrow account with a Russian partner bank
- [ ] Wire customer phone-number OTP auth (Russian SMS provider) and email-link via Resend
- [ ] Sign a verification partnership with a Russian background-check partner (passport + INN + court records)
- [ ] Decide Drizzle schema: `customers`, `tasks`, `contractors`, `verifications`, `matches`, `escrow`, `disputes`, `payouts`

## Phase 1: Core

- [ ] Customer PWA intake: free text + category (car service / delivery / legal / travel / childcare / errands / other) + budget band + preferred time + location
- [ ] Task state machine: `intake → matching → assigned → in-progress → delivered → accepted | disputed`
- [ ] Concierge console: matching view, contractor pool with verification badges, SLA-tracked queue, dispute queue
- [ ] Contractor onboarding via Telegram bot: identity verification pipeline (passport + INN + court records); "verified" badge only after all three pass
- [ ] Escrow flow: customer pre-authorises payment; platform holds funds in the custodial account; debit on acceptance
- [ ] Contractor payout cycle (twice monthly) out of the escrow account; Russian self-employed receipts
- [ ] Dispute mediation: documented 24 h SLA; appeal path; contractor removed from the pool on repeat failure
- [ ] Per-task service fee (15%, ₽300–₽3,000 band) layered on the contractor's invoice; subscription tier ₽1,990/month with reduced fees
- [ ] "First task free or refunded" guarantee during the pilot
- [ ] Public dashboard: acceptance rate, dispute outcomes, average time to match
- [ ] Workspace status gating: customer flow continues after trial; subscription tier gated by Stripe / Russian equivalent webhook
- [ ] End-to-end test: customer describes a car-service task, concierge matches a verified contractor, escrow captures payment, customer accepts, contractor is paid

## Phase 2: Deploy

- [ ] Move payments to live mode (Russian partner bank + Stripe for the diaspora tier)
- [ ] Onboard 50 pilot customers + 100 verified contractors in Moscow and St Petersburg
- [ ] Weekly review of acceptance rate, dispute outcomes, and time-to-match during the pilot
- [ ] Tune the per-task fee against observed ROI
- [ ] Phase-2 expansion to a third city only after the playbook for the second concierge is documented
