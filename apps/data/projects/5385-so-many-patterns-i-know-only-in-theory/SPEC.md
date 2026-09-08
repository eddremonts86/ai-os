# SPEC.md — So many patterns I know only in theory

## Problem

I know about the outbox pattern, the rate limiting pattern, CDC, idempotent consumers, main&#x2F;replica setup, circuit breakers, caching, sharding, partitioning, and a large etc. I know them well enough to pass technical interviews in which I&#x27;m asked about them, and I know them well enough to work in an environment in which these solutions have already been implemented and one only needs to be aware of them.<p>But I have never implemented such a solution in a production environment. Over a decade of experience. I have played around with these topics at personal projects, ofc, but never a single time i have deployed my own solution to a prod. environment.
In very small companies, these patterns are typically not needed. In big&#x2F;medium-size companies, they are already typically implemented.<p>What about you?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49587708)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-06T15:52:07Z

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
