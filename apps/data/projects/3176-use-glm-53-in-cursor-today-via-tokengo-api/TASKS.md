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

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Confirm GLM-5.3 licence permits hosted third-party inference; document in `docs/licence.md`
- [ ] Pick a GPU provider (RunPod vs Lambda vs Together) for the first region; price-shop per GPU-hour for the model size
- [ ] Set up vLLM serving GLM-5.3; confirm OpenAI schema compat with `curl` and with the `openai` Python SDK
- [ ] Cloudflare account + Worker project; pin the deploy pipeline
- [ ] Postgres schema: `api_keys (id, hash, label, created_at)`, `usage (key_id, ts, tokens_in, tokens_out, region)`
- [ ] Dashboard skeleton (Next.js): key list, create key, usage chart, IDE-specific setup snippets

## Phase 1: Core

- [ ] Worker proxy: TLS, schema validation, streaming SSE pass-through, per-key rate limit (e.g. 60 req/min)
- [ ] `glm-5.3` and `glm-5.3-flash` registered in `/v1/models`
- [ ] Token-accurate usage recording: tokens in / out per request, summed hourly
- [ ] Free-tier key issuance path with a per-key monthly token cap
- [ ] Cursor setup doc with screenshots: Settings > Models, OpenAI API key field, base URL override, model name
- [ ] Continue setup doc: `config.json` snippet
- [ ] Cody setup doc: VS Code settings + base URL field
- [ ] JetBrains AI Assistant setup doc: custom provider URL
- [ ] Latency dashboard: p50 / p95 / p99 per region, refreshed every 5 min

## Phase 2: Deploy

- [ ] Multi-region GPU pool: at least US-east and EU-west
- [ ] Pricing page (the post does not state prices — propose per-million-token rates that match GPU cost + margin)
- [ ] Self-serve "request high-volume test keys" form honouring the poster's Show HN offer
- [ ] Status page + incident playbook for GPU outages
- [ ] Post-launch: 30-day review of token usage, latency, and abuse signals to set the next pricing tier
