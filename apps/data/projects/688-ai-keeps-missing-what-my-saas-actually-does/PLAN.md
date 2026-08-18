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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Scraper:** Playwright + a depth-crawl BFS, with robots.txt and rate-limit respect.
- **Feature-to-problem mapper:** Anthropic Claude, called per scraped page; output is a structured manifest.
- **Video synthesizer:** Remotion + ElevenLabs voiceover + stock-footage providers + AI image generation.
- **Storage:** Cloudflare R2 for the input crawl data and the output videos.
- **Backend:** Supabase (auth + the manifest store + the credit ledger).
- **Payments:** Stripe.

## Architecture

Web app + Supabase + R2 + a serverless scraper + the video synthesizer. The scraper writes to R2; the manifest is stored in Supabase; the synthesizer reads both.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-URL demo with placeholder output. End of week 1.
2. **M1 — Depth-crawl scraper + manifest.** End of week 4.
3. **M2 — Video synthesizer (Remotion + ElevenLabs).** End of week 7.
4. **M3 — Stripe paywall + branding.** End of week 9.

## Risks

- **Scraper quality** — the feature-to-problem mapper must surface buried differentiators; if it regresses to homepage-copy, the product fails its quality bar.
- **Inference cost** — every render triggers multiple Claude calls; the per-video cost must stay under $2.00.
