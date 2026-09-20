# SPEC.md — Ditch; Build multiple products at once

## Problem

Hey HN,<p>I built Ditch because I&#x27;m running Codex across several projects and was losing track of what each agent was doing, which one needed me, and where I had left off. Plus, I have other work, so I&#x27;d like to leave my agents be and come back only when they need me, finish or fail.<p>Ditch is a local desktop app for managing multiple Codex agents simultaneously. It keeps projects and sessions in one place, shows which sessions are active or waiting, notifies you when something needs attention, and makes it easier to move between projects without losing context.<p>I’m also experimenting with remote control, shared context across agents, and higher-level orchestration, but I’m keeping this first release focused on the local Codex workflow in macOS.<p>The Community Edition with its source code is at Github:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;DitchNow&#x2F;Ditch" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;DitchNow&#x2F;Ditch</a><p>I want to keep developing the local runtime as OSS so it can be extended and integrated into workflows beyond what I build into the official app.<p>No account or email required. Just download the dmg and start adding your projects to the app.<p>I’m especially interested in how other HN users organize multiple coding-agent sessions, what causes them to lose context, and which parts of the workflow still feel unnecessarily manual.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49578906)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T17:48:16Z

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
