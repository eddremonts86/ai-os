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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

**One-liner:** A reference implementation and step-through visualization of the Tsampi BFT consensus paper, so a reader can run the protocol, change `(n, f)`, and watch leaderless one-round finality happen.

The product is an artifact, not a SaaS. Someone who finds the paper on `tsampi.com` and wants to actually understand the parameterized finality claim can open this MVP, run a small simulation with default parameters, change the number of nodes or the fault budget, and see when the protocol still finalizes and when it does not. The value is closing the gap between "I read the paper" and "I saw the protocol behave under a specific `(n, f)`."

## Target Users

| Stakeholder | Why they care |
|---|---|
| Grad students and self-taught readers | Want a runnable artifact next to the paper so they can internalize the algorithm instead of just trusting the prose |
| Distributed-systems engineers benchmarking protocols | Want a readable, minimal reference implementation they can compare against PBFT, HotStuff, Tendermint |
| The paper's author | Wants a single link to share with reviewers and readers that says "here, try it" |

## Jobs To Be Done

1. **Functional job** — Read the Tsampi paper, then run the protocol in a simulator with the same `(n, f)` and observe the message flow.
2. **Emotional job** — Move from "this is a clever result on paper" to "I have seen this protocol behave."
3. **Social job** — Be able to cite or link to a runnable artifact in a discussion, instead of asking readers to take the paper on trust.

## Success Metrics

- **Run-to-understanding:** A first-time reader can launch the simulator, run with default `(n=4, f=1)`, and reach the finality screen within five minutes.
- **Parameter exploration:** The parameter explorer is used at least three times per session by 50% of visitors who complete the first run.
- **Walkthrough readability:** A small qualitative check (3–5 readers) reports the walkthrough explains the paper's main contribution without requiring the paper open in another tab.
- **Honesty metric:** The README prominently carries the "education, not production" disclaimer, and is read by every visitor before they reach the simulator (tracked as a click-through on the landing page).

## Pricing & Monetization

Free in v1. No monetization path is assumed.

## Competitive Landscape

Source gives no competitive signal. There are well-known reference implementations of related protocols (PBFT, HotStuff, Tendermint) but the source does not name a comparable product, and naming one without warrant would be invention.

## Risks & Open Questions

- **Source gives almost no signal about intent.** The post is a PDF link; the framing as a reference implementation is the author's best inference. Mitigation: be explicit in the README that the artifact is a complement, not a substitute, for the paper.
- **Misuse as a production library.** A reader might mistake the reference implementation for a deployable consensus engine. Mitigation: a top-of-README disclaimer plus a "do not import" note in the package metadata.
- **Step-through visualization complexity.** A good step-through can become a maintenance burden. Mitigation: keep the visualization thin — a single table of node states — and resist the urge to make it pretty.
- **Paper updates.** If the paper changes, the reference implementation must follow. Mitigation: pin the implementation to a specific paper version in the README.

---

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49340061) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
