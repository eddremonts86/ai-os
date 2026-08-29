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

## Tech Stack

- **Tauri (Rust + WebView)** for the desktop client, because the recording UI is a web surface that controls a real browser via the Chrome DevTools Protocol and Tauri keeps the binary small and the install fast for Kenyan bandwidth.
- **TypeScript** for the recording UI logic and the replay orchestration, because the no-code surface is best built in a framework the team already maintains.
- **Node.js (Fastify)** for the self-hosted backend that holds the project's tests, run history and screenshots, because the backend is a small typed API with a SQLite store and Fastify is the lightest well-typed Node option.
- **SQLite** as the default backend store, so a single-machine deployment is one binary plus one file and no separate database process.
- **Playwright (Chrome DevTools Protocol)** as the recording and replay engine, because Playwright's CDP integration and selector API are the most direct way to drive a real browser from a no-code surface.
- **WireMock** for stubbing external services during replay, so a recorded journey can be replayed deterministically even when the developer's app depends on a third-party API.
- **Sentry** for runtime error capture in both the desktop client and the backend, so a developer who hits a CDP edge case can file a useful report.
- **Cloudflare R2** as the storage layer for screenshots and recorded-journey artefacts, with lifecycle rules aligned to the documented retention policy.
- **M-Pesa (Daraja API sandbox)** as the Kenyan payment-processor integration for any paid tier, behind a single subscription product at launch.
- **Coolify** for hosting the self-hosted backend, on a single container for the MVP.
- **Docker** for local development parity and for the backend container image.

## Architecture

The desktop client is a Tauri application that embeds a TypeScript UI for recording and replay. Recording opens a real Chromium browser via Playwright's CDP integration and captures every click, type, navigation and screenshot as a step in a JSONL journey, with a no-code selector strategy that prefers stable attributes (data-testid, name, aria-label) and falls back to text content with a warning. Each recorded journey is saved locally as a named test inside a project folder, and the project folder can be sync-pushed to the self-hosted backend.

The self-hosted backend is a Fastify service over SQLite that holds the project library, run history and screenshots. A replay run loads a saved test, opens a fresh browser via Playwright, walks the journey step by step and reports each step as pass, fail or warn with a screenshot. Failures include the divergent step, the expected versus observed DOM state and the moment in the recording where the divergence happened, in plain language rather than as a stack trace.

The scheduled-run option runs the project suite on a configurable interval inside the backend and surfaces failures by email or webhook. The export-and-share feature packages a project's tests and a minimal runner into a tarball that a colleague can replay on their own machine without an account. WireMock is used inside replay runs to stub external services that the recorded journey depends on, so a replay is deterministic rather than flaky.

The non-load-testing disclaimer is rendered in the desktop client and on every backend run report. Sentry captures runtime errors from both the desktop client and the backend, with a release tag per version so regressions are attributable. Cloudflare R2 holds screenshots and recorded-journey artefacts under a per-project prefix with lifecycle rules aligned to the documented retention policy; the desktop client stores artefacts locally and syncs to the backend on demand. M-Pesa integration is gated behind the paid tier and is sandbox-only at MVP.

## Milestones

1. **M1 — Recording** — Tauri desktop client with Chromium via Playwright CDP, JSONL journey capture, no-code selector strategy with stable-attribute preference and brittleness warnings.
2. **M2 — Replay** — Fastify backend over SQLite, replay engine that walks a journey and reports plain-language failures with screenshots, run history persistence.
3. **M3 — Project library** — named tests in a project folder, single-test / folder / project run modes, export-and-share tarball.
4. **M4 — Scheduled runs** — configurable interval scheduling, email and webhook failure surfacing, Sentry runtime error capture.
5. **M5 — Selector stability feedback** — pre-replay selector audit, post-replay flakiness report, and a developer-facing stability metric.
6. **M6 — Paid tier** — M-Pesa (Daraja sandbox) integration behind a single subscription product, with documented retention policy enforced on Cloudflare R2 prefixes.

## Risks

- **Brittle selectors** — a no-code strategy that silently produces a flaky suite is the same failure as the mainstream tools it is supposed to replace; the brittleness warning has to be loud, not optional.
- **Credentials leakage** — recorded journeys may contain credentials typed into the developer's own app, and a retention policy plus local-first storage have to exist before the first pilot user.
- **Disclaimer invisibility** — a tool that silently becomes a load test because the user replays a looped scenario is a positioning failure; the disclaimer has to be visible on every run.
- **CDP edge cases** — the Chrome DevTools Protocol has edges that surface only in real recording; Sentry capture plus a developer-facing failure report are required from day one.
- **Kenyan bandwidth assumptions** — a desktop client that ships a heavy binary or requires a heavy first-run download is a barrier on Kenyan connections; Tauri keeps the binary small for a reason.
- **Payment-processor scope creep** — M-Pesa integration that quietly grows into a payment-feature product is scope creep that has to be resisted; the MVP is testing, not payments.
- **Cloud-sync confusion** — a local-first tool that quietly cloud-syncs without the developer's awareness is a consent failure; the sync path has to be opt-in and visible.
