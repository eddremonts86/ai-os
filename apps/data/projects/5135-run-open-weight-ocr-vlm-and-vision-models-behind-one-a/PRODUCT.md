---
id: "5135"
slug: run-open-weight-ocr-vlm-and-vision-models-behind-one-a
title: "Run open-weight OCR, VLM and vision models behind one API"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49568379"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Run open-weight OCR, VLM and vision models behind one API

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN. We built an openai-compatible API for running open-weight VLMs, OCR VLMs and ViT-based vision models.The motivation was mostly frustration when running these models in production and discovering all the details around serving VLMs, especially around visual accuracy.A few footguns we kept running into:- quantized models served under the same name (this one still drives me nuts): providers often serve models with different quants, environments, vLLM/SGLang serving params with the same model-id. Vision is especially sensitive to this; some quants that look fine on text benchmarks noticeably hurt OCR/small-text/spatial accuracy.- video performance is varied: when we tested with popular routers on video-native VLMs, more than 80% of providers didn't support video inputs, and even fewer let you control FPS. If you care for time-resolution in videos, none of these providers work even if the models themselves are capable of it.- document inference is all pipelining: rasterizing PDFs, parallelizing page workers, retrying when pages fail inference, dealing with rate-limits, etc can get tricky quickly and takes substantial developer time.- standardization making abstractions leaky: this is less about vision per-se, but generally for serving models with high-quality output assurances. context-limits, max resolution, FPS sampling, quants, GPU SM architecture, can all add variability to (vision) quality even if the model-id claims to be the same.We wanted one place to run OCR models, VLMs and ViTs that we could confidently use for our own internal agents and evals. The gateway was born from this need internally, and now we're opening it up to the public - you can swap the model name to compare GLM-OCR, dots.mocr, PaddleOCR VL, Qwen3.8-27B, Gemma4-26B-A4B etc. We handle the serving/runtime/pipelining underneath, with the goal of giving high-quality visual intelligence.Are there any other vision "footguns" people have run into? especially cases where "same model" across two providers gave materially different outputs.Try different models on Gateway simply by updating the model name:uvx vlmrun gw chat .pdf -m glm-ocruvx vlmrun gw chat .pdf -m deepseek-ocr-2uvx vlmrun gw chat .pdf -m pp-ocrv6uvx vlmrun gw chat .mp4 -m qwen/qwen3.5-0.8b -p "describe the video"

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49568379) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
