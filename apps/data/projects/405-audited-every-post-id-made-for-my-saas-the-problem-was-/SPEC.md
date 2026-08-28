---
id: "405"
slug: audited-every-post-id-made-for-my-saas-the-problem-was-
title: "Audited every post I'd made for my SaaS. The problem was never the writing."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnm0nd/audited_every_post_id_made_for_my_saas_the/"
category: saas
date: "2026-08-13"
---
# Audited every post I'd made for my SaaS. The problem was never the writing.

## Problem

The poster builds a small marketing tool and does all their own distribution. They went back and actually scored every public post and comment they had made, instead of guessing. Almost none of it was what they expected. Posts and comments are not the same channel: posts earned +143 between them, comments earned +5 across nearly twice as many attempts. Commenting feels like work and mostly is not. The post goes on to name the scoring system, the named patterns, and what the founder would change. The post is a practitioner write-up, not a question. No country, no ARR, no team size was stated.

## Objective

Give a small SaaS founder who is doing their own distribution a scoring system and a channel-shape insight that lets them stop treating posts and comments as the same channel. The job is not to write the posts — it is to give the founder a way to measure which surface actually returns the time.

## Target Users

Primary: a small SaaS founder (1-3 people) who is doing their own distribution across Reddit, LinkedIn, X, Hacker News, and Indie Hackers and wants to know which surface is actually returning the time. Secondary: a first marketing hire at the same kind of company who is being asked to replicate the founder's distribution and needs the measurement framework.

## MVP Scope

In scope for v1:

- A scoring system for public posts and comments, with the named categories from the post (posts vs. comments, score per attempt, named patterns).
- A channel-shape insight: the named asymmetry between posts and comments, with the ratio from the post as the anchor.
- A 'what the founder would do differently' section: the post's named recommendations, with the named sequencing.
- A one-page export the founder can drop into a Notion doc or a Monday morning standup.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnm0nd/audited_every_post_id_made_for_my` follows the constraints in `405-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a practitioner write-up with named numbers — the MVP must surface every number and label any extrapolation as extrapolation.
- The post is about one founder's distribution. The MVP must respect that scope and refuse to extrapolate to enterprise demand-gen or paid acquisition.
- No country, no stack, no revenue was stated; the MVP must work for any SaaS founder with a public distribution channel.
