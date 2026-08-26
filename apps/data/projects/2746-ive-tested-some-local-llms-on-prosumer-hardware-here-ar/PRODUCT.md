---
id: "2746"
slug: ive-tested-some-local-llms-on-prosumer-hardware-here-ar
title: "I've tested some local LLMs on prosumer hardware, here are some findings"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49410310"
category: ask-hn
date: "2026-08-23"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I've tested some local LLMs on prosumer hardware, here are some findings

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I have been benchmarking local LLMs on a Mac M4 Pro 24 GB RAM using LM Studio. I've tested mostly with 4-bit quantization, both MLX and GGUF, from 4b to 35b models, with speeds of 3 to 40 tokens/second.Results briefly:- fast small model -> extraction/classification- Gemma -> summarization- gpt-oss -> transcript consultation- large Qwen -> difficult reasoning/code interpretationThere wasn't a single best LLM for all tasks.Best summarizer:
I took a transcript and asked an LLM to summarize, then graded the summarization.
Gemma 4 e4b was the best and took only 30s. qwen3.6-35b-a3b-ud q2_K_XL took around 2 minutes and incurred in a few omissions.Best "answerer from files" (RAG):
I added some transcript files and asked questions about facts that should be grounded on the files.
gpt-oss-20b answered questions perfectly in about 4s. BTL 4 Compact and Gemma 4 e4b did too but took around a minute.Best PII identifier:
I asked to identify names of people and organizations plus PII (emails, phones, etc) in a text file.
Qwen 3 4B MLX (not a thinking model) took less than 3s. Others were good too: BTL 4 Compact, Gemma 4 e4b, Qwen 3.5 9b 4-bit - but they took between 11s and 30s.Best "code interpreter":
I gave a class file and asked an LLM to identify certain methods and result values and tell whether the code would compile and run.
Qwen 3.8 27B was by far the best at difficult code interpretation, but at the cost of 30 minutes (~5 tok/s). BTL 4 Compact and Gemma 4 e4b took around a minute and responded with a couple of mistakes.I did not test code generation or any other types.In these examples more thinking didn't result in better answers. Some models spent 45 minutes and still got something wrong.Qwen 3.8 27B may need a reasoning budget to make it usable in 24Gb RAM (it was exhausting the context with thinking over and over until I experimented with a budget of 1k tokens).Sometimes a Q2 Qwen 3.6 variant can beat a Q3 variant.I would be interested in comparable test results from other machines, especially Mac Studio, AMD Strix Halo, DGX Spark, and consumer NVIDIA GPUs.What models and workloads are working well for yall?

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49410310) · **Category:** ask-hn · **Tags:** Ask HN,Problem
