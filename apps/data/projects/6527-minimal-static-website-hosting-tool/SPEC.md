# SPEC.md — Minimal Static Website Hosting Tool

## Problem

I built this because I self host a lot of stuff and wanted to simplify tossing up a simple static site with no backend, no NGINX&#x2F;Caddy&#x2F;Traffik configs, instantly deploy with a single file copy. Powered by Golang&#x27;s built-in reverse proxy package.<p>Another awesome freebie is this is built on top of [Pocketbase](<a href="https:&#x2F;&#x2F;pocketbase.io&#x2F;" rel="nofollow">https:&#x2F;&#x2F;pocketbase.io&#x2F;</a>), so the whole app is API driven for free. This gives you some AI integration points off the bat.<p>Great for whipping up demos to pitch to clients, or quick and dirty temporary static sites to share with friends, family or coworkers.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49662930)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T18:20:45Z

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
