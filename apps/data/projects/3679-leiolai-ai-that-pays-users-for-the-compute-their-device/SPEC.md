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

## Problem

Frontier LLM inference is currently bottlenecked by hyperscaler data centers, which concentrate compute, water draw, and capital cost into a few facilities. The Leiolai poster argues that this is unnecessary: consumer hardware sitting idle in pockets can run inference end-to-end if the orchestration layer is built to tolerate heterogeneous, unreliable nodes. The poster's stated proposal is a two-sided product — an iPhone/Android app where users contribute device compute and are paid for it, paired with an OpenAI-compatible API (the model is called `leiolai-1`, claims an 11M-token context window, and supports continuous generation with no output cap) priced at $0.01 per 1M input tokens and $0.02 per 1M output tokens. The consumer app is free, requires no card, and includes a chip-style leveling system that unlocks more compute contribution at no extra cost to the user.

The implicit problem the poster is naming is twofold: (1) ordinary phone owners have unused compute that is never priced or exposed, and (2) AI labs cannot sell inference below a floor set by their own data-center capex, so cheap-and-good inference is structurally scarce. Leiolai's wager is that buying cycles back from the consumer side can break that floor without rebuilding the model.

## Objective

Ship a peer-to-peer inference network where consumer phones run `leiolai-1` and are paid per useful token produced, while developers consume the same model through an OpenAI-compatible endpoint at $0.01/$0.02 per 1M tokens. The MVP must prove the loop end-to-end: a request from the developer API must land on a real consumer device, return a streamed completion, settle a micro-payment to that device, and survive the device dropping off mid-generation.

## Target Users

- Primary: developers integrating `leiolai-1` into a product who care about price per token first and accept that p99 latency and uptime will not match a managed endpoint. The $0.01/$0.02 figure is the wedge.
- Secondary: end-users running the Leiolai mobile app on iOS or Android who want to monetize idle device compute without paying anything upfront. The chip-leveling system is the engagement surface.
- Tertiary: independent researchers and small AI labs who want a 11M-context model with continuous generation for workloads that managed providers either refuse (because of length caps) or price out of reach.

## MVP Scope

- A coordinator service written in Rust that brokers inference jobs to active phones over gRPC streaming, with NATS as the job bus and TimescaleDB for per-job telemetry.
- Native iOS (Swift) and Android (Kotlin) inference runtimes running a quantized `leiolai-1` that streams partial tokens back to the coordinator and survives network drops by handing off the job to another device.
- A device-side credit ledger that accrues per accepted token and supports a mobile payout flow (operator-billed SMS verification, no card, no bank account needed in v1).
- An OpenAI-compatible developer API at `/v1/chat/completions` and `/v1/completions` that returns SSE streams of tokens and bills against a prepaid developer balance.
- A leveling system that gates the maximum concurrent job slots per device based on a chip tier earned from completed jobs.

## Design Direction

See `DESIGN.md` for this project's design tokens. The product has two distinct surfaces: the developer console (terminal-leaning, dark, information-dense) and the consumer app (warm, gamified, chip-meter visible at all times). They share a logo and a credit-unit but not a visual language.

## Constraints

- The poster's stated price is $0.01/$0.02 per 1M tokens; the system must pay contributors enough to keep devices online but not so much that developer revenue cannot cover the coordinator's compute. The economics need to close inside the 11M-context window — longer contexts cannot be billed higher in v1.
- The mobile app must work without a credit card and without forcing the user through KYC for the first $5 of accrued earnings; beyond that, the payout flow falls back to operator billing (SMS-charged) which is the only friction-free rails in most of the poster's likely markets.
- Continuous generation with no output cap must be respected by the rate limiter, which means the coordinator cannot charge by request count — it must charge by accepted token, which means the billing system has to ingest token counts from device runtimes in near-real-time.
- Devices may disconnect at any time; the coordinator must treat the network as eventually consistent and never double-pay or lose a completion that has already been billed to a developer.
