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

## Tech Stack

- **Edge layer:** Cloudflare Workers in front of the GPU backend; they terminate TLS, parse the OpenAI chat completion schema, and forward to the nearest GPU region.
- **Inference backend:** A GPU provider (RunPod / Lambda / Together) running vLLM or TensorRT-LLM with GLM-5.3 weights.
- **API surface:** OpenAI-compatible `/v1/chat/completions`, `/v1/models`, `/v1/embeddings` (if supported by the model).
- **Auth + metering:** API keys signed at the edge; usage metered per token and per request, rolled up to a Postgres ledger.
- **Dashboard:** small Next.js app for key management, usage graphs, and IDE-specific setup snippets.

## Architecture

```
Cursor / Continue / Cody
        │
        ▼
Cloudflare Worker (TLS, schema check, rate limit)
        │
        ▼
Regional GPU pool (vLLM serving GLM-5.3 / glm-5.3-flash)
        │
        └─▶ usage ledger (Postgres) ──▶ dashboard
```

The Worker is the only piece the IDE talks to; the GPU pool address is hidden. Streaming responses use SSE so the IDE sees tokens as they arrive. Per-key rate limits are enforced at the Worker so a noisy key never reaches the GPU.

## Milestones

1. **M0 — vLLM + GLM-5.3 standing up.** Single GPU region, no edge, OpenAI schema compatibility confirmed with `curl`. End of week 1.
2. **M1 — Cloudflare Worker proxy.** Edge routing, streaming, per-key rate limit. End of week 2.
3. **M2 — Cursor setup docs + dashboard.** Key issuance, usage graph, copy-paste Cursor config. End of week 3.
4. **M3 — Continue / Cody / JetBrains docs.** Same setup pattern, IDE-specific screenshots. End of week 5.
5. **M4 — Multi-region GPU pool.** At least one US and one EU region, latency measured per region. End of week 8.

## Risks

- **Model licence.** Hosted inference may not be permitted under all open-weight licences; legal review before going to GA.
- **GPU cost vs IDE traffic.** Inline completions fire on every keystroke pause; per-token pricing must cover the GPU minute cost or the unit economics fail.
- **Latency regression at scale.** A multi-tenant GPU pool sees noisy-neighbour latency spikes; per-key routing to a less-loaded replica is a known mitigation.
- **Abuse.** OpenAI-style keys are routinely shared on Discord; soft caps and credit-card-on-file thresholds for higher tiers are the standard answer.
