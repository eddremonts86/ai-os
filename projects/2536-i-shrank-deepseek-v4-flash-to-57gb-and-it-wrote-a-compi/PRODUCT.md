---
id: "2536"
slug: i-shrank-deepseek-v4-flash-to-57gb-and-it-wrote-a-compi
title: I shrank DeepSeek V4 Flash to 57GB and it wrote a compiler on my Mac
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49321813"
category: show-hn
date: "2026-08-16"
tags: [Show HN, Product, Problem]
---
# I shrank DeepSeek V4 Flash to 57GB and it wrote a compiler on my Mac

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I built a specialized package of DeepSeek V4 Flash 0731 (originally 284B total parameters, 13B active), preserving reasoning, tool calling and coding capabilities:https://huggingface.co/steadfastgaze/DeepSeek-V4-Flash-0731-...I let it write a minimal C compiler targeting ARM64, then test the result with Fibonacci and FizzBuzz programs, and it succeeded in less than 1 hour, with the full recording at:https://youtu.be/XiwSilmV8B0You can run it on Silicon Macs with my engine https://github.com/steadfastgaze/MoEspresso,
while one of the core libraries developed to obtain this result is available at https://github.com/steadfastgaze/mlx-iqk.The above recording was on a 128GB memory MacBook M3 Max, but you can also run it on 32GB MacBooks with a very usable context (128K tokens) and projected 5 tok/s. I did try it on a fanless 16GB memory MacBook Air M1 (1.39 tok/s), but unfortunately the available context was very small.How:
- First, efficient quantisation: mlx-iqk takes advantage of IQ_K tensor encoding, more efficient than the ones available via llama.cpp or barebones MLX, originally designed by Iwan Kawrakow - I also changed the layout to a k-contiguous one, to make it faster, at least in this Metal setup.- Second, expert pruning: each of the 40 learned-router layers had 256 experts, and not all of them are equally important for the coding use cases. I removed 80B parameters - this is a known technique called REAP, shared at https://www.cerebras.ai/blog/reap.- Third: balancing the cheapest IQ1_S_R4 tensor encoding (~1.5 bits per weight), selectively promoting projections to IQ2_KS or IQ2_K where the measured error reduction justified the bytes.One of the main ideas was not only to save relevant knowledge, but also to not make it forget how to... stop thinking, how to use reasoning. In the first experiments, it would sometimes reason for thousands of tokens without closing its thinking section, or it would go in loops.Then I solved this by heavily weighting tool-calling traces and structured reasoning in the calibration mix.

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

_Source:_ [ProblemHunt](https://news.ycombinator.com/item?id=49321813) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
