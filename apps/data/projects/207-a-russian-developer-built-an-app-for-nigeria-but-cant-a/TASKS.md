---
id: "207"
slug: a-russian-developer-built-an-app-for-nigeria-but-cant-a
title: "A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, PayPal and Stripe are blocked."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/"
category: fintech
date: "2026-04-04"
tags: [Fintech, Payments, Nigeria]
country: Russia
tech: [Python, FastAPI, Paystack, Flutterwave, PostgreSQL, Next.js]
---
# A Russian developer built an app for Nigeria but can't accept payments. App stores are unavailable, PayPal and Stripe are blocked.

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/207-a-russian-developer-built-an-app-for-nig/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Python, FastAPI, Paystack, and confirm versions resolve in CI.
- [ ] Wire Stripe (or the regional PSP for {country}) in test mode and document the price model in PRODUCT.md.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: Russia`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for Russia.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
## Phase 1: Core

- [ ] Partner-of-record onboarding in Nigeria
- [ ] Developer KYC and account creation
- [ ] Paystack and Flutterwave integration
- [ ] Customer payment page with partner disclosed
- [ ] Transaction ledger with audit log
- [ ] Settlement automation (USDC and bank transfer)
- [ ] Refund workflow with 90-day window
- [ ] Developer dashboard with transaction history
- [ ] First 10 developers live end-to-end
- [ ] Trust page with partner list

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python, FastAPI, Paystack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 207-a-russian-developer-built-an-app-fo MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python, FastAPI, Paystack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
