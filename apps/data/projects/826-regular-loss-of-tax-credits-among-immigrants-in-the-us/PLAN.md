---
id: "826"
slug: regular-loss-of-tax-credits-among-immigrants-in-the-us
title: Regular loss of tax credits among immigrants in the US
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/unnnxi3m71-regular-loss-of-tax-credits-among-immigr"
category: other
date: "2025-11-26"
tags: [Immigration, Legal, Finance, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Regular loss of tax credits among immigrants in the US

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Matches the rest of the AI-OS apps surface so the eligibility ruleset, status intake, and preparer hand-off live next to the other apps on the existing VPS.

## Architecture

A status intake captures the inputs that affect US federal credit eligibility without persisting identifiers. An eligibility engine maps the status combination to the credits the user is at risk of losing, with the documents each one requires. A preparer hand-off routes the cases the tool cannot resolve to a vetted local preparer.

```
residency / status / ITIN-vs-SSN / dependents
                    ↓
        ruleset versioned by tax year
                    ↓
     credits at risk + documents needed per credit
                    ↓
     optional preparer hand-off
```

## Milestones

1. Status intake flow with explicit "no identifier storage" guarantees surfaced to the user.
2. Eligibility ruleset for the US federal credits that depend on residency status, versioned by tax year.
3. Per-credit document list rendered against the user's situation.
4. Preparer hand-off surface with a small vetted list per market.

## Risks

- Tax rules change yearly; the ruleset must be versioned and an "as of" date shown on every check.
- Sensitive identifiers raise privacy questions the post does not address; storage defaults must be conservative.
- State-level credits are not in scope from this post; expanding without research would invent coverage.
- A "regular" loss implies recurring missed credits; quantifying it without interviews would be invented.
