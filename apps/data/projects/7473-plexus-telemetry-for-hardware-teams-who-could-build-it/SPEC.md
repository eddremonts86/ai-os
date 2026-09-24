# SPEC.md — Plexus – Telemetry for hardware teams who could build it but shouldn't

## Problem

Hi, I&#x27;m Ann, building Plexus.<p>We gives hardware teams live dashboards and stored history for your sensor data, so you don&#x27;t have to build and maintain that setup yourself. You can try it without signing up on our site.<p>I built it because small hardware teams keep ending up with the same homemade stack (InfluxDB, Grafana, a pile of scripts) and one engineer who is the only person who knows how it all fits together. Building it is the easy part. Maintaining it for the life of the company… that&#x27;s not fun for anyone and it&#x27;s time taken away from the hardware.<p>We have a free plan for up to 3 devices. Paid plans are $500 a month, and the first 50 startups get a design partnership: $300 a month for the first 6 months in exchange for feedback and a case study.<p>We&#x27;re early. If you run your own Grafana setup for hardware, I&#x27;d love to know: what would it take for you to stop maintaining it?<p>and&#x2F;or if you work in hardware - have any feedback for us?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49732498)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T20:26:05Z

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
