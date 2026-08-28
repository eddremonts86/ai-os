---
id: "248"
slug: marketing-directors-and-founders-have-nowhere-to-find-v
title: "Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/lk4uc1xvl1-marketing-directors-and-founders-have-no"
category: marketing
date: "2026-01-17"
tags: [Marketing, Business, Freelance, Career, Other]
country: Russia
---
# Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/248-marketing-directors-and-founders-have-nowhere-to-find-v/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the public directory with server-rendered listing and profile pages, indexed by city and specialization (targeting, SMM).
- [ ] Add the contractor console: sign-up, profile editor, evidence upload, reference nomination.
- [ ] Add the operator console with a verification checklist per application (identity, references, evidence review).
- [ ] Wire Resend transactional email for application received, reference needed, profile published, and inquiry arrived.
- [ ] Add the buyer-side inquiry form tagged by specialization and city, with email handoff to the contractor.
- [ ] Build the periodic re-check job that re-contacts references for already-verified contractors (e.g., every 12 months).
- [ ] Seed 20–30 verified profiles in the targeting specialization to break the cold-start.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (the chosen stack) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 248-marketing-directors-and-founders-ha MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Russia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for the chosen stack errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
