---
id: "891"
slug: there-is-no-stable-access-to-global-app-stores-for-russ
title: There is no stable access to global app stores for Russian developers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/jg3la3g2k1-there-is-no-stable-access-to-global-app"
  captured: "2025-10-16"
category: legal
date: "2025-10-16"
tags: [Legal]
country: Russia
wtp:
  raw: "10,000 RUB ($110) per year"
  currency: USD
  min: 110
  max: 110
  period: year
  mrrMid: 9.17
tech: [Case-law knowledge base with vector search, Django backend, Celery task queue for review monitoring, Store Connect and Play Console API polling, Document workflow engine, Postgres]
---
# There is no stable access to global app stores for Russian developers

## Phase 0: Scaffold

- [x] Capture the problem from ProblemHunt, including the six-month removal cadence and the 2–3 week stall
- [ ] Write DESIGN.md (case timeline, notice decoder, document checklist)
- [ ] Write the promise boundary: what the service can and cannot claim about suspension resolution
- [ ] Legal review of whether the service may publish corporate-structure guidance for developers in this jurisdiction
- [ ] Define the case record schema: notice text, platform, app, dates, actions taken, outcome

## Phase 1: Core

- [ ] Case intake: paste a rejection or removal notice, open a case with a timeline
- [ ] Seed the case base with documented removals and their resolutions from real teams
- [ ] Notice decoder: semantic match against the case base, returning candidate policies with linked precedents
- [ ] Show precedent explicitly — every suggested corrective action links to the case it came from, never a bare assertion
- [ ] Store Connect and Play Console polling for listing and review status
- [ ] Alerts on status change, so a removal is known immediately rather than when updates stop
- [ ] Appeal workflow: ordered document checklist and deadlines per case type
- [ ] Outcome capture on case close, feeding back into the case base
- [ ] Time-to-restoration metric per case, measured against the current 2–3 week baseline
- [ ] Monetisation guidance section: documented corporate routes, including the non-Russian-UBO structure raised in the comments, with counsel referral and no implied guarantee
- [ ] End-to-end test: run one historical removal through intake, decode, workflow and outcome

## Phase 2: Deploy

- [ ] Recruit five teams to contribute cases before launch, since the corpus is the product
- [ ] Launch the annual subscription at the 10,000 RUB band
- [ ] Track diagnosis accuracy against platforms' eventual stated reasons
- [ ] Contact the author directly via his listed Telegram to validate the reduced scope against what he actually needs
