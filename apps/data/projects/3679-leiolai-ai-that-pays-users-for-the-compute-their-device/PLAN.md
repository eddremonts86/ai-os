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

## Tech Stack

- **Device runtime (iOS):** Swift with the llama.cpp C++ core compiled via XCFramework, Inference Core ML fallback where the model fits, gRPC client over QUIC.
- **Device runtime (Android):** Kotlin with llama.cpp via JNI, NNAPI delegate where supported, gRPC client over QUIC.
- **Coordinator:** Rust service built with tonic (gRPC) and tokio; NATS JetStream as the job bus; horizontal scale behind a stateless load balancer.
- **Telemetry & billing:** TimescaleDB (hypertable on `job_events`) for per-token billing reconciliation; Redis for ephemeral session state.
- **Developer API:** OpenAI-compatible HTTP surface (Rust, axum) that fronts the coordinator with token-bucket rate limiting and a prepaid-credit ledger.
- **Consumer payments:** operator-billed SMS rails (provider-agnostic, region-switched); no card or bank onboarding in v1.

## Architecture

```
                       ┌────────────────────────┐
                       │   Developer (HTTP/SSE) │
                       └───────────┬────────────┘
                                   │ /v1/chat/completions
                                   ▼
                          ┌──────────────────┐
                          │  API gateway     │  (axum, Rust)
                          │  token-bucket RL │
                          │  prepaid ledger  │
                          └─────────┬────────┘
                                    │ enqueue job
                                    ▼
                          ┌──────────────────┐
                          │  Coordinator     │  (Rust, tonic)
                          │  NATS consumer   │
                          │  handoff engine  │
                          └─────────┬────────┘
                                    │ gRPC stream
                ┌───────────────────┼─────────────────────┐
                ▼                   ▼                     ▼
        ┌──────────────┐     ┌──────────────┐      ┌──────────────┐
        │ iOS device   │     │ Android dev. │      │ iOS device   │
        │ (Swift+llama)│     │ (Kotlin+JNI) │      │ (Swift+llama)│
        └──────┬───────┘     └──────┬───────┘      └──────┬───────┘
               │ accepted tokens   │                       │
               └─────────┬─────────┴───────────────────────┘
                         ▼
                  ┌──────────────┐
                  │ TimescaleDB  │  billing events
                  │ + Redis      │  session state
                  └──────────────┘
```

The coordinator owns job placement and handoff but does not run inference itself. A job is a context payload plus a generation request; it is enqueued on NATS, picked up by an idle device, streamed back over a gRPC bidi stream, and reconciled on acceptance. If the device drops, the coordinator re-queues the partial context with a sibling device and resumes from the last accepted token.

## Milestones

1. **M0 — Coordinator skeleton + first device.** Rust coordinator, NATS job bus, axum gateway with one echo endpoint, one iOS device that connects and streams tokens back. End of week 3.
2. **M1 — OpenAI-compatible surface.** `/v1/chat/completions` with SSE streaming, prepaid-credit ledger, per-token billing from device-accepted events into TimescaleDB. End of week 6.
3. **M2 — Android parity.** Same device runtime path on Android; cross-platform coordinator tests; both client runtimes on the same job. End of week 9.
4. **M3 — Handoff and resilience.** Device-drop mid-stream triggers sibling handoff from last accepted token; coordinator-side retry budget caps at 3; a billing-correctness audit reconciles billed vs accepted tokens. End of week 12.
5. **M4 — Consumer payout rails.** Operator-billed SMS verification, first $5 of earnings payable in app-credit, full payout after SMS verify. End of week 15.
6. **M5 — Chip-leveling system.** Tier thresholds encoded in the device client, gate on concurrent job slots, surfaced in the app UI and the developer dashboard. End of week 18.
7. **M6 — Open beta.** 1,000 active devices, public rate limit, pricing as posted ($0.01 / $0.02 per 1M tokens), a published status page. End of week 24.

## Risks

- **Model size on consumer hardware.** A 11M-token context model in any precision that runs end-to-end on a phone is unusual; the most likely failure mode is the model only runs on a subset of devices (recent flagships only), which collapses the supply side of the marketplace. The M0 milestone must report device coverage by RAM tier before any paid traffic.
- **Billing correctness under device drop.** Double-paying a device for tokens the developer never received is a fatal trust event; under-paying a device for tokens the developer already consumed is a fatal supply event. The TimescaleDB reconciliation must be the single source of truth, and the device's local accepted-token log is only a hint.
- **Operator-billed payout reliability.** Operator-billed SMS is the only friction-free rail in many of the poster's likely markets, but it is regulated differently in every country and the per-transaction fee can exceed the payout on small balances. A device earning $0.002 per accepted token cannot cash out until it has accumulated enough to cover the rail fee.
- **Continuous generation with no output cap.** A model that streams indefinitely with no max_tokens is exploitable: a developer can park a long stream on the network and consume device time without paying proportionally. The token-bucket rate limiter must bill on accepted tokens, not on request count, but the device's contribution time is also a real cost and must be priced in — likely a per-second floor on top of per-token billing.
- **No-card onboarding and abuse.** A free-to-install app that pays real money will attract farms of rooted or emulated devices. The chip-tier system has to make farming more expensive than farming is worth, which means earning rate must be a function of proof-of-personhood signals (device attestation, app usage patterns) rather than raw compute delivered.
