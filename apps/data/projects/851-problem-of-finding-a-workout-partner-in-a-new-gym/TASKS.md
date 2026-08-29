---
id: "851"
slug: problem-of-finding-a-workout-partner-in-a-new-gym
title: Problem of finding a workout partner in a new gym
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/fitness/59adku49n1-problem-of-finding-a-workout-partner-in"
category: fitness
date: "2025-11-08"
tags: [Fitness, Other]
country: India
tech: [Flutter, Dart, Supabase (PostgreSQL with row-level security), Supabase Auth, PostgreSQL with PostGIS for gym-radius queries, FCM for push notifications, WhatsApp Business API for India-region notifications, Coolify]
---
# Problem of finding a workout partner in a new gym

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/851-problem-of-finding-a-workout-partner-in-a-new-gym/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the member sign-up via phone-based Supabase Auth and the per-gym verification path with the one-time code integration.
- [ ] Model the four-field workout profile (time-of-day, equipment, intensity, goal) with the per-field declarations and the profile-edit flow.
- [ ] Implement the per-gym match query with the three-of-four-field overlap rule and the surfaced match list showing the overlap field-by-field.
- [ ] Build the short-introduction thread: the in-platform first message, the contact-handoff-only-on-confirmation path, the chat thread.
- [ ] Implement the partnership-confirmation field and the introduction-to-partnership rate metric.
- [ ] Build the gym-side opt-in flow and the gym-side dashboard with the pair-formation rate read.
- [ ] Add the safety surface: block-and-report path, misuse review queue, documented escalation path.
- [ ] Wire FCM and the WhatsApp Business API for introduction-arrival and partnership-confirmation notifications.
- [ ] Add the documented boundary with dating surfaces on every page; enforce it with a reachable block-and-report path.
- [ ] Add the regulatory-confirmation milestone before launch: Indian personal-data rules (DPDP Act), platform-liability rules.
- [ ] Wire Hindi and English copy throughout member, gym, and admin surfaces; keep other languages out of scope at MVP.
- [ ] Run an end-to-end test: a new gym member joins, verifies the gym through the one-time code, declares a four-field profile, sees two other verified members at the same gym with three-field overlap, sends a short introduction, the partner confirms, both confirm the partnership, the gym-side dashboard shows the pair-formation rate update, and the contact handoff happens inside the platform with no phone number or address exchanged.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
