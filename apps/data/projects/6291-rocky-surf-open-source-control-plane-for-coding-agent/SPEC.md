# SPEC.md — Rocky Surf – Open-source control plane for coding-agent cloud VMs

## Problem

Rocky Surf started late last year after Claude Code crashed my laptop.<p>The alpha version was designed as a commercial product, but I ditched the idea because it would have required significant capital. Basically, the business would have been a cloud reseller with a bit of software on top.<p>I built the core for my own projects - simple stuff like bash commands to create, stop, start, and terminate EC2s. Added features along the way, like other clouds and making tool bundles so I could spin up a VM and automatically install Pi, OpenCode, etc, etc.<p>Finally decided to turn it into an open source platform. It&#x27;s pretty cool because a) it&#x27;s easy to use; b) there&#x27;s an MCP so servers can be managed outside of the UI; c) it&#x27;s modular and the repo comes with skills to create new tool bundles or add other cloud providers.<p>Claude Code, Codex, Cursor, etc all offer their own cloud-based infrastructure but they have to be controlled somewhere. This makes it so my controlling agent doesn&#x27;t have to live on my laptop.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49648776)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T19:07:05Z

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
