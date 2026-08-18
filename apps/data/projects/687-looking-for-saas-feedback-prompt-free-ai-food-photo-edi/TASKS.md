---
id: "687"
slug: looking-for-saas-feedback-prompt-free-ai-food-photo-edi
title: "Looking for SaaS feedback: prompt-free AI food photo editor with credit-pack pricing"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpq803/looking_for_saas_feedback_promptfree_ai_food/"
category: saas
date: "2026-08-16"
tags: [saas, ai, image-editing, food]
tech: [Next.js, TypeScript, Stable Diffusion XL, IC-Light, Cloudflare R2, Supabase, Stripe]
---
## Phase 0: Scaffold

- [ ] Create `apps/687-looking-for-saas-feedback-prompt-free-ai-food-photo-edi/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding photo uploads and AI model weights
- [ ] Write SPEC.md and the matching DESIGN.md tokens (food-photo editor visual identity)
- [ ] Provision the AI inference layer: Stable Diffusion XL inpaint + IC-Light relighting endpoints
- [ ] Set up Cloudflare R2 for input + output photos
- [ ] Provision Supabase: auth, the credit ledger, the export-preset metadata
- [ ] Wire Stripe one-time credit-pack pricing (50 / 150 / 500 credits)

## Phase 1: Core

- [ ] Web app skeleton (Next.js + TypeScript)
- [ ] Photo upload + Cloudflare R2 storage
- [ ] Choose lighting control (IC-Light relighting)
- [ ] Replace tabletop surface control (Stable Diffusion XL inpaint)
- [ ] Replace studio backdrop control (Stable Diffusion XL inpaint)
- [ ] Remove garnishes control (Stable Diffusion XL inpaint)
- [ ] Export presets (1080×1080, 1080×1350, 1920×1080) for menus, delivery, social
- [ ] Credit ledger (Supabase)
- [ ] Stripe credit packs (50 / 150 / 500 credits)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] Niche-positioning landing page (menu designers, food marketers, ghost kitchens)
- [ ] Outreach to 20 food-marketing freelancers and 10 ghost kitchens for paid-pack conversion
- [ ] Post-mortem at week 10
