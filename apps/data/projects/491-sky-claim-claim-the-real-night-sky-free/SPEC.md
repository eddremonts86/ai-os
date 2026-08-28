---
id: "491"
slug: sky-claim-claim-the-real-night-sky-free
title: Sky Claim - Claim the real night sky - Free
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vo079k/sky_claim_claim_the_real_night_sky_free/"
category: sideproject
date: "2026-08-14"
tech: [Next.js, TypeScript, AR.js, WebXR, PostgreSQL, Resend, Vercel]
---
# Sky Claim - Claim the real night sky - Free

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vo079k/sky_claim_claim_the_real_night_sky_free/

Original post:

> App Name: Sky Claim What it does: Point your phone at a real star, planet or the Moon and hold it steady, and the app verifies you are genuinely aimed within 4 degrees of that object's true position before the claim counts. Every claim goes into a permanent log, and the entire sky is computed on the device, so it works with no internet, no server and no account. Key Features: Hunt - AR overlay on the camera view; aim and hold 2.5s to claim. 5,070 stars, all planets, the Moon at its real phase, 107 Messier objects. Star Gazing - full 360 sky map including below the horizon, with real IAU constellation figures, time travel to any date, and replay of the exact sky from an old claim. Playground - 13 mini-games built on real astrophysics formulas (N-body orbits, Roche limit, Chandrasekhar limit, gravity assists, pulsar geometry) for the hours the sky isn't usable. Link: https://play.google.com/store/apps/details?id=com.gear6games.sky_claim I'm the developer. Free, with an optional one-time unlock (not a subscription) and no ads unless you deliberately tap to watch one. No sign-up, no email, no data collection. Feedback I'd find most useful: Compass/aiming accuracy on your device - when you aim at something visible, does the overlay put it in the right place? Device model helps. Does the overlay track smoothly when you pan, or lag? Is the first-run Moon tutorial clear? The positions come from Schlyter's planetary algorithms hand-ported to Dart and validated against independent ground truth (published sunrise times, the Polaris-altitude-equals-latitude invariant, sidereal vs solar day drift). Happy to answer anything about the maths or the offline architecture. submitted by /u/Franky32 [link] [comments]

---

What this plan addresses: Sky Claim: an AR web app where you point your phone at the night sky and "claim" a region of stars as yours.

## Objective

A free AR web app where you point your phone at the night sky and claim a region of stars as yours, with an optional public map of claims. When I am looking at the night sky, I want a tool that lets me claim a region of stars as mine, so I have a playful personal record of the sky.

## Target Users

- Casual stargazers looking for a playful AR experience
- Parents wanting a free, low-pressure educational activity
- Astronomy enthusiasts who want a personal sky record

## MVP Scope

- AR view that maps the night sky to the camera feed
- Tap a region of stars to claim it as yours
- Public map (opt-in) of claimed regions
- No account required for basic claim

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vo079k/sky_claim_claim_the_real_n` follows the constraints in `491-.../SPEC.md` and the chosen stack (Next.js, TypeScript, AR.js). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body mentions "Sky Claim - Claim the real night sky - Free"
- Plan keeps the free + claim framing
- Source did not name a price (free was stated)
