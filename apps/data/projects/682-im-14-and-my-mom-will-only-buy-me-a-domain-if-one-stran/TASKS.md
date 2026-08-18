---
id: "682"
slug: im-14-and-my-mom-will-only-buy-me-a-domain-if-one-stran
title: "I'm 14 and my mom will only buy me a domain if one stranger actually pays for my app."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vpskax/im_14_and_my_mom_will_only_buy_me_a_domain_if_one/"
category: saas
date: "2026-08-16"
tags: [saas, education, consumer, anti-cheat]
tech: [Next.js, TypeScript, ProseMirror, Supabase, Cloudflare R2, Stripe]
---
## Phase 0: Scaffold

- [ ] Create `apps/682-im-14-and-my-mom-will-only-buy-me-a-domain-if-one-stran/` (Next.js + TypeScript)
- [ ] Initialize git with `.gitignore` excluding essay recordings
- [ ] Write SPEC.md and the matching DESIGN.md tokens (editor + replay visual identity)
- [ ] Set up ProseMirror with a custom keystroke-capture wrapper
- [ ] Provision Supabase: auth, the replay manifest store, the credits ledger
- [ ] Wire Cloudflare R2 for replay artifact storage and the signed-URL generator
- [ ] Configure the RFC 3161 public-timestamp service for tamper-evident anchoring
- [ ] Set up Stripe in test mode

## Phase 1: Core

- [ ] ProseMirror editor with a custom contenteditable wrapper that captures every keystroke
- [ ] Paste detection (paste events + clipboard snapshot)
- [ ] Idle-gap analysis (no typing for > N seconds flagged)
- [ ] Typing-cadence analysis (WPM variance over time)
- [ ] 5 verification methods (paste spikes, idle gaps, cadence anomalies, edit ratios, window-focus changes)
- [ ] Hash-chain of replay events signed with a per-essay key
- [ ] RFC 3161 public-timestamp anchoring
- [ ] Replay UI: keystroke-by-keystroke reconstruction
- [ ] Signed replay URL (Cloudflare R2 + signed URL)
- [ ] Stripe paywall (free / $4.99 monthly / $29.99 annual)

## Phase 2: Deploy

- [ ] Coolify deployment
- [ ] Beta with 50 high-school and undergraduate students
- [ ] Outreach to 20 high-school teachers for feedback on the replay link
- [ ] Post-mortem at week 9
