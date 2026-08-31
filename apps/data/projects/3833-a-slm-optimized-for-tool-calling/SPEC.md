---
id: "3833"
slug: a-slm-optimized-for-tool-calling
title: A SLM Optimized for Tool Calling
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49493085"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Small language model tuned for tool calling, JSON schema decoding, TrustedRouter hosting, tool-call pipeline harness, per-token metered API, router-side integration]
---
# A SLM Optimized for Tool Calling

## Problem

The capture is a URL-only Show HN: the post body is just a link to a Neurometric blog announcement, and the product claim sits in the title — "A SLM Optimized for Tool Calling". The linked post states the specifics: a task-specific small language model that "turns intent into valid, schema-bound tool calls", live on TrustedRouter at $0.01 per million input tokens and $0.10 per million output tokens. Its argument: tool selection is a narrow, structured problem that does not need frontier models, context accumulation is 80-90% of agent spend, and moving tool selection to a small model drops per-turn cost 70-90% and shortens multi-step latency.

## Objective

Sell and serve a cheap, specialized SLM whose only job is turning intent into valid, schema-bound tool calls — routing tool selection off frontier models for teams building multi-turn agents.

## Target Users

- Agent teams paying frontier-model prices for tool selection.
- Developers routing through TrustedRouter who can swap the model per call type.
- Agent-framework builders needing schema-reliable tool calls with low latency.

## MVP Scope

- The SLM hosted on TrustedRouter with a tool-calling endpoint.
- JSON-schema-bound tool call output.
- Metered pricing at the stated $0.01/$0.10 per million tokens.
- A comparison path: route tool-calling traffic at it and compare against current models.

## Constraints

- The capture is URL-only; all specifics come from the linked blog and are the vendor's own claims.
- The 80-90% spend and 70-90% savings figures are the vendor's, not independently benchmarked.
- The model does one thing — tool calling — and is not a general assistant.
- Availability is bound to TrustedRouter, the stated hosting path.

## Design Direction

See `DESIGN.md` for this project's design tokens.
