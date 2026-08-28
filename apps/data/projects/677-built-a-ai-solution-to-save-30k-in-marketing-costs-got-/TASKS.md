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
## Phase 0: Scaffold

- [ ] Create `apps/677-built-a-ai-solution-to-save-30k-in-marketing-costs-got-/` (Next.js + TypeScript)
- [ ] Initialize git, add `.gitignore` excluding the render-worker state
- [ ] Write SPEC.md and the matching DESIGN.md tokens (URL → video visual identity)
- [ ] Provision the Remotion render-worker Docker image and the serverless queue
- [ ] Wire ElevenLabs API key, Pexels + Pixabay stock-footage keys, and the Stability AI image-gen key
- [ ] Configure the per-stage inference-cost caps (ElevenLabs, image gen, stock footage)
- [ ] Set up Cloudflare R2 for input crawl data + output videos; Stripe in test mode

## Phase 1: Core

- [ ] Web app skeleton (Next.js + TypeScript) with URL / document upload input
- [ ] Blog parser: HTML extraction → structured manifest (key points, suggested stock footage, voiceover script)
- [ ] Remotion render worker (Docker image, CPU-bound, ≤ 8 GB RAM per render)
- [ ] ElevenLabs voiceover integration with a BYO-TTS config switch
- [ ] Stock footage fetch via Pexels + Pixabay APIs
- [ ] Image generation via Stability AI
- [ ] Per-stage inference-cost caps (ElevenLabs, image gen, stock footage) shown in the UI before commit
- [ ] Configurable human-style templates
- [ ] Credit ledger + Stripe paywall (free / $19 / $49 / $99)

## Phase 2: Deploy

- [ ] Coolify deployment of the web app and the render-worker queue
- [ ] 200-indie-hacker closed beta via r/SaaS and IndieHackers
- [ ] Post-mortem at week 12
