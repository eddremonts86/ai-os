---
tags: ["saas", "ai", "video-generation", "marketing"]
tech: ["Next.js", "TypeScript", "Playwright", "Anthropic Claude", "Remotion", "ElevenLabs", "Cloudflare R2", "Supabase", "Stripe"]
id: "688"
slug: ai-keeps-missing-what-my-saas-actually-does
title: AI keeps missing what my SaaS actually does
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vppqhm/ai_keeps_missing_what_my_saas_actually_does/"
category: saas
date: "2026-08-16"
---## Phase 0: Scaffold

- [ ] Create `apps/688-ai-keeps-missing-what-my-saas-actually-does/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding scraped customer data and rendered videos
- [ ] Write SPEC.md and the matching DESIGN.md tokens (URL → demo video visual identity)
- [ ] Build the Playwright depth-crawl BFS scraper with robots.txt + rate-limit respect
- [ ] Wire the Anthropic Claude feature-to-problem mapper endpoint
- [ ] Provision the Remotion video synthesizer (ElevenLabs + stock footage + image gen)
- [ ] Set up Cloudflare R2 for crawl data + output videos; Stripe in test mode

## Phase 1: Core

- [ ] Web app skeleton (Next.js + TypeScript)
- [ ] Playwright depth-crawl BFS scraper (respect robots.txt + rate limits)
- [ ] Feature-to-problem mapper (Anthropic Claude, per scraped page) with structured manifest output
- [ ] Manifest store (Supabase)
- [ ] Remotion video synthesizer (ElevenLabs + stock footage + AI image gen)
- [ ] 1080p / 720p export presets
- [ ] Credit ledger + Stripe paywall (free / $49 / $499)
- [ ] Custom branding support (logo, colour, font)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] First 10 paying SaaS marketing teams (target: 10 videos / month each)
- [ ] Post-mortem at week 9
