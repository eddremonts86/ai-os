---
id: "378"
slug: need-for-a-niche-marketplace-for-tilda-code-blocks-and-
title: Need for a niche marketplace for Tilda code blocks and solutions
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/dev/rsx7rzckd1-need-for-a-niche-marketplace-for-tilda-c"
category: dev
date: "2025-09-11"
tags: [Dev, No-Code]
country: Russia
---
# Need for a niche marketplace for Tilda code blocks and solutions

## Problem

The poster — Russian Tilda power-user selling or buying custom Zero Blocks based in Russia — posted the following to ProblemHunt under the `no-code` category, and the `blocks` of the title is the only signal the MVP is allowed to optimize against:

> Need for a niche marketplace for Tilda code blocks and solutions.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian Tilda power-user selling or buying custom Zero Blocks based in Russia a working tool that resolves the `blocks` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific blocks on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one blocks pain, less of it, demonstrably.

## Target Users

Primary: Russian Tilda power-user selling or buying custom Zero Blocks in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Dev, No-Code.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same blocks job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the blocks action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the blocks state stays controllable.
- A small dashboard showing only the one blocks metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the blocks retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/dev/rsx7rzckd1-need-for-a-niche-marketplace-for-tilda` follows the constraints in `378-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Russian buyers, Russian sellers, payouts in ₽ via a Russian-friendly rail.
- Two-sided: a marketplace needs both supply (Tilda builders willing to publish) and demand (Tilda users buying). Cold-start on supply first.
- Quality: a Tilda block is code. The marketplace has to preview it live, not just ship a screenshot.
