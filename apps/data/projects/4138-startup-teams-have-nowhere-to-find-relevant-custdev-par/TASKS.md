---
id: "4138"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-par
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/frug7pmx31-startup-teams-have-nowhere-to-find-relev"
category: startups
date: "2025-12-15"
tags: [Startups, Other]
country: Russia
tech: [Next.js, TypeScript, PostgreSQL, Drizzle ORM, Meilisearch, Cal.com integration (open-source self-hosted booking), Resend, Coolify]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/809-startup-teams-have-nowhere-to-find-relevant-custdev-par/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the screener, the participant declaration, the screening answer, the interview-completion record, and the per-team rating in PostgreSQL with Drizzle.
- [ ] Build the team-facing screener builder: persona fields, three to five screener questions, the persona-fields contract the team agrees to.
- [ ] Build the public participant-pool surface: sign-up flow, persona-field declaration, opt-in to active screeners.
- [ ] Wire Meilisearch indexing from PostgreSQL on a short interval and on every participant update, so search never serves a stale record.
- [ ] Implement the faceted-search surface for the team: role, industry, geography, language, current tool usage, returning the shortlist the team filters against.
- [ ] Wire the self-hosted Cal.com integration for the booking invite that goes to the participant; keep the platform's booking flow separate from the team's calendar.
- [ ] Implement the interview-completion record on the team-facing surface (interview happened, interview cancelled, no-show), one tap.
- [ ] Build the per-team ratings view: per-team rating, low-rating-participant drop from the recommended pool, the recalibration dashboard.
- [ ] Surface the calibration dashboard on the team-facing surface: match-to-interview rate, interview-completion record coverage, per-team repeat rate, pool diversity, pool growth rate.
- [ ] Add the thank-you-gift reminder the team sees after each interview, kept as a documented non-feature: no payment processing, no gift ledger, the team buys the gift themselves.
- [ ] Add the documented escalation path for a team that disputes a participant's persona fields or screener answers.
- [ ] Wire Russian and English copy throughout team, participant, and admin surfaces; keep other languages out of scope at MVP.
- [ ] Add the regulatory-confirmation milestone before live screeners: Russian personal-data rules, EU GDPR where applicable.
- [ ] Run an end-to-end test: a team publishes a screener, three participants opt in from the public pool and submit screener answers, the team filters the pool and picks one, the booking invite goes out via Cal.com, the interview is recorded as completed, the team fills in the rating, the pool-diversity metric reflects the new participant, and the thank-you-gift reminder appears without a payment path.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
