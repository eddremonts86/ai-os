---
id: "546"
slug: i-spent-200-testing-ugc-ad-tools-but-they-expected-engi
title: "I spent $200 testing UGC ad tools, but they expected engineering-level prompting"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9490/i_spent_200_testing_ugc_ad_tools_but_they/"
category: saas
date: "2026-08-14"
tags: [saas, ai, video-generation, ugc, marketing]
tech: [Next.js, TypeScript, Veo, Topaz, Cloudflare R2, Cloudflare Workers, Stripe]
---
# I spent $200 testing UGC ad tools but they expected engineering-grade prompting

## Phase 0: Scaffold

- [ ] Create `apps/546-i-spent-200-testing-ugc-ad-tools-but-they-expected-engi/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding brand assets
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (creative-studio visual identity)
- [ ] Provision the Veo 3.1 Lite + Flash API endpoints
- [ ] Set up Topaz upscaling integration
- [ ] Configure Cloudflare R2 for brand asset storage with per-tenant isolation
- [ ] Wire Stripe for the Pro tier ($49/month)

## Phase 1: Core

- [ ] Per-shot UI controls: lighting (relight), surface (replace), angle (recompose), voiceover script
- [ ] Visible agent state: per-shot progress, current frame, next frame, "pause and edit" affordance
- [ ] Brand-asset upload: logo, palette, product packshots
- [ ] Cost estimate shown before render; hard cap at the per-render setting
- [ ] Render queue: 1080p MP4 output, vertical + horizontal + square variants
- [ ] Free tier: 2 renders/month at 720p with watermark

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 30 paying founders via IndieHackers and r/SaaS
- [ ] 90-day Veo / Topaz pricing-change monitoring
- [ ] Post-mortem at week 10
