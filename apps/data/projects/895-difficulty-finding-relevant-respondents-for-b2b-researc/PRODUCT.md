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

## Value Proposition

A product manager testing B2B hypotheses cannot find the right respondents — LinkedIn is high-spam, Telegram chats attract the wrong people, and recruitment agencies charge a commission with no visibility into how the matches were made. The service takes the researcher's ICP, translates it into a structured query, surfaces a shortlist of pre-vetted respondents with the qualifying signal per match, handles the outreach, and pays the respondent on interview completion — so the researcher pays per interview (respondent fee + a visible service commission) instead of doing the outreach themselves or accepting an opaque agency process.

## Target Users

| Stakeholder | Why they care |
|---|---|
| PM / founder / B2B researcher (the poster) | Tests multiple B2B hypotheses; needs a steady, low-friction supply of qualified respondents. |
| UX researcher at SMB / consultancy | Runs 5–20 customer interviews per quarter; wants per-interview pricing, not an annual panel contract. |
| Community / Slack-Telegram group operator | Has a vetted membership; wants to monetise interview access without running a recruitment agency. |
| Respondent | Wants paid interview opportunities matching their expertise, with a transparent fee schedule. |

## Jobs To Be Done

1. **Functional job** — Get a shortlist of pre-qualified respondents for an ICP, with the source and the qualifying signal per match, without personally running outreach.
2. **Emotional job** — Stop the "I cannot find anyone to talk to about this hypothesis" blocker that stalls product discovery.
3. **Social job** — Be able to tell a co-founder "we interviewed 8 of these last month" with confidence, instead of "we tried LinkedIn for two weeks".

## Success Metrics

- **Activation:** a researcher submits an ICP and funds the project within their first session.
- **Match quality:** ≥ 70% of sourced respondents pass the screener (proxy for the ICP-to-query translation reading the ICP correctly).
- **Completion rate:** ≥ 80% of accepted invites convert to a completed interview.
- **Time-to-shortlist:** median time from "ICP submitted" to "researcher reviews shortlist" is under 5 business days.
- **Retention:** ≥ 60% of researchers run a second project within 60 days of their first.

## Pricing & Monetization

Per-interview pricing, matching the poster's stated model: respondent fee (set by the researcher, with a floor) + a visible service commission. The platform does not lock the researcher into a subscription they cannot use; the per-project model aligns the platform's revenue with completed interviews. Plausible surfaces:

- **Per-project fee** — respondent incentive × target count + a service commission (e.g. 30% of the respondent incentive, capped).
- **Subscription tier** — a monthly plan for researchers running ≥ 3 projects/quarter, with a reduced per-interview commission.
- **Pool-side monetisation** — communities that bring their own vetted respondent pool take a cut of the commission on interviews sourced from their pool, instead of paying a subscription.

## Competitive Landscape

- **Recruitment agencies for B2B research (Justriders, Respondent.io, User Interviews, fieldwork agencies)** — established, charge a commission on top of the respondent's incentive, but the matching is opaque: the researcher rarely sees the qualifying signal per match or how the respondent was sourced.
- **Self-serve research platforms (Respondent.io, Prolific, Userlytics)** — let researchers post studies and recruit from a panel; the panel quality varies, and matching against an ICP (especially a niche one like "custom AI in production with 1,000+ req/month") is weaker than the poster needs.
- **LinkedIn Sales Navigator + manual outreach** — the do-it-yourself option; high spam, time-consuming, requires a well-developed profile, and the matching is keyword-based, not signal-based.
- **Telegram / Slack communities with curated membership** — high-trust, niche, but no scheduling, no payment, no incentive mechanism; the researcher runs the whole loop manually.
- **AI-led prospect search tools (Apollo, Clay, Lemlist)** — built for sales prospecting, not for paid research interviews; the targeting and the qualification heuristics are wrong for the use case.

## Risks & Open Questions

- [ ] Respondent pool quality is the product. The MVP cannot be a thin wrapper around "send invites via Telegram" — the qualifying signal per match is the differentiator. Pool seeding (where the initial 1,000 respondents come from) is a founding problem, not an engineering problem.
- [ ] Outreach deliverability. Sending invites from a single domain at scale will get the domain blacklisted. The platform needs warmed sending domains, per-project throttling, and clear decline handling — otherwise the pool drains faster than it fills.
- [ ] Screener design. The poster's ICPs are narrow ("custom AI in production, 1,000+ req/month"); the screener must be designed per project by the researcher and must not be skippable. A 1-question "are you the right person?" screener will pass the wrong people.
- [ ] Match rate honesty. If the platform promises "5 respondents in 5 days" for an ICP it cannot fill, the researcher's project stalls and the refund request follows. The dashboard must show match-rate confidence at ICP submission time, before funding, not after.
- [ ] Respondent privacy. A respondent's profile and prior interview topics must stay private to the researcher they accepted; any cross-researcher visibility must be opt-in. A leak of "this person is in our pool" is a permanent reputational hit.
