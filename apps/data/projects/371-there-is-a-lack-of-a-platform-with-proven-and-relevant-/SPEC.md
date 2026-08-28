---
id: "371"
slug: there-is-a-lack-of-a-platform-with-proven-and-relevant-
title: There is a lack of a platform with proven and relevant marketing cases
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/3nb3237gu1-there-is-a-lack-of-a-platform-with-prove"
category: freelance
date: "2025-09-18"
tags: [Freelance, Marketing]
country: Russia
---
# There is a lack of a platform with proven and relevant marketing cases

## Problem

The poster — Russian marketing manager or agency owner sourcing case studies to plan campaigns based in Russia — posted the following to ProblemHunt under the `marketing` category, and the `cases` of the title is the only signal the MVP is allowed to optimize against:

> There is a lack of a platform with proven and relevant marketing cases.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian marketing manager or agency owner sourcing case studies to plan campaigns based in Russia a working tool that resolves the `cases` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific cases on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one cases pain, less of it, demonstrably.

## Target Users

Primary: Russian marketing manager or agency owner sourcing case studies to plan campaigns in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Freelance, Marketing.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same cases job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the cases action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the cases state stays controllable.
- A small dashboard showing only the one cases metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the cases retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/3nb3237gu1-there-is-a-lack-of-a-platform-wi` follows the constraints in `371-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: the case library is RU-centric; Russian campaigns, Russian verticals (e-commerce, fintech, edtech), Russian metrics (ROMI, CPL in ₽).
- Provenance: a 'proven' case has numbers, a date range, and a contactable author. The MVP cannot accept anonymous claims.
- Two-sided: cases have an author who is paid for them and a reader who subscribes to the library. Both flows have to ship on day one.
