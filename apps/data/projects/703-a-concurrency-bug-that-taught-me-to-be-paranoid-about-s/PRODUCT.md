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

## Value Proposition

**One-liner:** A postmortem on a Python concurrency bug (module-level flag shared across users) and the `contextvars.ContextVar` fix that scopes the flag per async task, so other builders of real-time async pipelines do not ship the same regression.

## Target Users

- Primary: developers building real-time async pipelines (voice AI, chat agents, stream processors) where multiple users share one Python process.
- Secondary: small-studio engineers reviewing single-user-tested async code for shared-state bugs.

## Jobs To Be Done

1. Functional — recognise that single-user-tested async code can hide global-state bugs that only surface under real concurrent load.
2. Functional — know that module-level variables are the canonical place this bug hides, and that the fix is `contextvars.ContextVar` scoped per async task.
3. Emotional — replace the "occasionally the AI gives weirdly short answers" mystery-report pattern with a named, greppable bug class.

## Success Metrics

- Other developers report they caught the same anti-pattern in their own code after reading the postmortem.
- Concrete numeric retention / conversion targets are not in the source.

## Pricing & Monetization

Not stated in the source. The post is a postmortem, not an offer.

## Competitive Landscape

Not stated in the source. The poster names a "TTS provider I use as a fallback" but does not name which one or name competitors.

## Risks & Open Questions

- [ ] Verify the poster's claim that the bug was found by a deliberate concurrency-focused review (and not by a user report) before generalising that into a recommended practice
- [ ] Note that the fix is Python-specific; readers in other runtimes will need their own per-task scoping primitive
- [ ] Decide whether the postmortem should publish a minimal reproducible harness alongside the narrative
