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

## Tech Stack

- **Frontend:** Next.js (React + TypeScript) researcher dashboard deployed on Vercel. Per-project workspace: ICP form, screener editor, shortlist view, outreach status board, payout ledger.
- **Backend API:** Node.js (Fastify) + Postgres on a single Coolify instance. Postgres stores projects, ICP definitions, screeners, sourced candidates, outreach events, interview completions, payouts.
- **ICP-to-query translation:** LLM prompt that takes the researcher's plain-English ICP and produces a structured query (Boolean search terms, source list, qualifying-signal heuristics). The same LLM judges whether a sourced candidate matches the ICP signal at submission time.
- **Sourcing layer:** a small set of vetted data sources per ICP (initially curated Slack/Telegram communities, public conference attendee lists, niche community rosters). Each source has an ingestion job that yields candidate rows with the qualifying signal attached.
- **Outreach layer:** a templated invite (email by default; Telegram bot optional) with the screener, the interview incentive, and the platform's privacy notice. Outreach events (invited, opened, screened, accepted, declined) are tracked per candidate. Rate-limited per project; single reminder policy.
- **Payments:** Stripe Connect (Express accounts) on the researcher side for project funding; respondent payout via the platform's payout method (bank transfer / card-to-card / Telegram Wallet, depending on region).

## Architecture

The researcher submits an ICP; the backend runs the LLM-based translation to produce a structured query, then runs the sourcing layer to produce a candidate shortlist. Each candidate is screened (the platform sends a screener; the candidate's responses are stored). The researcher reviews the screened shortlist, releases the funding, and the outreach is sent. Each interview completion is recorded by the researcher (or auto-detected from the calendar link), which triggers the respondent payout.

```
Researcher (browser)
       │  submits ICP + funds project
       ▼
Next.js dashboard ──▶ Fastify (projects, screeners, candidates, outreach)
       │                       │
       │                       ▼
       │                Postgres
       │                       ▲
       │                       │
       │   ICP-to-query (LLM)  │
       │            │          │
       │            ▼          │
       │     structured query  │
       │            │          │
       │            ▼          │
       │     sourcing layer ───┘ (candidates with qualifying signal)
       │            │
       │            ▼
       │     screener (LLM-judged pass/fail)
       │            │
       │            ▼
       │     shortlist (researcher review)
       │            │
       │            ▼
       │     outreach (rate-limited, single reminder)
       │            │
       │            ▼
       │     interview completion ──▶ respondent payout (Stripe Connect)
       ▼
   payout ledger, retention signal
```

## Milestones

1. **M0 — Spec freeze + pool seed.** SPEC.md approved; initial respondent pool seeded from 3–5 curated communities (Slack, Telegram, conference attendee lists). End of week 2.
2. **M1 — Researcher dashboard + ICP form.** Next.js shell; ICP form; project record in Postgres. End of week 4.
3. **M2 — ICP-to-query + sourcing layer.** LLM translation; sourcing against the seeded pool; candidate shortlist with the qualifying signal per match. End of week 6.
4. **M3 — Screener + outreach.** Researcher designs the screener; platform sends it; outreach events tracked; rate-limited send + single reminder. End of week 8.
5. **M4 — Payments + payout.** Stripe Connect on the researcher side; respondent payout on interview completion; payout ledger visible to both sides. End of week 10.
6. **M5 — Pilot.** 20 projects across PMs, founders, and UX researchers; weekly review of match quality, completion rate, and respondent retention. End of week 14.

## Risks

- **Pool quality.** The platform's value is the qualifying signal per match, not the outreach automation. A pool of 100 well-matched candidates beats a pool of 10,000 loosely-matched ones; seeding and ongoing curation is a founding problem, not an engineering problem. The MVP must track match-quality per source and prune sources that fail.
- **Outreach deliverability.** A single sending domain sending hundreds of invites per day will be blacklisted. The platform needs warmed sending domains (one per project class), per-project throttling, and a one-click decline path for the respondent. Deliverability regressions are silent — the open rate falls and the platform only finds out when match quality collapses.
- **Screener design.** The poster's ICPs are narrow; the screener must be designed per project by the researcher, must be ≤ 5 questions, and must not be skippable. A 1-question "are you the right person?" screener passes the wrong people and tanks the completion rate.
- **Match-rate honesty.** If the dashboard promises "5 respondents in 5 days" for an ICP the pool cannot fill, the researcher's project stalls and a refund follows. The dashboard must surface match-rate confidence at ICP submission time, before funding.
- **Respondent privacy.** A respondent's profile and prior interview topics must stay private to the researcher they accepted. Cross-researcher visibility is opt-in only. A single leak of "this person is in our pool" is a permanent reputational hit and a regulatory problem in some jurisdictions.
