---
id: "4158"
slug: retainfast-cancellation-flow-widget-that-never-touches-
title: RetainFast – cancellation flow widget that never touches your Stripe
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511987"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# RetainFast – cancellation flow widget that never touches your Stripe

## Phase 0: Scaffold

- [ ] Set up the TanStack Start project under `apps/4158-retainfast-cancellation-flow-widget-that-never-touches-/`
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Stand up the SQLite + Drizzle ORM analytics store
- [ ] Pick the script-tag CDN origin and bucket policy

## Phase 1: Core

Build the widget bundle (vanilla JS, Shadow DOM, two-callback contract), build the flow editor (reasons, per-reason offers, accent colour, live preview), build the analytics view (funnel, save rate per offer, reason breakdown, free-text reasons), write the three-step integration docs, write the pricing page ($25 intro then $12/month), and verify that the widget never receives, stores, or needs a Stripe key at any point in the flow.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production (load the script tag on a staging billing page, confirm `onSave` and `onCancel` fire)