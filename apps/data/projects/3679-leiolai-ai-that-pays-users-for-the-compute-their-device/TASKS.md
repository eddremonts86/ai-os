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

## Phase 0: Scaffold

- [x] Capture problem from HackerNews Show HN + write SPEC.md skeleton
- [ ] Decide the model format and quantization that fits the 11M-context claim on a phone (llama.cpp gguf vs Core ML vs a custom kernel) and document the chosen path
- [ ] Provision NATS JetStream cluster and TimescaleDB instance (single-node to start, replica later)
- [ ] Stand up the Rust coordinator crate with tonic, tokio, NATS, and the `axum` gateway stub
- [ ] Apple Developer account + iOS app shell (Swift) with the llama.cpp XCFramework linked
- [ ] Google Play Console + Android app shell (Kotlin) with the llama.cpp JNI wrapper linked
- [ ] Operator-billed payout integration account (provider and country list chosen) and a sandbox for the first region

## Phase 1: Core

- [ ] gRPC contract between coordinator and devices: `EnqueueJob`, `StreamTokens`, `AcceptToken`, `DeviceHeartbeat`, with a stable version field on every message
- [ ] Coordinator placement: pick the lowest-latency idle device with a chip tier that can run the model, retry on timeout, hand off on stream break from the last accepted token
- [ ] iOS runtime: load the `leiolai-1` gguf, stream partial tokens to the coordinator over QUIC, persist accepted-token ledger locally and reconcile on reconnect
- [ ] Android runtime: same path as iOS, swap Swift/Kotlin, share the protobuf definitions, run a cross-platform coordinator integration test
- [ ] Axum `/v1/chat/completions` and `/v1/completions` returning SSE streams; OpenAI message schema accepted; token-bucket rate limit per API key
- [ ] Prepaid-credit ledger (developer balance, top-up via Stripe, deduction on stream start with a usage reconciliation on stream end)
- [ ] TimescaleDB schema: `job_events` hypertable with `job_id`, `device_id`, `accepted_tokens`, `rejected_tokens`, `billed_amount`; a nightly reconciliation job that flags any job where billed != accepted within tolerance
- [ ] Consumer-side credit accrual and the first $5 in-app-credit ledger, no payout flow yet
- [ ] Device-drop test: a developer request that runs across 3 devices (handoff mid-stream) reconciles to the developer-billed token count exactly
- [ ] End-to-end test: developer hits `/v1/chat/completions`, receives a streamed completion, billing is debited, the device that served the job sees its chip-tier progress advance

## Phase 2: Deploy

- [ ] Move prepaid top-up from Stripe test mode to live mode with KYC on the coordinator entity
- [ ] Switch the consumer app from TestFlight / internal testing track to public beta in two storefronts
- [ ] Onboard the first 1,000 active devices through invite-only links and watch p50 / p99 first-token latency daily
- [ ] Public status page (inference availability, job completion rate, billing reconciliation lag) and an on-call rotation for the coordinator
- [ ] Post-mortem after week 24 with a published device-coverage matrix and a published per-token economics table
