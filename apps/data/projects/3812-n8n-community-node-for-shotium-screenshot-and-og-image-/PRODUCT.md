---
id: "3812"
slug: n8n-community-node-for-shotium-screenshot-and-og-image-
title: N8n community node for Shotium – screenshot and OG image API
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49495905"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [n8n community node, TypeScript, Shotium REST API, headless browser rendering, OG image templates, n8n credential framework]
---
# N8n community node for Shotium – screenshot and OG image API

## Value Proposition

Screenshots and OG images as a node in the automation graph. Instead of wiring a headless browser or hand-rolling API calls, n8n users drop in the Shotium node: Take Screenshot turns any URL into PNG, JPEG or WebP, Generate OG Image renders 1200x630 cards from typed templates in a real browser, and Generate Signed URL emits a JSON url whose image updates whenever signed parameters change. Render results arrive as binary data, ready for S3 upload, email attachments, Telegram messages or disk writes in the same workflow. Getting started costs nothing up front — a GitHub sign-in grants 100 free render credits with no credit card, and failed renders are never billed.

**One-liner:** Shotium's screenshot and OG-image API as a verified n8n community node, with credit-metered rendering.

## Target Users

| Stakeholder | Why they care |
|---|---|
| n8n automation builders | Image generation and capture steps without leaving the workflow canvas. |
| Content and CMS operators | Data-driven OG images via signed-URL templates that refresh automatically. |
| Monitoring-minded operators | Scheduled screenshots of pages feeding image-diff alerts. |
| Shotium itself | The node is the no-code distribution channel for the API's audience. |

The post describes a developer tool; the market is the n8n community and Shotium's API customers.

## Jobs To Be Done

1. **Functional job** — Screenshot any URL from a workflow and pass the image binary to downstream nodes.
2. **Functional job** — Generate OG images from typed templates with expression-driven parameters.
3. **Functional job** — Produce signed URLs whose images update when the signed parameters change.
4. **Functional job** — Validate credentials without spending render credits (GET /v1/me).

## Success Metrics

- **Verification:** the node passes n8n community-node review — the repo's own named gate for reaching the no-code audience.
- **Install base:** n8n instances that installed the node (npm downloads of n8n-nodes-shotium).
- **Operation usage:** successful Take Screenshot and Generate OG Image executions per week.
- **Billing transparency:** zero support complaints about unexpected charges, matching the no-auto-charge guarantee.

## Pricing & Monetization

The node is free and MIT-licensed; monetization sits in the Shotium API it wraps. The repo states the account terms: GitHub sign-in with 100 free render credits and no credit card, renders billed only on success, 60 requests per minute per key, and a 429 quota_exceeded response when credits run out — nothing auto-charges.

## Competitive Landscape

The post does not name competitors. The category is n8n community nodes and workflow steps for image capture and social-card generation; the usual alternative is a custom HTTP Request node against a screenshot service, or self-hosting a headless browser. The node's position is convenience — credential handling, typed operations and binary output wired into n8n's node ecosystem — on top of a real-browser rendering API.

## Risks & Open Questions

- [ ] Verification is the gate: until n8n accepts the node, the no-code audience cannot reach it, and the repo itself says blog claims wait on this.
- [ ] Render billing depends on Shotium's credit meter; quota exhaustion mid-workflow (429) must fail loudly, not silently.
- [ ] Signed-URL images update server-side; caching layers could serve stale OG images to scrapers.
- [ ] The node wraps an external API; Shotium outages or pricing changes propagate straight into user workflows.
- [ ] A single maintainer and a 0.1.x version number suggest an early project with a thin compatibility track record.
