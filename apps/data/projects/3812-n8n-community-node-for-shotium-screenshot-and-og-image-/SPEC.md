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

## Problem

The capture is a URL-only Show HN by foodpad pointing at github.com/shotium/n8n-nodes-shotium. The repository describes an n8n community node that brings Shotium — a screenshot and OG image rendering API — into n8n workflows: any URL can become a PNG, JPEG or WebP screenshot, or a 1200x630 Open Graph image generated from typed templates rendered by a real browser. The node exposes three operations: Take Screenshot, Generate OG Image, and Generate Signed URL. Render operations output binary image data (default field data) ready to pipe into downstream nodes — upload to S3, attach to email, send via Telegram, write to disk — while Generate Signed URL returns JSON with a url field. Credentials come from a Shotium account (GitHub sign-in, 100 free render credits, no card); the API key, signing secret and UID are shown once, and credential validation calls GET /v1/me without consuming credits. Renders bill only when an image is successfully returned; the rate limit is 60 requests per minute per key, and exhaustion returns 429 quota_exceeded with no auto-charge. The node requires n8n 1.0+ and is MIT-licensed at version 0.1.3.

## Objective

Get the community node verified and reachable by n8n's no-code audience, so screenshots and OG images become one node in any workflow — with the repository's own named next steps (Google sign-in support and a blog announcement) as the follow-on.

## Target Users

- n8n workflow builders who automate content pipelines and want screenshot or OG image steps without code.
- Marketers and CMS operators generating Open Graph images that follow their data.
- Ops people building visual monitoring (screenshot a page, diff, alert) inside n8n.

## MVP Scope

- The three operations shipped: Take Screenshot, Generate OG Image, Generate Signed URL.
- Shotium API credential with declarative validation against GET /v1/me.
- Binary data output on render operations for downstream nodes (S3, email, Telegram, disk).
- Signed URL output as JSON for templates that update as parameters change.
- n8n verification acceptance so the node appears for the no-code audience.

## Constraints

- Depends on the Shotium API's account, credits and rate limit (60 requests per minute); the node is a client, not the renderer.
- Billing honesty: renders bill only on success; quota exhaustion returns an error instead of auto-charging — the node must surface that.
- The repo states n8n 1.0+ compatibility; older self-hosted instances are out of scope.
- The capture names no roadmap beyond the node itself; Google sign-in work lives in the main Shotium repo.

## Design Direction

See `DESIGN.md` for this project's design tokens.
