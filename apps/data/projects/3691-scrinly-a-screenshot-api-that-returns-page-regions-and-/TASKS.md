---
id: "3691"
slug: scrinly-a-screenshot-api-that-returns-page-regions-and-
title: Scrinly – A screenshot API that returns page regions and visual diffs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484191"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Headless Chromium render workers, Node.js REST API, Postgres, Redis job queue, Backblaze B2 with S3 and R2 support, MCP server with scoped OAuth]
---
# Scrinly – A screenshot API that returns page regions and visual diffs

## Phase 0: Scaffold

- [x] Capture the Show HN post and the product page describing capture, regions, diffs, monitors and style guide
- [ ] Containerised headless Chromium worker with recycling and hard timeouts
- [ ] Postgres schema: accounts, credit ledger, captures, region sets, diffs, monitors, baselines
- [ ] Destination validation refusing private-network, loopback, link-local and reserved targets
- [ ] B2 bucket plus the storage-destination abstraction for S3 and R2
- [ ] Write DESIGN.md (docs surface, dashboard, diff visualization treatment)

## Phase 1: Core

- [ ] `POST /render/screenshot` with viewport, device, theme, format, wait, `fullPage` and cleanup controls
- [ ] Credit ledger: reserve before render, settle on success, refund on failure, balance in response headers
- [ ] Screenshot `sha256` recorded and returned as the traceability anchor for every derivation
- [ ] Browser actions and cookie/authorization-header support for caller-authorized pages
- [ ] Async path: `async=true` and `webhookUrl` returning `202` with a pollable job id
- [ ] Regions add-on: ordered section splitting, per-crop bounds, bytes and hash, document order preserved
- [ ] Visual diff request: overlay, heatmap and binary mask against a prior capture
- [ ] Monitors: scheduled capture, baseline storage, per-run diff, incident events, recovery lifecycle
- [ ] Visual style guide: sanitised projection excluding URL, hostname, HTML, headers, cookies, selectors and page text
- [ ] Style-guide literal check — every color, duration, easing, breakpoint and token matched back to the projection, add-on failed rather than published when it does not match
- [ ] Observed-versus-inferred labelling and explicit evidence-gap reporting in style-guide output
- [ ] BYOK via `X-Scrinly-Provider-API-Key`, never stored, echoed or logged, synchronous only
- [ ] Partial-failure semantics: keep the screenshot, refund only the failed add-on; refund the full charge on capture failure
- [ ] Screenshot batch endpoint reserving one credit per item, rejecting `regions` and `styleGuide`
- [ ] MCP server: four visual tools, scoped OAuth, per-call `maxCredits` ceiling declared before work begins
- [ ] Typed component errors so an agent can decide whether to retry

## Phase 2: Deploy

- [ ] Publish the five plan tiers with monthly allowances and operating limits
- [ ] Ship the agent skill package and the credits documentation
- [ ] Monitor refund rate, regions attach rate and MCP-originated call share
- [ ] Verify in production
