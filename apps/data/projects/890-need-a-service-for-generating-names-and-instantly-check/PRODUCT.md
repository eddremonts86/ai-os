---
id: "890"
slug: need-a-service-for-generating-names-and-instantly-check
title: Need a service for generating names and instantly checking domain availability
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/s4e5ajoj91-need-a-service-for-generating-names-and"
  captured: "2025-10-16"
category: marketing
date: "2025-10-16"
tags: [Marketing]
country: Russia
wtp:
  raw: hidden commission on domain purchase accepted
  currency: USD
  min: 0
  max: 0
  period: one-shot
  mrrMid: 0
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, WHOIS + RDAP + registrar APIs (Namecheap, Porkbun, etc.), Coolify, Docker]
---
# Need a service for generating names and instantly checking domain availability

## Value Proposition

A founder picking a name and a domain for a new project gets one tool that generates short candidate names and instantly tells them which matching .com / .ru / .net domains are available, then hands them off to a registrar to buy — so the average couple-of-days name-and-domain selection collapses into one short, productive session, and the registrar's affiliate commission funds the service rather than a separate SaaS subscription.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Founder / indie hacker / side-project builder | Picks a name + domain every project; wants short names with verified availability across .com / .ru / .net in one step. |
| Marketer / brand-strategy freelancer | Runs naming sprints for clients; needs ten candidates + verified availability per pass to deliver in days, not weeks. |
| Domain investor / "name-hunter" | Wants a fast availability sweep across a candidate list with a length filter to triage faster. |
| Domain registrar (indirect) | Gains a high-intent buyer channel; pays an affiliate commission on the resulting sales. |

## Jobs To Be Done

1. **Functional job** — Pick a name and a matching available domain for a new project, across .com / .ru / .net, in one session instead of two days of cross-checking.
2. **Emotional job** — Stop feeling like every project starts with the same frustrating "is this name taken?" loop.
3. **Social job** — Be able to recommend a tool to a co-founder that produces a list of name-plus-domain candidates rather than just a list of names.

## Success Metrics

- **Activation:** a first-time visitor generates a name batch and sees availability results for the chosen zones within 60 seconds of landing on the page.
- **Click-through to registrar:** ≥ 25% of visitors who mark a domain as "the one" click through to the registrar handoff within the same session.
- **Conversion to purchase:** affiliate-tracked purchase rate (registrar-side) compared to the typical referral baseline; v1 should establish the metric rather than hit a fixed number.
- **Free-tier funnel:** ≥ 10% of free-tier users who hit the daily cap return to sign up for the paid tier within 7 days, indicating the cap is calibrated correctly.
- **Trust signal:** zero false "available" results reported against actual WHOIS / RDAP for at least the .com / .ru / .net zones within the first 90 days.

## Pricing & Monetization

Free tier with a daily candidate-generation cap; paid tier with higher caps, bulk export, and team collaboration. Primary revenue is the registrar affiliate commission on domains purchased through the handoff links (the author's stated willingness-to-pay), not the SaaS subscription; the paid tier exists as a friction-removal layer for agencies and power users.

## Competitive Landscape

- **Namecheap / Porkbun / GoDaddy search boxes** — do availability checks but no name generation; the user has to bring the candidate list themselves.
- **Lean Domain Search / Panabee / Namelix** — generate names, but availability is either absent, slow, or limited to a subset of zones; the post's specific complaint ("the existing service generated names but did not check domains in the same step") points at this gap.
- **Spreadsheet + manual WHOIS** — what founders do today; works at one-candidate-per-five-minutes pace and exactly does not scale.
- **AI-chatbot name generators** — generate creative names but do not verify availability against authoritative registry data; nice copy, no signal.

## Risks & Open Questions

- [ ] Confirm registrar affiliate programs accept the expected traffic patterns; some programs reserve the right to claw back commissions on refunded purchases or cap monthly payouts, which would distort the v1 business model.
- [ ] Validate the .ru RDAP path: Russian registry data is sometimes slow, sometimes behind CAPTCHA, and the v1 must not silently return "available" when the answer is "registry unreachable".
- [ ] Decide the rate-limit strategy across the chosen registrars: a parallel fan-out is the product experience but can get the service banned if it acts like a scraper; a polite queue with backoff is necessary but adds latency.
- [ ] Decide the free-tier daily cap: too high and affiliate revenue per signup is too low to fund the service; too low and the word-of-mouth funnel starves. The cap is a real product dial, not an arbitrary number.
- [ ] Watch for "premium" domain ambiguity: some registrars mark taken-but-resellable domains as "premium" with a price; the result list has to distinguish "taken" from "premium" so users do not click through expecting a standard registration.
