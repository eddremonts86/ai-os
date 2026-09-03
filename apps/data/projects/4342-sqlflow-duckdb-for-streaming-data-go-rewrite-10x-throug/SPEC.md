# SPEC.md — SQLFlow (DuckDB for streaming data) Go Rewrite 10x Throughput

## Problem

Hello Everyone! I just released sqlflow v1, which includes a go core rewrite.<p><a href="https:&#x2F;&#x2F;github.com&#x2F;turbolytics&#x2F;sql-flow" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;turbolytics&#x2F;sql-flow</a><p>This allows for ~10x higher throughput, over the python core, and more predictable memory usage! This also makes it easier for our users to run in resource constrained environments (such as IoT).<p>The go rewrite also brings a bit more sanity to handling background sqlflow control loops, such as window compaction and timeouts.<p>I&#x27;d really love and appreciate your feedback, any examples using sqlflow in production, or your concerns on what makes sqlflow UNUSABLE for you!<p>Thank you<p>Danny
danny@turbolytics.io

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49521329)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T12:55:06Z

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
