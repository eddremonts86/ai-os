---
id: "247"
slug: search-for-a-controlled-and-stable-channel-for-attracti
title: "Search for a controlled and stable channel for attracting clients to a banquet hall, as an alternative to unpredictable social media advertising"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/g9lxp72ug1-search-for-a-controlled-and-stable-chann"
category: marketing
date: "2026-01-18"
tags: [Marketing, Business, AI, Other]
country: Algeria
---
# Search for a controlled and stable channel for attracting clients to a banquet hall, as an alternative to unpredictable social media advertising

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/247-search-for-a-controlled-and-stable-channel-for-attracti/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the venue profile page with capacity, photos, menu samples, pricing bands, and availability calendar, backed by a headless CMS so the operator can edit without engineering help.
- [ ] Add Arabic and French copy variants on the profile and directory pages.
- [ ] Set up Google Business Profile for the venue, link it from the profile page, and add city + capacity on-page SEO.
- [ ] Onboard three to five wedding-planner partners and one wedding fair, each with a distinct UTM tag pointing to the venue profile.
- [ ] Build the inquiry capture form with referrer tagging; store inquiries in PostgreSQL.
- [ ] Add a manual "source" field the operator fills for phone and walk-in inquiries so the reporting remains accurate.
- [ ] Build the monthly reporting view that groups inquiries and bookings by source for the trailing 90 days.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 247-search-for-a-controlled-and-stable- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Algeria completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
