---
id: "4210"
slug: the-economic-atlas-a-data-first-dashboard-for-comparing
title: "The Economic Atlas: a data-first dashboard for comparing countries"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508704"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The Economic Atlas: a data-first dashboard for comparing countries

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4210-the-economic-atlas-a-data-first-dashboard-for-comparing/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the country / region catalog: the country list, the regional grouping (Europe, the Americas, Asia, Africa, the Middle East), the G7 entry set.
- [ ] Build the hourly rebuild pipeline: per-source fetchers for ONS, FRED, Eurostat, e-Stat and the Bank of Japan, MoSPI, the Bank of Korea, the OECD, and the World Bank; per-source fetch success metric; per-source publish-timestamp stamp.
- [ ] Build the data store: the per-source trace, the freshness check, the view-isolation guarantee.
- [ ] Build the Compare view: side-by-side country comparison on the same metric, reading from the data store.
- [ ] Build the My Dashboard view: the reader's saved metrics, reading from the data store.
- [ ] Build the country pages: the per-country breakdown, reading from the data store.
- [ ] Build the G7-economy live entry: the landing page's primary view, the drill-down into Compare / My Dashboard / country pages.
- [ ] Build the "Get in touch" surface for reader submissions of missing, wrong, or worth-adding data.
- [ ] Add the traceable-source badge per number: the per-source trace the reader sees, the source-link the reader can click.
- [ ] Run an end-to-end test: a reader opens the G7-economy live entry, drills into a per-country breakdown, builds a My Dashboard with two saved metrics, runs a Compare between two countries on the same metric, submits a "Get in touch" entry for a missing metric; every number the reader sees traces back to one of the eight official sources, the freshness check passes, and the per-source fetch success rate is above the threshold.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy the web app at theeconomicatlas.com with the hourly rebuild pipeline
- [ ] Document the per-source trace and the freshness check on the data-about page
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
