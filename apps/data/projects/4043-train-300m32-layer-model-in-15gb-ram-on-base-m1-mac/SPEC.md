---
id: "4043"
slug: train-300m32-layer-model-in-15gb-ram-on-base-m1-mac
title: Train 300M/32-Layer Model in 1.5GB RAM on Base M1 Mac
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49497451"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Train 300M/32-Layer Model in 1.5GB RAM on Base M1 Mac

## Problem

Hello again! Since my last post about Ullis, the project has gone through several changes as I was searching for the right architecture. As it turned out, KAN and Hyena were quite resource-heavy, and I couldn't get anything viable out of them.
Then I tried RWKV, specifically the latest RWKV-8 Heron version with 1-bit ROSA activation. This ultimately proved to be the most viable architecture of all.
As an example: on my 2020 MacBook Pro M1 with 8GB RAM and a 68GB/s memory bandwidth, I managed to start training a model with ~272 million parameters, a 2048 context length, and 32 layers—all within a 1.5GB memory footprint. On my specific hardware, this is still a highly taxing task. Due to the low bandwidth, the total latency per step is around half a minute, and the throughput drops to about 70 tokens per second.
To be clear right away: I had to keep ROSA SAM on the CPU because it proved to be more efficient for these tasks than the GPU.
Here are the logs as proof:cargo run --release -- train \
 --data data/ullis_dataset.jsonl \
 --run runs/hard \
 --config train_config.json \
 --steps 20000 \
 --learning-rate 0.005 \
 --checkpoint-every 500 \
 --bpe-train-mib 150ullis: token stream compacted to u16 (156 MiB)
ullis: compiling Metal shaders
ullis: Metal ready in 0.2s
ullis: Metal train: LN/QKV/CMix/head on GPU; ROSA SAM on CPU (~603979776 bytes idx+y+out/step)
ullis: starting loop after 379.0s of setup
ullis: clipped SGD lr=0.005 rosa_grad=StopGradBits (QKV frozen; window-mean CE on FP16, token-sum STE on BinaryConnect; |w0|=0.01)
step 1/20000 loss=7.9256 ema=7.9256 p10=5.218 p50=8.193 p90=10.197 unigram=5.958 unique=597 n=1389 flips=0/0/0 (head/cmix/o) embed_grms=6.40e-5 scale_grms=8.09e-3 cmix_vrms=0.013 |w|=0.010 dw=4.37e-6 bias_rms=2.033 resid=3.21e-8 rss=1643MiB 27881ms 73 tok/s
ullis: step 1 phases embed=8ms fwd_ln=370ms fwd_rosa=7220ms fwd_cmix=5897ms head=1070ms bwd_ln=625ms bwd_cmix=9754ms bwd_rosa=2678ms embed_sgd=57ms
step 2/20000 loss=7.0537 ema=7.8384 p10=1.670 p50=7.518 p90=9.969 unigram=5.564 unique=590 n=1520 flips=0/0/0 (head/cmix/o) embed_grms=6.46e-5 scale_grms=1.06e-2 cmix_vrms=0.013 |w|=0.010 dw=4.68e-6 bias_rms=2.033 resid=5.67e-8 rss=1628MiB 27997ms 73 tok/s
ullis: step 2 phases embed=8ms fwd_ln=314ms fwd_rosa=5717ms fwd_cmix=4738ms head=1231ms bwd_ln=786ms bwd_cmix=11755ms bwd_rosa=3180ms embed_sgd=60msWith scaled-down settings, training runs with pretty satisfactory performance.
Here is an example: since a multi-stage training pipeline with pre-training is not implemented yet, I trained it on a large Claude Opus distillation dataset. After 5500 steps, here is the result:cargo run --release -- generate \
 --checkpoint runs/ullis_b1_32m/checkpoint.safetensors \
 --prompt "2+2" \
 --temperature 0.4 \
 --top-p 0.8 Finished `release` profile [optimized] target(s) in 0.60s
 Running `target/release/ullis generate --checkpoint runs/ullis_b1_32m/checkpoint.safetensors --prompt 2+2 --temperature 0.4 --top-p 0.8`
- *No a single = = = = = = i < (r: $=3_x(d: $d = \frac{[b_t + 2>[b_t + 1 + 3-c)$- The correct answer is a list of the number of the first n > 0As you can see, the model is capable of learning, but since I cannot afford to keep my main work laptop running training tasks 24/7, I had to stop at this relatively modest result. There is, of course, a possibility that some training algorithms might have implementation bugs, but this is the current outcome.
I hope you find this project interesting. Honestly, pulling off a project like this entirely on your own is quite tough, especially considering I'm developing it alongside an LLM assistant (which constantly tries to break things). I'm not deeply experienced in this field yet, so I'd be incredibly glad to find testers, people with domain expertise, or anyone willing to share any kind of feedback. Thank you!Link: https://github.com/Vladislav-Kalinkin/ullis

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
