# SPEC.md — Kaden Terminal – Bloat / AI Free Terminal for Linux

## Problem

Kaden is a Terminal Emulator and fork of warp with clipboard support and configurable keybindings, I made Kaden because every other Linux terminal lacks proper text selection.
It&#x27;s impossible to select user input with a single hotkey on Linux, requiring mouse use and awkward multi-step shortcuts in order to do basic copy and paste.<p>This was frustrating to deal with, until I found warp, which wraps the shell in a remappable text input field, its the only terminal on Linux that does this.<p>Unfortunately, it&#x27;s full of sign in buttons, AI and cloud integration prompts everywhere.
&quot;Hideous&quot; - I thought. But I used it anyway - until one day they released the source code so I forked it and made Kaden.<p>- No AI features, drive, sign-in and cloud prompts.
- Local zero telemetry, network requests or auto-updates.
- Modular code-base for faster development and compile times.
- Contextual copy&#x2F;kill bindings to ctrl-c by default.<p>I would love for you to use, test and give feedback on how it works (and does not) for you, you can find a compiled AppImage and the source code on my GitHub here: <a href="https:&#x2F;&#x2F;github.com&#x2F;glitcher255&#x2F;Kaden-Terminal" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;glitcher255&#x2F;Kaden-Terminal</a><p>I will be here to answer any questions or feedback you have, so feel free to ask any, thank you.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49526071)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T18:35:21Z

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
