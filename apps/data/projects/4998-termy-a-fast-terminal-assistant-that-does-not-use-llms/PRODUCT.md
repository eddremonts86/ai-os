---
id: "4998"
slug: termy-a-fast-terminal-assistant-that-does-not-use-llms
title: TERMy – A fast terminal assistant that does not use LLMs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49562219"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# TERMy – A fast terminal assistant that does not use LLMs

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I love research and development, you may have heard of me because of PJON (Padded Jittering Operative Network). It is a network protocol I started developing in 2010, which was recently implemented in silicon by the ETH Zurich university thanks to the research of Pius Sieber.I am excited to share with you TERMy, a terminal assistant built on top of the NPC-Forge framework. Unlike everything else being built today, TERMy does not use embeddings, machine-learning or LLMs. It runs on the CPU (even on a Raspberry Pi Zero) both in the terminal or client-side in a browser tab and responds in milliseconds. It is a cynical but very knowledgeable Linux terminal assistant that translates your natural language into shell commands without relying on a single artificial neuron.I had a chance to focus for 2 months on my personal projects since early July, during the strange times of AI price hikes and the end of subsidized tokenmaxing. I was curious to see if I could develop from scratch a terminal assistant capable of handling simple natural language requests. I have a bad memory and got used to ask to copilot "activate the virtual environment" or similar trivial operations spending a non negligible sum every month. I started thinking, maybe I can do something to make my workflow more efficient? Do I really need trillions of parameters to accomplish those tasks?How it WorksWhen you type a prompt, it goes through a lightweight NLU pipeline written in ~1000 lines of Python that implement the following steps:1. Strip expletives, interjections, encouraging, discouraging and thanking words (remove noise)2. Sentiment analysis3. Exact Match (very fast)4. Template Match (slower)5. Probabilistic Match (even slower)Step 5 relies on:1. IDF (Inverse Document Frequency) to identify rare words.2. BOW (Bag Of Words) to accommodate word inversions.3. IDF weighted Levenshtein to safely handle typos.Permission gating is hardcoded into the dataset and enforced for all potentially destructive commands, so it's inherently safer than letting an unpredictable LLM run wild on your machine.- TERMy in operation: https://www.youtube.com/watch?v=qeIp0xePLBg- Variance and typo tolerance: https://www.youtube.com/watch?v=tQvGDk6fkk0- Copilot integration: https://www.youtube.com/watch?v=Wzzouhq2a8A- Advanced features: https://www.youtube.com/watch?v=qeIp0xePLBg- Source Code: https://github.com/gioblu/NPC-Forge

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49562219) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
