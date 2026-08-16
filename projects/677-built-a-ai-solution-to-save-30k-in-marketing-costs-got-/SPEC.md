---
id: "677"
slug: built-a-ai-solution-to-save-30k-in-marketing-costs-got-
title: "Built a AI solution to save $30K in marketing costs, got paid $4K instead (Proof attached)"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vptqll/built_a_ai_solution_to_save_30k_in_marketing/"
  captured: "2026-08-16"
category: saas
date: "2026-08-16"
tags: [saas, ai, content-marketing, video-generation]
scores:
  money: 7.5
  learn: 5.5
  fun: 6.5
tech: [Remotion, ElevenLabs, Next.js, TypeScript, Cloudflare R2]
---
# Built a AI solution to save $30K in marketing costs, got paid $4K instead (Proof attached)

## Problem

A technical agency owner was sourcing clients through written blogs, but the channel was not scaling because audiences had moved to video. A human video editor quoted $300-500 per video to translate blog posts into explainer videos — unaffordable at the volume the agency needed. The off-the-shelf AI video providers they tried charged $3 per minute of generated video (~$180/hr) and produced generic AI-video-looking output that did not match the technical depth of the source posts. The founder built an internal pipeline that combines Remotion-rendered templates, ElevenLabs voiceover, stock footage, and AI-generated images, configurable per template so the result looks like a human editor made it. The pipeline generates a 3-minute explainer video from a blog URL or document upload in about 3 minutes at a cost of roughly $0.6 per video. The product has been live long enough to earn roughly $4K in additional revenue with minimal ongoing effort.

## Objective

Ship a self-serve SaaS that lets content marketers and indie hackers turn one blog post into one explainer video in under 5 minutes at a per-video cost well below the $300-500 human-editor quote and well below the $3/minute off-the-shelf AI video providers. The MVP has to produce output that does not look generic-AI-generated — that is the visible quality bar the source post sets. Pricing is per-video with a generous free tier; subscription is the long-term shape.

## Target Users

- **Primary:** indie hackers, founders, and small agencies whose primary traffic source is written content (dev blogs, technical Substacks, niche newsletters) and who have tried but cannot afford to translate every post into a $300-500 human-edited video.
- **Secondary:** in-house content marketers at B2B SaaS companies running a doc → video content pipeline, and SEO/GEO consultants packaging a "video repurpose" upsell for their clients.
- **Tertiary:** solo creators who want to publish on YouTube Shorts / TikTok / LinkedIn video without learning video editing.

## MVP Scope

- Input: blog URL or pasted Markdown / document upload.
- Render: configurable human-style template (the founder's "configurable human templates" are the moat) plus stock-footage fetch, AI image generation, ElevenLabs voiceover, Remotion composition, and an H.264 export at 1080p.
- Output: 1080p MP4, typically 2-4 minutes, vertical/horizontal/square variants from one render.
- Per-video cost cap: ≤ $1.00 of model + API spend at default settings (ElevenLabs + image-gen + stock); shown to the user before render.
- Free tier: 3 videos/month at 720p with a watermark; paid tiers at $19/month (20 videos, 1080p, no watermark), $49/month (100 videos, custom templates), $99/month (unlimited, white-label).
- Web app only in v1; no API, no mobile, no team workspace, no scheduled batch.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single content-first surface where the user pastes a URL, sees the parse preview, picks a template, and watches a progress bar. No marketing-site chrome inside the app; the product is the URL bar + the preview.

## Constraints

- Per-video cost must stay under $1.00 on default settings or the unit economics break; each pipeline stage has its own cost cap and the UI shows the running total before commit.
- ElevenLabs voiceover is the most expensive stage — must be skippable (paste your own audio) and replaceable (BYO TTS provider) without a fork.
- Remotion rendering is CPU-bound; a single render must not exceed 8 GB of RAM on the worker so the same template works on a $5/mo VPS and on the SaaS renderer.
- The output must not look like generic AI video: configurable human-style templates (per-founder-template) and stock-footage-first composition are the only mitigation until the underlying model aesthetics catch up.
