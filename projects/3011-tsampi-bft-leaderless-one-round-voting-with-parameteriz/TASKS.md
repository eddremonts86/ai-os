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

## Phase 0: Scaffold

- [ ] Create project folder `apps/3011-tsampi-bft-reference/`
- [ ] Initialize a TypeScript repo with `node:test` configured
- [ ] Add a minimal harness that runs `n=4, f=1` and asserts the protocol finalizes once
- [ ] Add the "education, not production" disclaimer at the top of the README
- [ ] Wire design tokens from DESIGN.md into the planned Svelte visualization (placeholder page only)

## Phase 1: Core

- [ ] Read the Tsampi BFT paper end-to-end and write a one-page plain-language summary as a Markdown file in the repo
- [ ] Implement the reference algorithm in TypeScript, one named function per protocol step, with comments that cite the paper section
- [ ] Add the simulation harness: loop `(n, f)`, inject faults from a chosen fault model (silence, equivocation, vote-flip), record the full message trace
- [ ] Add finality-invariant assertions: at the end of a trace, all honest nodes agree on the same value
- [ ] Build the step-through visualization in Svelte: load a trace JSON, render a per-node state table, step / play controls
- [ ] Build the parameter explorer: a form for `n` and `f` that runs a fresh simulation and shows whether the protocol finalized
- [ ] Write the walkthrough static page (HTML rendered from Markdown) with inline code blocks
- [ ] Wire a regression test that runs a known trace through the visualization and asserts the finality row matches
- [ ] Run the artifact with three external readers (grad student, distributed-systems engineer, author) and log feedback before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Deploy the visualization and walkthrough to a static host
- [ ] Wire CI: `node:test` runs the simulation harness on every push
- [ ] Pin the reference implementation to a specific paper version in the README
- [ ] Verify the deployed visualization loads a known trace end-to-end
