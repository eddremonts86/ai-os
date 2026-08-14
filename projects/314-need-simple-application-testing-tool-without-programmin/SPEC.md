---
id: "314"
slug: need-simple-application-testing-tool-without-programmin
title: Need simple application testing tool without programming
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/dev/1ic9wdywx1-need-simple-application-testing-tool-without-p"
category: dev
date: "2025-10-29"
tags: [Dev, QA, Other]
country: Kenya
tech: [Next.js 14, TypeScript, Postgres, Playwright headless browser farm, M-Pesa Daraja API, Hetzner]
---
# Need simple application testing tool without programming

## Problem

Kenyan developers and product teams that build web apps — often solo founders, dev shops, or in-house teams at banks, SACCOs, telcos — cannot reliably test their apps before release because they do not have a QA team or a coding-heavy testing tool (Cypress, Playwright, Selenium). The title is direct: a simple application testing tool that does not require programming. Today they test by clicking through the app themselves and shipping; bugs slip into production and customers see them first.

## Objective

Ship a no-code web-app testing product purpose-built for Kenyan developers that lets a non-QA engineer record a browser session once and replay it on every deploy, with assertion checks for the visual and text content they care about. Outcome: a solo Kenyan developer ships a critical-path smoke test in under 30 minutes and catches regressions before the customer does.

## Target Users

Kenyan developers and product teams — solo founders, dev shops, in-house teams at banks, SACCOs, telcos, and startups. Adults 22–45, comfortable with Chrome DevTools but not Cypress/Playwright. Secondary: Kenyan QA leads who want a lighter alternative to enterprise testing tools.

## MVP Scope

Browser recorder Chrome extension: record clicks, form fills, and page navigations; auto-generate a test step list. Assertion editor: click any element, set 'expect this text' or 'expect this element to be visible'. Replay on demand or on git push (GitHub Actions integration). Screenshot diff: visual regression per page on every replay. Failure notifications via Slack, email, and WhatsApp. Pricing in KES with M-Pesa support. English-only UI in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/dev/1ic9wdywx1-need-simple-application-testing-tool-w` follows the constraints in `314-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, Postgres). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Kenya.

For Kenya, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must work on a Kenyan ISP (low bandwidth tolerance: 1–2 Mbps for the recorder). Replay runs on the platform's headless browser farm — the user does not need a CI server. M-Pesa payments via Daraja API for the Kenya market. Test history retention: 30 days default, configurable. No real-data capture in recordings — the recorder masks form values automatically.
