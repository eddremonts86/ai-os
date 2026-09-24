# SPEC.md — Real-Time Bluesky Post Firehose in < 256MB

## Problem

Hello everyone, I&#x27;m still trying to get some traction with sqlflow!<p>I&#x27;m completely disenchanted with the modern data stack, and am trying to create a toolchain that helps treat data as if it were software: Observability, Integrated Testing, Performance and a real UX.<p>The linked page uses sqlflow (the foundation of this datastack) to consume and window the bluesky post firehose, save it to postgres, then serve it back over HTTP for dashboarding.<p>What&#x27;re you using for analytics? Do you serve lines a chart to your customers? What tech are you using? Are you happy with the JVM (flink)?<p>i&#x27;m very interested in learning how you tackle streaming data and analytics today! Thank you

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49745386)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T19:25:37Z

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
