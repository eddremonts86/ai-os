---
id: "366"
slug: need-for-a-built-in-audio-player-in-tilda-product-catal
title: Need for a built-in audio player in tilda product catalog
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/no-code/9gfljgt4l1-need-for-a-built-in-audio-player-in-tild"
category: no-code
date: "2025-09-20"
tags: [No-Code, Marketing, Retail, Dev]
country: Russia
---
# Need for a built-in audio player in tilda product catalog

## Problem

The poster — Russian Tilda freelancer or studio owner building product catalog pages based in Russia — posted the following to ProblemHunt under the `no-code` category, and the `audio` of the title is the only signal the MVP is allowed to optimize against:

> Need for a built-in audio player in tilda product catalog.

That sentence is the entire brief. The source is `manual`, so only the title is real ground truth — the post body was not captured. Every assumption that goes beyond the title is an open hypothesis the MVP has to validate in the first week, not a fait accompli.

## Objective

Give Russian Tilda freelancer or studio owner building product catalog pages based in Russia a working tool that resolves the `audio` pain named in the title — measured on the same scale the post implies. The bar for v1 is verifiable reduction of that specific audio on the channel and device the role uses, at a price the role can pay. Not delight; not growth curves; not retention metrics the post did not name — just this one audio pain, less of it, demonstrably.

## Target Users

Primary: Russian Tilda freelancer or studio owner building product catalog pages in Russia. The persona is grounded in the title and tags, not in a body — the post did not capture a body, so any specifics beyond the title are open hypotheses until the first interview. Tags supplied with the post: No-Code, Marketing, Retail, Dev.

Secondary: peers reached through the same acquisition channel the poster would plausibly use (a trade Telegram chat, a Reddit sub, a VK group, a Yandex.Zen page). Same audio job, same constraints, different name on the invoice.

## MVP Scope

In scope for v1:

- One concrete user flow, end to end: the audio action the role is currently doing by hand that the post objects to, automated enough that the role would stop doing it manually within a week.
- Persistence scoped to the role's data — single-tenant or invitation-only during v1, no public sign-up — so the audio state stays controllable.
- A small dashboard showing only the one audio metric the role cares about — fewer charts, not more.
- Manual onboarding for the first cohort; no self-serve sign-up before the audio retention is proven.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/no-code/9gfljgt4l1-need-for-a-built-in-audio-player-i` follows the constraints in `366-.../SPEC.md` and the chosen stack (the chosen stack). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Platform: the host is Tilda, not a custom Next.js app. The deliverable is a Tilda-compatible block plus a small static audio host, not a separate SaaS.
- Geography: Russian Tilda users expect VK-style share buttons and Yandex.Metrika, not GA4. The block must not inject forbidden third-party scripts that violate Russian hosting norms.
- Performance: product pages already load images; adding an audio stream must not break Tilda's lazy-load contract or push the page past Core Web Vitals on a slow Russian mobile network.
