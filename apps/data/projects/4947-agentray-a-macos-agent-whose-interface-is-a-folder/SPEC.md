# SPEC.md — Agentray, a macOS agent whose interface is a folder

## Problem

Hi,<p>I&#x27;m not a fan of chat as the main UI for interacting with AI, so I&#x27;m trying something where you interact with LLMs by handling regular files and folders.<p>Agentray is an invisible AI agent. You point it at a folder, it creates &quot;in&quot; &quot;out&quot;, and &quot;done&quot; dirs in it. Whatever you drop into &quot;in&quot; gets summarised, the answer appears in &quot;out&quot;, and the original moves to &quot;done&quot; so you can see what&#x27;s been handled. If you want something other than a summary, make a subfolder and name it: drop a file into &quot;in&#x2F;translate to french&quot; and that name is the instruction. No prompt to write, no config file, just mkdir.<p>By default it uses Apple&#x27;s on-device model or Gemma 4 through MLX. You can also set your OpenRouter key for additional models.<p>It&#x27;ll be a free app but until I work out bugs, you can get it from Test Flight: <a href="https:&#x2F;&#x2F;testflight.apple.com&#x2F;join&#x2F;MRwp3e1P" rel="nofollow">https:&#x2F;&#x2F;testflight.apple.com&#x2F;join&#x2F;MRwp3e1P</a><p>Happy to get any feedback!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49555446)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T19:31:12Z

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
