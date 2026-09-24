# SPEC.md — PGSkiff – Connect IPv4 Clients to IPv6-Only Postgres

## Problem

I built PGSkiff to let apps and tools on IPv4 networks connect to IPv6-only Postgres databases.<p>Clients connect to a PGSkiff endpoint over IPv4, and PGSkiff forwards the connection to the database over IPv6. It removes the need to maintain your own proxy or configure a VPN.<p>One use case is connecting to Supabase when you need access without pooling.<p>You can try it at <a href="https:&#x2F;&#x2F;pgskiff.com" rel="nofollow">https:&#x2F;&#x2F;pgskiff.com</a>.<p>I’d be interested in feedback on the connection setup and in hearing about environments where this would be useful.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49695074)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T11:28:36Z

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
