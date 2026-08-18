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

## Problem

Florian built a free, no-signup website with a browsable 3D globe where each startup is represented by a tower whose height grows with MRR. The MRR is pulled straight from Stripe (with other payment providers planned), so there's no manual claim and no way to inflate. There's also an "orbit" tier that puts a startup higher above the surface for better visibility. The motivation is half utility (low-cost startup discovery, ordered by revenue) and half showcase ("just thought it looked sick").

## Objective

Ship a self-running, evergreen directory of startups visualized on a 3D globe, ranked by Stripe-verified MRR, that founders keep tabs on voluntarily because the exposure is worth it. Keep it free to browse, frictionless (no signup), and visually distinctive enough to be shareable.

## Target Users

1. **Founders of small B2B SaaS startups** who want a presence in a community-curated directory without filling out another "list your startup" form.
2. **Investors, scouts, and journalists** looking for an at-a-glance view of who's at what MRR tier, geo-grouped on a globe.
3. **Hackers and indie founders** who like weird, beautiful product surfaces and want a place to point curious users.

## MVP Scope

- 3D globe rendered in WebGL, pan/zoom/spin freely, no login.
- Tower per startup, height scaled by current MRR pulled from Stripe.
- "Orbit" tier where a paying startup floats above the surface for visibility.
- A simple submit flow (Stripe connect) so a new startup can claim a slot without manual approval.
- Periodic Stripe re-poll so tower heights update over time.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source mentions Stripe as the source of truth for MRR, with plans for additional PSP connectors "if this picks up". PSP coverage beyond Stripe is out of scope for v1.
- Free to browse, no signup — onboarding friction is the wedge against incumbent directories.
- Source has no WTP signal. The "orbit" tier implies a paid visibility option, but the post doesn't name a price. Leave pricing as an open question.
