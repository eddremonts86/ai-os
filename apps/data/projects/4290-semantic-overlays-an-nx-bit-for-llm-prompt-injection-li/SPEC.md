---
id: "4290"
slug: semantic-overlays-an-nx-bit-for-llm-prompt-injection-li
title: Semantic Overlays – an NX bit for LLM prompt injection (live demo)
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49525220"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Semantic Overlays – an NX bit for LLM prompt injection (live demo)

## Problem

I've built a new method for steering LLMs called Semantic Overlays, small trained adapters on a frozen model which change how its perceives a piece of its context. The most readily applicable usage is to mitigate prompt injection, and it lets us take a very-injectable Qwen-3.5-9B to SOTA scores on all the prompt injection benchmarks I could find. (They are only blackbox attacks, but I did NOT train on anything like them — whitebox attacks are out of scope for this paper)I'm excited for you to play with the tech — see if YOU can break it! (let me know if you can)Paper at https://arxiv.org/abs/2608.23873 if you want to read more about it, code at http://github.com/JoshuaSP/semantic-overlays, adapters at http://huggingface.co/joshuapenman/semantic-overlays-adapter...Also https://x.com/joshua_s_penman/status/2094823990472884389 if you wanna watch a little video I made!

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
