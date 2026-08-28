---
id: "328"
slug: need-a-simple-alternative-to-meta-ads-after-andromeda-u
title: Need a simple alternative to Meta Ads after Andromeda update
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-meta-ads-af"
category: marketing
date: "2025-10-29"
tags: [Marketing]
country: USA
tech: [Meta Marketing API, Google Ads API, TikTok Ads API, Postgres on Fly.io, Plausible Analytics]
---
# Need a simple alternative to Meta Ads after Andromeda update

## Problem

After Meta rolled out its Andromeda algorithmic update, advertisers in the US report rising cost per click, weaker creative performance, and an interface that the poster describes as more complex than it needs to be. The pain is not the absence of paid distribution - Google, TikTok, Reddit and X all accept paid spend. The pain is that the small-business operator who is posting this kind of problem was relying on Meta Ads as their single paid channel and now has no simple replacement that combines creative upload, audience targeting, budget pacing and reporting in one place that does not feel like Meta.

## Objective

Ship a paid-ads orchestrator that lets a US small-business operator create and monitor a multi-platform paid campaign (Meta + Google + TikTok) from a single desktop dashboard, with creative testing and budget pacing that does not require learning the Meta Ads Manager.

## Target Users

- US small-business owners running under $5k/month in paid spend who lost performance after the Andromeda update.
- Solo marketers and agency operators serving 3-10 small US clients who want one dashboard instead of three.
- DTC brand founders who need cross-platform creative A/B without re-uploading the same asset four times.

## MVP Scope

- Connect Meta, Google and TikTok ad accounts via official Marketing APIs in one OAuth flow.
- Create one campaign per platform from a single brief (objective, audience, daily budget, creative).
- Auto-generate per-platform creative variants from one uploaded master asset (image, video, headline, primary text).
- Daily automated spend pacing with a per-platform and overall daily cap, with email or Telegram alert at 80%.
- Single reporting view: spend, impressions, CTR, CPC, CPA across all three platforms, exportable as CSV.
- No mobile app, no organic social posting, no CRM integration in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/marketing/8xk7k4gx31-need-a-simple-alternative-to-met` follows the constraints in `328-.../SPEC.md` and the chosen stack (Meta Marketing API, Google Ads API, TikTok Ads API). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Must respect each platform's marketing-API rate limits; budget pacing job runs at most every 15 minutes.
- No creative copy or asset is stored longer than required for current-quarter campaign reporting (privacy minimum).
- Operates only on US-based business accounts for v1 (USD billing, US data-residency for Postgres).
