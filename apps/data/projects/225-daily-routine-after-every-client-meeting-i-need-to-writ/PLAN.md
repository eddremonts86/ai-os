---
id: "225"
slug: daily-routine-after-every-client-meeting-i-need-to-writ
title: "Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing tools are slow, opinionated, or forget the context."
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/"
category: productivity
date: "2026-02-10"
tags: [Productivity, AI, Meetings]
country: UK
tech: [Python, FastAPI, Whisper, Claude API, PostgreSQL, Next.js]
---
# Daily routine: after every client meeting, I need to write a structured report for colleagues. Existing tools are slow, opinionated, or forget the context.

## Tech Stack

Python + FastAPI for the orchestration. Whisper for the live transcription. Claude API for the summarisation and templating. PostgreSQL for the per-client and per-colleague memory. Next.js for the web UI.

## Architecture

Transcript → per-client retrieval → per-colleague style → template → draft report → 60-second review. User edits update the per-client memory. Per-tenant isolation of the memory.

## Milestones

M0 — single-template single-client working end-to-end. M1 — multi-template. M2 — per-colleague style. M3 — 100 users in pilot. M4 — public launch with a clear you own the template stance.

## Risks

May hallucinate names or decisions the model inferred. Per-client memory must be respected when the client changes. Risk of being interpreted as a meeting surveillance tool if the user pastes a meeting they were not in.

## Data Model

## Integrations

Python + FastAPI for the orchestration. Whisper for the live transcription. Claude API for the summarisation and templating. PostgreSQL for the per-client and per-colleague memory. Next.js for the web UI.
