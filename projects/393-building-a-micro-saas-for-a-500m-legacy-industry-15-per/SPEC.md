---
id: "393"
slug: building-a-micro-saas-for-a-500m-legacy-industry-15-per
title: Building a micro-SaaS for a $500M+ legacy industry (1\u20135 person teams). How do you approach feedback from non-tech users?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnqlk8/building_a_microsaas_for_a_500m_legacy_industry/"
category: saas
date: "2026-08-13"
---
# Building a micro-SaaS for a $500M+ legacy industry (1–5 person teams). How do you approach feedback from non-tech users?

## Problem

The poster — solo SaaS founder targeting small independent insurance agencies as an alternative to legacy AMS platforms — submitted the following to Reddit, and the entire product brief is grounded in it:

> I've spent months building a lightweight, ultra-fast management tool for small, independent insurance agencies (1 to 5 employees). The incumbents cost $500–$1,000+/mo and are crammed with enterprise features a 2-person team never uses. The poster lists concrete features: rate-increase flags, account bundling, instant search, simplified client workflows. They ask about onboarding (CSV vs guided setup) and how to extract feedback from non-tech users.

That text, plus the title `Building a micro-SaaS for a $500M+ legacy industry (1–5 person teams). How do you approach feedback from non-tech users?`, is the only ground truth. Anything not in the body or the title is an assumption the MVP has to verify with a real conversation before committing code. The MVP is judged on whether the insurance the post names is removed for the persona in the body, not on any adjacent metric.

## Objective

Give solo SaaS founder targeting small independent insurance agencies as an alternative to legacy AMS platforms a working tool that resolves the insurance pain visible in the captured Reddit body — measured on the same scale the post uses. If the post is a question rather than a complaint (e.g. 'is this worth building?'), the objective is a verdict with evidence, not a feature list. The bar for v1 is a directional answer the poster can act on, at the price and on the device named in the body.

## Target Users

Primary: solo SaaS founder targeting small independent insurance agencies as an alternative to legacy AMS platforms. The persona is grounded in the Reddit body; the post tells us how they describe themselves and what they are already using.

Secondary: peers reached through the same acquisition channel the poster uses (Reddit r/SaaS, organic posts, word of mouth in trade groups). Same insurance job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the insurance action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the insurance state stays controllable.
- A measurement step for the insurance signal the poster asked about (the post is a question, not a feature request — the MVP has to produce evidence, not ship features blindly).
- A small dashboard showing only the one insurance metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the insurance retention is proven.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnqlk8/building_a_microsaas_for_a_500m_l` follows the constraints in `393-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Industry: small insurance agencies are non-technical buyers who are also domain experts. The MVP must be 'fast and obvious' for the agent, not for the developer who builds it.
- Geography: no country stated. US-default (state-by-state licensing is US-shaped); MVP does not assume multi-jurisdiction.
- Pricing posture: the poster explicitly names $500–$1,000+/mo as the incumbents' price. The MVP price band must be visibly below that.
