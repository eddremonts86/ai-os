---
id: "895"
slug: difficulty-finding-relevant-respondents-for-b2b-researc
title: Difficulty finding relevant respondents for b2b research
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/tphf0sjeg1-difficulty-finding-relevant-respondents"
  captured: "2025-10-12"
category: other
date: "2025-10-12"
tags: [Other]
country: Russia
wtp:
  raw: "~500 RUB/respondent ($6) + commission"
  currency: USD
  min: 6
  max: 6
  period: one-shot
  mrrMid: 6
tech: [Next.js (researcher dashboard), Node.js (Fastify) + Postgres, LLM-based ICP-to-query translation, manual outreach tracking, optional Telegram bot for invite flow]
---
# Difficulty finding relevant respondents for b2b research

## Phase 0: Scaffold

- [x] Capture ProblemHunt post by Svetlana (Russia, 2025-10-12)
- [ ] Seed initial respondent pool from 3–5 curated communities (Slack, Telegram, public conference attendee lists), with each candidate carrying a qualifying signal
- [ ] Provision Next.js dashboard + Fastify API + Postgres on Coolify
- [ ] Define `projects`, `screeners`, `candidates`, `outreach_events`, `payouts` tables in Drizzle
- [ ] Set up warmed sending domains for outreach (one per project class), with rate limits per domain
- [ ] Decide LLM tier for ICP-to-query translation and screener judgment

## Phase 1: Core

- [ ] Researcher dashboard: project list, per-project workspace
- [ ] ICP form: industry, role, signal (e.g. "custom AI in production, 1,000+ req/month"), target interview count, incentive per respondent, deadline
- [ ] Match-rate confidence surfaced at ICP submission time, before funding (no over-promising)
- [ ] ICP-to-query translation (LLM): structured query with Boolean terms, source list, qualifying-signal heuristics
- [ ] Sourcing layer: pull candidates from the seeded pool that match the structured query; attach the qualifying signal per candidate
- [ ] Screener editor: researcher designs ≤ 5 questions, ≤ 3 min; non-skippable
- [ ] Screener sent automatically; LLM judges pass/fail against the ICP signal
- [ ] Shortlist view: researcher reviews screened candidates, approves the final list
- [ ] Outreach: rate-limited invite (email default, Telegram bot optional) with screener, incentive, and privacy notice; single-reminder policy
- [ ] Outreach status board per project: invited → screened → accepted → interviewed → paid
- [ ] Stripe Connect on the researcher side; project funding = (incentive × target count) + service commission, visible before checkout
- [ ] Respondent payout on interview completion; payout ledger visible to both sides
- [ ] End-to-end test: submit an ICP for the poster's exact case ("decision-makers implementing corporate custom AI, 1,000+ req/month"), fund a 5-respondent project, observe 5 sourced candidates with qualifying signals, 4 pass the screener, 3 complete the interview, 3 receive payout

## Phase 2: Deploy

- [ ] Onboard 20 pilot projects across PMs, founders, and UX researchers
- [ ] Prune sourcing sources that fail the match-quality threshold; expand sources that exceed it
- [ ] Weekly review of match quality (screener pass rate ≥ 70%), completion rate (interviewed / accepted ≥ 80%), and respondent retention in the pool
- [ ] Per-project throttling + warmed-domain rotation to defend outreach deliverability
- [ ] Post-mortem at week 14: projects shipped, time-to-shortlist, respondent repeat-participation rate, researcher second-project rate
