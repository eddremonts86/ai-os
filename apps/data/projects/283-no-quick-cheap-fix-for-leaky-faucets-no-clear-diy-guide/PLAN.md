---
id: "283"
slug: no-quick-cheap-fix-for-leaky-faucets-no-clear-diy-guide
title: "No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber"
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/other/e59sb30221-no-quick-cheap-fix-for-leaky-faucets-no"
category: other
date: "2025-12-01"
tags: [Other]
country: India
tech: [Flutter mobile app, Dart, SQLite offline cache, Firebase Auth, WhatsApp Business API, Razorpay]
---
# No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber

## Tech Stack

- Flutter mobile app (Android-first) — one codebase for low-end Android + iOS later.
- Dart + Riverpod for state, GoRouter for screens.
- SQLite via Drift for offline symptom and repair caches, syncing to Postgres backend when online.
- Firebase Auth (phone OTP) for plumber and household accounts.
- WhatsApp Business API for booking notifications — taps an Indian default channel.
- Razorpay for booking fee + plumber payout splits.
- Fastify on Hetzner + Postgres for the catalogue and booking API.

## Architecture

Flutter app talks to a thin Fastify API backed by Postgres. Symptom trees, repair steps, and parts catalogue are versioned JSON cached on-device for offline use; the API serves fresh data on next launch. Plumber bookings flow: user picks slot → server holds the slot for 5 minutes → user confirms → Razorpay captures the ₹99 booking fee → WhatsApp template message fires to the plumber. Post-job, the household releases the labor payout; the platform retains the booking fee.

## Milestones

1. **M0** — Spec freeze + symptom tree (4 symptoms × 3 outcomes = 12 repair flows). End of week 1.
2. **M1** — Flutter app skeleton, phone-OTP auth, single-screen symptom chooser. End of week 3.
3. **M2** — Parts catalogue with Amazon.in/Flipkart deep links for the top 50 SKUs. End of week 5.
4. **M3** — DIY timer + photo checkpoints for the 12 repair flows. End of week 7.
5. **M4** — Plumber onboarding + booking flow in Bengaluru with 10 vetted plumbers. End of week 10.
6. **M5** — Expand to Mumbai + Pune + Hyderabad once Bengaluru hits 100 completed jobs. End of week 14.

## Risks

- **Offline content drift** — a cached repair flow could go out of date with a new tap model. Mitigation: cache hits a 'last synced' badge; warn user if older than 90 days.
- **Plumber supply bottleneck in non-pilot cities** — booking succeeds but no plumber accepts. Mitigation: city-gate the launch; do not open a city until 5 plumbers onboarded.
- **Affiliate link breakage** — Amazon/Flipkart deep links change format. Mitigation: shortlink resolver service, monitor 404 rate weekly.
