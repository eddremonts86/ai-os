# SPEC.md — How do you test an app from a region you're not physically in?

## Problem

We run a small B2B product for a few overseas markets. We keep seeing bugs that only reproduce locally: country-specific payment SDK behavior, stale CDN edge cache, and TLS&#x2F;TTFB issues that only appear on local mobile networks.<p>VPN and emulators are insufficient. VPN does not replicate carrier routing or device integrity checks like Play Integrity. Commercial device farms rarely guarantee physical device location, which is what we need.<p>We’re thinking of hosting physical devices in target countries and remote-controlling them. The connection is solvable, but we’re worried about operations: carrier NAT traversal, unattended OS updates, battery&#x2F;thermal drift, and long-running failure modes.<p>What has worked for you? Self-hosted remote hardware, device farms with location limits, or accepting user-reported bugs?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49723043)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-09-16T07:11:09Z

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
