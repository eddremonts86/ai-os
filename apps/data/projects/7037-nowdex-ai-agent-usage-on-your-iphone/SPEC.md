# SPEC.md — Nowdex – AI agent usage on your iPhone

## Problem

Hi HN,<p>I&#x27;ve been using Claude Code, Codex and Cursor quite a bit lately, and I found myself checking their usage limits all the time.<p>Most of the tools I found for this live on the desktop or in the menu bar. What I really wanted was to pull out my phone and see how much I had left, especially when I&#x27;m away from my computer.<p>I ended up building Nowdex for this.<p>The main thing is the iPhone widget. It shows your current usage and reset time directly on the Home Screen or Lock Screen. Right now it supports Claude, Codex, Cursor, Grok, Kimi and GLM.<p>There is no account thing. The app doesn&#x27;t send your usage data to my server, all data live on your device, and sync between your Apple devices is done through iCloud.<p>&gt; One note if you try the Mac app: the version currently on the App Store has a bug that prevents connecting accounts. It&#x27;s fixed in the next version, which is currently waiting for App Review. Apple review takes toooo long :)<p>I&#x27;m also working on an Apple Watch version since this feels like exactly the kind of information I&#x27;d rather glance at than open an app for.<p>It&#x27;s a paid app, but only if you need to track a lot providers. No subscription.<p>Happy to answer any questions.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49704882)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T22:10:15Z

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
