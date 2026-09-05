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

## Value Proposition

A weekly-fresh view of what new sites are built with, so the user can see the stack the day the site launches, not a stale snapshot from months ago. The system picks up new site launches on a weekly cadence, runs a stack-detection pass on each, exposes the result in a per-week view, and lets the user drill into a single launch to see the full stack.

The stack surface and the detection methodology are documented and exposed in the system. The filter by stack component lets the user scan for the component they care about (front-end, back-end, CDN, analytics, payments, etc.) without scrolling every week's worth of launches. The history of past weeks is the long-tail view; the weekly view is the launch-day view.

**One-liner:** A weekly-fresh view of what new sites are built with, with a per-launch detail view and a filter by stack component.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers | Want to see what new sites are built with close to launch day. |
| Analysts and technologists | Want a weekly-fresh view of the tech-stack landscape. |
| Recruiters and sales teams | Want to know what stack a prospect has before the first call. |
| Investors and researchers | Want to track tech-stack adoption across new launches. |
| Indie developers | Want to see what stacks their peers are picking on launch day. |

## Jobs To Be Done

1. **Functional job** — See what new sites are built with this week, close to launch day.
2. **Functional job** — Drill into a single launch and see the full stack of that site.
3. **Functional job** — Filter by stack component to see only the launches that use a given framework, runtime, CDN, analytics, or payment processor.
4. **Functional job** — Browse the history of past weeks to see the long-tail adoption pattern.
5. **Functional job** — Trust that the snapshot is from launch week, not a stale crawl from months ago.
6. **Emotional job** — Stop the feeling that the existing stack-detection tools are stale and the user is reading yesterday's news.
7. **Social job** — Be the analyst or developer whose tech-stack view is fresh enough to share without disclaimers.

## Success Metrics

- **Weekly freshness coverage** — share of weekly views that reflect launches from the same week. A view that drifts more than one week is a freshness failure.
- **Stack-detection coverage** — share of launches the system can run a detection pass on. A launch the system skips is a coverage gap.
- **Stack surface coverage** — share of the documented stack surface the detection pass actually covers. A surface in the docs but not in the pass is a documentation gap.
- **Per-launch detail coverage** — share of launches with a detail view the user can drill into. A launch without a detail view is a UX gap.
- **Filter coverage** — share of stack components the user can filter by. A component the user cannot filter by is a UX gap.
- **History coverage** — share of past weeks the user can browse. A history gap is a UX failure.
- **Methodology documentation coverage** — share of the detection methodology the system exposes in the docs. An undocumented methodology is a coverage gap.

## Pricing & Monetization

The source names no fee, no tier, and no commercial plan. The launch post is a tagline and a discussion link. Any future monetization has to be measured against the weekly freshness coverage and the stack-detection coverage, because those are the metrics the source ties to the system's value proposition.

## Competitive Landscape

- **Stale stack-detection snapshots (the names the source does not provide)** — show the stack from a crawl that is months old, not from launch week.
- **Domain-by-domain stack-lookup tools (the names the source does not provide)** — let the user check one site at a time, but do not surface a per-week view.
- **Tech-stack aggregators (the names the source does not provide)** — list what stacks are popular, but the data is aggregated, not per-launch.
- **Manual inspection (the names the source does not provide)** — the user opens a new site, looks at the source, reads the headers; the cadence is whatever the user remembers.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the launch-detection source. The system picks up new site launches weekly; the open question is the source of the launch list (a registry, a feed, a curated list, or a crawl).
- [ ] Define the stack-detection methodology. The source is silent; the open question is whether the methodology is header analysis, asset fingerprinting, JS execution, or a combination.
- [ ] Validate the stack surface coverage. The source names no specific surface; the open question is the full list of stack components the detection pass covers on launch.
- [ ] Decide the per-launch detail view's depth. The user drills into a single launch; the open question is the depth (a flat list of components, a per-page breakdown, a per-asset breakdown).
- [ ] Establish the history retention policy. The user browses past weeks; the open question is the maximum history depth the system keeps.
- [ ] Confirm the filter's granularity. The user filters by stack component; the open question is whether the filter is by exact match, by category, or by both.
- [ ] Define the policy on a launch the system detects but cannot analyse. The launch is in the weekly view but the detection pass fails; the open question is whether the launch is excluded, flagged, or partially populated.