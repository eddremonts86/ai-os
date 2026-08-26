---
id: "809"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-pa
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/startups/u3yh16ty81-startup-teams-have-nowhere-to-find-relev"
  captured: "2026-01-03"
category: startups
date: "2026-01-03"
tags: [Startups, Research, Other]
country: Russia
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Provision Coolify app + Drizzle migrations + Stripe Connect platform application
- [ ] Bilingual i18next setup (Russian + English)
- [ ] Respondent identity verification flow (phone or email + reference)
- [ ] First 50 vetted respondents onboarded (initial screening interview per respondent)

## Phase 1: Core

- [ ] Screener builder: persona fields (role, industry, seniority, geography, current-tool usage)
- [ ] 3-question consistency screen (e.g. "describe the last time you used X")
- [ ] Screener quality rubric enforced before going live
- [ ] Respondent pool browsing (filters: persona match, language, geography, tenure)
- [ ] Interview booking with calendar invite + screener summary
- [ ] In-platform interview notes (optional)
- [ ] Consistency check service: heuristic + LLM-assisted scoring
- [ ] Stripe Connect escrow: $25 / $75 / $150 tiers (junior / mid / senior persona)
- [ ] Payout released on consistency-pass; rebook on flag
- [ ] Post-interview ratings (both sides); low-rating respondents drop from the pool
- [ ] End-to-end test: 3 screeners → 9 interviews booked → 9 consistency-passed → 9 payouts

## Phase 2: Deploy

- [ ] Coolify production deploy with daily SQLite backup
- [ ] Per-respondent pattern detector (answer text similarity, completion-time anomalies)
- [ ] Manual review queue for flagged consistency scores
- [ ] Per-persona payout floor adjusted quarterly
- [ ] Per-screener quality rubric review queue (first-100 screeners)
- [ ] Post-mortem at week 14: did the consistency check actually filter out professional-respondent noise?
