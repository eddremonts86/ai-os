---
id: "655"
slug: "3-months-ago-i-posted-about-churn-because-everyone-said"
title: "3 months ago i posted about churn because everyone said « i’ll just vibe code it myself » here’s what happened when i stopped fighting it"
status: draft
source:
  name: manual
category: other
---
#

## Tech Stack

Next.js + Postgres for the app, a LinkedIn automation layer that respects rate limits (warming schedules + per-day caps), a content publishing pipeline (CMS + LinkedIn / Reddit / X adapters), a site structured for GEO (one page per problem, plain language, quotable).

## Architecture

Account + warming config → automation worker (caps per day, randomised delays) → LinkedIn via official API where possible → reply capture → CRM sync. Separate surface: site + content pipeline feeding GEO/SEO/LLM-quotable copy.

## Milestones

- [ ] Account + warming schedule
- [ ] Connection / message automation with caps + delays
- [ ] Reply capture + tracked inbox
- [ ] Content pipeline: CMS → LinkedIn / Reddit / X
- [ ] Site rewrite for GEO (one page per problem)
- [ ] Outbound workflow the founder can dogfood
- [ ] Public dashboard of warming-window + cap telemetry (the visible signal of the product's restraint)

## Risks

- LinkedIn policy risk is existential; any single ToS change can shut the wedge.
- Content cadence is part of the product; without it, conversion regresses.
- $39/mo price floor limits support model; must stay self-serve.
