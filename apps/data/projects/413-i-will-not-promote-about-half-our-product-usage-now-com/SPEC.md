---
id: "413"
slug: i-will-not-promote-about-half-our-product-usage-now-com
title: "I will not promote: About half our product usage now comes through the API, and we almost missed what that meant"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/startups/comments/1vnm3el/i_will_not_promote_about_half_our_product_usage/"
category: startups
date: "2026-08-13"
---
# I will not promote: About half our product usage now comes through the API, and we almost missed what that meant

## Problem

The poster builds a document platform — editor, templates, the usual. A while back they shipped an API because a few technical customers asked. This summer they looked at the numbers: about half of all documents ever created on the platform came through the API and MCP, created by users' coding agents rather than by the users themselves. Nobody announced this to them. Usage just migrated while they were watching the app's metrics. Once they saw it, they re-read support and sales notes — the pattern was everywhere. Their most engaged users were prompting agents like Claude Code to write the documents. The post is a public reflection, not a question. No country, no MRR, no user count was stated.

## Objective

Give a SaaS founder who has shipped an API and watches the same metrics everyone else watches a framework for noticing the moment when API/MCP usage overtakes UI usage, with the named signals to watch and the named implications for the product. The job is not to add API analytics — it is to teach the founder to notice the migration before it is too late to design for it.

## Target Users

Primary: a SaaS founder who has shipped an API and watches the same metrics everyone else watches, and wants the named signals to watch for the API-usage-migration. Secondary: a head of product or analytics lead at the same kind of company who is being asked to notice the migration and report it to the founder.

## MVP Scope

In scope for v1:

- A 'when API usage overtakes UI usage' framework: the named signals to watch (API vs. UI document creation, agent vs. user session count, support note patterns, sales note patterns).
- A 'what it means' implication map: the named consequences of the migration — agent-first doc generation, MCP-first design, pricing implications, the implication that the user's product is now part of someone else's agent flow.
- A 'before you ship the next feature' checklist: the named precondition.
- A one-page export the founder can drop into a Notion doc or a team thread.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/startups/comments/1vnm3el/i_will_not_promote_about_half` follows the constraints in `413-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- The source is a public reflection, not a feature request — the deliverable is a framework, not a product.
- No country, no MRR, no user count was stated; the MVP must work for any SaaS founder who has shipped an API and watches the standard metrics.
- The output must not invent a metric — name the named signals from the post and let the founder fill in the threshold.
