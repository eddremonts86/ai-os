# SPEC.md — A repo gained 3,278 stars while GitHub showed Andrej Karpathy as a contributor

## Problem

A GitHub repo gained 3,278 stars in one week, peaking at 573 stars in a single day. Its associated paper also reached #1 on Hugging Face Trending Papers.<p>During that period, the repo page prominently showed @karpathy (Andrej Karpathy) as a contributor, including his GitHub account&#x2F;avatar.<p>The associated commit was authored and committed as @karpathy. GitHub&#x27;s API shows the commit was unsigned.<p>A GitHub issue later questioned this, saying Karpathy never contributed. The project subsequently removed the commit.<p>Forging Git commit author metadata is a known issue. What&#x27;s interesting here is how that metadata was surfaced by GitHub as a visible contributor identity, and what role that may have played in this particular case.<p>Refs:
https:&#x2F;&#x2F;github.com&#x2F;EvoMap&#x2F;AutoResearch&#x2F;issues&#x2F;8
https:&#x2F;&#x2F;github.com&#x2F;EvoMap&#x2F;AutoResearch&#x2F;commit&#x2F;4606e68
https:&#x2F;&#x2F;huggingface.co&#x2F;papers&#x2F;2608.17906

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49697367)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-14T14:22:36Z

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
