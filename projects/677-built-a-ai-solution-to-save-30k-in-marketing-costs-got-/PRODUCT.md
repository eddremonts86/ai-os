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

> Product brief for the blog-to-video pipeline described in the source post.

## Value Proposition

A content marketer or indie hacker can turn one blog post into one explainer video in under 5 minutes at a per-video cost well below the $300-500 human-editor quote and well below the $3/minute off-the-shelf AI video providers — with output that does not look generic-AI-generated.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Indie hackers and founders | Primary traffic source is written content; cannot afford to translate every post into a $300-500 human-edited video. |
| B2B SaaS content marketers | Run a doc → video pipeline at scale. |
| SEO / GEO consultants | Package a "video repurpose" upsell for clients. |
| Solo creators | Want to publish on YouTube Shorts / TikTok / LinkedIn video without learning video editing. |

## Jobs To Be Done

1. **Functional job** — Turn a blog URL or document into a 2-4 minute explainer video.
2. **Functional job** — Produce output that does not look generic-AI-generated.
3. **Emotional job** — Stop feeling like every SaaS explainer video looks the same.
4. **Social job** — Look like a serious content operation without the budget of one.

## Success Metrics

- **Activation:** first video rendered within 7 days of signup.
- **Retention:** at least 5 videos rendered per active user per month.
- **Cost ceiling:** ≤ $1.00 per video on default settings (ElevenLabs + image-gen + stock).
- **Quality:** ≥ 50% of generated videos are published as-is without manual editing.

## Pricing & Monetization

Free tier: 3 videos/month at 720p with a watermark. Paid at $19/month: 20 videos, 1080p, no watermark. Pro at $49/month: 100 videos, custom templates. Business at $99/month: unlimited, white-label.

## Competitive Landscape

- **Human video editors** — $300-500 per video; the cost basis the source post is anchored against.
- **Synthesia / HeyGen** — AI avatar-based; not blog-to-video.
- **Off-the-shelf AI video providers** — $3/minute of generated video; generic-AI-looking output.
- **Pictory / Lumen5** — blog-to-video; weaker on the human-style template.

## Risks & Open Questions

- [ ] Per-video cost must stay under $1.00; each pipeline stage has its own cap.
- [ ] The configurable human-style templates are the moat; without them the product is a worse Pictory.
- [ ] ElevenLabs voiceover is the most expensive stage; must be skippable and replaceable with BYO TTS.
