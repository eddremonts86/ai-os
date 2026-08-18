---
id: "318"
slug: problem-of-managing-type-1-diabetes-without-ai-assistan
title: Problem of managing type 1 diabetes without AI assistance
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/health/bx6kjqfm21-problem-of-managing-type-1-diabetes-without-ai"
category: health
date: "2025-10-29"
tags: [Health, AI, Other]
country: Serbia
tech: [Next.js 14 (mobile-web), Python (FastAPI) backend, Postgres + TimescaleDB, OpenAI API, Dexcom / Libre CGM adapters, Apple Health / Google Fit, Hetzner (EU)]
---
# Problem of managing type 1 diabetes without AI assistance

## Tech Stack

- Next.js 14 (App Router) mobile-web first.
- Python (FastAPI) for the AI pattern pipeline.
- Postgres + TimescaleDB on Hetzner Falkenstein (EU) for CGM history.
- OpenAI API for pattern detection (with explicit prompt constraints and human review of medically-sensitive wording).
- Dexcom and Libre CGM APIs.
- Apple Health / Google Fit for activity.
- PDF export via a server-side renderer for the endocrinologist summary.

## Architecture

FastAPI ingests CGM data every 5 minutes per user; the pattern pipeline computes rolling time-in-range, post-meal spike patterns, nocturnal hypo risk, and a daily brief. Real-time alert logic runs on a streaming worker that fires when glucose trajectory crosses a threshold. Mobile-web app (Next.js) hosts the daily brief, alerts, meal/insulin logging, and the endocrinologist view. All medically-sensitive copy is human-reviewed; no automated dosing decisions.

## Milestones

1. **M0** — Spec freeze, single CGM (Dexcom G6) ingest, daily brief MVP. End of week 1.
2. **M1** — Libre 2/3 ingest + meal + insulin logging + activity. End of week 4.
3. **M2** — AI pattern detection with explicit prompt constraints. End of week 7.
4. **M3** — Real-time alerts + endocrinologist summary PDF export. End of week 10.
5. **M4** — Pilot with 100 Serbian T1 patients + 5 endocrinologists; measure TIR delta at week 12.

## Risks

- **Medical-device classification** — Mitigation: explicit educational disclaimer; no automated dosing; legal review.
- **CGM API drift** — Mitigation: per-vendor adapter isolation; nightly canary.
- **Serbian medical copy accuracy** — Mitigation: medically-reviewed copy; endocrinologist on retainer.
