# SPEC.md — Bash sandbox script for Claude and codex CLI

## Problem

I&#x27;ve been working on and off on this project to have a reasonably easy way to run a docker sandbox on my machine. Recently with claude &quot;auto mode&quot; not working as &quot;automatically&quot; as before I resurrected this. Hopefully it is of use to you too.<p>Usage: sclaude &#x2F; scodex just like you&#x27;d call claude or codex.<p>To update: sclaude update (updates the script and tooling)<p>It runs locally in a container.
Docker also works via Docker-in-Docker (but can be turned off).<p>Feedback welcome!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49710493)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T10:51:54Z

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
