---
id: "702"
slug: i-built-a-free-mac-app-for-screenshot-clutter-i-am-not-
title: "I built a free Mac app for screenshot clutter. I am not sure if it is useful, or just my own problem?"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vq0gqe/i_built_a_free_mac_app_for_screenshot_clutter_i_am/"
  captured: "2026-08-16"
category: saas
date: "2026-08-16"
tags: [macos, b2c, free, foss, screenshots, productivity]
scores:
  money: 4.5
  learn: 5
  fun: 5.5
tech: [Swift, SwiftUI, macOS, FileProvider, local-storage]
---
# I built a free Mac app for screenshot clutter. I am not sure if it is useful, or just my own problem?

## Phase 0: Scaffold

- [ ] Confirm `SPEC.md` Problem captures the poster's exact framing (Desktop covered by end of day, manual triage, occasional mis-delete, folders that become another mess)
- [ ] Confirm the source explicitly says free, open source, local-first, and macOS notch-resident — and carry each into `SPEC.md` Constraints
- [ ] Add the three validation questions from the post (shared problem? notch access useful? five-minute-abandonment reasons?) into `PRODUCT.md` Success Metrics
- [ ] Add frontmatter `tags` for `macos`, `b2c`, `free`, `foss`, `screenshots`, `productivity` so the corpus index stays searchable

## Phase 1: Core

- [ ] Re-read the Reddit launch thread and record each reply that names a shared problem, a notch reaction, or an abandonment reason
- [ ] Keep all answers attributed to the source — do not promote a "Mac users want this" claim beyond what replies confirm
- [ ] Reject any enrichment that proposes a paid tier or cloud upload — the source explicitly says free + local-first
- [ ] If a future revision adds a non-notch fallback surface, gate it on at least one reply from a non-notch-Mac user

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production
