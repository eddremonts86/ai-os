---
id: "3011"
slug: tsampi-bft-leaderless-one-round-voting-with-parameteriz
title: "Tsampi BFT – Leaderless One-Round Voting with Parameterized Finality [pdf]"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49340061"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# Tsampi BFT – Leaderless One-Round Voting with Parameterized Finality [pdf]

## Tech Stack

- **Reference implementation:** TypeScript. Picked for readability over performance; the artifact is meant to be read, not benchmarked.
- **Simulation harness:** Plain Node, no test runner beyond `node:test` for the property checks. Deterministic RNG seeded per run so a reader can reproduce any fault scenario.
- **Visualization:** Svelte for the step-through UI, served as a static bundle.
- **Walkthrough page:** Static HTML rendered from a Markdown source, with inline code blocks.
- **Hosting:** Any static host for the visualization and walkthrough. No backend, no auth.

## Architecture

The reference implementation is a pure TypeScript module with no I/O. The simulation harness imports it, drives `n` nodes, injects `f` faults, and records the message trace. The visualization reads a JSON trace from the harness and renders it as a step-through table. The walkthrough is a static page.

```
Paper (PDF)
   |
   |--- reference impl (TypeScript, pure)
   |
   |--- simulation harness (Node, deterministic)
   |       \
   |        trace JSON
   |         \
   |          Svelte visualization (static bundle)
   |
   |--- walkthrough page (static HTML)
```

Nothing ships to production. The harness, the visualization, and the walkthrough all run locally or on a static host.

## Milestones

1. **M0 — Scaffold:** TypeScript repo, `node:test` configured, a single end-to-end run with `n=4, f=1` that finalizes.
2. **M1 — Reference implementation:** Port the algorithm from the paper into readable TypeScript; each protocol step is a small named function.
3. **M2 — Simulation harness:** Loop over `(n, f)`, inject a configurable fault model, record the full message trace, verify finality invariants.
4. **M3 — Step-through visualization:** Svelte UI that loads a trace JSON, lets the reader step or play, shows per-node state at each step.
5. **M4 — Parameter explorer:** Slider or input for `n` and `f`, runs a fresh simulation, displays whether the protocol finalized.
6. **M5 — Walkthrough:** Static page summarizing the paper in plain language alongside the code, with a "do not use as a library" disclaimer.

## Risks

- **Misinterpretation of the paper.** A bad read of the algorithm ships as a reference implementation. Mitigation: every step is a small named function that can be checked against the paper line by line; the README cites the paper version.
- **Visualization drift.** The visualization can lag the implementation. Mitigation: a test that renders a known trace and asserts the visualization's finality row matches.
- **Reader misreads artifact as production code.** Mitigation: top-of-README and package-metadata disclaimer; no `package.json` field that would let a downstream project install it.
