---
id: "825"
slug: no-quick-cheap-fix-for-leaky-faucets-no-clear-diy-guide
title: "No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber"
status: enriched
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/other/e59sb30221-no-quick-cheap-fix-for-leaky-faucets-no"
category: other
date: "2025-12-01"
tags: [Other]
country: India
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# No quick, cheap fix for leaky faucets: no clear DIY guide or affordable plumber

## Tech Stack

React + TypeScript front end, TanStack Start API, SQLite via Drizzle ORM, deployed on Coolify / Docker. Same stack as the rest of the AI-OS apps so the triage flow, guides and plumber directory live alongside the other corpus apps on the existing VPS.

## Architecture

A triage screen captures a photo and a few answers to identify the leak type. From the result, the user goes down one of two paths: a DIY guide tailored to that leak type, or a vetted plumber directory filtered to the poster's city. The same booking surface backs the plumber path so the household stays in one place.

```
leak photo + a few answers
            ↓
     triage (washer / cartridge / O-ring / supply line)
            ↓
    DIY guide for this leak        plumber directory in city
                                          ↓
                                  booking / request visit
```

## Milestones

1. Leak-type triage flow backed by photo and a short Q&A.
2. DIY guides written per leak type for a first-time homeowner.
3. Plumber directory filtered to the poster's India city, with a price band per fix.
4. Booking surface that takes the household's request and routes it to the listed plumber.

## Risks

- Source names no specific city; the directory cannot credibly launch beyond the cities interviews confirm.
- "Cheap" is undefined in the post; a price band displayed without research would be invented and would undermine trust.
- Plumbing work is regulated locally in India; any "vetted" claim needs a verification process the post does not describe.
- Parts availability for cartridges and O-rings varies locally; the DIY guide cannot assume the same SKUs are everywhere.
