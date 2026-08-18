---
id: "634"
slug: need-help-with-outreach-at-a-quotlocalquot-ai-law-start
title: "need help with outreach at a \"local\" AI law startup (i will not promote)"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vp036s/need_help_with_outreach_at_a_local_ai_law_startup/"
category: startups
date: "2026-08-15"
tags: [legal-tech, seo, outreach, b2b]
country: Central Europe
tech: [Astro (static site), Next.js (app), Postgres + Drizzle, Resend, Plausible]
---
# need help with outreach at a "local" AI law startup (i will not promote)

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialize the git repository and adopt a license
- [ ] Copy `edd-app-template` into `apps/634-need-help-with-outreach-at-a-quotlocalquot-ai-law-start/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with the tokens from DESIGN.md
- [ ] Set up the local development environment

## Phase 1: Core

- [ ] Draft the outreach runbook as a public Astro site, indexed for the founder's own "lawyer AI" keyword cluster so the playbook doubles as a content asset
- [ ] Build the per-channel landing-page variants in Next.js at `/lp/google`, `/lp/linkedin`, `/lp/facebook`, each with a UTM-tagged signup form and Plausible event
- [ ] Wire the CRM schema in Postgres + Drizzle: previous users, stage column (contacted, replied, signed up, churned), templated email body per stage
- [ ] Stand up the attribution dashboard with per-channel spend, signups, activated lawyers, and CAC, refreshed nightly
- [ ] Implement the Resend re-engagement sequence: three waves over two weeks, a Friday scorecard reminder to the founder, and a hand-off template for warm intros
- [ ] Add a "rules checklist" appendix to the runbook that the founder's local counsel can tick before paid spend goes live
- [ ] Ship the two-week pilot plan: which channel to test first, daily budget cap, and the stop/go criteria based on CAC

## Phase 2: Deploy

- [ ] Create the public GitHub repository
- [ ] Deploy the Astro runbook and the Next.js dashboard to Coolify
- [ ] Verify in production
