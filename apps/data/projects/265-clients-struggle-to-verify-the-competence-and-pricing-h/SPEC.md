---
id: "265"
slug: clients-struggle-to-verify-the-competence-and-pricing-h
title: Clients struggle to verify the competence and pricing honesty of freelancers when creating websites \u2014 there is no AI tool for real-time proposal analysis
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/freelance/ousnmj63l1-clients-struggle-to-verify-the-competenc"
category: freelance
date: "2025-12-26"
tags: [Business, AI, Other]
country: USA
tech: [Next.js 14, TypeScript, PostgreSQL, OpenAI GPT-4o, Stripe, Resend, PostHog]
---
# Clients struggle to verify the competence and pricing honesty of freelancers when creating websites — there is no AI tool for real-time proposal analysis

## Problem

USA clients hiring freelancers for website work receive proposals that vary wildly in scope, price, and competence signals. There is no tool that analyses a proposal in real time and surfaces whether the scope matches the price, whether the timeline is realistic, and what competence signals the freelancer actually has. The poster wants such a tool.

## Objective

Ship a real-time proposal-analysis tool that ingests a freelancer's proposal (PDF, doc, or pasted text), compares it against the brief, and returns a structured read on scope coverage, pricing honesty (vs. market rate), timeline realism, and the freelancer's competence signals (portfolio, references, prior work).

## Target Users

USA clients hiring freelancers for website / SaaS builds; small agencies that triage inbound proposals; procurement teams at mid-sized companies.

## MVP Scope

Web app with proposal upload (PDF, doc, text), GPT-4o analysis pipeline that scores four dimensions (scope coverage, pricing, timeline, competence signals), structured report, and 5 free analyses per month per user with paid tier for unlimited.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/freelance/ousnmj63l1-clients-struggle-to-verify-the-c` follows the constraints in `265-.../SPEC.md` and the chosen stack (Next.js 14, TypeScript, PostgreSQL). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in USA.

For USA, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Analysis quality depends on having a market-rate dataset — pricing-honesty scoring is bounded by dataset freshness. Source does not state a willingness-to-pay. Free tier exists to let clients try without commitment.
