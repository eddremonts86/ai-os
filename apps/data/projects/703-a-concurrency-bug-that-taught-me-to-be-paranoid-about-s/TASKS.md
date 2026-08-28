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

## Phase 0: Scaffold

- [ ] Confirm `SPEC.md` Problem captures the bug class exactly: a Python module-level flag controlling "shorten reply when fallback TTS is slow" that flipped globally under one user's slow network and silently degraded every concurrent user until process restart
- [ ] Carry the fix path (`contextvars.ContextVar` scoped per async task) into `SPEC.md` Objective
- [ ] Note explicitly in `SPEC.md` Constraints that the source is a postmortem, not a product brief, and that no SaaS is on offer
- [ ] Add frontmatter `tags` for `concurrency`, `python`, `async`, `postmortem`, `voice-ai`

## Phase 1: Core

- [ ] Re-read the Reddit thread and capture any replies that name the same anti-pattern in their own code
- [ ] Keep the fix description tied to Python's `contextvars.ContextVar` — do not transplant it into other runtimes without caveats
- [ ] Reject any enrichment that frames this as a "concurrency bug scanner SaaS" — the source is a postmortem, not a product
- [ ] If a downstream plan proposes a test harness, gate it on a minimal repro that surfaces the regression with two concurrent users

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
