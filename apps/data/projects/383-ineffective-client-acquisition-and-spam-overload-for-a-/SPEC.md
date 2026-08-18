---
id: "383"
slug: ineffective-client-acquisition-and-spam-overload-for-a-
title: Ineffective client acquisition and spam overload for a lawyer
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/freelance/7vyumtmek1-ineffective-client-acquisition-and-spam"
category: freelance
date: "2025-09-08"
tags: [Freelance, Marketing]
country: Armenia
---
# Ineffective client acquisition and spam overload for a lawyer

## Problem

The poster — Armenian lawyer (solo or small firm) getting junk leads and no good ones based in Armenia — posted the following to ProblemHunt under the `freelance` category, and the `leads` of the title is the only signal the MVP is allowed to optimize against:

> Ineffective client acquisition and spam overload for a lawyer.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Armenian lawyer (solo or small firm) getting junk leads and no good ones based in Armenia a working tool that resolves the `leads` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific leads on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one leads pain, less of it, demonstrably.

## Target Users

Primary: Armenian lawyer (solo or small firm) getting junk leads and no good ones in Armenia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Freelance, Marketing.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same leads job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the leads action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the leads state stays controllable.
- A small dashboard showing only the one leads metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the leads retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/7vyumtmek1-ineffective-client-acquisition-a` follows the constraints in `383-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Armenia.

For Armenia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Armenia — legal services marketed in Armenian and Russian, leads from Yerevan and the diaspora.
- Trust: lawyers in Armenia are bound by bar advertising rules. The MVP must pre-screen copy and channels for compliance, not just send anything.
- Filter: most inbound is spam. The MVP's wedge is a filter layer, not a generator.
