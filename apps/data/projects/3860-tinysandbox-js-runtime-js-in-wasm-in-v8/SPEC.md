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

## Problem

The poster (dangoodmanUT) announces that Tinysandbox's WASM-based JavaScript runtime now runs wherever Rust or NodeJS runs — making it possible to run isolated JS anywhere WASM runs, including the browser, Cloudflare Workers and Convex v8 actions. The post gives concrete numbers: the baseline WASM dropped from 4 MiB to 1 MiB, and each isolate costs about 0.69 MiB. The project's README frames tinysandbox as an ultra-minimal, Linux-like sandbox for AI agents — a shell, coreutils, filesystem and a secure JS runtime in a single Rust crate, with no containers, no VMs and no host access. A browser demo lives at tinysandbox-browser-example.pages.dev.

## Objective

Make the isolated JS runtime portable to every WASM host: shrink the baseline binary, keep per-isolate overhead near the stated 0.69 MiB, and keep the sandbox's no-container, no-VM, no-host-access guarantees intact on browsers, Workers and serverless v8 runtimes.

## Target Users

- AI agent builders who need a safe runtime for agent-written code without containers or VMs.
- Platform teams running untrusted JS on Cloudflare Workers or Convex v8 actions.
- Developers embedding a JS runtime in browser-side tooling (the demo site is the proof point).

## MVP Scope

- The WASM JS runtime callable from Rust and NodeJS.
- Isolated JS execution in the browser, Cloudflare Workers and Convex v8 actions.
- Baseline WASM at 1 MiB and per-isolate overhead around 0.69 MiB, per the post's numbers.
- The no-host-access guarantee: filesystem, shell and coreutils stay inside the sandbox.

## Constraints

- All claims are the poster's own; the 1 MiB and 0.69 MiB numbers come from his post, not independent benchmarks.
- The sandbox is for AI agents per the README; general-purpose browser scripting is not the stated goal.
- WASM targets (browser, Workers, Convex) each impose their own runtime constraints the sandbox must respect.
- Size claims are a moving target as features land; the MVP must keep them honest.

## Design Direction

See `DESIGN.md` for this project's design tokens.
