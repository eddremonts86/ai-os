# SPEC.md — EarthToPixels – Turning real cities into explorable pixel art

## Problem

Hi HN! A few friends and I built EarthToPixels, a project that turns real-world cities into explorable pixel-art maps.<p>We fine-tuned an open-source Qwen image model and built a pipeline that takes aerial imagery, generates pixel-art tiles, and keeps neighboring generations visually continuous so they can be stitched into a large map.<p>We built the pipeline to work with arbitrary coordinates rather than a specific city. For the first complete render, we chose our hometown: João Pessoa, Brazil.
You can explore it here:
<a href="https:&#x2F;&#x2F;earthtopixels.com&#x2F;" rel="nofollow">https:&#x2F;&#x2F;earthtopixels.com&#x2F;</a><p>Would love to hear what you think, especially about the technical side.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49674973)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-12T17:44:14Z

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
