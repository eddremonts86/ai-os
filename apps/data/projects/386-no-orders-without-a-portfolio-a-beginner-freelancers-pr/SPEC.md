---
id: "386"
slug: no-orders-without-a-portfolio-a-beginner-freelancers-pr
title: "No orders without a portfolio: a beginner freelancer's problem"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/bhk2hd8zp1-no-orders-without-a-portfolio-a-beginner"
category: freelance
date: "2025-09-08"
tags: [Freelance]
country: Russia
---
# No orders without a portfolio: a beginner freelancer's problem

## Problem

The poster — Russian beginner freelancer (likely designer or developer) rejected because they have no portfolio yet based in Russia — posted the following to ProblemHunt under the `freelance` category, and the `portfolio` of the title is the only signal the MVP is allowed to optimize against:

> No orders without a portfolio: a beginner freelancer's problem.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian beginner freelancer (likely designer or developer) rejected because they have no portfolio yet based in Russia a working tool that resolves the `portfolio` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific portfolio on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one portfolio pain, less of it, demonstrably.

## Target Users

Primary: Russian beginner freelancer (likely designer or developer) rejected because they have no portfolio yet in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: Freelance.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same portfolio job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the portfolio action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the portfolio state stays controllable.
- A small dashboard showing only the one portfolio metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the portfolio retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/bhk2hd8zp1-no-orders-without-a-portfolio-a-` follows the constraints in `386-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Geography: Russian beginner freelancer — Russian portfolio, Russian-language case studies.
- Honesty: the poster admits the portfolio is missing. The MVP cannot fabricate fake clients. It produces case studies from real (pro bono, study, or learning) work and labels them as such.
- Cheap: the target user cannot pay 5,000 �/mo for a portfolio tool. MVP price band is 500–1,500 ₽/mo or one-shot under 2,000 ₽.
