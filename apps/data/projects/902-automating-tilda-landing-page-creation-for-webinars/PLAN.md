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

## Tech Stack

- **Frontend:** React + TypeScript SPA served by TanStack Start, single-page form (brief in, page out) plus a per-workspace settings page for the Tilda API key and the reference template.
- **Backend:** Node.js + TanStack Start server functions, SQLite via Drizzle ORM, hosted on a single Coolify instance behind Docker.
- **Tilda integration:** the official Tilda API for page creation; the team supplies a per-workspace API key, and the tool authenticates per workspace, never across workspaces.
- **Template extraction:** a one-time pass over a reference Tilda page (HTML export + Tilda API `getpage`) that captures block ids, section order, block types, and any static text the team wants preserved verbatim.
- **Content generation:** an LLM call constrained to the dynamic blocks (topic description, audience, agenda, FAQs) with a topic-agnostic prompt; the static blocks (header, footer, payment CTA, speaker card) are pulled from `template_config` and never regenerated.
- **Russian-first:** the LLM prompt + UI copy default to Russian; English is supported as an opt-in per generation.
- **Payments:** Russian card / YooMoney / SBP via YooKassa (or the Russian PSP the team chooses); credit packs purchased up-front, debited per generation.

## Architecture

A single TanStack Start app serves both the marketing site and the authenticated workspace (route group `(authed)`). The brief form submits a `generation` row; the template engine reads `template_config` and the reference blocks, fills the static blocks verbatim, and invokes the LLM only on the dynamic blocks. The Tilda adapter creates a draft page in the team's account via the Tilda API and returns the page URL. The team opens the draft in Tilda, edits if needed, and publishes manually.

```
Browser ─▶ TanStack Start (form + workspace settings)
                │
                ├─▶ /api/generate
                │       │
                │       ├─▶ load template_config (static blocks) ─┐
                │       │                                         │
                │       ├─▶ LLM (dynamic blocks only:            │
                │       │     topic / audience / agenda / FAQs)   │
                │       │                                         │
                │       └─▶ Tilda API ──▶ draft page in           │
                │                                workspace        │
                │                                                 │
                │                          (team edits + publishes│
                │                           in Tilda)             │
                │
                ├─▶ /api/template/extract (one-time, per workspace)
                │
                └─▶ YooKassa webhook ──▶ credit balance
```

## Milestones

1. **M0 — Spec + Tilda API partner flow freeze.** SPEC.md approved; Tilda API access tier confirmed for the pilot workspaces; payment provider (YooKassa) integrated in test mode. End of week 1.
2. **M1 — Template extraction.** One-time pass over a reference Tilda page; `template_config` row with block ids, section order, block types, static text. End of week 3.
3. **M2 — LLM content fill (dynamic blocks only).** Topic-agnostic prompt for topic / audience / agenda / FAQs; static blocks never regenerated; per-template style guide editable by the team. End of week 5.
4. **M3 — Tilda draft creation.** Tilda API call to create a draft page from `template_config` + dynamic-block content; page URL returned to the team. End of week 6.
5. **M4 — Russian-first UI + payments.** Brief form in Russian; credit pack model (12 / 24 pages); single-page purchase at 2,990 RUB; per-workspace Tilda API key storage. End of week 8.
6. **M5 — Pilot.** 5 online schools + 2 expert hosts onboarded; weekly review of edit-pass duration and template fidelity. End of week 12.

## Risks

- **Tilda API rate limits and quotas.** Free-tier Tilda accounts have hard limits on API calls and pages per project. Mitigation: the integration targets paid Tilda plans; rate-limit telemetry wired to the team's on-call.
- **Reference-template drift.** If the team changes the manual template, `template_config` becomes stale. Mitigation: a "re-extract from current reference" workflow; versioned `template_config` so old pages stay reproducible.
- **Content quality across topics.** Topics are wide (tax, accounting, real estate, CFC); a niche-tuned LLM will fail on others. Mitigation: topic-agnostic prompt + per-template style guide editable by the team.
- **Edit-pass overhead.** If the generated page needs too many edits in Tilda, the time-saved promise collapses. Mitigation: track edit-pass duration per page; alert the team if a page consistently takes > 10 minutes of edits so the prompt can be tuned.
- **Pricing under the ceiling.** The 3,000 RUB / page ceiling leaves thin margin. Mitigation: the LLM is invoked only on dynamic blocks; static blocks are pulled from `template_config` and not regenerated per page.
- **Russian-language SEO.** Yandex may penalise boilerplate text across pages. Mitigation: per-page unique copy, no template text reuse across pages, FAQ blocks generated from the brief (not boilerplate).
- **Single-tenant Tilda accounts.** A workspace is one Tilda account; cross-workspace leakage would be a catastrophic trust failure. Mitigation: explicit per-workspace Tilda API key storage with encryption at rest; no cross-workspace reads or writes.
