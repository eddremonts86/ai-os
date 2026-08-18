---
id: "353"
slug: difficulty-finding-relevant-respondents-for-b2b-researc
title: Difficulty finding relevant respondents for b2b research
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/tphf0sjeg1-difficulty-finding-relevant-respondents"
category: other
date: "2025-10-29"
tags: [Other]
country: Russia
tech: [Next.js, Postgres, B2B intent + role-firmographic data (Apollo + Russian-provider fallback), Stripe / YuKassa, OpenAI API (qualification scoring)]
---
# Difficulty finding relevant respondents for b2b research

## Problem

A Russian B2B research team targeting a specific buyer persona (e.g. head of logistics at a 200-1000-person Russian manufacturer) reports that finding 30 qualified respondents means posting on Telegram channels, paying recruiter fees, or cold-emailing lists that turn out to be 40% outdated. The hour cost of qualifying respondents is comparable to the hour cost of running the interview; neither is the productive part of the work.

## Objective

Ship a B2B respondent-recruitment tool for Russian B2B research teams that targets a specific buyer persona, scores firmographic + role fit, recruits respondents via paid incentives, and books interviews on the research team's calendar - in one dashboard, without a recruiter.

## Target Users

- Russian B2B research agencies running 5-20 client studies per quarter.
- Russian in-house product and growth teams running 2-3 B2B discovery waves per quarter.
- Russian consultancies validating a market entry thesis with primary research.

## MVP Scope

- Persona spec: role, industry, company-size band, geography (RU-only).
- Respondent sourcing: Apollo + Russian provider (Hunter-ru alternative) + opt-in recruiter panel.
- Qualification scoring: firmographic + role + tenure + sector composite score, with a 0-100 fit index.
- Outreach: templated Russian-language outreach, incentive offer (RUB), opt-in double-confirmation.
- Calendar: 30-minute interview booking synced with the research team's calendar.
- Translation of respondent recontact language for non-Russian speakers.
- No general-purpose market-research panel; specialist B2B only.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/other/tphf0sjeg1-difficulty-finding-relevant-responde` follows the constraints in `353-.../SPEC.md` and the chosen stack (Next.js, Postgres, B2B intent + role-firmographic data (Apollo + Russian-provider fallback)). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Incentive paid in RUB via YuKassa; non-cash gift cards acceptable on opt-in.
- PII handled per 152-FZ with a clear consent text shown in the outreach.
- Per-study recruitment cap at 200 respondents; project-based billing only.
