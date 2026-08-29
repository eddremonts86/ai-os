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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A vaccination-organisation service for Indian parents of newborns that combines a doctor search, a schedule engine driven by the child's date of birth, an appointment-and-reminder loop on WhatsApp, and a per-visit record the parent keeps across paediatricians — so the parent experiences a single shared schedule, missed or late doses become visible events, and the cognitive load of the whole schedule stops sitting on the parent's memory.

The service is an organisation surface, not a clinical decision system. The schedule reflects the published schedule the parent and the paediatrician agree to. Doctor search returns curated profiles the parent can act on. WhatsApp reminders keep the cadence visible on the channel the parent already uses.

**One-liner:** A vaccination-organisation service for Indian parents of newborns that puts the doctor search, the schedule, the reminders, and the per-visit record on a single shared surface, so missed or late doses become visible events rather than silent gaps.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Parents of newborns in India | Need to find a paediatrician, book the first vaccination, and keep the schedule on track. |
| Parents of infants in India | Need to catch up on missed doses or find a new paediatrician after a move. |
| Indian paediatricians | Want a per-child view of the schedule and a way to confirm a visit happened. |
| Indian paediatric clinics | Want a per-child schedule the receptionist can see. |
| Indian extended family | Want to be informed of an upcoming visit without being the primary reminder. |
| ASHA workers and Anganwadi centres | Want a shared view of which children are on track in their area. |

## Jobs To Be Done

1. **Functional job** — Find a paediatrician in my city who fits my language and budget, with a stated vaccination-experience flag.
2. **Functional job** — See my child's vaccination schedule from birth to the next year, with the upcoming dose at the top and any catch-up steps visible.
3. **Functional job** — Receive a WhatsApp reminder ahead of each dose and confirm with one tap once it is given.
4. **Functional job** — Keep a per-visit record across paediatricians so the schedule survives a move or a clinic change.
5. **Emotional job** — Stop the anxiety of whether the next dose is on time.
6. **Social job** — Be the parent whose child is on the schedule rather than the parent who is always catching up.

## Success Metrics

- **On-time dose rate** — share of doses given within the published target window. This is the schedule-effectiveness lever.
- **Catch-up completion** — share of missed doses that are completed within 30 days of the parent seeing the catch-up step. The schedule engine is only useful if the catch-up path actually fires.
- **Reminder confirm rate** — share of WhatsApp reminders the parent confirms with a one-tap. A low rate is the signal the cadence is wrong or the channel is wrong.
- **Doctor-search conversion** — share of searches that resolve to a booked first appointment. A low rate is the signal the doctor-search surface is too thin.
- **Per-visit record completeness** — share of closed visits where the parent recorded the dose and the date. A visit without a record is the gap the source names.
- **Multi-paediatrician continuity** — share of children whose schedule survived a paediatrician change without a dose being missed in the handoff. The schedule must travel with the child.

## Pricing & Monetization

The source names no fee, no rate and no tier. What the architecture fixes is the cost shape: the service could charge the parent a subscription, the paediatrician a listing fee, or the clinic a per-child onboarding fee. The source does not pick one, so the plan does not invent a number. Any future monetization has to be evaluated against the on-time dose rate and the reminder confirm rate, because both metrics depend on the parent actually using the service rather than abandoning it after the first dose.

## Competitive Landscape

- **WhatsApp threads with the paediatrician's receptionist (the de-facto incumbent the source describes)** — work for the first visit, fall apart across the schedule.
- **Generic reminder apps** — schedule a reminder the parent types in, but do not model the vaccination cadence the source names.
- **Practo and equivalents (the names the source does not provide)** — doctor-search surfaces with appointment booking, but not a vaccination-schedule engine the parent can keep across paediatricians.
- **Cowin (the names the source does not provide)** — government-side scheduling for some vaccines, but the parent carries the gap between the public schedule and the private paediatrician.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Define the schedule-engine inputs (the published schedule the parent and the paediatrician agree to) so concretely that two clinics using the engine produce the same upcoming-dose list for the same child.
- [ ] Confirm the regulatory path (DPDP Act, ABDM where applicable) before launch with real child profiles.
- [ ] Decide how the service handles a child whose parent changes a paediatrician — the schedule must travel, but the per-paediatrician record-keeping may differ.
- [ ] Confirm Hindi and English copy alone is sufficient, or whether a regional-language surface is needed for the city-level rollout the MVP serves.
- [ ] Validate with five Indian parents of newborns that the doctor-search filters match how they actually pick a paediatrician.
- [ ] Establish a documented escalation path for a parent who disputes a scheduled dose (the paediatrician's plan and the schedule engine disagree), so a clinical disagreement does not become a brand-trust problem.
