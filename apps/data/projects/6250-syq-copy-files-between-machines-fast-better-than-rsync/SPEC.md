# SPEC.md — Syq – copy files between machines fast (better than rsync)

## Problem

I got frustrated with the slowness of rsync and made an alternative that works faster by using multiple parallel connections, direct encrypted TCP when available, and other optimizations. I also added cool features like the ability to maintain a persistent ssh connection to the server for fast one-offs, the ability to download to your laptop while working in an ssh shell on a server, and the ability to do direct remote-remote transfers without forwarding your ssh agent (by using restricted ssh keys on the receiver that will only execute a specific request signed with the key on your laptop). It is also designed to be more robustly&#x2F;flexibly scriptable than alternatives.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49644955)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T15:01:27Z

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
