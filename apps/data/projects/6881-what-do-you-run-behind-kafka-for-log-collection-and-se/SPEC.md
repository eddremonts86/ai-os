# SPEC.md — What do you run behind Kafka for log collection and search?

## Problem

I&#x27;ve mostly seen Kafka → Logstash&#x2F;Connect → Elasticsearch(ELK), but I&#x27;m curious
whether that&#x27;s still the default or whether people have moved to something
lighter. What are you actually running?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49693546)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-14T08:14:53Z

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
