---
id: "242"
slug: the-monthly-headache-of-being-remote-tech-support-for-e
title: The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/ai/u9prt4av11-the-monthly-headache-of-being-remote-tec"
category: ai
date: "2026-01-20"
tags: [Productivity, Other]
country: Serbia
tech: [Next.js 14, TypeScript, Tauri (Rust), OpenAI GPT-4o-mini, WebRTC, PostgreSQL, Cloudflare TURN]
---
# The monthly headache of being remote tech support for elderly relatives who constantly need help with the same computer problems

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/242-the-monthly-headache-of-being-remote-tech-support-for-e/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Tauri companion app with single-button UI
- [ ] Helper pairing via short code
- [ ] WebRTC screen-share with Cloudflare TURN fallback
- [ ] Remote-control channel (mouse + keyboard)
- [ ] Postgres knowledge base seeded with 30 common issues
- [ ] GPT-4o-mini triage on session start
- [ ] Helper-side dashboard with triage suggestions and action palette
- [ ] Post-session notes and recurrence log

## Phase 2: Deploy

- [ ] Confirm the chosen deployment target for the stack (Next.js 14, TypeScript, Tauri (Rust)) and set the prod-equivalent env vars.
- [ ] Run a single end-to-end smoke test of the 242-the-monthly-headache-of-being-remot MVP against the source post's stated use case.
- [ ] Capture a 60-second screen recording showing the primary user flow in Serbia completing the core task.
- [ ] Set up the on-call rotation (or, for a single-founder MVP, the personal alert path) for Next.js 14, TypeScript, Tauri (Rust) errors.
- [ ] Publish the post-mortem template and the rollback procedure specific to this deployment target.
- [ ] Mark the milestone: either the plan graduates to v2 or it is archived with a written reason in `decisions.md`.
