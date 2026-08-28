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

## Problem

A SaaS founder with a creative studio planned inside their GTM product tried to create UGC-style videos and product ads. Tested Creatify (~$100) and Runway (~$100); output was good but the prompt-engineering burden was brutal — getting the AI to understand exactly what the founder wanted felt like a job in itself. Creatify's agent generated a script that literally mentioned "Creatify" when making an ad for the founder's product. Runway solved another problem (visibility into the creative process) but cost escalated on the more powerful models. The founder built their own with Veo 3.1 Lite + Flash for generation and Topaz for upscaling, achieving similar quality for ~$10 in generation cost per batch. They are wondering if there is actually a product here — a simple creative studio where you do not need engineering-grade prompting, you can see what the agent is doing, and you have enough control to fix things. The implicit product: a focused UGC / product-ad creative studio with visible intermediate state, prompt-free control, and predictable cost.

## Objective

Define the MVP scope for a UGC + product-ad creative studio that uses Veo + Topaz (or similar) under the hood, exposes a non-prompt UI for the per-shot controls (lighting, surface, angle), and shows the agent's intermediate state so the user can intervene before the final render.

## Target Users

- **Primary:** solo SaaS founders and indie hackers running paid acquisition who need to produce UGC ads weekly without a video editor or an engineering-grade prompt.
- **Secondary:** small marketing teams at sub-50-person SaaS companies running product-ad creative in-house.
- **Tertiary:** agencies preparing product-ad creative for clients.

## MVP Scope

- Per-shot UI controls: lighting (relight), surface (replace), angle (recompose), voiceover script.
- Visible agent state: per-shot progress, the current frame, the next frame, with a "pause and edit" affordance.
- Brand-asset upload: logo, palette, product packshots used as references.
- Cost estimate shown before render; hard cap at the per-render setting.
- Render queue: 1080p MP4 output, vertical + horizontal + square variants.
- Free tier: 2 renders/month at 720p with watermark. Pro at $49/month: 20 renders, 1080p, no watermark, brand asset library.
- Excluded in v1: script writing, A/B test automation, platform-specific format optimisations, multi-language voiceover.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single creative surface — per-shot controls on the left, the visible agent state in the centre, the render queue on the right. No marketing-site chrome; the product is the shot.

## Constraints

- Per-render cost must stay under $2.00 at default settings; runaway Veo / Topaz usage will eat margin.
- The visible agent state must refresh at least every 2 seconds; a hidden agent is the failure mode the user is escaping.
- Brand-asset references must not be uploaded to a third-party training set; BYOK or per-tenant isolation is the safety net.
