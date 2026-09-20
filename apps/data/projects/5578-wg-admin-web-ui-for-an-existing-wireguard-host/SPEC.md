# SPEC.md — Wg-admin – web UI for an existing WireGuard host

## Problem

Reads &#x2F;etc&#x2F;wireguard, lets you add&#x2F;edit&#x2F;remove peers, applies with wg syncconf (no interface bounce). Does not install WireGuard or rewrite your PostUp&#x2F;NAT. That&#x27;s all

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49600269)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-07T16:43:37Z

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
