---
id: "4180"
slug: ai-startup-trustedrouter-raises-125m
title: AI startup TrustedRouter raises $1.25M
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510283"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# AI startup TrustedRouter raises $1.25M

## Problem

Third-party LLM routers sit between the user and every model provider. That gives them visibility into every prompt, every completion, and every key a developer trusts them with, which is more exposure than most teams are comfortable handing to a closed-source middleman. Existing benchmarks posted by big labs are useful but opaque: the community cannot tell which models were tested, which prompts were skipped, or how results were aggregated, so a "winning" score on a vendor chart does not always reflect what a real product would see in production.

## Objective

Ship a privacy-respecting AI routing layer (TrustedRouter) with a wider provider and model catalog than existing routers, paired with a public, crowdsource-funded evaluation marketplace (AnyEval) where the community can fund specific benchmarks, pay a few cents to grade individual problems, and surface head-to-head model comparisons that the providers themselves do not publish.

## Target Users

- Independent developers and small teams who need multi-model access without trusting a closed-source router with their API keys and traffic.
- Researchers, journalists, and AI-safety hobbyists who want to run and fund targeted evaluations (e.g. jailbreak propensity, censorship behaviour) without paying for a full benchmark out of pocket.
- Provider-agnostic application builders who want one endpoint, one SDK, and a way to add new models the day they ship rather than waiting for a router to integrate them.

## MVP Scope

- A routing API that fronts a broader catalog of providers and models than OpenRouter, with provider keys held client-side or in the user's own vault rather than centrally aggregated.
- A skills layer that recommends which model to use for a given task based on declared constraints (cost, latency, capability).
- AnyEval: a public site where anyone can run, fund, or co-own a benchmark; pay-per-problem pricing that lets a community pool pennies to cover a full eval.
- Two flagship evaluations as proof: HoneyPot bench (a recreation of the Hugging Face incident scenario to measure escape/self-exfiltration tendencies) and Freedom bench (a measure of Chinese-style censorship, separated into provider-monitoring vs. model-weight components).
- Head-to-head comparison view: pick model A and model B, see side-by-side answers on shared prompts, see win rates on shared benchmarks.
- Web UI for browsing providers, models, evals, and individual problem results; no mobile app in v1.

## Design Direction

Design direction for the MVP at `https://news.ycombinator.com/item?id=49510283` follows the constraints in `4180-.../SPEC.md` and the chosen stack (React, TypeScript, Node.js API, SQLite, Coolify, Docker). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for both developers and researchers.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for provider/model catalogs and eval result tables; generous spacing for landing/marketing surfaces.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Must not centralize provider API keys: each developer supplies their own keys or routes through their own vault, and the platform never logs prompt or completion payloads.
- Benchmark results must record which model, which prompt version, and which scorer ran them, so the community can audit and replicate.
- AnyEval pricing must be granular enough that a single contributor paying a few cents can fund part of an eval without paying the whole thing.
- The catalog must include at least as many providers and models as OpenRouter at parity, otherwise the headline value proposition collapses.
- v1 runs on a single Coolify deployment with SQLite via Drizzle; horizontal scaling deferred until evaluation traffic warrants it.
