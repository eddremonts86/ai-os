---
tags: ["saas", "ai", "video-generation", "ugc", "marketing"]
tech: ["Next.js", "TypeScript", "Veo", "Topaz", "Cloudflare R2", "Cloudflare Workers", "Stripe"]
id: "546"
slug: i-spent-200-testing-ugc-ad-tools-but-they-expected-engi
title: "I spent $200 testing UGC ad tools, but they expected engineering-level prompting"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9490/i_spent_200_testing_ugc_ad_tools_but_they/"
category: saas
date: "2026-08-14"
---
# I spent $200 testing UGC ad tools but they expected engineering-grade prompting

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Generation layer:** Veo 3.1 Lite + Flash (or equivalent) for video; Topaz for upscaling.
- **Per-shot controls:** a custom React UI that maps lighting / surface / angle to the generation API parameters.
- **Brand asset storage:** Cloudflare R2 with per-tenant isolation; BYOK for any third-party model training.
- **Render queue:** a serverless worker (Cloudflare Workers + a per-tenant queue).
- **Payments:** Stripe.

## Architecture

Web app + a per-tenant render worker. The web app collects the per-shot controls and the brand-asset references, posts to the worker, the worker streams the visible agent state back to the UI.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-shot render demo. End of week 1.
2. **M1 — Per-shot controls + visible agent state.** End of week 4.
3. **M2 — Brand asset library + per-tenant isolation.** End of week 6.
4. **M3 — Cost caps + render queue.** End of week 8.
5. **M4 — Stripe paywall + 1080p output.** End of week 10.

## Risks

- **Veo / Topaz pricing churn** — the per-render cost ceiling is the unit-economics anchor; pricing changes are tracked weekly.
- **Visible agent state latency** — if the state refresh drops below 2s, the differentiator is lost.
