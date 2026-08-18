---
id: "327"
slug: problem-of-arabic-language-support-in-digital-services
title: Problem of arabic language support in digital services
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/taootfgpp1-problem-of-arabic-language-support-in-di"
category: other
date: "2025-10-29"
tags: [Other, Localization]
country: Morocco
tech: [Python (FastAPI), Next.js 14, Postgres + pgvector, OpenAI GPT-4o + Whisper Arabic (Darija, MSA), Cloudflare, Stripe]
---
# Problem of arabic language support in digital services

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/problem-of-arabic-language-support-in-digital-services/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Chat layer: Darija + MSA + French with code-switch handling.
- [ ] RTL layout primitives for Next.js / Tailwind (drop-in components).
- [ ] Arabic OCR for receipts and Moroccan CIN with field extraction.
- [ ] Darija voice input/output via Whisper + ElevenLabs Arabic voices.
- [ ] Arabic-aware entity recognition: names, addresses, car plates, CIN, ICE.
- [ ] Drop-in SDK for React + React Native (npm + CocoaPods + Maven).
- [ ] Per-language audit log with explicit language code per call.
- [ ] Moroccan cultural advisor review queue for chat + voice outputs.
- [ ] Anti-caricature prompt set for Darija chat and voice.
- [ ] Stripe billing with USD default; MA-region deployment option in v2.
- [ ] Pilot with 5 Moroccan digital services; measure SDK integration time at week 12.

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Python (FastAPI), Next.js 14, Postgres + pgvector) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 327-problem-of-arabic-language-support- MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Morocco completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Python (FastAPI), Next.js 14, Postgres + pgvector errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
