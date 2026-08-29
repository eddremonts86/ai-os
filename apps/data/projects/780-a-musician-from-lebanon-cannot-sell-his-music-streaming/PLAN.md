---
id: "780"
slug: a-musician-from-lebanon-cannot-sell-his-music-streaming
title: "A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/media/0vvg4xzv91-a-musician-from-lebanon-cannot-sell-his"
category: media
date: "2026-01-21"
tags: [Media, Other]
country: Lebanon
tech: [Elixir, Phoenix LiveView, PostgreSQL, Stripe Connect, Cloudflare R2, Mux, Tailwind CSS, Docker, Fly.io]
---
# A musician from Lebanon cannot sell his music: streaming pays pennies, and Bandcamp doesn't accept payments in his country. Needs a fair radio-platform with direct sales.

## Tech Stack

- **Elixir with Phoenix LiveView** for the radio surface and the musician dashboard, because LiveView fits the always-on, server-rendered streaming schedule and the per-state radio interactions without a separate SPA.
- **PostgreSQL** for musicians, tracks, schedules, purchases and the payout ledger; the relational model plus Elixir's Ecto is the cleanest path for the reconciliation work.
- **Stripe Connect** as the primary payment processor with a documented fallback for countries Stripe does not serve, so the musician's onboarding can route around the post's exclusion.
- **Mux** for adaptive-bitrate audio delivery, chosen because it abstracts the streaming stack and survives regional block events better than a self-hosted HLS pipeline.
- **Cloudflare R2** for the lossless master storage, cheap enough that the long tail of older tracks does not eat the platform's margin.
- **Tailwind CSS** for the radio and dashboard surfaces, paired with LiveView's server-rendered model so the design system stays consistent without a separate design-codebase.
- **Docker** for packaging and **Fly.io** for the regional deployment, because LiveView's long-running connections and the regional audio egress benefit from a multi-region shape from day one.

## Architecture

A visitor loads the radio, the LiveView page opens an SSE stream from the Phoenix server, and the server pushes the now-playing track plus the upcoming rotation. The audio itself is delivered by Mux from a CDN-backed manifest, with the lossless master stored in Cloudflare R2 and Mux producing the per-bitrate renditions. The schedule is a Postgres table that the musician edits through the dashboard, and the radio reads from a denormalised view of the upcoming N tracks so the listen path does not contend with edits.

The checkout path runs through Stripe Connect when the musician's country is served. When it is not, the onboarding flow tells the musician so and walks them through the fallback path, which is a documented processor that does serve the country or, as a last resort, a manual payout bridge that the musician and the platform agree on. The fan sees the split at checkout because the platform's cut is a published percentage and the listener's total is the musician's share plus the platform's cut plus the processor's fee. The purchase records the split, the processor's reference and the resulting ledger entry in Postgres, so the payout reconciliation can be replayed against the processor's own reports.

The musician dashboard is a separate LiveView surface that reads from the same Postgres but with a write path bounded to the musician's own catalogue. It shows listen counts, listen-to-sale conversions, payout history and the catalogue freshness metric, all of which are derived from the same event store the radio writes to. The architecture avoids a separate analytics warehouse because the volumes are small enough that a few well-indexed Postgres queries beat a second system.

## Milestones

1. **M1 — Radio surface** — LiveView radio that plays a scheduled mix, with the now-playing track and the upcoming rotation visible to any visitor.
2. **M2 — Catalogue onboarding** — musician sign-up, track upload and metadata management, with the rights flag on each track.
3. **M3 — Direct checkout** — Stripe Connect checkout for single-track, album and subscription purchases, with the split shown at checkout.
4. **M4 — Processor fallback** — documented fallback path for countries the primary processor does not serve, with the musician onboarding that walks them through it.
5. **M5 — Dashboard and reconciliation** — musician dashboard with listen counts, conversions and payout history that reconciles with the processor's ledger.
6. **M6 — Regional deployment** — Fly.io multi-region shape with Mux handling the audio egress, validated by a Lebanese musician onboarding and a real payout.

## Risks

- **No processor serves the country** — the entire premise collapses if both the primary and the fallback processors refuse to pay out; a documented honest path is required, not a silent signup.
- **Checkout failure at the last step** — a fan who is ready to pay and is blocked by the processor is the worst possible failure mode; the checkout must surface the failure and offer the next step.
- **Audio egress cost at scale** — a popular radio with a small per-listen margin can flip into a loss as the listen count grows; the per-listen cost has to be measured before the launch.
- **Catalogue rights ambiguity** — a track the musician uploaded without the rights they think they have creates a takedown risk for the platform and the musician; the rights flag has to be honest at upload.
- **Radio without listeners** — an always-on radio that nobody hears is a cost without a conversion; the launch needs at least one editorial slot and a way to seed listen traffic.
- **Payout reconciliation drift** — a discrepancy between the platform's ledger and the processor's is the kind of trust failure that ends a marketplace; the reconciliation has to be automated and reviewed.
