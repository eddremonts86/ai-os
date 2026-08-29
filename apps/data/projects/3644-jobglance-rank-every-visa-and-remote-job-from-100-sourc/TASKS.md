---
id: "3644"
slug: jobglance-rank-every-visa-and-remote-job-from-100-sourc
title: JobGlance – Rank every visa and remote job from 100+ sources by your resume fit live
status: enriched
source:
  name: BetaList
  url: "https://betalist.com/startups/jobglance?utm_campaign=startup-181405&utm_medium=atom&utm_source=newsfeed"
category: beta
date: "2026-08-28"
tags: [BetaList, Beta, Product]
tech: [Next.js, TypeScript, Python (FastAPI), PostgreSQL, Redis, Playwright (scrapers), Chrome Extension (MV3), OpenAI API, BullMQ]
---
# JobGlance – Rank every visa and remote job from 100+ sources by your resume fit live

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3644-jobglance-rank-every-visa-and-remote-job-from-100-sourc/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the per-source scrape worker and the normalised PostgreSQL schema for catalogue rows
- [ ] Run the daily scrape against the first 10 source sites and verify the 24-hour refresh cadence
- [ ] Implement resume upload, parsing and per-user storage with explicit retention and deletion controls
- [ ] Ship the baseline 0 to 100 match endpoint against the latest 24-hour snapshot
- [ ] Add live re-ranking on filter and search change, with a measured latency budget
- [ ] Expose the visa-sponsorship and work-from-anywhere filters as first-class controls with a per-role signal
- [ ] Build the ATS resume builder that scores, rebuilds and tailors the resume per role
- [ ] Generate the cover letter and the company research view for a selected role
- [ ] Implement the application tracker that records the score at apply time and the current stage
- [ ] Ship the MV3 Chrome extension that overlays the score on supported job pages
- [ ] Scale the scrape pipeline to the full 100+ source set with source-health monitoring
- [ ] Verify the extension under MV3 host-permission rules on every supported job board before launch

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
