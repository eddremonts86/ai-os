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

## Tech Stack

- **TypeScript on the Bun runtime with the Hono framework** for the API and the parent-facing surface, since the per-child dashboard and the schedule engine are JSON-heavy and Hono keeps the routes tight.
- **PostgreSQL with Drizzle ORM** for child profiles, paediatrician profiles, schedules, visits, and reminders — relational because every visit joins to a child, a paediatrician and a dose.
- **Redis** for the reminder queue and the WhatsApp notification fanout, so the reminder path can wake up per-dose and stay idempotent.
- **Practo API (or a licensed Indian doctor-directory equivalent)** as the doctor-search source, so the MVP does not scrape or invent paediatrician profiles.
- **WhatsApp Business API** as the reminder channel, since WhatsApp is the messaging surface Indian parents already use.
- **Razorpay or UPI** as the optional payment surface for the clinic's consultation fee, kept separate from the schedule surface so the MVP is not a payment processor.
- **An open vaccination-schedule data source (the Indian immunisation schedule as published, or the equivalent)** as the schedule-engine reference, configurable per the parent's paediatrician's stated plan.
- **Docker** for local and staging runs, and **Coolify** for self-hosted production on a single VPS, matching the per-plan deployment shape used across this corpus.

## Architecture

The service has three surfaces — a parent-facing surface, a paediatrician-facing surface (read-only schedule view, optional), and a clinic-facing surface (read-only schedule list per active child) — and one schedule engine underneath. The schedule engine takes a child's date of birth and current vaccination history and produces the upcoming doses with their target dates and any catch-up steps; the engine is configurable per the parent's paediatrician's stated schedule.

The parent-facing surface is the primary experience. The parent enters the child's date of birth and the current vaccination history (which doses have been given, when, by which paediatrician); the surface produces the upcoming schedule, surfaces the next-up dose at the top, and shows the catch-up steps for any missed doses. The parent searches for a paediatrician through the doctor-search surface, filters by city, language, fee band, hospital affiliation and availability window, and books a first appointment. After each visit, the parent updates the per-visit record with the dose given, the date, the paediatrician, and any notes.

The reminder path is a Redis-backed queue. For each upcoming dose, the queue fires a WhatsApp reminder on the configured cadence ahead of the target date, with a one-tap confirm that closes the dose once it has been given. The reminder cadence is per-dose and parent-controlled: a parent can shorten or lengthen the lead time, and can pause reminders for a dose they have already scheduled manually.

The paediatrician-facing surface is read-only and shows the per-child schedule, the visit history, and the upcoming doses. The paediatrician confirms a visit happened by closing the visit record; the parent sees the confirmation reflected on the dashboard. The surface does not let the paediatrician edit the schedule the parent set; if the paediatrician's plan differs, the schedule-engine configuration is updated with the paediatrician's stated plan.

The clinic-facing surface is a list of active children with their next-up doses, so the receptionist can pre-prepare the visit. The clinic does not see child profiles beyond what is needed to prepare the visit (name, date of birth, next dose, allergies or contraindications the parent flagged). The clinic does not see the full per-visit record unless the parent has explicitly shared that record with the clinic.

The schedule engine is a published configuration that takes (a) the child's date of birth, (b) the current vaccination history, and (c) the paediatrician's stated schedule, and produces the upcoming doses. The engine is deterministic: the same inputs produce the same outputs, so two clinics using the engine agree on the upcoming-dose list for the same child. A change to the published configuration is a documented event, not a silent edit.

## Milestones

1. **M1 — Child profile and history** — child record, date of birth, current vaccination history, the parent-facing entry surface.
2. **M2 — Schedule engine** — the published configuration, the deterministic upcoming-dose output, the catch-up steps for missed doses.
3. **M3 — Doctor search** — Practo (or equivalent) integration, the filter surface, the per-paediatrician profile with vaccination-experience flag.
4. **M4 — Per-visit record** — post-visit update flow, dose-identifier selection, paediatrician and date fields, parent notes.
5. **M5 — WhatsApp reminder path** — Redis-backed queue, per-dose cadence, one-tap confirm, parent-controlled pause.
6. **M6 — Paediatrician and clinic read-only surfaces** — per-child schedule view, per-clinic active-children list.
7. **M7 — Regulatory confirmation** — sign-off on DPDP Act and ABDM where applicable before launch with real child profiles.

## Risks

- **Schedule-engine drift** — two clinics using the engine produce different upcoming-dose lists for the same child. Mitigation: the engine is deterministic on its inputs, with the published configuration as the contract.
- **Reminder cadence wrong** — the parent ignores a WhatsApp reminder because the cadence is too aggressive or too quiet. Mitigation: parent-controlled cadence, with the reminder-confirm rate measured weekly and the cadence default adjusted on real data.
- **Doctor-search coverage thinness** — the curated doctor set is too small for a city and the parent falls back to phone calls. Mitigation: a minimum-viable-coverage gate per city before claiming the city is in scope.
- **Clinical disagreement** — the paediatrician's plan and the schedule engine disagree on the next dose. Mitigation: the schedule engine is configurable per paediatrician's stated plan, and the documented escalation path keeps the disagreement visible rather than hidden.
- **Data-protection regulatory gate** — DPDP Act and ABDM rules can block the launch. Mitigation: regulatory review is its own milestone before live child profiles, not a launch-day scramble.
- **Multi-paediatrician continuity loss** — a parent changes paediatricians and a dose is missed in the handoff. Mitigation: the schedule travels with the child, not with the paediatrician, and the per-visit record is the parent's, not the clinic's.
- **Child profile data sensitivity** — child profile data is more sensitive than adult profile data. Mitigation: the documented retention policy names a child-specific deletion path, with parent-initiated profile deletion honoured end to end.
