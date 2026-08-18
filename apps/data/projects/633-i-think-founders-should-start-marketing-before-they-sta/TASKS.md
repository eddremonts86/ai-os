---
id: "633"
slug: i-think-founders-should-start-marketing-before-they-sta
title: I think founders should start marketing before they start building.
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voy6zq/i_think_founders_should_start_marketing_before/"
category: saas
date: "2026-08-15"
---
# I think founders should start marketing before they start building.

## Phase 0: Scaffold

- [ ] SvelteKit project, one route group for problems
- [ ] PostgreSQL with the three tables: captures, outreach, problems
- [ ] Full-text index on capture text — this is the one schema decision that matters
- [ ] Deploy target: single container, no queue, no worker

## Phase 1: Core

- [ ] Add a capture: quote, source link, problem
- [ ] Group captures into framings, and show competing framings side by side
- [ ] Outreach log with the response types the source names
- [ ] The single "does anybody care yet" view over captures + outreach
- [ ] Export a problem's whole record as markdown
- [ ] Test the framing query, which is the only non-obvious logic in the product

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-15_
