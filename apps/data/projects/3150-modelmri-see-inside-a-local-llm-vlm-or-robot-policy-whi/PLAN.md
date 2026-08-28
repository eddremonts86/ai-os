---
id: "3150"
slug: modelmri-see-inside-a-local-llm-vlm-or-robot-policy-whi
title: "ModelMRI – see inside a local LLM, VLM or robot policy while it runs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447785"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# ModelMRI – see inside a local LLM, VLM or robot policy while it runs

## Tech Stack

Python with framework-level forward hooks, because that is where a running model's internals are reachable, plus a local streaming UI so inspection happens during the run rather than over a dump afterwards.

## Architecture

Hooks attach to named modules of a loaded model and emit tensors on a local stream that a viewer consumes live. The design constraint is throughput: capture has to be selective and downsampled, otherwise instrumentation changes the behaviour being observed.

## Milestones

1. Hook one local LLM and stream activations live
2. Local viewer for activations and attention
3. Extend to a second model type and measure overhead
4. Public repo with per-model-type instructions

## Risks

- Each model type has its own internals; wide coverage on day one is a broad surface
- Capture overhead can slow or distort the run being inspected
- Streaming full tensors is heavy; selection and downsampling decide usability
