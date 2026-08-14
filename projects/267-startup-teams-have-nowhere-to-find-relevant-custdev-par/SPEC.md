---
id: "267"
slug: startup-teams-have-nowhere-to-find-relevant-custdev-par
title: Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/startups/frug7pmx31-startup-teams-have-nowhere-to-find-relev"
category: startups
date: "2025-12-15"
tags: [Research, Other]
country: Russia
tech: [Next.js 14, TypeScript, PostgreSQL, Telegram Bot API, Stripe, Resend, YooMoney]
---
# Startup teams have nowhere to find relevant custdev participants (people for interviews) to test early ideas and prototypes without overpaying for biased feedback

## Problem

Russian startup teams need to run 10-20 customer-development interviews to validate an early idea or prototype but have no reliable way to find participants who match the target persona and will give honest (not paid-positive) feedback. Current options — recruiter panels, friend networks, paid panel providers — produce biased or generic responses, and Russian payment rails exclude most international panel tools.

## Objective

Ship a Russian-language custdev-participant platform that vets participants per persona (industry, role, seniority, geography), routes invitations through Telegram and email, and pays participants via Russian-friendly rails (YooMoney, Tinkoff, SBP) so startups get honest feedback at sane cost.

## Target Users

Russian startup teams running early-stage customer development; Russian product teams at mid-sized companies running concept tests. Independent UX researchers in Russia.

## MVP Scope

Web dashboard for startup to define persona, participant vetting questions, and incentive amount. Telegram bot and email channel for participant recruitment. Participant-vetting flow with persona-matching score. Russian-friendly payout (YooMoney / Tinkoff / SBP) for completed interviews.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/startups/frug7pmx31-startup-teams-have-nowhere-to-fin` follows the constraints in `267-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Russia.

For Russia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must support Russian payment rails (YooMoney, Tinkoff, SBP). Participant privacy — name and contact details not shared with startup until participant opts in. Honest feedback, not paid-positive — incentive structure must not corrupt responses.
