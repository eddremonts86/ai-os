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

## Problem

The poster open-sourced ModelMRI (github.com/muhammadmahadazher/ModelMRI), a tool to look inside a local LLM, VLM, or robot policy while it runs. The HN post body gives no further detail beyond the repo.

## Objective

Inspect the internal state of a local model (LLM, VLM, or robot policy) while it is running.

## Target Users

Researchers and engineers debugging or interpreting local model behaviour, without sending data to a hosted service.

## MVP Scope

Open-source tool that hooks into a local model run and surfaces internal signals (activations, attention, action distributions) for inspection.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Each model type exposes different internals; covering LLMs, VLMs, and policies on day one is a wide surface.
