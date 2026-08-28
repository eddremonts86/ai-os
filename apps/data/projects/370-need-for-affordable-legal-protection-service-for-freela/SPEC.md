---
id: "370"
slug: need-for-affordable-legal-protection-service-for-freela
title: Need for affordable legal protection service for freelancers
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/legal/mfxod8viz1-need-for-affordable-legal-protection-ser"
category: legal
date: "2025-09-18"
tags: [Legal, Freelance]
country: Russia
---
# Need for affordable legal protection service for freelancers

## Problem

The poster — Russian freelancer handling client contracts, late payments and disputes alone based in Russia — posted the following to ProblemHunt under the `freelance` category, and the `legal` of the title is the only signal the MVP is allowed to optimize against:

> Need for affordable legal protection service for freelancers.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian freelancer handling client contracts, late payments and disputes alone based in Russia a working tool that resolves the `legal` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific legal on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one legal pain, less of it, demonstrably.

## Target Users

Primary: Russian freelancer handling client contracts, late payments and disputes alone in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Legal, Freelance.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same legal job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the legal action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the legal state stays controllable.
- A small dashboard showing only the one legal metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the legal retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/legal/mfxod8viz1-need-for-affordable-legal-protection` follows the constraints in `370-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Russian freelancers need help under Russian contract law; templates and dispute support must reflect ГК РФ, not generic US/EU boilerplate.
- Affordable: the price point is a freelancer, not a corporate legal department. The MVP must work at a 1,500–3,000 ₽/mo price band.
- Two-sided: contracts are between freelancer and client; the legal protection service has to be sellable to both sides — the freelancer pays, the client signs.
