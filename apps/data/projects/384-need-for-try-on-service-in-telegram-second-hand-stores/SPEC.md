---
id: "384"
slug: need-for-try-on-service-in-telegram-second-hand-stores
title: Need for try-on service in Telegram second-hand stores
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/dknrnh1581-need-for-try-on-service-in-telegram-seco"
category: retail
date: "2025-09-08"
tags: [Retail]
country: Serbia
---
# Need for try-on service in Telegram second-hand stores

## Problem

The poster — Serbian shopper buying clothes on a Telegram second-hand channel based in Serbia — posted the following to ProblemHunt under the `retail` category, and the `try-on` of the title is the only signal the MVP is allowed to optimize against:

> Need for try-on service in Telegram second-hand stores.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Serbian shopper buying clothes on a Telegram second-hand channel based in Serbia a working tool that resolves the `try-on` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific try-on on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one try-on pain, less of it, demonstrably.

## Target Users

Primary: Serbian shopper buying clothes on a Telegram second-hand channel in Serbia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Retail.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same try-on job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the try-on action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the try-on state stays controllable.
- A small dashboard showing only the one try-on metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the try-on retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/retail/dknrnh1581-need-for-try-on-service-in-telegram` follows the constraints in `384-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Serbia — Telegram is the dominant marketplace for second-hand clothes in Belgrade/Novi Sad.
- Privacy: the user uploads a photo of themselves to a try-on service. The MVP must store nothing permanently, must explain that in the bot flow, and must offer a delete button.
- Realism: virtual try-on still looks fake on loose garments. The MVP has to be honest about which categories work (tops, dresses) and which do not (shoes).
