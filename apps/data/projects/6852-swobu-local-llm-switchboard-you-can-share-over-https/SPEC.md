# SPEC.md — Swobu – Local LLM Switchboard You Can Share over HTTPS

## Problem

Swobu is a local TUI switchboard for Codex, Claude Code, PI, you name it.<p>With stateful, provider-independent session lineage and model-name-based routing across way too many heterogeneous LLM providers.<p>The same route can be shared and revoked over end-to-end HTTPS with another machine, a friend or your phone.<p>Hell, you can even make an LLM mesh with one Swobu swobing remote Swobus. Anyway.<p>One &lt;10 MB Go binary. TLS terminates locally - relay is a dumb pipe.<p>In other words, I’ve tried to factorize LLM traffic along orthogonal client, backend and network dimensions.<p>Looking for help with product-market fit, don’t want to go back to job-market fit :)

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49689250)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-13T22:12:51Z

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
