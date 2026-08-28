---
id: "3176"
slug: use-glm-53-in-cursor-today-via-tokengo-api
title: Use GLM-5.3 in Cursor today via tokengo API
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49454595"
category: show-hn
date: "2026-08-26"
tags: [Show HN, AI, Developer Tools, Inference, API]
tech: [Cloudflare Workers, OpenAI-compatible proxy, GLM-5.3 weights (hosted), Cursor settings]
---
# Use GLM-5.3 in Cursor today via tokengo API

## Problem

GLM-5.3 is generating buzz as the next strong open-source coding model with weights dropping imminently, but the poster wants to test it where the work actually happens — inside their IDE. Rather than wait for native Cursor support, they mapped GLM-5.3 to TokenGo by swapping the base URL and pointing the Cursor model dropdown at it. The backend uses Cloudflare for edge routing to keep latency low, which matters for inline code completions where the user is staring at a spinner.

## Objective

Ship a hosted, OpenAI-compatible inference endpoint for GLM-5.3 (and a `glm-5.3-flash` variant) that any IDE with custom-base-URL support — Cursor first, but also Continue, Cody, and JetBrains AI Assistant — can use immediately, with low per-token latency at the edge.

## Target Users

- Primary: individual developers who want to try GLM-5.3 inline in their existing IDE workflow without standing up local inference hardware.
- Secondary: small teams whose developers are already on Cursor / Continue / Cody and want a managed alternative to self-hosting a 70B+ coding model.

## MVP Scope

- OpenAI-compatible `/v1/chat/completions` and `/v1/models` endpoints backed by GLM-5.3 (and `glm-5.3-flash`).
- Edge routing on Cloudflare Workers so requests land at a geographically close GPU region.
- Setup docs for Cursor: OpenAI API key field, base URL override, model name `z-ai/glm-5.3`, dropdown selection.
- Equivalent setup notes for Continue, Cody, and one JetBrains AI client (whichever the poster confirms first).
- A free trial key issuance path for high-volume production testers (as the post promises).
- Out of scope: model fine-tuning, BYO weights, non-OpenAI-compatible endpoints.

## Design Direction

The product surface is mostly docs and a dashboard: a usage graph, an API key manager, and a "drop-in base URL" snippet for each supported IDE. The landing page is one paragraph: "point your IDE here, use the GLM-5.3 model name." No marketing chrome; the IDE screenshot is the demo.

## Constraints

- Latency must be competitive with the IDE's default provider for inline completions — measured at the 95th percentile, not the median.
- API must be OpenAI-API-compatible so any client that already supports base-URL overrides works without code changes.
- Model weights, if hosted on TokenGo's own infra, must come from a verifiable upstream source.
- The free trial key path must be self-serve; no manual approval loop for the first key.
