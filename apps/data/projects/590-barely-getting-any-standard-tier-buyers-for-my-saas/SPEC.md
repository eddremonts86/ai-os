---
id: "590"
slug: barely-getting-any-standard-tier-buyers-for-my-saas
title: Barely getting any standard tier buyers for my SaaS
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1voswno/barely_getting_any_standard_tier_buyers_for_my/"
category: saas
date: "2026-08-15"
tags: [saas, events, b2b, identity]
tech: [Next.js, TypeScript, Supabase, Stripe, PWA]
---
# Barely getting any standard tier buyers for my SaaS

## Problem

A founder runs a SaaS for a digital passport for events. Been running for about a couple of months. The only real buyers are enterprise clients (4 so far), even though they have made it super easy and user-friendly for people to set up their own digital passports. They have gotten only 1 standard-tier buyer. Enterprise is good because they pay more, but it really needs dedicated management support from beginning to end, which consumes most of the founder's time as a solo operator. The founder is asking: is this enough data to assess and shift from SaaS to a managed-service model focused on enterprise, hiring people to help, or is it too early and they should keep pushing the SaaS model and see how it performs until year-end? The implicit product: a digital passport SaaS for events, with a clear split between self-serve (standard tier) and managed (enterprise tier), and the strategic question of which to focus on.

## Objective

Define the MVP scope for the digital-passport-for-events SaaS and the strategic decision between doubling down on self-serve standard tier vs pivoting to managed enterprise. The plan keeps the product surface honest and gives the founder a decision rubric rather than picking the answer.

## Target Users

- **Primary (standard tier):** small event organisers running 1-5 events a year who want a self-serve digital passport.
- **Primary (enterprise tier):** large event organisers running 10+ events a year who need a managed service with custom branding and on-site support.
- **Secondary:** festivals, conferences, and sports events with ticketing + identity verification needs.

## MVP Scope

- Event creation: date, location, capacity, branding.
- Digital passport: per-attendee QR code + identity verification.
- Self-serve standard tier at $49/event: 1-100 attendees, basic branding, no on-site support.
- Managed enterprise tier at $2,500+/event: 100-10,000 attendees, custom branding, on-site support.
- Excluded in v1: ticketing payments, attendee CRM, post-event analytics.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single event dashboard — the event list on the left, the per-attendee passport list in the centre, the branding settings on the right. No marketing-site chrome; the product is the event.

## Constraints

- The two tiers must share the same product surface; the enterprise tier is a managed-service wrapper around the same self-serve engine.
- The founder must run the rubric in the Risks section before pivoting; the pivot is not automatic.
