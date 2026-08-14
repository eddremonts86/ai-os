---
id: "255"
slug: its-difficult-for-parents-of-newborns-in-india-to-organ
title: "It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision."
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/health/o94v8yjuj1-its-difficult-for-parents-of-newborns-in"
category: health
date: "2026-01-09"
tags: [Health, Other]
country: India
---
# It's difficult for parents of newborns in India to organize vaccination: there is no service for easy doctor search and a «turnkey» process provision.

## Tech Stack

- Node.js 20 + Express + TypeScript for the API; chosen because the surface is mostly CRUD with light search and the team's existing stack aligns with this choice.
- PostgreSQL with Prisma for clinics, paediatricians, vaccine catalogue, bookings, and the parent-side schedule.
- Next.js + TypeScript for the public search and booking surface; mobile-first, low-bandwidth-tolerant (parents are often on phones over 4G).
- A WhatsApp Business API integration (or Gupshup as the Indian alternative) for clinic confirmations, parent reminders, and parent reply handling.
- Redis for booking slot reservation; the slot must be held while the parent confirms, not double-booked.
- Self-hosted on Coolify; the workload is per-booking, low-throughput, and predictable.

## Architecture

Three pieces:

1. **Parent surface** — search by city and vaccine, results list with clinic + paediatrician details, booking flow, schedule tracker, post-visit confirmation.
2. **Clinic surface (WhatsApp-first)** — the clinic receives a structured booking message on WhatsApp and replies YES / NO / ALT-TIME. The MVP does not require a clinic portal in v1.
3. **Schedule engine** — a simple rules engine that maps the child's DOB to the IAP schedule and computes "what is due next" and "what is overdue." The schedule is clearly attributed to the IAP recommendation, not invented.

Stock information is curated, not live. Each clinic listing shows "last confirmed" with a date for each vaccine.

## Milestones

- **M1 — Clinic + vaccine catalogue.** Operator onboards 30–50 clinics across one or two pilot cities; each clinic lists the vaccines it stocks with a "last confirmed" date.
- **M2 — Parent search.** City + vaccine search; results list with distance, price band, next slot.
- **M3 — Booking flow.** Slot reservation (Redis hold), parent confirm, clinic WhatsApp notification.
- **M4 — Schedule tracker.** Child profile with DOB; schedule engine computes next-due and overdue; reminders via WhatsApp.
- **M5 — Post-visit confirmation.** Parent confirms the vaccine was given; schedule updates; reminder for next vaccine.

## Risks

- Clinic onboarding friction is the binding constraint. The MVP must keep the clinic flow to WhatsApp confirmations; a portal login will not be adopted.
- Stock curation honesty: a clinic listing a vaccine today may be out of stock tomorrow. The MVP must publish "last confirmed" dates and refresh the listing when the clinic replies "out of stock" on a booking.
- Medical scope discipline: the schedule is an IAP-derived recommendation, not medical advice. The MVP must clearly attribute the schedule and keep the doctor as the clinical decision-maker.
- Personal data: a child's name, DOB, and vaccination history is sensitive. The MVP must define a retention policy and a parent-controlled deletion path; this is a hard prerequisite for launch.
- WhatsApp Business API reliability in India: the Gupshup integration has its own latency and template-approval overhead. The MVP must degrade gracefully to SMS if WhatsApp delivery fails.
