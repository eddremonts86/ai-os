---
id: "2982"
slug: i-made-a-3d-globe-platform-to-promote-your-startup-base
title: I made a 3D Globe platform to promote your startup based on your MRR
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49338015"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# I made a 3D Globe platform to promote your startup based on your MRR

## Tech Stack

Chosen for this problem:
- **Three.js** for the WebGL globe — wide ecosystem, easy to ship a polished 3D scene in a weekend.
- **Next.js (App Router) + React** for the front-end page wrapper (SEO landing, embeddable iframe).
- **Stripe Connect** for the MRR source of truth and the orbit-tier billing.
- **Cloudflare Workers + KV** for the periodic MRR polling cron, caching the latest MRR per startup.
- **Postgres** for startup metadata (name, geo, Stripe account id, orbit status).

## Architecture

```
+----------------+   Stripe API    +----------------------+   cron poll    +-------------------+
|  Founder's     |  |  Next.js page        | -----------------> |  Three.js globe |
|  (WebGL + drag/zoom) |          |  (geo + cached MRR)   |                    |  (live render)  |
+----------------------+          +----------------------+                    +-----------------+
                                          |
                                          v
                                  +--------------------+
                                  |  Postgres          |
                                  |  startup metadata  |
                                  +--------------------+
```

The Worker polls Stripe for each connected account's MRR and writes it into KV; the Next.js page reads KV for the latest height per startup and feeds it into Three.js. A click on a tower links to the startup's site.

## Milestones

- **M1 (week 1):** static globe with 20 hand-entered towers (Stripe connection mocked for the demo).
- **M2 (week 2–3):** Stripe Connect onboarding so a founder can claim a slot and live-update MRR.
- **M3 (week 4):** orbit-tier billing + elevation in the scene.
- **M4 (week 5–6):** polish — smooth transitions when MRR changes, search/filter by region, shareable screenshots.
- **M5 (week 7+):** explore additional PSP connectors (Paddle, Lemon Squeezy) only if the Stripe-only ceiling is hit.

## Risks

- **Stripe coverage limits the addressable market.** Founders without Stripe (or in countries where Stripe is unavailable) cannot participate; Paddle/Lemon Squeezy would help, but are explicitly out of scope for v1 per the source.
- **Cold start.** A globe with three towers is uninteresting. The first batch must be hand-curated or seeded via partner channels.
- **No validated pricing.** "Orbit tier" exists as a concept but the source doesn't name a number; pricing is a guess until founder-led interviews.
- **3D UX on low-end devices.** A globe with 500+ towers may chug on a phone; performance budget needs an explicit target.
