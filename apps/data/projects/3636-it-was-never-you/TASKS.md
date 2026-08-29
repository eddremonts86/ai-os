---
id: "3636"
slug: it-was-never-you
title: It Was Never You
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49481007"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Swift 5.10, SwiftUI, CoreImage, Vision framework, Photos framework, PhotoKit, Sign in with Apple (only if user-driven auth is added)]
---
# It Was Never You

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3636-it-was-never-you/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Scaffold the SwiftUI app target with the first-launch onboarding screen that carries the author's framing
- [ ] Wire the Photos framework permission flow without bypassing the system UI
- [ ] Implement Vision-based face detection in the source photo with a confirmation UI for the selected face
- [ ] Implement the target-face selection from the user's library or a small on-device gallery
- [ ] Wire the on-device swap pipeline (Vision alignment + on-device model + CoreImage composite) with a preview surface
- [ ] Write the swapped result back to the user's library as a separate asset, with a test that asserts the original is untouched
- [ ] Carry the author's stated ambivalence into the in-app strings without rewriting it as marketing copy
- [ ] Carry the same register into the App Store description, screenshots and metadata
- [ ] Add the network-audit test that asserts zero egress during a typical swap operation
- [ ] Add a CI check that flags any marketing string that contradicts the author's stated ambivalence
- [ ] Document the App Store review risks in the operator notes without inventing a strategy for review pushback
- [ ] Plan the post-launch conversation the author is implicitly opening in the post, without scheduling it as a roadmap

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
