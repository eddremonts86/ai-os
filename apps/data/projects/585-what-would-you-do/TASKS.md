---
id: "585"
slug: what-would-you-do
title: Anti-exploitation job board and ATS auto-fill browser extension
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vojiuh/what_would_you_do/"
  captured: "2026-08-14"
category: jobs
date: "2026-08-14"
tags: [jobs, ats, browser-extension, b2c, job-board, mission-driven]
scores:
  money: 3
  learn: 5
  fun: 4
---
# Anti-exploitation job board and ATS auto-fill browser extension

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise git repo
- [ ] Copy `edd-app-template` → `apps/585-what-would-you-do/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Configure `tailwind.config.ts` with DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Pick the 3 ATSs the source implies (LinkedIn, Indeed, Glassdoor) and define the auto-fill surface for each.
- [ ] Build the per-user perma-hide and spam-job-poster labelling model.
- [ ] Wire the browser extension to read the user's labels and apply them at the ATS page.
- [ ] Stand up a job-board front-end that reads from the same posting store.
- [ ] Identify a GTM channel that does not depend on the sponsored-listing model the source rejects.

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
