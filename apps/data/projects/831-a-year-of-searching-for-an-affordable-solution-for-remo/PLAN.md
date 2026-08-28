---
id: "831"
slug: a-year-of-searching-for-an-affordable-solution-for-remo
title: A year of searching for an affordable solution for remote US business opening without citizenship
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/business/zosvs04rp1-a-year-of-searching-for-an-affordable-so"
category: business
date: "2025-11-20"
tags: [Business, Legal, Other]
country: USA
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# A year of searching for an affordable solution for remote US business opening without citizenship

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Same stack as the rest of the AI-OS apps so the eligibility check, entity picker, and per-state flow ship alongside the other corpus apps on the existing VPS.

## Architecture

The product is a workflow that produces the right paperwork, not a legal service. An eligibility check filters out the cases that need a lawyer first. An entity picker walks the founder through the trade-offs. A per-state formation flow generates the filings and a registered-agent requirement for the chosen state. A cost summary shows every fee before the founder commits.

```
eligibility check (non-citizen, non-resident)
        ↓
entity picker (LLC / C-Corp / single-member)
        ↓
per-state formation flow (filings + fees + registered agent)
        ↓
cost summary before any payment
```

## Milestones

1. Eligibility check that confirms the founder can open a US business from outside without a visa.
2. Entity picker with the trade-offs the founder has to read.
3. Per-state formation flow for one or two states chosen from interviews.
4. Cost summary that shows every fee before the founder pays anything.
5. Explicit "workflow tool, not legal advice" disclaimer in the UI.

## Risks

- US entity formation is per-state; claiming national coverage from one MVP would be invented.
- "Affordable" is the founder's word; pricing must come from interviews.
- Legal advice is regulated; positioning must hold the line between workflow and advice.
- A non-citizen founder's needs change when they enter the US on a visa; the MVP cannot cover post-entry changes from this post.
