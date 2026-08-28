---
id: "318"
slug: problem-of-managing-type-1-diabetes-without-ai-assistan
title: Problem of managing type 1 diabetes without AI assistance
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/health/bx6kjqfm21-problem-of-managing-type-1-diabetes-without-ai"
category: health
date: "2025-10-29"
tags: [Health, AI, Other]
country: Serbia
tech: [Next.js 14 (mobile-web), Python (FastAPI) backend, Postgres + TimescaleDB, OpenAI API, Dexcom / Libre CGM adapters, Apple Health / Google Fit, Hetzner (EU)]
---
# Problem of managing type 1 diabetes without AI assistance

## Problem

People with Type 1 diabetes in Serbia — and the diaspora of Serbian T1 patients across the EU — manage a relentless daily routine of blood-glucose monitoring, carbohydrate counting, insulin dosing, exercise, and sleep, all of which interact. The title frames the failure as the absence of AI assistance: current tools (CGM apps, manual logbooks, endocrinologist check-ins every 3 months) do not help the user interpret patterns or pre-empt dangerous glucose excursions in real time. The result is poor time-in-range and burnout.

## Objective

Ship a T1D AI assistant that ingests CGM data, meal logs, insulin doses, and activity, and produces a daily 'today's pattern to watch' brief plus a real-time 'glucose is heading toward X in 30 minutes' alert. Outcome: a T1 patient in Serbia improves time-in-range by a measurable delta within 90 days, with the assistant never replacing their endocrinologist.

## Target Users

Serbian T1 patients (and the EU diaspora of Serbian T1 patients) using a CGM (Dexcom G6/G7, Abbott Libre 2/3) and an insulin pump or MDI. Adults 18–55, smartphone-first. Parents of T1 children (a critical secondary user). Tertiary: Serbian endocrinologists who want a structured pattern summary between visits.

## MVP Scope

CGM data ingestion via Dexcom and Libre APIs. Meal logging via photo + natural-language ('two slices of bread and cheese'). Insulin dose logging (pump or MDI). Activity via Apple Health / Google Fit. AI pattern detection: time-of-day trends, post-meal spikes, nocturnal lows. Daily brief in Serbian + English. Real-time alert when glucose trajectory suggests hypo/hyper within 30 minutes. Endocrinologist view: structured pattern summary exportable as PDF.

## Design Direction

Design direction for the MVP at `https://problemhunt.pro/en/health/bx6kjqfm21-problem-of-managing-type-1-diabetes` follows the constraints in `318-.../SPEC.md` and the chosen stack (Next.js 14 (mobile-web), Python (FastAPI) backend, Postgres + TimescaleDB). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in Serbia.

For Serbia, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

Must be EU-hosted (Hetzner Falkenstein) per GDPR. Not a medical device — explicit disclaimer that the assistant is educational and never replaces the endocrinologist. No automated insulin dosing decisions (closed-loop is a regulated Class IIb/III medical device, out of scope). CGM data retention: 5 years max, with explicit per-user export and erasure. Serbian-language UI in v1.
