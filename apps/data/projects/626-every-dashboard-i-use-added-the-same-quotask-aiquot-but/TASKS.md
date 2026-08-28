---
id: "626"
slug: every-dashboard-i-use-added-the-same-quotask-aiquot-but
title: "Every dashboard I use added the same \"Ask AI\" button this year"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vozdqc/every_dashboard_i_use_added_the_same_ask_ai/"
category: saas
date: "2026-08-15"
---
# Every dashboard I use added the same "Ask AI" button this year

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/626-every-dashboard-i-use-added-the-same-quotask-aiquot-but/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Define the action schema for the two stated example actions: (1) "give user X the same access as user Y but with a different scope/read-only", (2) "add a redirect from path A to path B"
- [ ] Build the NL → proposed-action translator for those two intents
- [ ] Build the proposed-diff render ("shows you what it's about to change") and the explicit "yes" confirmation gate
- [ ] Wire the confirm path to actually run the action against the customer's product, with a rollback story for the demo
- [ ] Recruit 15–20 design partners per the source: founders with a real SaaS and real users, recruited via DM
- [ ] Onboard the first 5 design partners onto a working build and observe whether the two example actions cover their real asks

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-15_
