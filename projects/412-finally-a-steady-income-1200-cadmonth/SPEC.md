---
id: "412"
slug: finally-a-steady-income-1200-cadmonth
title: "Finally a steady income! 1200 CAD/month"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadmonth/"
category: saas
date: "2026-08-13"
---
# Finally a steady income! 1200 CAD/month

## Problem

The poster is celebrating a steady $1,200 CAD/month from their site hedgefun.ai. They say: as long as you have a product that WORKS, that NO ONE else has, you will make money. They haven't advertised beyond a few Reddit posts. They invite users who trade SPX/SPY themselves, with covered spreads or naked options, and claim a strategy for the user. The post is a launch/promotion, not a question. Country: implied Canada (CAD). No category, no other metrics were stated.

## Objective

Give an indie developer or solo tinkerer who has crossed the $1,000/month mark a frame for the milestone — what the milestone means, what the next step looks like, and what the named failure modes are when the founder treats $1,200/month as the end rather than a marker. The job is not to push the founder to scale — it is to name the named fork in the road.

## Target Users

Primary: an indie developer or solo tinkerer who has hit $1,000-$2,000/month on a side project and is wondering whether to keep the project as a steady hobby, push to $5,000/month, or push for a venture-scale outcome. Secondary: a partner or spouse of someone who has hit the milestone and is weighing the named trade-off.

## MVP Scope

In scope for v1:

- A 'what the $1,200/month milestone means' frame: the named fork — keep as a steady hobby, push to $5,000, push to venture-scale — with the named trade-off of each path.
- A 'next 12 months' decision aid: what the next 12 months look like on each path, with the named inputs from the post (no advertising, niche feature, CAD pricing).
- A 'named failure modes' section: the named ways the founder turns the milestone into a half-step that consumes the savings without growing the project.
- A one-page export the founder can drop into a Notion doc or a personal journal.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnj7hy/finally_a_steady_income_1200_cadm` follows the constraints in `412-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a launch/promotion, not a complaint — the deliverable is a frame, not a product.
- Country: implied Canada (CAD). The MVP must respect the currency and the currency's purchasing power, not assume USD.
- No category, no user count, no other metrics were stated; the MVP must work for any indie developer who has hit a $1,000-$2,000/month milestone on a niche product.
