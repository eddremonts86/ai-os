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

## Problem

The poster is testing new B2B hypotheses in IT — currently hunting for decision-makers involved in implementing corporate custom AI solutions with a load of 1,000+ requests per month — and cannot find the right respondents. The current options each fail in a specific way the poster names. LinkedIn outreach is high-spam and requires a heavily-developed profile to get any response; relevant Telegram chats attract off-target respondents and a more detailed query reduces conversion because nobody reads it through; recruitment agencies work but charge a commission on top of the respondent's fee with no transparency into how the respondent was found. The poster will pay for respondents' time plus a service commission, or a subscription, with the cost depending on the ICP's complexity — explicitly around 500 rubles (~$6) for their current case. The problem is not episodic; the poster has been searching for respondents regularly for several months while testing new product hypotheses.

## Objective

Ship a respondent-finding service that takes a researcher's ICP (industry, role, signal — e.g. "decision-makers implementing corporate custom AI with 1,000+ req/month"), translates it into a structured query, surfaces a shortlist of pre-vetted respondents with the source and the qualifying signal per match, and handles the outreach and incentive payment transparently — so the researcher pays per completed interview (respondent fee + a small service commission) instead of doing the outreach themselves or paying a recruitment agency on opaque terms.

## Target Users

- **Primary:** product managers, founders, and B2B researchers (the poster's profile) who are testing multiple B2B hypotheses and need a steady, low-friction supply of pre-qualified respondents for short interviews.
- **Secondary:** UX researchers at SMBs and consultancies who run 5–20 customer interviews per quarter and want a per-interview pricing model instead of an annual research panel contract.
- **Tertiary:** community-led research collectives and Slack/Telegram communities that already have a vetted membership and want a way to monetise interview access for their members without running a recruitment agency themselves.

## MVP Scope

- A researcher dashboard: per project, an ICP form (industry, role, signal — e.g. "running custom AI in production with 1,000+ req/month"), target number of interviews, incentive offered per respondent, deadline.
- A ICP-to-query translation layer: the LLM converts the researcher's plain-English ICP into a structured query (Boolean search terms, source list, qualifying-signal heuristics).
- A sourcing layer: per query, a shortlist of candidate respondents drawn from a curated pool (initially seeded by the founding team from public B2B communities, Slack/Telegram groups, conference attendee lists where public) plus a verification step that confirms each respondent matches the ICP signal (e.g. a 3-question screener).
- A outreach layer: the dashboard sends a templated invite (email or Telegram, based on the respondent's listed channel) with the screener, the interview incentive, and a privacy notice. Outreach status is tracked per respondent (invited → screened → accepted → interviewed → paid).
- A researcher-side payment flow: the researcher pre-funds the project (interview incentive × target count + a service commission), the platform pays the respondent on interview completion via the platform's payout method.
- A respondent-side flow: respondents receive invites, accept or decline, complete the interview (off-platform, by the researcher's choice), and receive payment; respondents see a profile of past interview topics and a transparent fee schedule.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The poster's stated cost ceiling is around 500 RUB (~$6) per respondent for their current case, with the actual cost depending on ICP complexity. The platform must let the researcher set the incentive; charging a fixed platform fee above the respondent's incentive must be transparent and visible before checkout.
- Respondent anonymity must be preserved until the interview is accepted. Until then, the researcher sees only the qualifying signal ("Senior Engineer at company X, runs custom AI in production, 1,000+ req/month — verified YYYY-MM-DD"), not the respondent's name or direct contact info.
- Outreach must be opt-in: respondents receive invites only because they are in the platform's pool; no scraping of LinkedIn profiles without consent.
- The MVP must respect Telegram and email anti-spam conventions (rate-limited outreach, single reminder, easy decline). Sending a flood of invites from a single domain will get the domain blacklisted and the researcher pool emptied.
- The screener must be quick (≤ 5 questions, ≤ 3 minutes) or the conversion from "invited" to "screened" collapses.
- The MVP must not promise a respondent count the platform cannot deliver. If the pool cannot fill the request, the dashboard must say so before the researcher pays, not after.
