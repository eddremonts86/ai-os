# SPEC.md — Jetway, a working airline GDS and message router

## Problem

Over the past few days I made an open-source GDS, message router, departure control system, faring engine, and a bunch of other airline systems.<p>It supports Type B&#x2F;AIRIMP, EDIFACT&#x2F;PADIS, NDC, MATIP; PNRs, tickets, EMDs, queues, IROPS; PNL&#x2F;ADL, bags, loadsheets, MVT, ACARS, flight plans, and more.<p>Is it vibe coded? Yes. Does it work? As far as I can test, yes. There&#x27;s a live demo running a full day at wholesky.io (which is also open source at <a href="https:&#x2F;&#x2F;github.com&#x2F;adamf&#x2F;wholesky" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;adamf&#x2F;wholesky</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49559630)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T02:03:02Z

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
