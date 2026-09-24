# SPEC.md — Tell HN: iOS 27's Connectivity Assist subverts DNS level adblocking

## Problem

If you run Pi Hole, AdGuard Home, or any other network level adblocking services on your network, iOS 27&#x27;s Connectivity Assist gets around these block lists in iOS applications.<p>That&#x27;s because the cellular network it &quot;Assists&quot; with isnt blocked, and iOS treats your blocked traffic like it needs a workaround from the cell network.<p>To fix this, go to the settings for your specific Wi-Fi network and disable Connectivity Assist.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49741286)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-17T14:26:40Z

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
