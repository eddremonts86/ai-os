---
id: "374"
slug: need-for-instant-notifications-about-discounts-at-vkusv
title: Need for instant notifications about discounts at \u00abVkusvill\u00bb and \u00abPerekrestok\u00bb
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/retail/lfz3mtpit1-need-for-instant-notifications-about-dis"
category: retail
date: "2025-09-16"
tags: [Retail]
country: Russia
---
# Need for instant notifications about discounts at «Vkusvill» and «Perekrestok»

## Problem

The poster — Russian shopper on a tight grocery budget tracking weekly promotions based in Russia — posted the following to ProblemHunt under the `retail` category, and the `discount` of the title is the only signal the MVP is allowed to optimize against:

> Need for instant notifications about discounts at «Vkusvill» and «Perekrestok».

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian shopper on a tight grocery budget tracking weekly promotions based in Russia a working tool that resolves the `discount` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific discount on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one discount pain, less of it, demonstrably.

## Target Users

Primary: Russian shopper on a tight grocery budget tracking weekly promotions in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Retail.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same discount job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the discount action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the discount state stays controllable.
- A small dashboard showing only the one discount metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the discount retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/retail/lfz3mtpit1-need-for-instant-notifications-abou` follows the constraints in `374-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Russia — both retailers publish weekly flyers on Russian domains; scraping has to respect robots.txt and use Russian proxy IPs where required.
- Speed: the discount window is 1–3 days. The notification has to land on Telegram within 30 minutes of the catalog being posted.
- Trust: shoppers ignore spammy Telegram bots. The MVP must be opt-in per category, not a firehose.
