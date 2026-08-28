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

## Value Proposition

Watch a local LLM, VLM, or robot policy from the inside while it runs, without shipping the run to a hosted service.

## Target Users

Researchers and engineers debugging or interpreting local model behaviour who need the internals and cannot send the data anywhere.

## Jobs To Be Done

- See activations and attention while a prompt is actually being processed
- Inspect a robot policy's action distribution at the moment it acts
- Do this locally because the model or the data cannot leave the machine

## Success Metrics

- Model families successfully hooked without custom per-model code
- Overhead the instrumentation adds to a run
- Repository clones and issues from people running their own models

## Competitive Landscape

LLM observability tools (LangSmith, Helicone) exist, but the source does not name any direct competitor that exposes live internals of local LLM/VLM/robot-policy models.

## Risks & Open Questions

- LLMs, VLMs, and policies expose different internals; the post does not say how one tool spans them
- Live inspection competes with inference throughput for the same GPU
- Surfacing an activation is not the same as making it interpretable
