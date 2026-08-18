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
# Looking for SaaS feedback: prompt-free AI food photo editor with credit-pack pricing

## Problem

The poster has built GridMenu, a prompt-free AI food photo editor for B2B food marketers. Users upload a real dish photo, apply controlled edits through UI buttons (not text prompts), and export usable assets for menus, delivery platforms, and social media. The MVP controls are intentionally narrow: choose lighting, replace tabletop surface, replace studio backdrop, remove garnishes. The intended users are menu designers, food marketers, social media managers, ghost kitchens, and freelancers preparing food assets — not broad restaurant owners. The poster is asking for feedback on positioning and pricing, having switched from one model to a credit-pack model. The implicit product: a focused food-photo editor for a B2B2C niche, with prompt-free UI controls that abstract the AI.

## Objective

Define the MVP scope and the credit-pack pricing for GridMenu. The plan treats the source as a working MVP with a clear niche and a pricing question; the focus is on the positioning that fits the niche.

## Target Users

- **Primary:** menu designers, food marketers, and social media managers who need a stream of polished dish photos for menus, delivery platforms, and social.
- **Secondary:** ghost kitchens preparing assets for multiple delivery platforms.
- **Tertiary:** freelancers and agencies preparing food assets for client restaurants.

## MVP Scope

- Upload a dish photo; apply controlled edits via UI buttons: choose lighting, replace tabletop surface, replace studio backdrop, remove garnishes.
- Export at the resolutions and aspect ratios needed for menus, delivery platforms, and social media (1080×1080, 1080×1350, 1920×1080).
- Credit pack: 1 credit = 1 edited export. Free tier: 5 credits on signup. Paid packs: 50 credits for $19, 150 credits for $49, 500 credits for $149.
- Web-first; no mobile, no native editor in v1.
- Excluded in v1: text-prompt mode, batch editing, brand-kit management, team workspace.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single editor surface with the photo on the left, the four UI controls on the right, and the export-format picker at the bottom. Minimal chrome; the product is the photo.

## Constraints

- The prompt-free UI is the differentiator; adding a text-prompt mode would dilute it.
- Credit-pack pricing must reward repeat usage; one-off packs must not feel cheap.
- The four controls (lighting, tabletop, backdrop, garnishes) are the MVP scope; adding more is roadmap, not a promise.
