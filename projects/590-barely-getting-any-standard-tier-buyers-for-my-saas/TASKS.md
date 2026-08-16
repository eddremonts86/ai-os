---
tags: ["saas", "events", "b2b", "identity"]
tech: ["Next.js", "TypeScript", "Supabase", "Stripe", "PWA"]
id: "590"
slug: barely-getting-any-standard-tier-buyers-for-my-saas
title: Barely getting any standard tier buyers for my SaaS
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voswno/barely_getting_any_standard_tier_buyers_for_my/"
category: saas
date: "2026-08-15"
---
# Barely getting any standard tier buyers for my SaaS

## Phase 0: Scaffold

- [ ] Create `apps/590-barely-getting-any-standard-tier-buyers-for-my-saas/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding per-attendee identity documents
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (event-dashboard visual identity)
- [ ] Provision Supabase: auth, events, attendees, per-attendee QR codes
- [ ] Wire Stripe for the standard tier ($49/event)
- [ ] Set up invoicing for the enterprise tier ($2,500+/event)
- [ ] Build the on-site check-in PWA

## Phase 1: Core

- [ ] Event creation: date, location, capacity, branding
- [ ] Per-attendee digital passport: QR code + identity verification
- [ ] Self-serve standard tier at $49/event
- [ ] Managed enterprise wrapper: custom branding + on-site support
- [ ] On-site check-in PWA
- [ ] Decision rubric: 5 standard-tier buyers in 60 days = stay self-serve; else pivot

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 10 paying standard-tier events via r/events and r/festivals
- [ ] Decision rubric review at week 10
- [ ] Post-mortem at week 10
