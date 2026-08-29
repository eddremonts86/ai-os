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

## Problem

Parents of newborns in India struggle to organize vaccination: there is no service that gives them an easy way to find a paediatrician and a turnkey path through the vaccination schedule. The post frames the gap as a missing end-to-end surface: a parent who has just had a child needs to find a doctor, book the appointments on the vaccination cadence, get reminders, and arrive at each visit with the right paperwork, and the current experience scatters those steps across phone calls, WhatsApp messages, the doctor's receptionist, and the parent's memory. The implication is that doses are missed, doses are given late, and the parent carries the cognitive load of the whole schedule.

The capture is a one-line problem statement from ProblemHunt, with country listed as India and no further detail. The post does not name a specific paediatrician, a specific hospital, a specific vaccine, a regulator, a price, or a missed-dose rate. What the source names is the actor (parents of newborns in India), the pain (organizing vaccination is difficult), and the missing thing (a service for easy doctor search and a "turnkey" process provision). The plan treats those bare facts as the ground truth.

What follows from those bare facts is the shape of the problem: any solution has to combine a doctor-search surface, a vaccination-schedule engine, an appointment-and-reminder loop, and a per-visit record the parent can keep across paediatricians. The plan scopes the narrowest honest MVP that addresses exactly those four pieces, without inventing a specific vaccination schedule or claiming compliance with a specific Indian immunisation programme the post does not name.

## Objective

Build a vaccination-organisation service for Indian parents of newborns that combines a doctor search, a vaccination-schedule engine driven by the child's date of birth, an appointment-and-reminder loop on WhatsApp, and a per-visit record the parent can keep across paediatricians, so the parent experiences a single shared schedule rather than a series of phone calls, and missed or late doses become visible events rather than silent gaps.

## Target Users

- Parents of newborns in India who need to find a paediatrician, book the first vaccination, and keep the schedule on track.
- Parents of infants in India who are mid-schedule and need to catch up on missed doses or find a new paediatrician after a move.
- Indian paediatricians who want a per-child view of the vaccination schedule and a way to confirm a visit happened.
- Indian paediatric clinics that want a per-child schedule the receptionist can see and a per-visit record the clinic can keep.
- Indian extended family (grandparents) who want to be informed of an upcoming visit without being the primary reminder channel.
- ASHA workers and Anganwadi centres in India that help families navigate the vaccination schedule and want a shared view of which children are on track.

## MVP Scope

- A child-profile surface where the parent enters the child's date of birth, the current vaccination history (which doses have been given and when), and any allergies or contraindications the paediatrician should know about.
- A doctor-search surface where the parent filters paediatricians by city, language, consultation fee band, hospital affiliation, and availability window, and sees the per-paediatrician profile with a stated vaccination-experience flag.
- A vaccination-schedule engine that, given the child's date of birth and the current history, produces the upcoming doses with their target dates and any catch-up steps for missed doses.
- A per-visit record the parent can update after each appointment, with the dose given, the date, the paediatrician, and any notes the parent wants to keep.
- A WhatsApp Business API reminder path that sends a reminder ahead of each upcoming dose on the parent's existing channel, with a one-tap confirm once the dose is given.
- A parent-facing dashboard that shows the schedule as a chronological list, the next-up dose at the top, and any catch-up steps clearly visible.
- Hindi and English copy on the parent-facing surface, since the source country is India and parents may use either language.
- A documented data-retention policy that names how long child profiles and visit records are kept, and what happens to them after.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The service is an organisation surface, not a clinical decision system. The schedule engine reflects the published schedule the parent and the paediatrician agree to; the engine does not override the paediatrician.
- Doctor search returns profiles the parent can act on, not a directory of every paediatrician in India. The MVP works with a curated set per city and explicitly marks out-of-coverage areas.
- WhatsApp reminders are sent on a configurable cadence ahead of each dose, not on a flood schedule. The parent controls the cadence.
- The service does not store clinical photographs, lab results, or prescriptions at MVP. The per-visit record is the dose, date, paediatrician, and parent notes — nothing clinical beyond the dose identifier.
- Indian data-protection rules (DPDP Act, ABDM where it applies) are confirmed before launch with real child profiles; the documented retention policy reflects the regulatory path.
- The MVP does not claim compliance with any specific Indian immunisation programme the post does not name. The schedule engine is configurable per the parent's paediatrician's stated schedule.
- The service does not file insurance or government scheme claims; the visit payment is between the parent and the clinic.
