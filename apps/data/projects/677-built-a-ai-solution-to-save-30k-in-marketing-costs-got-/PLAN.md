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

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **Render worker:** Remotion on Node.js (CPU-bound), packaged as a Docker image.
- **Voiceover:** ElevenLabs API (replaceable with BYO TTS via a single config switch).
- **Stock footage:** Pexels + Pixabay APIs.
- **Image generation:** Stability AI or similar.
- **Storage:** Cloudflare R2 for the input crawl data and the output videos.
- **Backend:** Supabase (auth + the manifest store + the credit ledger).
- **Payments:** Stripe.

## Architecture

Web app + a serverless render worker. The web app collects the input (URL or document upload), produces a manifest (key points + selected stock footage + voiceover script), and queues the worker. The worker renders with Remotion and writes the output to R2.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-URL demo with placeholder output. End of week 1.
2. **M1 — Blog parse + manifest.** End of week 3.
3. **M2 — Render worker (Remotion + ElevenLabs + stock footage).** End of week 5.
4. **M3 — Cost caps + per-stage inference budget.** End of week 7.
5. **M4 — Stripe paywall + custom templates.** End of week 9.

## Risks

- **Per-video cost** — must stay under $1.00 on default settings; runaway inference cost will eat margin.
- **Render worker CPU** — Remotion is CPU-bound; a single render must not exceed 8 GB of RAM.
- **Generic-AI aesthetic** — configurable human-style templates are the only mitigation; quality regression = product failure.
