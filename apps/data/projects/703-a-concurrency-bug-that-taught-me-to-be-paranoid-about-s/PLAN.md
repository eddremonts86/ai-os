---
id: "703"
slug: a-concurrency-bug-that-taught-me-to-be-paranoid-about-s
title: A concurrency bug that taught me to be paranoid about shared state in real-time systems
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq0gkr/a_concurrency_bug_that_taught_me_to_be_paranoid/"
category: saas
date: "2026-08-16"
---
# A concurrency bug that taught me to be paranoid about shared state in real-time systems

## Tech Stack

- Python (the source is about Python module-level state and the `contextvars` fix).
- Async/await runtime (the bug only appears under real concurrent load).
- Real-time voice pipeline: STT → LLM → TTS, streaming.

Stack chosen because the fix is a Python-language primitive (`contextvars.ContextVar`) and the bug class is tied to async-task scoping.

## Architecture

A real-time voice AI pipeline running multiple concurrent user sessions in one Python process:

- STT ingest per user session.
- LLM call per user session.
- TTS synthesis per user session, with a fallback provider whose slow path triggers a "shorten reply" flag.
- The "shorten reply" flag must be scoped per async task, not module-level — otherwise one user's slow network degrades every other user's experience until the process restarts.

The postmortem describes replacing the module-level flag with `contextvars.ContextVar`.

## Milestones

1. M0 — Capture the postmortem: bug class, why single-user testing hides it, why it persists across sessions, and the `contextvars.ContextVar` fix.
2. M1 — Add a minimal reproducible test harness that surfaces the regression with two concurrent users.
3. M2 — Add a short checklist of "module-level state in async code" anti-patterns.

## Risks

- Over-generalisation risk: the fix is Python-specific; readers may wrongly transplant it into runtimes with different scoping primitives.
- Single-poster risk: only one case study is in the source; do not promote it into a universal "single-user testing always hides this bug" rule without more evidence.
- Privacy risk: a future reproducer that ships the slow-TTS path must use the fallback provider the poster named or a stub, never user data.
