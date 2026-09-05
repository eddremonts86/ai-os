---
id: "4235"
slug: stackscope
title: StackScope
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/stackscope-dev"
category: product-launch
date: "2026-08-08"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# StackScope

## Problem

The web's tech stack is a moving target. Sites launch every week, and the user wants to see what they are built with — the front-end framework, the back-end runtime, the CDN, the analytics, the payment processor — close to launch day, before the trail goes cold. The StackScope launch post names the alternative: see what new sites are built with, the week they launch. The post is short — a tagline and a discussion link — but the weekly-freshness claim is explicit: the user is not looking at a stale snapshot from months ago, the user is looking at the stack the day the site launches. The source names the actor (a developer, an analyst, or a technologist who wants to see what new sites are built with close to launch), the pain (existing stack-detection tools are stale or sampled, not weekly-fresh on the launches), and the missing thing (a weekly-fresh view of what new sites are built with). It does not name a specific stack-detection methodology, a specific stack surface (front-end, back-end, CDN, payments), or a specific number of sites per week.

## Objective

Ship a weekly-fresh view of what new sites are built with, so the user can see the stack the day the site launches, not a stale snapshot from months ago.

## Target Users

- Developers who want to see what new sites are built with close to launch day.
- Analysts and technologists who want a weekly-fresh view of the tech-stack landscape.
- Recruiters and sales teams who want to know what stack a prospect has before the first call.
- Investors and researchers who track the tech-stack adoption across new launches.
- Indie developers who want to see what stacks their peers are picking on launch day.

## MVP Scope

- A weekly cadence that picks up new site launches and runs a stack-detection pass on each.
- A stack-detection methodology that reads the public surface of the site (the source names no specific methodology; the methodology is the system's claim).
- A stack surface the detection pass covers (the source names no specific surface; the surface is the system's claim).
- A weekly view where the user sees what new sites are built with that week.
- A per-site detail view where the user sees the full stack of a single launch.
- A filter by stack component (front-end, back-end, CDN, analytics, payments, etc.).
- A history of past weeks the user can browse.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The cadence is weekly. A snapshot the user cannot trust to be from launch week is a freshness failure.
- The stack-detection methodology is documented. An undocumented methodology is a coverage gap.
- The stack surface the detection pass covers is documented. A surface the user expects but the system does not cover is a coverage gap.
- The weekly view is per-week. A view that aggregates across weeks is a UX regression.
- The per-site detail view is the source of truth for a single launch. A detail view that disagrees with the weekly view is a sync failure.
- The filter by stack component is configurable. A component the user cannot filter by is a UX gap.
- The history is bounded. A history that grows unbounded is a coverage gap, not a feature.