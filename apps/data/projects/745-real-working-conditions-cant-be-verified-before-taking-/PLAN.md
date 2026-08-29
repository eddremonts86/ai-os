---
id: "745"
slug: real-working-conditions-cant-be-verified-before-taking-
title: "Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct contact with former employees. Willing to pay: £50–100 when I successfully get hired."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/career/f50s1ke0t1-real-working-conditions-cant-be-verified"
  captured: "2026-04-24"
category: career
date: "2026-04-24"
tags: [Career, AI, Other]
country: UK
wtp:
  raw: £50–100 on successful hire
  currency: GBP
  min: 50
  max: 100
  period: hire
  mrrMid: 75
tech: [Next.js, Supabase (Postgres + auth), Stripe Connect for referral payouts, Resend transactional email, Discord and Telegram bot integrations, Redis job queue]
---
# Real working conditions can't be verified before taking a job — reviews lie. Need a service for direct contact with former employees. Willing to pay: £50–100 when I successfully get hired.

## Tech Stack

- **Frontend:** Next.js — the candidate-facing surface is a search box, a request form and a threaded Q&A; server-rendered pages keep the company pages indexable, which is how candidates would find this at all.
- **Data + auth:** Supabase (Postgres with row-level security) so a respondent's identity can be hidden from the candidate while remaining verified to the platform.
- **Payouts:** Stripe Connect, because the respondent side needs paying and the candidate's £50–100 only arrives on a hire — two flows on different clocks.
- **Community bridges:** Discord and Telegram bot integrations, since the author says these groups are exactly where photographers already discuss employers, with the search problem being the barrier.
- **Queue:** Redis for outreach jobs — matching, invitation sends and reminder chases are asynchronous and rate-limited by design.
- **Email:** Resend for invitation and reminder mail to potential respondents.

## Architecture

Three sides, joined by a request. A candidate names a company and asks up to a few specific questions. The matcher looks for verified former employees whose employment ended in the last 6–12 months and who have opted in to answer, ranked by their past reply rate. Invitations go out through the queue, rate-limited so one respondent is never flooded. Answers land in a thread the candidate reads; respondent identity stays behind row-level security. The hire event, self-reported by the candidate, triggers the £50–100 charge and the respondent payout.

The pool is seeded from the communities the author already named — photography Discords and Telegram groups — where the conversations exist but are unsearchable. A bot that lets members register as answerable-for-company-X converts an existing behaviour into supply, which is cheaper than building a directory from scratch.

## Milestones

1. **M0 — Verification design.** Decide how recent employment is confirmed without demanding documents. This gates everything; a respondent nobody can trust is a review, and reviews are the problem. End of week 2.
2. **M1 — Respondent onboarding.** Opt-in flow, company and dates captured, anonymity guarantees stated in plain language. End of week 4.
3. **M2 — Request and match.** Candidate asks about a company, matcher finds opted-in recent ex-employees, invitations sent through the rate-limited queue. End of week 6.
4. **M3 — Q&A thread.** Structured short-answer exchange, respondent pseudonymous, no free-form contact details. End of week 8.
5. **M4 — Payments.** Candidate charged £50–100 on self-reported hire; respondent paid per answered request. End of week 10.
6. **M5 — Community seeding.** Discord and Telegram bot in two photography communities; measure how many members opt in. End of week 13.

## Risks

- **Nobody replies.** This is the risk that already materialised: the author messaged several employees on LinkedIn and got no answers at all, and does not know why. If opt-in plus payment does not fix reply rate, the product is a directory of silence.
- **The 6–12 month window shrinks supply hard.** Verified, recent, opted-in and willing to talk about a specific employer is a narrow intersection. For any company outside the largest employers, the expected pool is zero, and the source gives no basis for estimating coverage.
- **Contingent pricing pays for the wrong outcome.** £50–100 lands only when the candidate gets hired. The conversation that correctly warns someone off — the author's actual case — earns nothing, while respondents still need paying.
- **Legal exposure on both sides.** A respondent describing unpaid work processes at a named UK employer may be breaching confidentiality terms; the platform hosting it inherits defamation risk. The source does not touch this.
- **Gaming.** Review platforms failed here because companies allegedly seeded fake negatives to dilute real ones. A paid Q&A network invites the same behaviour in a more targeted form: an employer-planted respondent giving reassuring answers is harder to detect than a fake review.
