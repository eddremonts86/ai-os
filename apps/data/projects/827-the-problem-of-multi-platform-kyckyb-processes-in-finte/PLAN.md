---
id: "827"
slug: the-problem-of-multi-platform-kyckyb-processes-in-finte
title: The problem of multi-platform KYC/KYB processes in fintech leading to specialist burnout
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/ai/u4jsvhe931-the-problem-of-multi-platform-kyckyb-pro"
category: ai
date: "2025-11-26"
tags: [AI, Finance, Business, Other]
country: France
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# The problem of multi-platform KYC/KYB processes in fintech leading to specialist burnout

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Matches the rest of the AI-OS apps surface so the case aggregator and routing rules ship alongside the other corpus apps on the existing VPS.

## Architecture

The product is a thin case aggregator that sits across the vendors a specialist already pays for. It does not run KYC or KYB itself. A case is identified once; the case view fans out to the connected vendors for the next check, gathers the results in one audit trail, and surfaces the queue to the specialist on one screen.

```
case opens (customer or business)
        ↓
routing rule picks the next vendor for the next check
        ↓
   case view fans out to each connected vendor
        ↓
   aggregated audit trail per case
        ↓
   specialist dashboard: queue, blockers, vendor waits
```

## Milestones

1. Pick the first two connected vendors from interviews, not from this post.
2. Case view that pulls status from each connected vendor into one screen.
3. Routing rule that selects the next vendor based on what has already been collected.
4. Audit trail per case, with timestamp and vendor per result.
5. Specialist dashboard for queue and blockers.

## Risks

- Compliance wrappers raise regulator exposure; data residency for France and the EU must be settled before any data passes through the system.
- No vendor is named in the post; integration depth cannot be promised without choosing and signing at least one partner.
- "Burnout" is an outcome the post claims, not a metric. Any feature that says it reduces burnout needs a measurement design the post does not provide.
- The "AI" category is the poster's tag, not a feature claim; the MVP need not include AI to address the stated problem.
