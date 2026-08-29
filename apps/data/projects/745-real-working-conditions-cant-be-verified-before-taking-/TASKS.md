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

## Phase 0: Scaffold

- [x] Capture the problem from ProblemHunt, including the failed LinkedIn outreach and the review-site failure modes
- [ ] Write DESIGN.md (company page, request form, pseudonymous Q&A thread)
- [ ] Decide the employment-verification method for the last 6–12 months
- [ ] Draft respondent terms covering anonymity, confidentiality risk and payout
- [ ] Set up Supabase with row-level security so respondent identity is never readable by candidates

## Phase 1: Core

- [ ] Respondent opt-in: company, role, employment end date, questions they will answer
- [ ] Employment verification check, with a manual review path for cases automation cannot settle
- [ ] Recency gate: only respondents whose employment ended within 6–12 months are matchable
- [ ] Candidate request: name a company, submit a few specific questions, state the offer deadline
- [ ] Matcher: rank opted-in respondents by reply history, not just availability
- [ ] Rate-limited invitation queue with a reminder chase, so no respondent is flooded
- [ ] Pseudonymous Q&A thread: short answers, no contact-detail exchange
- [ ] Reply-rate instrumentation per respondent and per company — the metric the LinkedIn approach failed on
- [ ] Hire self-report → charge the candidate £50–100 via Stripe
- [ ] Respondent payout per answered request, independent of whether the candidate takes the job
- [ ] Abuse controls against employer-planted respondents, the targeted version of the fake-review problem
- [ ] Discord and Telegram bot for community seeding: let members register as answerable for a company

## Phase 2: Deploy

- [ ] Seed two photography communities and count actual opt-ins
- [ ] Run ten real candidate requests and measure reply rate and time to first answer
- [ ] Legal review of confidentiality and defamation exposure in the UK before public launch
- [ ] Revisit contingent pricing if conversations that warn candidates off dominate the volume
