---
id: "228"
slug: a-freelancer-often-loses-in-proposal-competitions-due-t
title: A freelancer often loses in proposal competitions due to the inability to quickly create personalized proposals — weeks of work wasted.
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: freelance
date: "2026-01-29"
tags: [Freelance, Productivity, AI]
country: Australia
tech: [Next.js, Python, FastAPI, Claude API, PostgreSQL, Stripe]
---
# A freelancer often loses in proposal competitions due to the inability to quickly create personalized proposals — weeks of work wasted.

## Problem

A freelancer in Australia loses proposal competitions because the time to produce a high-quality, personalised proposal is too long. Templates exist but they read as templates. Custom proposals are full-rewrite each time and the work is wasted when the client picks a competitor who submitted faster. The freelancer ends up either underpricing (to compensate for the small win rate) or burning out on the proposal pipeline. What is missing is a service that takes a client's brief, the freelancer's portfolio and prior work, and the freelancer's own voice, and produces a personalised draft proposal in 10 minutes that the freelancer adjusts in 5. None of the mainstream tools (Trello for proposals, Refrens, Bonsai) combine per-client portal context with the freelancer's own voice and a 10-minute turnaround.

## Objective

A proposal-generation service that takes a brief, the freelancer's portfolio, and the freelancer's voice, and produces a personalised draft in 10 minutes, with a 5-minute human review.

## Target Users

Australian and UK freelancers in design, dev, writing, and consulting who run a proposal pipeline and lose to faster competitors. Also small agencies with the same pain.

## MVP Scope

Web app. Upload or paste a brief. Select a portfolio item. Output a draft proposal in the freelancer's voice. Templated sections (rates, scope, timeline) configurable per freelancer. Per-client context memory (past conversations, the brief, the client's website). No live chat in v1.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/` follows the constraints in `228-.../SPEC.md` and the chosen stack (Next.js, Python, FastAPI). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Australia.

For Australia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must respect the freelancer's own voice (not a generic house voice). Must not fabricate portfolio items the freelancer does not have. Per-client memory must be deletable. No silent training on the freelancer's data.
