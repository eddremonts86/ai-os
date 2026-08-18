---
id: "688"
slug: ai-keeps-missing-what-my-saas-actually-does
title: AI keeps missing what my SaaS actually does
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vppqhm/ai_keeps_missing_what_my_saas_actually_does/"
category: saas
date: "2026-08-16"
tags: [saas, ai, video-generation, marketing]
tech: [Next.js, TypeScript, Playwright, Anthropic Claude, Remotion, ElevenLabs, Cloudflare R2, Supabase, Stripe]
---
# AI keeps missing what my SaaS actually does

> Product brief for the depth-crawl SaaS demo video generator scoped in the source post.

## Value Proposition

A SaaS marketing team can turn their own website into a demo video in under 10 minutes — with the buried differentiators (the Slack integration, the customer quote about the Asana problem) highlighted instead of the generic "boost productivity" copy.

## Target Users

| Stakeholder | Why they care |
|---|---|
| SaaS marketing teams | Need demo videos for landing pages, sales decks, and social. |
| Indie hackers and solo founders | Want a demo video without learning video editing. |
| SaaS sales teams | Need a custom demo video per prospect. |

## Jobs To Be Done

1. **Functional job** — Generate a demo video from the SaaS website.
2. **Functional job** — Surface the buried differentiators, not the homepage copy.
3. **Emotional job** — Stop feeling like every SaaS demo video says the same thing.

## Success Metrics

- **Activation:** first video rendered within 7 days of install.
- **Retention:** at least 3 videos rendered per active team per month.
- **Quality:** ≥ 60% of generated videos are used as-is without manual editing.

## Pricing & Monetization

Free tier: 1 video/month, 720p, watermark. Paid at $49/month: 10 videos, 1080p, no watermark, custom branding. Enterprise at $499/month: unlimited videos, white-label, sales-team workflow.

## Competitive Landscape

- **Synthesia / HeyGen** — AI avatar-based; do not crawl the customer's site.
- **Loom / Vidyard** — recording-based; do not crawl.
- **Off-the-shelf AI video providers** — produce generic output; do not surface buried differentiators.

## Risks & Open Questions

- [ ] The depth-crawl + feature-to-problem mapper is the moat; if the quality regresses, the product becomes a worse Synthesia.
- [ ] The per-video inference cost must stay under $2.00; runaway inference cost will eat the margin.
