# SPEC.md — FastRecall, ultra-cheap memory across AI models

## Problem

Hi everyone! After working on memory at OpenAI, I built FastRecall to solve one problem: using different AI models results in clunky ad-hoc context management systems or lost context entirely.<p>With the model layer becoming commoditized, your context should travel seamlessly across models whether you are using OpenRouter or some other model aggregator.<p>FastRecall offers a simple API that stores your context cheaply and efficiently. In fact, we are so cheap that recalls are entirely free, with generous plans starting at only $2&#x2F;month!<p>If you use the same model again, FastRecall respects provider caching to save you inference costs. We also have SOTA model-free compaction of context with FlashCompact, in case you don&#x27;t need full-fidelity context.<p>Hopefully this is useful for some of your projects. Let me know what you think!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49735358)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T01:31:50Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
