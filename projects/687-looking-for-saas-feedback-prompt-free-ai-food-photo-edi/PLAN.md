---
tags: ["saas", "ai", "image-editing", "food"]
tech: ["Next.js", "TypeScript", "Stable Diffusion XL", "IC-Light", "Cloudflare R2", "Supabase", "Stripe"]
id: "687"
slug: looking-for-saas-feedback-prompt-free-ai-food-photo-edi
title: "Looking for SaaS feedback: prompt-free AI food photo editor with credit-pack pricing"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpq803/looking_for_saas_feedback_promptfree_ai_food/"
category: saas
date: "2026-08-16"
---
# Looking for SaaS feedback: prompt-free AI food photo editor with credit-pack pricing

## Tech Stack

- **Web app:** Next.js + TypeScript + Tailwind CSS.
- **AI layer:** inpainting + relighting models (e.g. Stable Diffusion XL inpaint, IC-Light for relighting), called per-edit.
- **Storage:** Cloudflare R2 for the input + output photos.
- **Backend:** Supabase (auth + the credit ledger + the export presets).
- **Payments:** Stripe (one-time credit packs).

## Architecture

Web app + Supabase + R2 + the AI inference layer. The four UI controls map to four inference pipelines; the credit ledger debits per export.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + a single-edit demo with one of the four controls. End of week 1.
2. **M1 — All four controls + export presets.** End of week 4.
3. **M2 — Credit ledger + Stripe packs.** End of week 6.
4. **M3 — Niche positioning landing page + outreach to food marketers.** End of week 8.

## Risks

- **AI inference cost** — every export triggers at least one inference call; the credit pack must price above inference cost.
- **Niche drift** — adding text-prompt mode or expanding to "all restaurant owners" would dilute the differentiator.
