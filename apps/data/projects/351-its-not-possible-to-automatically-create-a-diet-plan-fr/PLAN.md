---
id: "351"
slug: its-not-possible-to-automatically-create-a-diet-plan-fr
title: "It's not possible to automatically create a diet plan from video recipes"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-create"
category: food
date: "2025-10-29"
tags: [Food]
country: Russia
tech: [Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction), USDA + Russian food-composition DBs, Postgres]
---
# It's not possible to automatically create a diet plan from video recipes

## Tech Stack

- Next.js
- Whisper (transcription)
- OpenAI API (ingredient + nutrition extraction)
- USDA + Russian food-composition DBs
- Postgres

Why this stack: each technology was chosen for this specific problem (the rationale is in the per-section prose). No global default stack is inherited from other plans.

## Architecture

The MVP for food runs as a single backend service on the stack (Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction)) with a thin client (web or mobile depending on the chosen deployment). Ingestion from the source post — captured at `https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-cre` — feeds the problem statement and any captured body. From there, the read/write API serves a single dashboard view for the primary user in Russia, backed by an append-only audit log so each change can be traced back to a user action.

Components:

- **Edge / client** — serves the user surface and owns the auth handshake.
- **API** — single service exposing typed endpoints; no microservices in v1.
- **Persistence** — relational store (Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction)) with a migration log.
- **Background jobs** — used only for the source-body fetch and a daily metric rollup; nothing time-critical.
- **Outbound** — limited to the chosen payment processor and a transactional email side; no third-party trackers.

For Russia, data residency and payment routing follow the source post's locale (see `https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-cre`).

## Milestones

M1 — Foundations (weeks 1–2): scaffold the app folder (`351-it-s-not-possible-to-automatically-`), pin dependencies for Next.js, Whisper (transcription), OpenAI API (ingredient + nutrition extraction), and confirm CI on the chosen target. The schema from PLAN.md is in place and the auth path is end-to-end against a sandbox.

M2 — Source-faithful MVP (weeks 3–5): implement the smallest slice that solves the problem stated in `https://problemhunt.pro/en/food/yby468h0g1-its-not-possible-to-automatically-cre` with no feature creep. A single user from Russia can complete the core flow without hand-holding. WTP is not yet wired (only if the source post stated one — see SPEC.md).

M3 — Tightening (weeks 6–7): observability (logs + error tracking), data-residency config for Russia, and the security review per the constraints in SPEC.md.

M4 — Pilot (weeks 8–10): 5–10 users from Russia test the MVP and give feedback on the exact task the source post described. No marketing, no growth work, only the stated problem.

M5 — Decide (week 11): either commit to a v2 based on pilot signal, or shelve with a written post-mortem.

## Risks

- **Whisper Russian WER on recipe audio.** Recipes have unusual ingredient nouns ('патиссон', 'топинамбур'); fallback is manual transcript upload.
- **Nutrition DB coverage gap.** Russian-specific foods (kefir, tvorog, buckwheat) need a Russian food-composition DB; switching between DBs must be clean and audit-traceable.
- **Clinical-advice liability.** A diet plan for a clinical population is a clinical instrument; the user base is non-clinical and the disclaimer is prominent.
