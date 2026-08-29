---
id: "902"
slug: automating-tilda-landing-page-creation-for-webinars
title: Automating Tilda landing page creation for webinars
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/education/8gtvllpc91-automating-tilda-landing-page-creation-f"
category: education
date: "2025-10-06"
tags: [Education, No-Code, AI, Marketing]
country: Russia
wtp:
  raw: up to 3000 rubles ($33) per page
  currency: USD
  max: 33
  period: one-shot
  note: "Author named a per-page ceiling of 3000 RUB (≈ $33 at capture-time rates) for an automatically-generated page, with edits supported."
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Automating Tilda landing page creation for webinars

## Phase 0: Scaffold

- [x] Capture problem from ProblemHunt + write SPEC.md skeleton
- [ ] Define DESIGN.md tokens (brief form chrome, workspace settings, generation status page)
- [ ] Provision Coolify project + Docker image + SQLite volume
- [ ] Wire Resend email-link auth (single workspace per Tilda account)
- [ ] Confirm Tilda API access tier for pilot workspaces (paid Tilda plan)
- [ ] Integrate YooKassa in test mode (Russian card / YooMoney / SBP)
- [ ] Decide Drizzle schema: `workspaces`, `tilda_keys` (encrypted at rest), `templates`, `generations`, `credit_packs`, `purchases`

## Phase 1: Core

- [ ] Per-workspace Tilda API key storage with encryption at rest; no cross-workspace reads or writes
- [ ] Template extraction: one-time pass over a reference Tilda page; capture block ids, section order, block types, static text; save as `template_config`
- [ ] Versioned `template_config`: each re-extract bumps the version; old pages stay reproducible
- [ ] Brief intake form (Russian-first): topic, target audience, agenda, FAQs, speaker bio, date / time, call-to-action
- [ ] LLM content fill constrained to dynamic blocks only: topic / audience / agenda / FAQs; static blocks pulled from `template_config` verbatim
- [ ] Per-template style guide editable by the team (tone, length, FAQ count) so the prompt adapts to their house style
- [ ] Tilda API call to create a draft page from `template_config` + dynamic-block content; return the page URL to the team
- [ ] Generation status page: submitted → filling → draft ready (with URL) → edited in Tilda → published (manual)
- [ ] Edit-pass duration captured per generation; alert the team if a page consistently needs > 10 minutes of edits
- [ ] Credit packs: 12 / 24 pages at 29,900 / 49,900 RUB; single-page purchase at 2,990 RUB; all at or below the 3,000 RUB / page ceiling
- [ ] Custom template add-on: 9,900 RUB one-time per additional reference template beyond the first
- [ ] English-language opt-in per generation (UI + LLM prompt)
- [ ] End-to-end test: extract a reference template, submit a webinar brief, receive a draft Tilda page that matches the manual structure, edit in Tilda, publish

## Phase 2: Deploy

- [ ] Move YooKassa to live mode
- [ ] Onboard 5 online schools + 2 expert hosts during pilot
- [ ] Weekly review of edit-pass duration and template fidelity; tune the per-template style guide where pages consistently need > 10 minutes of edits
- [ ] Add a "re-extract from current reference" reminder email when the manual template changes
- [ ] Phase-2: add a Make / Zapier connector so the team's existing webinar-scheduling tool can trigger a generation automatically
