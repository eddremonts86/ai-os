---
id: "343"
slug: an-educator-seeks-a-tool-for-automatically-creating-coh
title: An educator seeks a tool for automatically creating coherent video lessons from multiple fragments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automatical"
category: design
date: "2025-10-29"
tags: [Design, Education, Media]
country: Russia
tech: [Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring), Postgres, S3-compatible storage]
---
# An educator seeks a tool for automatically creating coherent video lessons from multiple fragments

## Tech Stack

- Next.js
- FFmpeg + Whisper (transcription)
- OpenAI API (coherence scoring)
- Postgres
- S3-compatible storage

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for design runs as a single backend service on the stack (Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring)) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automa` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring)) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automa`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`343-an-educator-seeks-a-tool-for-automa`), pin dependencies for Next.js, FFmpeg + Whisper (transcription), OpenAI API (coherence scoring), and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/design/oy3gtd71l1-an-educator-seeks-a-tool-for-automa` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Whisper Russian WER.** Transcription accuracy drives every downstream step; fallback is a manual transcript upload.
- **Slide resync drift.** A slide deck that does not match the spoken order produces a confusing render; the tool flags mismatches for manual override.
- **Render time on poor hardware.** A 40-minute 1080p render is heavy on a typical home laptop; queueing with progress and resume is a v1 must.
