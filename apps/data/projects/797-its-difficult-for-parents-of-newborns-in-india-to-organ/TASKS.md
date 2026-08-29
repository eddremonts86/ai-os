---
id: "797"
slug: its-difficult-for-parents-of-newborns-in-india-to-organ
title: "It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/o94v8yjuj1-its-difficult-for-parents-of-newborns-in"
category: health
date: "2026-01-09"
tags: [Health, Other]
country: India
tech: [TypeScript, Bun runtime, Hono, PostgreSQL, Drizzle ORM, Redis, Practo / Indian doctor-directory API (or licensed equivalent), WhatsApp Business API, Razorpay or UPI payment integration, Cowin-style vaccination-schedule lookup (open data), Coolify]
---
# It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision.

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/797-its-difficult-for-parents-of-newborns-in-india-to-organ/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Model the child record, the paediatrician record, the schedule entry, the per-visit record, and the reminder record in PostgreSQL with Drizzle.
- [ ] Build the schedule engine: deterministic on (date of birth, current history, paediatrician's stated plan), with the upcoming-dose output and the catch-up steps for missed doses.
- [ ] Integrate the doctor-search source (Practo or licensed equivalent) with the filter surface: city, language, fee band, hospital affiliation, availability window.
- [ ] Build the per-paediatrician profile with the stated vaccination-experience flag and the per-child schedule view (read-only).
- [ ] Build the parent-facing dashboard: chronological list, next-up dose at top, catch-up steps visible, per-visit record update flow.
- [ ] Wire the Redis-backed WhatsApp reminder queue with per-dose cadence, parent-controlled lead time, one-tap confirm, and pause control.
- [ ] Build the per-visit record update flow: dose identifier, date, paediatrician, parent notes; the record is the parent's, not the clinic's.
- [ ] Add the paediatrician and clinic read-only surfaces (per-child schedule view, per-clinic active-children list) with field-level visibility controls.
- [ ] Add the published schedule-engine configuration as a documented page, so the parent and the paediatrician see the same rule.
- [ ] Add the documented escalation path for a parent who disputes a scheduled dose (the paediatrician's plan and the engine disagree).
- [ ] Add the optional Razorpay or UPI integration for the clinic's consultation fee, kept separate from the schedule surface.
- [ ] Add the regulatory-confirmation milestone before launch with real child profiles: DPDP Act, ABDM where applicable.
- [ ] Add the documented child-specific data-retention and deletion path; parent-initiated profile deletion honoured end to end.
- [ ] Wire Hindi and English copy throughout parent, paediatrician and clinic surfaces; keep other languages out of scope at MVP.
- [ ] Run an end-to-end test: a parent enters a newborn profile, finds a paediatrician, receives a WhatsApp reminder, attends the visit, confirms the dose via the one-tap, sees the next-up dose on the dashboard, and survives a paediatrician change without missing a scheduled dose.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
