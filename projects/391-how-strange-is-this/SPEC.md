---
id: "391"
slug: how-strange-is-this
title: How strange is this?
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vnr1ls/how_strange_is_this/"
category: saas
date: "2026-08-13"
---
# How strange is this?

## Problem

The poster — solo dev in a specific niche, accidentally shipping a paid landing page before the product is built — submitted the following to Reddit, and the entire product brief is grounded in it:

> I'm a solo dev building a saas in a specific niche, deploying on Railway with a public link. Auth and billing work; main features aren't ready. Looking at the db, someone started paying a subscription 8 days ago. Nobody knows the project is being built — the customer found the landing page and decided it was worth it.

That text, plus the title `How strange is this?`, is the only ground truth. Anything not in the body or the title is an assumption the MVP has to verify with a real conversation before committing code. The MVP is judged on whether the niche the post names is removed for the persona in the body, not on any adjacent metric.

## Objective

Give solo dev in a specific niche, accidentally shipping a paid landing page before the product is built a working tool that resolves the niche pain visible in the captured Reddit body — measured on the same scale the post uses. If the post is a question rather than a complaint (e.g. 'is this worth building?'), the objective is a verdict with evidence, not a feature list. The bar for v1 is a directional answer the poster can act on, at the price and on the device named in the body.

## Target Users

Primary: solo dev in a specific niche, accidentally shipping a paid landing page before the product is built. The persona is grounded in the Reddit body; the post tells us how they describe themselves and what they are already using.

Secondary: peers reached through the same acquisition channel the poster uses (Reddit r/SaaS, organic posts, word of mouth in trade groups). Same niche job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the niche action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the niche state stays controllable.
- A measurement step for the niche signal the poster asked about (the post is a question, not a feature request — the MVP has to produce evidence, not ship features blindly).
- A small dashboard showing only the one niche metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the niche retention is proven.

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SaaS/comments/1vnr1ls/how_strange_is_this/` follows the constraints in `391-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: no country stated. The MVP language is English; the deploy target (Railway) is region-agnostic.
- Pre-launch state: the source is a 'wait, someone paid before I was ready' moment. The plan is not a feature roadmap; it is a 'decide what to ship before refunding or disappointing' plan.
- Trust: ignoring a paying customer is a churn risk. The MVP must include a same-day outreach, not 'add to backlog'.
