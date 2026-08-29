---
id: "3732"
slug: staats
title: Staats
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/staats-3"
category: product-launch
date: "2026-08-28"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Staats

## Problem

Coding agents have collapsed the time it takes to ship a change: the bottleneck is no longer building, it is deciding what to build next. The Staats ProductHunt listing makes that argument explicit — "Coding agents have made shipping so fast that the bottleneck has moved. It's not building anymore, it's knowing what to build next and making data-backed decisions is just sensible." Today the loop looks the same as it always did: deploys happen, the dashboard updates, the founder opens PostHog or Mixpanel later, scrolls through charts, and tries to recall which deploy corresponded to the bump they are seeing. By the time the answer arrives, the deploy is a week old and the rationale is gone. The implicit gap is that the existing analytics dashboards are human-facing — charts, funnels, retention curves — but the decision-maker is now a coding agent, and the agent does not browse a dashboard. Staats is positioned as agent-native, cookieless site analytics: the coding agent itself measures deploys, flags changes, and suggests next moves, with evidence attached.

## Objective

Ship an analytics product that, in place of a chart-based dashboard, gives a coding agent (and the human behind it) a queryable record of deploys and their measured effects on the live site, so the loop "ship → measure → decide what to ship next" is closed inside the agent's own working environment. The MVP is the Staats product as described in the ProductHunt listing: cookieless site analytics, deploy markers, flagged changes, evidence-backed suggestions, no dashboard to read.

## Target Users

- **Primary:** solo founders shipping with AI coding agents (Claude Code, Codex, Cursor, etc.) who want the agent to also answer "what shipped, what changed, what's next" without the founder opening a separate analytics tab.
- **Secondary:** small product teams where one engineer is "the deployer" and "the metrics reader" simultaneously, and who want the two roles to collapse onto a single tool the agent can call.
- **Tertiary:** indie hackers and bootstrapped founders for whom a full analytics dashboard is overkill — a feed of evidence-backed suggestions is enough.

## MVP Scope

- A lightweight, cookieless site analytics collector that records pageviews (and likely conversions / custom events) without requiring a cookie banner. The listing names "cookieless" as a property, not just a feature; the implementation must genuinely avoid a cookie consent UX in the EU.
- A deploy-marker API that the user (or their CI) calls when a deploy ships, attaching the deploy id / commit / version / release notes to the live analytics stream.
- A change-detection layer that compares the post-deploy window against a baseline and surfaces "deploy X moved metric Y by Z" with the evidence (time window, segments, comparison cohort).
- An "agent-native" interface: a CLI / MCP surface / HTTP endpoint that an LLM coding agent can call to ask "what shipped, what changed, what should I ship next," returning structured evidence rather than charts.
- An evidence card per suggestion: deploy id, time window, segments, baseline, observed delta, and a one-line interpretation. Charts are intentionally absent from the listing.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Cookieless measurement is a regulatory and technical commitment, not a marketing claim. If the implementation falls back to cookies for any event type, it must say so or the EU cookie-banner problem returns.
- "No dashboard" is a load-bearing claim for the product's identity. A dashboard may exist later as a secondary surface, but the core agent-native surface must remain the primary way to read results.
- The product must be safe to wire into a coding agent's automation. A bad prompt injection on a partner site must not be able to steer what the agent suggests; the analytics input is observational only and cannot instruct the agent.
- Pricing is not stated in the ProductHunt listing beyond "agent-native, cookieless site analytics." No `wtp` field is set; absent beats invented.
- The product must respect GDPR and equivalent regimes: cookieless tracking implies no per-user identifier is held, which constrains what the analytics can offer (no per-user funnels).
