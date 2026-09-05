# SPEC.md — ForgeGuardian – Open-source software supply-chain security scanner

## Problem

1. Why you built it<p>ForgeGuardian was built in order to discover the threats that software supply chain has other than those detected by the regular CVE scanning process.<p>2. What problem it solves
Include:<p>Malicious packages
Typosquatting
Dependency attacks
Behavioral threats
Malware
Threats related to AI&#x2F;MCP<p>3. What you actually built
This includes:<p>8 detection engines
9 ecosystems
More than 223 detection signatures
CLI&#x2F;web dashboards
Offline&#x2F;local-first functionality
SBOM
Policy enforcement
CI&#x2F;CD
Webhooks
Prevention&#x2F;quarantine<p>4. What you want HN users to look at
This is crucial. Ask a legitimate technical question, e.g.:<p>I would be most interested in hearing feedback about the detection mechanism and what you see as the weaknesses of supply-chain scanners. I would also love to get your opinion on the signature model and false positives management.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49574041)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T07:28:40Z

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
