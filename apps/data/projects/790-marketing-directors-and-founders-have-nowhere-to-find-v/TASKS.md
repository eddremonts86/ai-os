---
id: "790"
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
tech: [Next.js, TypeScript, PostgreSQL, Prisma, Meilisearch, S3-compatible object storage, Stripe Connect, Coolify]
---
# Marketing directors and founders have nowhere to find verified contractors (targeting specialists, SMM managers) — the existing search process is a lottery that wastes time and budget

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/790-marketing-directors-and-founders-have-nowhere-to-find-v/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the specialist record (niche lane, verification state, screening questionnaire answers, rubric pass record, portfolio references) in Prisma against PostgreSQL.
- [ ] Write the published targeting-specialist rubric and the published SMM-manager rubric as static pages, each with explicit pass criteria.
- [ ] Build the specialist onboarding flow with the screening questionnaire and the document-upload path to S3-compatible storage.
- [ ] Build the reviewer console that records a structured rubric pass per applicant, with the audit-trail query that explains a badge later.
- [ ] Wire Meilisearch indexing from PostgreSQL on a short interval and on every specialist update, so search never serves a stale record.
- [ ] Implement faceted search by niche, city, language, rate band and availability window, returning the shortlist the directory's job depends on.
- [ ] Render the public specialist profile with the verification badge, the case-study surface, and the inquiry-start button.
- [ ] Build the buyer shortlist (save up to a fixed number of specialists per search, share internally, message them all from one thread).
- [ ] Add the inquiry-thread lifecycle and the outcome capture field (hired, declined, no response) the calibration signal depends on.
- [ ] Implement the time-bound badge state machine and the re-check queue, so verification expires on a stated cadence and is re-recorded.
- [ ] Add the calibration dashboard that surfaces hire rate, response rate, and per-niche pool size, read from the outcome field.
- [ ] Wire Russian-language copy throughout buyer and specialist surfaces; keep English out of scope at MVP.
- [ ] Add the optional Stripe Connect escrow lane behind a buyer opt-in, kept separate from the directory's hiring scope.
- [ ] Run an end-to-end test: ten applicants onboarded, five verified, three inquiries opened, three outcomes recorded, two hires confirmed.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
