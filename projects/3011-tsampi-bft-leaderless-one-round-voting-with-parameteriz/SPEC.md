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

## Problem

The captured post is a Show HN submission pointing only at a PDF on `tsampi.com`. The title describes the paper's contribution: a Byzantine Fault Tolerant (BFT) consensus protocol that is leaderless, settles in a single round of voting, and exposes parameterized finality — meaning the trade-off between latency and the failure threshold `f` is explicit in the protocol's parameters. The post contains no narrative, no use-case description, no audience claim, and no code. There is no evidence in the source that the author intends a runnable product rather than a paper release. Any MVP framing here is therefore an *educational* / *reference-implementation* framing, not a claim that the source asked for one.

## Objective

Build a small reference implementation and a written companion walkthrough of the Tsampi BFT paper. The reference implementation runs the protocol on a single machine across simulated nodes, exposes the message flow as a step-through animation, and lets a reader swap in different `(n, f)` parameters and watch how the protocol behaves. The companion walkthrough is a static, citable page that summarizes the paper in plain language next to the algorithm. The MVP is not a production consensus library; it is a learning artifact that lets one person read the paper and immediately try it.

## Target Users

- A graduate student or self-taught reader who saw the Show HN post and wants to actually understand the protocol before citing it.
- A distributed-systems engineer who is benchmarking consensus protocols and wants a quick, readable reference implementation to compare against PBFT / HotStuff / Tendermint.
- The paper's author, who gets a runnable artifact to point reviewers and readers at.

## MVP Scope

- A reference implementation of the Tsampi BFT protocol in a single language (TypeScript), structured so the leaderless one-round voting flow is readable end-to-end.
- A simulation harness that runs `n` simulated nodes, injects `f` Byzantine faults from a chosen fault model, and verifies that the protocol finalizes.
- A step-through visualization (in the browser) that shows each node's vote in each step, the quorum calculation, and the finality call.
- A written walkthrough page that summarizes the paper in plain language alongside the code: problem statement, the parameterized trade-off, and the proof sketch (informally).
- A small parameter explorer where the reader changes `(n, f)` and sees how the protocol still finalizes or fails to.
- No production-grade crypto, no networking, no real Byzantine adversary — the simulator injects faults programmatically.

## Design Direction

Design direction for the MVP at `https://www.tsampi.com/tsampi-bft-1.0.pdf` follows the constraints in `3011-.../SPEC.md`. The visual language is research-tool-flavored: dense diagrams, monospace labels, a single accent for the "finality" state.

**Color** — neutral background, one accent reserved for the finality state, one muted accent for fault markers.

**Type** — one display family for headings, one text family for prose, one mono family for code and message traces.

**Density** — high. The step-through visualization is meant to be read like a figure, not a card.

**Motion** — only the step controls (next/prev/play). The visualization is otherwise static.

## Constraints

- The reference implementation is for education, not production. The README says so prominently.
- The MVP does not ship a consensus library for use in other projects. The code is structured to be read, not imported.
- No real cryptography. Signatures, hashes, and message authentication are abstracted.
- The MVP does not claim to extend or improve the paper; it documents what the paper already says.
