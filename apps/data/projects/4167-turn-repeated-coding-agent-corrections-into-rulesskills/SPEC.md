# SPEC.md — Turn repeated coding-agent corrections into rules/skills

## Problem

Hi HN, Peder here. My cofounder and I built Blume after coding agents ate our previous startup.<p>While building our previous product we severely struggled with agent drift. Duplicated functions, incoherent architecture and sneaky production bugs. Worst being Fable, which writes such good looking code that you almost don’t notice deviant behaviour.<p>We tried to enforce behaviour with all the best practices: rules, skills, docs, self-verification&#x2F;testing etc. But they rotted faster than a human can maintain them, and using agents directly to maintain them just leads to bloat and more drift.<p>So that is what we set out to solve.<p>Blume is a desktop app that sits next to Claude Code, Codex and Cursor. It reads your agents&#x27; context setup (skills, rules, docs) and local session files. When you keep correcting the same things, blume proposes updates to your rules and skills as reviewable diffs. You approve or dismiss each one.<p>To avoid bloat we extract intent, corrections, frustrations from agent sessions and group them into clusters. And when pain&#x2F;recurrence thresholds are reached, only then an agent is sent to look for improvements.<p>Analysis runs locally on your machine, using your local Claude Code or Codex harness. Your sessions&#x2F;code are never sent to blume. It is free to use, with the only “cost” being limited token spend to extract signals and creating the improvements themselves. (We plan to monetise with optional cloud agents and team features going forward).<p>The biggest gap in the product right now is that we don&#x27;t yet measure whether an accepted change actually helped, in fewer corrections or fewer tokens spent re-explaining. We&#x27;re working on that and think it&#x27;s a core part of the product.<p>Would love feedback, especially from anyone who&#x27;s tried to keep agent rules&#x2F;skills maintained across a team. Happy to answer anything about how it works.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49511274)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T15:57:10Z

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
