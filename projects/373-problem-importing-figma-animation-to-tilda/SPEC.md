---
id: "373"
slug: problem-importing-figma-animation-to-tilda
title: Problem importing Figma animation to Tilda
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/no-code/o9hindv9z1-problem-importing-figma-animation-to-til"
category: no-code
date: "2025-09-17"
tags: [No-Code, Design]
country: Russia
---
# Problem importing Figma animation to Tilda

## Problem

The poster — Russian Tilda user with a Figma file containing a Smart-Animate sequence based in Russia — posted the following to ProblemHunt under the `no-code` category, and the `animation` of the title is the only signal the MVP is allowed to optimize against:

> Problem importing Figma animation to Tilda.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian Tilda user with a Figma file containing a Smart-Animate sequence based in Russia a working tool that resolves the `animation` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific animation on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one animation pain, less of it, demonstrably.

## Target Users

Primary: Russian Tilda user with a Figma file containing a Smart-Animate sequence in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: No-Code, Design.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same animation job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the animation action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the animation state stays controllable.
- A small dashboard showing only the one animation metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the animation retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/no-code/o9hindv9z1-problem-importing-figma-animation-` follows the constraints in `373-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Tilda is the target; the output has to be a Tilda Zero Block with embedded JS, not a Next.js site.
- Animation fidelity: Figma Smart Animate uses easings and timing curves that Lottie and CSS keyframes both approximate badly. The MVP has to surface a fidelity report per animation, not silently downgrade.
- One-time use: most users need this once. The MVP must be a single-shot export, not a recurring subscription.
