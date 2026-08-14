---
id: "407"
slug: drop-elite-ball-knowledge-about-moats
title: Drop elite ball knowledge about moats
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnk3em/drop_elite_ball_knowledge_about_moats/"
category: saas
date: "2026-08-13"
---
# Drop elite ball knowledge about moats

## Problem

The poster is asking other founders for advice on what makes a strong moat for an app or SaaS in general. The post is a one-line question, not a feature request, not a complaint. No country, no category, no stack, no revenue was stated.

## Objective

Give a SaaS founder who is sizing defensibility a catalog of named moats — data, switching cost, network effects, brand, regulatory, scale, distribution — with the named signal each moat produces and the named time cost to build it. The job is not to build a moat — it is to map the moat space and let the founder pick the one that matches their category and stage.

## Target Users

Primary: a SaaS founder (pre-PMF to post-Series A) who is sizing defensibility and wants a map of the moat space, not a generic 'build a moat' post. Secondary: a chief of staff or head of strategy at the same kind of company who is paid to think about defensibility.

## MVP Scope

In scope for v1:

- A moat catalog: data, switching cost, network effects, brand, regulatory, scale, distribution, with the named signal each produces and the named time cost.
- A 'this moat fits at this stage' matrix: which moats are pre-PMF, which are post-PMF, which require Series A+ capital.
- A 'which moats are actually defensible' section: the named failure modes (moats that look like moats but aren't).
- A one-page export the founder can drop into a Notion doc or a board update.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnk3em/drop_elite_ball_knowledge_about_m` follows the constraints in `407-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a one-line question, not a feature request — the deliverable is a catalog, not a product.
- No country, no stack, no category, no revenue was stated; the MVP must work for any SaaS founder who is sizing defensibility.
- The output must not invent a moat — name the categories and let the founder fill in the specifics.
