---
tags: ["saas", "creator", "chrome-extension", "ai"]
tech: ["Next.js", "TypeScript", "Chrome Extension MV3", "Anthropic Claude", "Supabase", "Stripe"]
id: "543"
slug: i-wrote-a-simple-script-to-automate-my-keywording-and-i
title: "I wrote a simple script to automate my keywording, and it accidentally turned into a full app."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9quq/i_wrote_a_simple_script_to_automate_my_keywording/"
category: saas
date: "2026-08-14"
---
# I wrote a simple script to automate my keywording and it became a Chrome extension

## Phase 0: Scaffold

- [ ] Create `apps/543-i-wrote-a-simple-script-to-automate-my-keywording-and-i/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding user-uploaded images
- [ ] Write SPEC.md (this document) and the matching DESIGN.md tokens (drop-zone visual identity)
- [ ] Provision Supabase: auth, keyword history, per-user confidence thresholds
- [ ] Set up the Chrome extension (manifest v3, TypeScript)
- [ ] Configure the Anthropic Claude API key and per-image inference-cost cap

## Phase 1: Core

- [ ] Drag-and-drop a batch of images
- [ ] AI keyword generation (Anthropic Claude, one call per image)
- [ ] EXIF write that preserves all existing metadata
- [ ] Per-keyword confidence score shown in the UI
- [ ] Chrome extension: manifest v3, EXIF reader, agency-side pre-fill
- [ ] Free tier: 50 images/month
- [ ] Stripe paywall: Pro at $9/month (1,000 images + bulk + confidence thresholds)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] Chrome Web Store submission
- [ ] First 100 microstock contributors via r/microstock and r/stockphotography
- [ ] Post-mortem at week 7
