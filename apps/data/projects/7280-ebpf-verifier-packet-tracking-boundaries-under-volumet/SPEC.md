# SPEC.md — eBPF verifier packet tracking boundaries under volumetric socket drops?

## Problem

How do you handle eBPF verifier pkt_ptr tracking limits under volumetric socket drops? Bypassing userspace L7 bottlenecks via L4 transport splicing. Code audits welcome: https:&#x2F;&#x2F;github.com&#x2F;devloperdevesh&#x2F;FaultPlane

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49720626)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-16T00:20:52Z

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
