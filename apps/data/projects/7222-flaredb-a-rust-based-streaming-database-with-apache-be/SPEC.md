# SPEC.md — FlareDB – a Rust-based streaming database with Apache Beam as interface

## Problem

I’m building FlareDB, a Rust-based streaming database with Apache Beam as programing interfere 
The latest release, v0.2.0, i launched FlareDbIO, which lets data processing pipelines write results into FlareDB, query them using SQL, and read the results back into another pipeline.
The goal is to make processed data persistent and without having to maintain a external serving database<p>Docs: <a href="https:&#x2F;&#x2F;docs.flare-db.com&#x2F;io" rel="nofollow">https:&#x2F;&#x2F;docs.flare-db.com&#x2F;io</a><p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;flare-db&#x2F;flare-db" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;flare-db&#x2F;flare-db</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49713583)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T14:59:52Z

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
