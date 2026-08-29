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

## Problem

A vision model handed a full-page screenshot gets one compressed image, and a long marketing page compressed into a single frame is unreadable to it. Scrinly, posted to Show HN by `iamdavidoti`, is built for that gap: it captures a page pixel-accurately across viewports, devices, themes and post-interaction states, then breaks the long capture into ordered regions an agent can inspect one at a time while document order is preserved. On top of the same captured image it returns visual diffs — overlay, heatmap and binary mask — so a caller can tell what changed rather than only that something changed, plus scheduled monitoring that keeps a baseline and emits incident events, and an optional screenshot-grounded visual style guide that reports colors, typography, spacing and motion while labelling what was observed versus what was inferred. The operational problem underneath is stated plainly on the product page: callers do not want to run Chromium, size containers or babysit a render queue.

## Objective

Ship a screenshot API where one capture yields three layers of usable output — the pixel-accurate image, ordered regions sized for vision models, and a labelled visual style guide — with every result traceable back to the same screenshot by hash, credits charged before work starts and refunded when it fails, so an agent can call it without a caller-side browser or a surprise bill.

## Target Users

- Primary: developers building AI agents and automations that need to see a page, addressed directly by the MCP server that connects Codex, Claude Code and other MCP clients through scoped OAuth so the agent never receives the API key.
- Secondary: teams running visual regression and uptime-style monitoring on release-critical pages, who want diffs and incident events without maintaining a screenshot service.
- Tertiary: designers and QA doing design audits or brand reviews, served by the visual style guide that turns a capture into structured colors, typography, spacing and motion signals.

## MVP Scope

- `POST /render/screenshot`: full-page or viewport capture with device, theme, format and wait controls, plus browser actions and cookies for pages the caller is authorized to access.
- Deterministic regions: split a long capture into ordered sections, each with its own crop bounds, bytes and hash, document order preserved.
- Visual diff as its own request: overlay, heatmap and mask outputs against a prior capture.
- Monitors: capture a page on a schedule, keep a baseline, diff each successful run and emit incident events through the capture, baseline, diff and recovery lifecycle.
- Credit accounting: charge before the render starts, refund on failure, return the balance in response headers.
- Sync by default, queued via `async=true` or a `webhookUrl` returning `202` with a pollable id.
- MCP server exposing four visual tools under scopes the user approves individually.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Private network targets, loopback, link-local and reserved destinations are blocked outright; overriding `robots.txt` requires a domain the caller has verified.
- Capture rights are the caller's obligation, not a gate the service can check. Cookies, authorization headers and browser actions exist for pages the caller is authorized to access.
- Provider input for the style guide is bounded: the model receives screenshot crops and a sanitised projection, never the target URL, hostname, HTML, headers, cookies, selectors or supplied page text. Visible copy and branding still appear in the pixels.
- A caller-supplied provider key in `X-Scrinly-Provider-API-Key` is never stored, echoed or logged, which forces BYOK style guides to stay synchronous — a provider credential cannot be persisted into a queue.
- Partial failure has a defined shape: a failed regions or style-guide add-on returns the successful screenshot and refunds only that increment; a failed browser capture refunds the whole charge.
- Screenshot batches reserve exactly one credit per item, so `regions` and `styleGuide` are rejected inside a batch.
- Assets used for diffing and monitoring must be publicly fetchable, which bounds where stored captures can live.
- Yearly plans are billed once but the credit allowance still refreshes monthly — an annual plan is not twelve months of credits handed over at once.
