# SPEC.md — Orchestrator, spawn and manage Claude Code instances remotely

## Problem

Hey everyone,<p>I built this little tool for myself over the weekend because I was struggling with managing remote Claude Code instances when I am not at my computer.<p>This is a simple app that lets you spawn, prompt, kill and manage Claude Code instances remotely, on many remotes.<p>For example, I have an API server and a laptop. When I go on a walk, I can prompt Claude code instances on my laptop in different directories, and also prompt Claude Code on my API server.
Not only that, but I can prompt Claude code, close the app and all of the instances will continue to work and I can check in later to see their progress.<p>Feel free to check it out, its fully free and open-source. For android, you can download the build on Github and for iOS there is a testflight link.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49643645)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T13:46:03Z

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
