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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Backend:** Supabase (auth, events, attendees, per-attendee QR codes).
- **QR + identity verification:** a client-side QR scanner + a per-attendee identity document upload.
- **On-site check-in:** a PWA that the on-site team uses for scanning.
- **Payments:** Stripe for the standard tier; invoicing for the enterprise tier.

## Architecture

Single web app + a PWA for on-site check-in. The product surface is shared between the two tiers; the enterprise tier adds a managed-service wrapper (custom branding, on-site support).

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-event demo. End of week 1.
2. **M1 — Event creation + per-attendee passports.** End of week 3.
3. **M2 — Self-serve standard tier ($49/event) + Stripe.** End of week 5.
4. **M3 — On-site check-in PWA + managed enterprise wrapper.** End of week 7.
5. **M4 — Decision rubric review at week 10** (self-serve vs managed). End of week 10.

## Risks

- **Self-serve vs managed pivot** — the founder must run the decision rubric at week 10; the pivot is not automatic.
- **Enterprise support load** — managed deals consume founder time; a hire is the trigger, not a goal.
