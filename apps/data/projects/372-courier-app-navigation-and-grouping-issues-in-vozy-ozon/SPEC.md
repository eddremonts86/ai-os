---
id: "372"
slug: courier-app-navigation-and-grouping-issues-in-vozy-ozon
title: Courier app navigation and grouping issues in \u00abVozy Ozon\u00bb
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/logistics/69hxkoys91-courier-app-navigation-and-grouping-issu"
category: logistics
date: "2025-09-17"
tags: [Logistics]
country: Belarus
---
# Courier app navigation and grouping issues in «Vozy Ozon»

## Problem

The poster — Ozon Vozy courier working in Belarus using the courier app on a personal phone based in Belarus — posted the following to ProblemHunt under the `delivery` category, and the `grouping` of the title is the only signal the MVP is allowed to optimize against:

> Courier app navigation and grouping issues in «Vozy Ozon».

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Ozon Vozy courier working in Belarus using the courier app on a personal phone based in Belarus a working tool that resolves the `grouping` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific grouping on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one grouping pain, less of it, demonstrably.

## Target Users

Primary: Ozon Vozy courier working in Belarus using the courier app on a personal phone in Belarus. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Logistics.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same grouping job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the grouping action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the grouping state stays controllable.
- A small dashboard showing only the one grouping metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the grouping retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/logistics/69hxkoys91-courier-app-navigation-and-group` follows the constraints in `372-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Belarus.

For Belarus, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Belarus; the courier's territory is a single city (Minsk, Gomel, etc.). The grouping logic has to respect city-level delivery zones.
- Phone-first: couriers use one hand on the phone and one on a handlebar or trolley. The grouping fix has to be visible in under 2 seconds.
- Employer constraint: Ozon owns the dispatcher. The fix is for the couriers' personal workflow, not a sanctioned Ozon app — there is no path to ask Ozon to ship it.
