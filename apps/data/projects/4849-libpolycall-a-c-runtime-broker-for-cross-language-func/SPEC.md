# SPEC.md — LibPolyCall – a C runtime broker for cross-language function calls

## Problem

LibPolyCall is an open-source C runtime for connecting programs across language boundaries without requiring each language pair to implement its own integration layer.<p>The architecture is program-first rather than binding-first, with a stable C ABI, FFI bindings, Polycallfile&#x2F;Polycallrc configuration, runtime state management, and telemetry.<p>I’ve recently completed the Windows build path producing both libpolycall.dll and libpolycall.a, and I’m working toward using the same runtime across Python, Node.js, Java, Go, and other language environments.<p>I’d particularly appreciate feedback on the ABI design, runtime architecture, configuration model, and approach to cross-language dynamic loading.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49553255)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T17:05:39Z

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
