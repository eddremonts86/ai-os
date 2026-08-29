---
id: "856"
slug: need-simple-application-testing-tool-without-programmin
title: Need simple application testing tool without programming
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/dev/ved547b251-need-simple-application-testing-tool-wit"
category: dev
date: "2025-11-04"
tags: [Dev, AI, No-Code, Other]
country: Kenya
tech: [Tauri (Rust + WebView), TypeScript, Node.js (Fastify), SQLite, Playwright (CDP), WireMock, Sentry, Cloudflare R2, M-Pesa (Daraja API sandbox), Coolify, Docker]
---
# Need simple application testing tool without programming

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/856-need-simple-application-testing-tool-without-programmin/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Stand up the Tauri desktop client and the TypeScript recording UI with Playwright Chromium via CDP
- [ ] Implement the JSONL journey capture with the no-code selector strategy (data-testid, name, aria-label preference, text-content fallback with warning)
- [ ] Build the Fastify backend over SQLite with endpoints for project library, run history and screenshot storage
- [ ] Implement the replay engine that walks a journey, reports plain-language failures with screenshots, and persists run history
- [ ] Add the project folder model with named tests, single-test / folder / project run modes, and the export-and-share tarball
- [ ] Add WireMock stubs for external services so a replay is deterministic against third-party APIs
- [ ] Implement the scheduled-run option with email and webhook failure surfacing
- [ ] Render the non-load-testing disclaimer in the desktop client and on every backend run report
- [ ] Wire Sentry runtime error capture in the desktop client and the backend, with a release tag per version
- [ ] Wire Cloudflare R2 for screenshots and recorded-journey artefacts under per-project prefixes with lifecycle rules
- [ ] Wire M-Pesa (Daraja sandbox) integration behind the paid tier on a single subscription product
- [ ] Define and document the retention policy for recorded journeys and screenshots before any pilot developer is onboarded

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-18_
