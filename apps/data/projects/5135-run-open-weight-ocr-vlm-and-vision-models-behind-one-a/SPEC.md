# SPEC.md — Run open-weight OCR, VLM and vision models behind one API

## Problem

Hey HN. We built an openai-compatible API for running open-weight VLMs, OCR VLMs and ViT-based vision models.<p>The motivation was mostly frustration when running these models in production and discovering all the details around serving VLMs, especially around visual accuracy.<p>A few footguns we kept running into:<p>- quantized models served under the same name (this one still drives me nuts): providers often serve models with different quants, environments, vLLM&#x2F;SGLang serving params with the same model-id. Vision is especially sensitive to this; some quants that look fine on text benchmarks noticeably hurt OCR&#x2F;small-text&#x2F;spatial accuracy.<p>- video performance is varied: when we tested with popular routers on video-native VLMs, more than 80% of providers didn&#x27;t support video inputs, and even fewer let you control FPS. If you care for time-resolution in videos, none of these providers work even if the models themselves are capable of it.<p>- document inference is all pipelining: rasterizing PDFs, parallelizing page workers, retrying when pages fail inference, dealing with rate-limits, etc can get tricky quickly and takes substantial developer time.<p>- standardization making abstractions leaky: this is less about vision per-se, but generally for serving models with high-quality output assurances. context-limits, max resolution, FPS sampling, quants, GPU SM architecture, can all add variability to (vision) quality even if the model-id claims to be the same.<p>We wanted one place to run OCR models, VLMs and ViTs that we could confidently use for our own internal agents and evals. The gateway was born from this need internally, and now we&#x27;re opening it up to the public - you can swap the model name to compare GLM-OCR, dots.mocr, PaddleOCR VL, Qwen3.8-27B, Gemma4-26B-A4B etc. We handle the serving&#x2F;runtime&#x2F;pipelining underneath, with the goal of giving high-quality visual intelligence.<p>Are there any other vision &quot;footguns&quot; people have run into? especially cases where &quot;same model&quot; across two providers gave materially different outputs.<p>Try different models on Gateway simply by updating the model name:<p>uvx vlmrun gw chat &lt;doc&gt;.pdf -m glm-ocr<p>uvx vlmrun gw chat &lt;doc&gt;.pdf -m deepseek-ocr-2<p>uvx vlmrun gw chat &lt;doc&gt;.pdf -m pp-ocrv6<p>uvx vlmrun gw chat &lt;video&gt;.mp4 -m qwen&#x2F;qwen3.5-0.8b -p &quot;describe the video&quot;

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49568379)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T18:31:25Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
