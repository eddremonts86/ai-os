# SPEC.md — Triplox, a distributed Datalog engine with incremental queries

## Problem

I have been working on a distributed Datalog engine à la Datomic on top of object storage. The system is called Triplox. I am using <a href="https:&#x2F;&#x2F;github.com&#x2F;slatedb&#x2F;slatedb" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;slatedb&#x2F;slatedb</a> at the storage layer. The main ideas are roughly the following (in no particular order):<p>- Object storage centric. In its final version Triplox should simply need a single (or likely two) S3 bucket(s) for deployment.<p>- The Datomic data model and API as main inspiration.<p>- A client&#x2F;server architecture.<p>- Incremental Datalog queries. You can dynamically subscribe and unsubscribe from live Datalog queries.  This is the most experimental part of Triplox and will need more effort to scale.  Standard connectives (`and`, `or`, `not`) are already supported. You can find an intro here: <a href="https:&#x2F;&#x2F;triplox.xyz&#x2F;incremental-queries&#x2F;overview&#x2F;" rel="nofollow">https:&#x2F;&#x2F;triplox.xyz&#x2F;incremental-queries&#x2F;overview&#x2F;</a>.<p>The incremental query angle is likely the most interesting aspect for people considering such a solution. If you have an incremental Datalog problem or are working on sync engines, Triplox might be of interest.<p>Website: <a href="https:&#x2F;&#x2F;triplox.xyz&#x2F;" rel="nofollow">https:&#x2F;&#x2F;triplox.xyz&#x2F;</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49550003)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T13:58:08Z

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
