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

## Problem

The author turned photography from a hobby into commercial work and took their first job with a company where the conditions and tasks described during hiring looked great. They passed an interview, did almost a month of in-house training, then spent another week assembling the documents and certificates the company asked for. Once actually working, reality diverged: work processes nobody had mentioned, unpaid, and they quit rather than accept it — several months wasted, ending in burnout. They had read reviews about the company beforehand and found them useless. Some were obviously fake, including negative ones, which they read as the company diluting real problems with fake criticism; another batch were overly emotional and contradictory, possibly from competitors. Of hundreds of reviews, only a small fraction matched their actual experience. They know photographers discuss employers in Discord and Telegram groups, but only thought of searching there after quitting, and those chats carry a huge flow of messages with poor search. They also tried messaging a few current employees directly on LinkedIn and got no replies at all, for reasons they do not know. What they want is a way to quickly find and talk to real people who actually worked at a company in the last 6 to 12 months, ask a few honest questions, and decide whether the job is worth taking. They would pay £50–100, on successfully getting hired.

## Objective

Connect a candidate with people who verifiably worked at a target company within the last 6–12 months and who are likely to actually reply, so a few honest questions can be answered before accepting an offer — paid on a successful hire, not upfront.

## Target Users

- Primary: candidates about to accept an offer who cannot tell from reviews what the job is really like — here, someone moving into commercial photography who lost several months and burned out on their first role.
- Secondary: former employees of the target company willing to answer a few questions, whose incentive to reply is the missing piece: the author's cold LinkedIn messages to current employees got no response.

## MVP Scope

- Company lookup: find people who worked at a named company within the last 6–12 months.
- Recency filter as a hard constraint — the author asks specifically for the last 6 to 12 months, not any former employee.
- Employment verification, so a respondent is not another anonymous review.
- Response likelihood: surface or prioritise people who have opted in to answer, addressing the silence the author hit on LinkedIn cold outreach.
- A short structured Q&A: a few honest questions, not an open-ended chat.
- Payment on outcome: the candidate pays £50–100 when they successfully get hired.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Payment is success-contingent: £50–100 when the candidate gets hired. Revenue arrives late and depends on an event the service does not control, so cost per conversation has to be near zero before that point.
- Respondents must be motivated to reply. The author's direct LinkedIn approach failed completely; a service that just surfaces names reproduces that failure.
- The recency window is 6–12 months. A pool of older ex-employees does not answer the question being asked.
- Review platforms are the failure mode, not the model: Glassdoor and Indeed reviews were, in this case, a mix of fake positives, likely-fake negatives and contradictory emotional posts. Any UGC design that allows anonymous unverified posting recreates the problem.
- TODO: the source does not say how many companies, regions or industries the service would need to cover to be useful. The author's own experience is a single UK photography employer, so coverage requirements remain unknown.
