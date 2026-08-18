---
id: "368"
slug: tildas-terrible-support-and-the-need-for-a-premium-help
title: "Tilda's terrible support and the need for a premium help service"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/t6oxa8m3d1-tildas-terrible-support-and-the-need-for"
category: other
date: "2025-09-19"
tags: [Other]
country: Belarus
---
# Tilda's terrible support and the need for a premium help service

## Problem

The poster — Tilda user in Belarus paying for an account but unable to get a timely human reply based in Belarus — posted the following to ProblemHunt under the `dev` category, and the `support` of the title is the only signal the MVP is allowed to optimize against:

> Tilda's terrible support and the need for a premium help service.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Tilda user in Belarus paying for an account but unable to get a timely human reply based in Belarus a working tool that resolves the `support` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific support on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one support pain, less of it, demonstrably.

## Target Users

Primary: Tilda user in Belarus paying for an account but unable to get a timely human reply in Belarus. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Other.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same support job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the support action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the support state stays controllable.
- A small dashboard showing only the one support metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the support retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/other/t6oxa8m3d1-tildas-terrible-support-and-the-need` follows the constraints in `368-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Belarus.

For Belarus, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Belarus — payments in BYN or USD via a Belarus-friendly rail (bePaid or Stripe Atlas). The help service cannot require a Russian or EU bank account only.
- Affiliation: the service is unofficial Tilda help, not affiliated. The MVP must say so clearly and never impersonate Tilda staff.
- Channel: Tilda support is email-and-forum only; the premium help service has to be chat-first to be a real upgrade.
