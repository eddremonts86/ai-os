# SPEC.md — Wordmate – local speech-to-text for macOS

## Problem

Hi HN!<p>I built Wordmate because I wanted WisprFlow-style dictation locally on my machine. It’s a free macOS app. Audio and transcripts never leave your Mac.<p>Speech recognition uses Parakeet and optional post-processing uses a tuned Qwen3 0.6B 4-bit to improve punctuation and capitalization and clean up fillers, stutters, and spoken corrections.<p>The complete transcription pipeline is open source: <a href="https:&#x2F;&#x2F;github.com&#x2F;vdszds&#x2F;wordmate" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;vdszds&#x2F;wordmate</a><p>You can download the app at <a href="https:&#x2F;&#x2F;wordmate.sh" rel="nofollow">https:&#x2F;&#x2F;wordmate.sh</a>. I’d appreciate your feedback!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49553252)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T17:05:23Z

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
