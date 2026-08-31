---
id: "3860"
slug: tinysandbox-js-runtime-js-in-wasm-in-v8
title: Tinysandbox-JS-Runtime - JS in WASM in v8
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500882"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, WebAssembly, Embedded v8 JavaScript runtime, Per-isolate sandboxing, Cloudflare Workers support, WASM size optimization]
---
# Tinysandbox-JS-Runtime - JS in WASM in v8

## Value Proposition

Run isolated JavaScript anywhere WASM runs. The tinysandbox JS runtime ships as WASM at a 1 MiB baseline with about 0.69 MiB per isolate, so sandboxed JS executes in the browser, on Cloudflare Workers and in Convex v8 actions — inside a Linux-like sandbox with no containers, no VMs and no host access, built for AI agents that run code.

**One-liner:** Isolated JS in WASM in v8, runnable anywhere WASM runs.

## Target Users

| Stakeholder | Why they care |
|---|---|
| AI agent framework builders | A secure runtime for agent-executed code without containers. |
| Workers and serverless teams | Sandboxed JS on Cloudflare Workers and Convex v8 actions. |
| Browser tooling developers | Isolated JS in the browser via the WASM runtime. |

## Jobs To Be Done

1. **Functional job** — Execute JS in an isolated WASM sandbox from Rust or NodeJS.
2. **Functional job** — Deploy the same sandbox to the browser, Cloudflare Workers and Convex v8 actions.
3. **Functional job** — Keep baseline WASM at 1 MiB and per-isolate overhead around 0.69 MiB.
4. **Functional job** — Guarantee no host access: no containers, no VMs, nothing escapes the sandbox.

## Success Metrics

- **WASM size:** baseline at 1 MiB and per-isolate near 0.69 MiB, maintained across releases.
- **Target coverage:** the runtime loads and runs on the browser, Workers and Convex v8 actions.
- **Isolation integrity:** zero host-access escapes reported.
- **Adoption:** crate and npm package usage across agent frameworks.

## Pricing & Monetization

None stated. Open source (MIT OR Apache-2.0) as a Rust crate and npm package; no commercial offering appears.

## Competitive Landscape

The post does not name competitors. The category is sandboxed runtimes for AI agents and untrusted code (container and VM based sandboxes, WebAssembly runtimes); tinysandbox's stated difference is the combination: a Linux-like shell and filesystem plus a JS runtime in one Rust crate, with per-isolate WASM overhead measured in sub-MiB.

## Risks & Open Questions

- [ ] The 1 MiB and 0.69 MiB numbers are the poster's own; sustained size discipline as features land is unproven.
- [ ] v8-in-WASM performance on Workers and Convex is bounded by each platform's WASM support.
- [ ] Security claims (no host access) need independent review; a sandbox escape would be existential.
- [ ] Multiple targets mean multiple test matrices (browser, Workers, Convex) to keep green.
- [ ] The README targets AI agents specifically; whether the runtime fits general use is untested.
