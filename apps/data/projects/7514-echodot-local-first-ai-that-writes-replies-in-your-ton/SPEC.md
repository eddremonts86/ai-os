# SPEC.md — Echodot – Local-first AI that writes replies in your tone

## Problem

I built echodot – a free, open-source desktop app that drafts replies in your personal writing style.<p>Problem:
Most AI writing tools either force you into their voice or require constant copy-pasting between apps. Tools like Cotype are useful but closed-source and cloud-only.<p>What echodot does:
- Press a global hotkey (⌘⇧E &#x2F; Ctrl+Shift+E)
- It reads the context (from clipboard)
- Generates a reply that matches your tone
- Auto-copies the result so you can paste it instantly<p>Key points:
- Local-first by default (works with Ollama)
- Optional OpenRouter support (bring your own key)
- Tone presets + writing samples for better personalization
- Streaming responses
- Completely free and MIT licensed
- No account, no tracking, no subscription<p>Tech stack:
Tauri 2 + React + TypeScript + Tailwind
Rust backend for hotkeys and system integration<p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;ohkariku-boop&#x2F;Echodot" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;ohkariku-boop&#x2F;Echodot</a><p>Still early (v0.1). Looking for feedback on the core workflow, prompt quality, and what features would make this actually useful day-to-day.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49735771)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T02:34:13Z

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
