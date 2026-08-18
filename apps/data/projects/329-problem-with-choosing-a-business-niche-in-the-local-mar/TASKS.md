---
id: "329"
slug: problem-with-choosing-a-business-niche-in-the-local-mar
title: Problem with choosing a business niche in the local market
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/tl9r966991-problem-with-choosing-a-business-niche-i"
category: ai
date: "2025-10-29"
tags: [AI, Business, Psychology, Education, Other]
country: India
tech: [Next.js, OpenAI API, Firebase Firestore, Vercel Cron, Razorpay]
---
# Problem with choosing a business niche in the local market

## Phase 0: Scaffold

- [ ] Read the source at `https://problemhunt.pro/en/ai/tl9r966991-problem-with-choosing-a-business-niche-i` and quote the original problem statement into a `source-quote.md` for traceability.
- [ ] Create the project folder under `apps/329-problem-with-choosing-a-business-niche-i/` (or per the chosen deployment target).
- [ ] Initialize git, pin dependencies for: Next.js, OpenAI API, Firebase Firestore, and confirm versions resolve in CI.
- [ ] Write DESIGN.md with country-appropriate defaults (`country: India`) — color, type, density, motion tokens — not the global default.
- [ ] Scaffold the auth + persistence layer with data-residency configured for India.
- [ ] Set up the framework router, server actions, and a typed API client for the read/write endpoints listed in PLAN.md.
- [ ] Set up the LLM provider abstraction (rate-limit, fallback model, prompt cache) and the eval harness for the {country}-relevant test cases.
## Phase 1: Core

- [ ] Intake form: city, capital ceiling (INR), hours/week, 2-3 niche candidates
- [ ] Demand pull: Google Trends city/state, JustDial category volume, Reddit/Quora post count
- [ ] Competition pull: Maps business count, IndiaMART/TradeIndia active listings
- [ ] Personal-fit questionnaire (10 questions, score 0-10 per niche)
- [ ] Side-by-side comparison view with weighted ranking (40% demand, 25% competition, 20% capital, 15% fit)
- [ ] One-page printable memo (PDF) with the comparison and a recommendation paragraph
- [ ] End-to-end test: 3-city cohort of 10 founders, verify the recommendation tracks a manual expert review within +/-10%

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js, OpenAI API, Firebase Firestore) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 329-problem-with-choosing-a-business-ni MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in India completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js, OpenAI API, Firebase Firestore errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
