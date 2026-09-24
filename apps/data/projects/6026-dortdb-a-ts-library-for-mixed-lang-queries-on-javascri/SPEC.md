# SPEC.md — DortDB, a TS library for mixed-lang queries on JavaScript structures

## Problem

Hello HN,<p>I made a TypeScript library for querying in-memory JS data. Originally, the goal was to have a more modular and lightweight alternative to AlaSQL, but then I was asked to include support for SQL&#x2F;XML, which I personally find way too verbose. So I got to thinking, remembered Virtuoso&#x27;s combined SQL and SPARQL queries and extrapolated from there.<p>The resulting engine consists of a shared core that provides the optimizer, query infrastructure etc., and separate languages that can be added as plugins. The way this is implemented is that the languages are translated into a common algebra. Thanks to that, you can mix multiple languages in a single query - imagine you need to process some tabular data, but for each row you want to extract information from a deep tree-like structure. Well, you can write an outer SQL query and put in an XQuery subquery and it just works. The algebra itself is designed to be extensible - I don&#x27;t presume to have covered everything any query language might need (but there is a language implemented for every major data model - SQL, XQuery and a Cypher-like language (licensing)). For example, XQuery includes two special algebra operators of its own, without needing to modify the core.<p>There is a link to a demo on the GitHub README, where you can play with query plans, or execute queries on some sample data. There is also a link to my diploma thesis about this project, if you&#x27;re interested in that. The whole thing was presented as a demo at VLDB last year.<p>This is a result of more than 2 years of work, and I&#x27;m at the point where I think other people might find it useful too - mainly because I was able to make docs I am happy with. The docs were created with the help of a LLM, but I spent weeks on that, so hopefully they read good. The code itself was written by hand, with the exception of the initial batch of regression tests.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49625773)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T12:54:21Z

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
