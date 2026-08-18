---
id: "417"
slug: i-will-not-promote
title: I will not promote
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vng36u/i_will_not_promote/"
category: startups
date: "2026-08-13"
---
# I will not promote

## Problem

The poster is a senior software engineer and LLM engineer, posting to ask how people actually manage to find investors for early-stage startups at the MVP stage. Where can they look? What should they say? They need help and would be happy if someone could explain it. The post is a question, not a complaint. No country, no category, no revenue, no specific investor type was stated.

## Objective

Give a first-time technical founder who is at the MVP stage a realistic map of who to ask for money, where to find them, and what to say in the first email — with the named context that makes the first email land. The job is not to introduce the founder to an investor — it is to give the founder a named-decision framework so they can run the outbound in a week, not a quarter.

## Target Users

Primary: a first-time technical founder (senior engineer, LLM engineer, or data scientist) who is at the MVP stage and has never raised before. Secondary: a first-time founder with a non-technical background who is asking the same question from a different angle.

## MVP Scope

In scope for v1:

- A 'who to ask for money' map: pre-seed angels, micro VCs, accelerators, operator angels, with the named contact path for each.
- A 'where to find them' list: the named channels (Twitter/X, LinkedIn, AngelList, Crunchbase, accelerator applications, warm intros).
- A 'first email' template: the named context that makes the named senior-engineer background read as relevant, not generic.
- A one-page export the founder can drop into a Notion doc or a CRM.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vng36u/i_will_not_promote/` follows the constraints in `417-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a question, not a feature request — the deliverable is a map, not a product.
- No country, no category, no revenue, no specific investor type was stated; the MVP must work for any first-time technical founder at the MVP stage.
- The output must not invent an investor's contact — name the named channels and let the founder fill in the names.
