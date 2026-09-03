# SPEC.md — BlazeRules – YAML rule engine for streaming data, 3M records/SEC

## Problem

<a href="https:&#x2F;&#x2F;blazerules.dev" rel="nofollow">https:&#x2F;&#x2F;blazerules.dev</a> I initially wanted to make a sub-millisecond log parser in C++ but that blew into a embeddable decision engine, that can run YAML defined rules on incoming data.
The rules are executed in a vectorized format on incoming data by reprojecting into a columnar format first, if it&#x27;s not already. Depending on the payload size and rules complexity, the performance goes from 200K records&#x2F;s to more than million records&#x2F;sec, in terms of througput this would be around 200 MiB&#x2F;s to 3 GiB&#x2F;s on average.<p>Rules can be sql expressions too, or onnx models (numeric), window ops and quite a few more operations are supported.<p>It&#x27;s comparable to DuckDB but for streaming data and on the fly decisions.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49534550)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T11:02:48Z

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
