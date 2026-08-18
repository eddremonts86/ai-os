---
id: "385"
slug: automated-figma-to-tilda-zero-block-layout-ai
title: Automated Figma-to-Tilda Zero Block layout AI
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/no-code/yf3xyo1d31-automated-figma-to-tilda-zero-block-layo"
category: no-code
date: "2025-09-08"
tags: [No-Code, Dev]
country: Russia
---
# Automated Figma-to-Tilda Zero Block layout AI

## Problem

The poster — Russian Tilda user with a Figma file they want published as a Tilda site without rebuilding layout manually based in Russia — posted the following to ProblemHunt under the `no-code` category, and the `layout` of the title is the only signal the MVP is allowed to optimize against:

> Automated Figma-to-Tilda Zero Block layout AI.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian Tilda user with a Figma file they want published as a Tilda site without rebuilding layout manually based in Russia a working tool that resolves the `layout` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific layout on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one layout pain, less of it, demonstrably.

## Target Users

Primary: Russian Tilda user with a Figma file they want published as a Tilda site without rebuilding layout manually in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: No-Code, Dev.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same layout job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the layout action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the layout state stays controllable.
- A small dashboard showing only the one layout metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the layout retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/no-code/yf3xyo1d31-automated-figma-to-tilda-zero-bloc` follows the constraints in `385-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Russian Tilda users — error messages and UI in Russian.
- One-shot: 'automated' means the user uploads a Figma file and gets a Tilda page in one step. No 10-screen wizard.
- Layout fidelity: Tilda Zero Block is a constrained grid. The MVP has to pick the closest Zero Block layout, not invent a new one.
