---
id: "834"
slug: protection-against-fraudulent-schemes-in-trading-and-cr
title: Protection against fraudulent schemes in trading and cryptocurrency investments
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/finance/lux1195af1-protection-against-fraudulent-schemes-in"
category: finance
date: "2025-11-18"
tags: [Finance, Legal, Other]
country: Madagascar
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Protection against fraudulent schemes in trading and cryptocurrency investments

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Same stack as the rest of the AI-OS apps so the check surface, known-schemes database and intake ship alongside the other corpus apps on the existing VPS.

## Architecture

The investor describes a scheme or names a platform; the check surface matches the input against a known-schemes database sourced from public regulator warnings. A match returns the warning, the regulator, and the date. A "no match" returns an honest "not in the database" with a clear explanation of what the database does not cover. A short intake lets the investor report schemes not yet in the database.

```
scheme description or platform name
        ↓
match against known-schemes database (regulator-sourced, dated)
        ↓
match → warning + regulator + date
        ↓
no match → honest "not in the database" + explanation of coverage
        ↓
intake for schemes not yet in the database
```

## Milestones

1. Source the known-schemes database from public regulator and consumer-protection lists, versioned by date.
2. Build the check surface that takes a description or platform name and returns a verdict.
3. Build the per-match explainer with the regulator and the date.
4. Build the "report a scheme" intake for cases not yet in the database.
5. Add the explicit "detection aid, not legal advice" disclaimer in the UI.

## Risks

- Country of submission is Madagascar; consumer-protection and crypto regulation are local and must be respected even when the scheme originates abroad.
- The post names no specific scheme; an MVP scheme taxonomy invented to look complete would be wrong.
- A "no match" verdict must not be read as a guarantee; the UI must communicate the limits of the database.
- The MVP must say so before the verdict renders, not after, so the disclaimer cannot be skipped.
