---
id: "401"
slug: how-did-you-get-your-first-real-users-when-nobody-knew-
title: How did you get your first real users when nobody knew your product existed?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnml9h/how_did_you_get_your_first_real_users_when_nobody/"
category: saas
date: "2026-08-13"
---
# How did you get your first real users when nobody knew your product existed?

## Problem

The poster is building LakeDB, a desktop SQL client, mostly solo, and is still early. The product works and they're getting some feedback, but the pattern is clear: building is easier than getting discovered. The question is concrete: how did you get your first 50-100 real users — Reddit, GitHub, Product Hunt, communities, content, direct outreach, something else? If on GitHub, what actually helped the project start getting stars organically? The poster wants to spend less time blindly adding features and more time learning the discovery part. No country, no revenue, no install count was stated.

## Objective

Give an early-stage solo developer who is stuck on the discovery part a realistic catalog of channels that have actually produced the first 50-100 users for comparable desktop or developer tools. The job is not to market the product — it is to map the channel space and let the founder pick the one that matches their temperament and their time budget.

## Target Users

Primary: a solo developer or very small team building a developer tool (CLI, desktop app, library, framework) who has shipped v1 and is stuck on the discovery part. Secondary: a first-time technical founder who is weighing whether to hire a growth person or do the discovery work themselves.

## MVP Scope

In scope for v1:

- A channel catalog: Reddit, GitHub, Product Hunt, communities, content, direct outreach, with the named signal each channel produces and the named time cost.
- A 'first 50-100 users' audit: which channels actually delivered the first 50-100 users for comparable desktop tools, and which ones were the poster's noise sources.
- A GitHub-specific section: what actually moved stars organically (the post's specific question), separate from follower count.
- A one-page export the founder can drop into a Notion doc or a team thread.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnml9h/how_did_you_get_your_first_real_u` follows the constraints in `401-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a question, not a feature request — the deliverable is a catalog, not a product.
- No country, no install count, no revenue was stated; the MVP must work for any developer tool with a v1 in the wild.
- The output must not invent a channel's conversion rate — name the channel and let the founder fill in the number from their own experiment.
