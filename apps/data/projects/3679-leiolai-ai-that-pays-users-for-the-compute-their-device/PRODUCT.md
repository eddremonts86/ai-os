---
id: "3679"
slug: leiolai-ai-that-pays-users-for-the-compute-their-device
title: "Leiolai, AI that pays users for the compute their devices provide"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49485913"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
wtp:
  raw: "$0.01 per 1M input tokens, $0.02 per 1M output tokens"
  currency: USD
  min: 0.01
  max: 0.02
  period: one-shot
  mrrMid: 0
tech: [Swift (iOS), Kotlin (Android), Rust core, gRPC, NATS, TimescaleDB]
---
# Leiolai, AI that pays users for the compute their devices provide

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A developer gets `leiolai-1` — an 11M-context model with continuous generation and no output cap — at $0.01 per 1M input tokens and $0.02 per 1M output tokens, served through a familiar OpenAI-compatible API. A phone owner gets paid for the compute their device already has, with no card required and a chip-tier system that unlocks more concurrent jobs over time. The two sides are the same product: the developer is buying tokens the consumer is selling.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indie developer integrating `leiolai-1` | Wants long-context inference without paying the hyperscaler floor; $0.01/$0.02 per 1M is meaningfully cheaper than the cheapest managed alternative. |
| Phone owner on iOS or Android | Has a device that sits idle most of the day and wants a no-card, no-KYC way to monetize it; the chip-leveling system gamifies the contribution. |
| Independent AI researcher | Needs an 11M-context model with continuous generation for workloads (long-document QA, multi-file refactors, full-codebase summarization) that mainstream providers either truncate or refuse. |
| AI labs watching the cost curve | Indirectly: a working consumer-side compute market is direct evidence on whether the data-center floor is structural or historical. |

## Jobs To Be Done

1. **Functional job — developer** — Run long-context completions through an OpenAI-shaped endpoint without rewriting existing client code and without paying more than the floor price.
2. **Functional job — phone owner** — Earn small per-token payments from a phone that is already in a pocket, with no onboarding friction beyond the app install.
3. **Emotional job — developer** — Stop feeling locked out of frontier context windows because the bill is unpredictable when the model streams continuously.
4. **Emotional job — phone owner** — Feel the device is "doing something" rather than burning battery for an ad network.
5. **Social job — both sides** — Be part of a visible alternative to the data-center model; the chip-tier display in the app and the developer dashboard's "served from N consumer devices" counter both carry this signal.

## Success Metrics

- **Activation (developer):** first successful streamed completion against `/v1/chat/completions` within 5 minutes of API key creation.
- **Activation (consumer):** first chip tier reached (≥ 1,000 accepted tokens) within 7 days of install.
- **Completion rate:** ≥ 95% of developer requests return a complete stream without coordinator-side retry; ≥ 99% within 24h via background handoff.
- **Token economics:** the median device earns more in credits per hour than it spends in battery cost, measured at the device's local electricity tariff.
- **Network density:** ≥ 1,000 active contributor devices online during the developer's working hours in at least one timezone before paid marketing is considered.
- **Latency:** p50 first-token latency ≤ 2.5s on a developer request when a warm device is available; p99 handoff latency ≤ 8s.

## Pricing & Monetization

Developer pricing is fixed by the poster at $0.01 per 1M input tokens and $0.02 per 1M output tokens, billed against prepaid credit. The first $5 of consumer earnings is paid in app-credit only (withdrawable to operator-billed mobile balance); beyond $5, payouts require SMS verification and route to the same operator rails. The coordinator takes the spread between what developers pay and what devices earn; that spread is not published because it is the unit-economics moat.

## Competitive Landscape

- **OpenAI / Anthropic / Google managed APIs** — the price floor the poster is undercutting; long-context tiers are expensive and output is usually capped.
- **Together.ai / Fireworks / Groq** — cheaper managed endpoints but still data-center bound and still truncated on long contexts.
- **BitTensor / Akash / Render network** — distributed GPU marketplaces that rent dedicated hardware; they price per GPU-hour, not per token, and the entry cost is a wallet and a willingness to debug container schedulers.
- **Petals / distributed-LLM volunteer projects** — academic distributed inference experiments that run well in a paper and poorly as a product because there is no developer surface and no payment to the volunteer devices.

## Risks & Open Questions

- [ ] Whether 11M-token context actually runs to completion on consumer phone RAM, or whether the poster's claim assumes an aggressive quantization that the model card does not document.
- [ ] Whether the $0.01/$0.02 price is sustainable once the network has to compensate devices for actual battery and wear cost, or whether this is a launch-price that drifts up as the device-side economics become visible.
- [ ] Whether the chip-leveling system can be tuned to encourage off-peak contribution (when the developer's latency tolerance is highest) without paying enough that the device stays awake at night.
- [ ] Whether OpenAI-compatible shape is enough of a wedge to attract developers, or whether the product also needs a hosted-fallback tier for the requests where the device network is too thin to serve.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49485913) · **Category:** show-hn · **Tags:** Show HN, Product, Problem
