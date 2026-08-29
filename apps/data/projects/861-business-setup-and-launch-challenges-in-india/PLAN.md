---
id: "861"
slug: business-setup-and-launch-challenges-in-india
title: Business setup and launch challenges in India
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/m7vsm5tpv1-business-setup-and-launch-challenges-in"
category: ai
date: "2025-10-30"
tags: [AI, Business, Legal, Other]
country: India
tech: [Python, FastAPI, PostgreSQL, Redis, Celery, SvelteKit, Playwright]
---
# Business setup and launch challenges in India

## Tech Stack

- **Python with FastAPI** for the API layer because the work is form-driven CRUD with rule evaluation against a structured dataset, and Python keeps the data shaping for the rule engine readable.
- **PostgreSQL** for the structured data — entity types, threshold bands, portal URLs, state-language mappings and per-founder checklist state — because the rules are relational and the schema will evolve as thresholds change.
- **Redis** for the weekly portal-link check queue and the founder-session cache, since the queue is naturally short-lived and the cache is naturally evictable.
- **Celery** as the task runner for the scheduled portal-link checks and the periodic regeneration of the status page, which is too heavy to do inline on a request.
- **SvelteKit** for the founder-facing UI because the form-driven checklist reads well in a server-rendered framework with progressive enhancement, and it does not drag in a heavyweight runtime.
- **Playwright** as a fallback for portal-link checks when a plain HTTP request returns a Cloudflare or captcha challenge, which is common on government sites and is the failure mode the status page is built around.

## Architecture

A founder submits a short situation form: entity type, state, sector, expected turnover band, founder count and existing registrations. The API evaluates that against a rule set stored in PostgreSQL, which is essentially a typed join from situation-shape to applicable-checklist, and returns the ordered list of items. Each item carries its name in English and in the relevant state language, the official portal URL, the threshold that triggered it and a citation to the public rule. The rule set is editable in an admin UI so a threshold change does not require a code deploy.

Portal URLs are checked on a weekly schedule by Celery workers. A plain HTTP request is the first pass, with retry and timeout; if that returns a captcha or a bot challenge, Playwright is the second pass with a real browser. Results land in Redis with a TTL matching the check interval, and the status page reads from Redis so a stale portal is visible to founders before they click the link. Each founder's checklist state — done, open, blocked, with their own reference numbers — is stored in PostgreSQL keyed to the founder account.

Bilingual output is loaded once per checklist render rather than per item: the API returns both English and the requested language, and the UI selects the language at the row level. The MVP targets English plus Hindi across the whole dataset; other state languages land behind feature flags as data quality allows. The disclaimer block sits between the form submit and the rendered checklist, and acknowledgment is recorded against the founder's checklist state so it can be shown again only when the disclaimer text itself changes.

## Milestones

1. **M1 — Rule schema** — PostgreSQL model for entity types, thresholds, portal URLs, language mappings and the situation-to-checklist join, with the seed data for private limited company, LLP and OPC at the central level.
2. **M2 — Form and checklist render** — SvelteKit form, FastAPI endpoint, English-only output, and the disclaimer block on every checklist.
3. **M3 — State layer** — GST, MSME/Udyam, Shops & Establishments and professional tax added for at least three states, with state-language portal links where they exist.
4. **M4 — Bilingual** — English plus Hindi across every checklist item, with a single source-of-truth string table the API returns side by side.
5. **M5 — Status page** — Celery-driven weekly portal-link check with Playwright fallback, Redis cache and a public status page that calls out broken or slow portals.
6. **M6 — Founder state** — per-founder account, checklist tick-off, reference-number capture and the open-versus-done view.
7. **M7 — Admin editor** — admin-only source-data editor for threshold and portal changes, with version history and the disclaimer re-acknowledgment flag.

## Risks

- **Legal-advice exposure** — the product turns a procedural surface into guidance, which is a step short of legal advice in many cases and the exact step over in others; the disclaimer text and the no-filing posture are the only barrier.
- **Threshold staleness** — a missed GST or Companies Act change ships a wrong checklist to every founder who reads it, and the cost is not just a bug report but a missed filing.
- **Government portal unreliability** — portals go down or change URLs without notice, and the link-checker must surface that rather than mask it; a silent failure here is the exact failure mode the product is supposed to fix.
- **Translation drift** — a checklist translated once and never revisited goes stale in the state language even while the English stays current, which is worse than no translation at all.
- **Scope creep into FEMA and cross-border** — non-resident founders and foreign-direct-investment cases pull the product into territory that needs a CA in the loop; the MVP must keep its scope visible.
- **CA partner dependence** — if the disclaimer directs users to verify with a CA and there is no CA path available, the product has moved the problem rather than solved it.
