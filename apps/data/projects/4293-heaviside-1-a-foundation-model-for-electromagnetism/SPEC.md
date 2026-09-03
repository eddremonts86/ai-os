# SPEC.md — Heaviside-1, a foundation model for electromagnetism

## Problem

Heaviside-1 was trained on 500B field samples from over 250K unique physical layout designs, and is approximately the scale of GPT-2. It predicts a full design&#x27;s fields ~10^5x faster than a commercial full-wave solver, with S-parameter magnitude error under 1 dB. and generalizes out of distribution.<p>You can play around with the model and a subset of designs including hairpin filters and patch antennas with our Fields Studio. Design, adjust the geometry, and the predicted electric and magnetic fields will update in milliseconds.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49524789)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T17:05:51Z

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
