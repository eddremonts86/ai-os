---
id: "2458"
slug: how-do-you-keep-54-llm-workflows-on-the-right-models
title: How do you keep 54 LLM workflows on the right models?
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49262312"
category: ask-hn
date: "2026-08-11"
tags: [Ask HN, Problem]
---
# How do you keep 54 LLM workflows on the right models?

## Problem

I have a Django app with 54 LLM-backed workflows. Up until recently I've exclusively used Anthropic models via AWS Bedrock but just set up OpenRouter to test the new Gemini models given they seem to match Sonnet/Haiku intelligence but with 3-5x output speed. I'm using Pydantic AI for validation/normalization.I currently maintain a registry that describes a workflow's purpose, what we're optimizing for (intelligence, speed, cost), its eval, and a human-readable bar that must be achieved.I'm curious what strategies/systems people are using to keep track of everything and ensure an optimal model is being used for a given workflow.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
