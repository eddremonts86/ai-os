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

## Problem

A Reddit engineering postmortem from the operator of Flowagenz (a small dev studio) building a real-time voice AI pipeline (STT → LLM → TTS, streaming). The bug: a flag that controlled "shorten the reply length when the fallback TTS provider is slow" was a plain module-level Python boolean. In single-user testing this was invisible. With two or more real concurrent users, one user's slow network flipped the global flag and silently degraded every other concurrent conversation (shorter replies) until the process restarted. Found during a deliberate concurrency-focused code review, not from a bug report. Fix: replaced the module-level variable with `contextvars.ContextVar` so the flag is scoped per async task. Broader lesson: anything built and tested as a single user on a single machine will hide this class of bug.

## Objective

Document the concurrency-bug class so other developers building real-time async pipelines spot it before it ships, and make the fix path (replace module-level state with `contextvars.ContextVar` scoped per async task) obvious.

## Target Users

- Primary: developers building real-time async pipelines (voice agents, chat agents, stream processors) where multiple users share one Python process.
- Secondary: small-studio engineers reviewing their own single-user-tested code for shared-state bugs.

## MVP Scope

- A written postmortem with: the bug class, why single-user testing hides it, why it does not reset until the process restarts, and the `contextvars.ContextVar` fix.
- A reproducible test harness (concurrent users, slow-TTS simulation) that surfaces the regression.
- A short checklist of "module-level state in async code" anti-patterns to grep for.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The source is a postmortem, not a product brief. No SaaS is on offer.
- Python-specific (the fix and the bug class are tied to Python's GIL/async model and module-level state).
- The poster is building a voice-AI pipeline; generalising the lesson beyond voice AI would dilute the specificity the postmortem carries.
- No willingness-to-pay is stated.
