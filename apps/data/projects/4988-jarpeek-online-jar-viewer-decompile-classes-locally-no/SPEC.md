# SPEC.md — JarPeek – Online JAR viewer, decompile classes locally (no upload)

## Problem

When I have no JDK environment, I want to do some things:<p>browse files inside a JAR
decompile .class, but not upload to server
edit config files (YAML, properties, JSON), and export the modified JAR
inspect class structure, constant pool, bytecode<p>Also can use on phone. (I use it on subway.)<p>So I built JarPeek.<p>Decompiler (Vineflower) runs entirely in browser via TeaVM. No upload, no server, no install.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49560203)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T03:31:16Z

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
