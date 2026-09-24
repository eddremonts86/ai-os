# SPEC.md — Building KasirCepat, an offline-first POS for Indonesia

## Problem

I&#x27;m building KasirCepat, a POS application for small shops in Indonesia.<p>Many of these businesses have unreliable internet connections, so I started with a local-first architecture instead of cloud-first.<p>The main goal is to make the daily workflow simple:
- selling products,
- tracking inventory,
- viewing sales history.<p>I&#x27;m curious how other developers approach:
- data synchronization,
- multi-device workflows,
- handling conflicts,
- designing software for non-technical users.<p>Especially interested in lessons from building local-first&#x2F;offline-first applications.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49692067)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-14T04:40:51Z

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
