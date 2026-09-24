# SPEC.md — TurboBench, the Compression Lie Detector, 100 Codecs, Daily Update

## Problem

TurboBench: The Ultimate Data Compression Benchmark
100+ Codecs. The Powerhouse in a Single Executable — The Compression Lie Detector<p>Tired of misleading benchmarks with I&#x2F;O overhead, cache effects, and CPU throttling? TurboBench delivers high-precision, zero-overhead results you can actually trust.<p>Why TurboBench Stands Out
The only benchmark that includes LzTurbo alongside 100+ popular, latest, and fastest compressors (LZ77, Rolz, BWT, Context Mixing, Entropy Coders, and more).<p>- 100% in-memory testing — no disk I&#x2F;O to skew your results.
Supports multiple files, recursive directories, and smart concatenation of small files into multiblock tests.
Built to avoid common pitfalls like cache scenarios and throttling found in other tools.<p>- Unlock peak performance — TurboBench reduces throttling by intelligently controlling the CPU frequency<p>- Automatic sorting, updating, and merging of result files.
A nightly github release is created automatically whenever submodules change.<p>- Creates a separate result file (file@SET.tbb) for each compressor set<p>- TurboBench rank aggregation crowns the top compression libraries with    — see who&#x27;s king!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49725461)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T11:56:01Z

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
