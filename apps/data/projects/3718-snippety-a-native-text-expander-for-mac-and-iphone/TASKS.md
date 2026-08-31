---
id: "3718"
slug: snippety-a-native-text-expander-for-mac-and-iphone
title: Snippety – a native text expander for Mac and iPhone
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49488310"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, macOS, iOS, Productivity]
tech: [Swift, SwiftUI, AppKit, CloudKit, Apple Shortcuts]
---
# Snippety – a native text expander for Mac and iPhone

## Phase 0: Scaffold

- [x] Read the Show HN post to confirm the 20-placeholder engine, conditional blocks, shell-out, CLI, Shortcuts/Siri, custom keyboard, and 250 themes
- [x] Write SPEC.md (this document)
- [x] Write DESIGN.md tokens for the single-window macOS surface and the keyboard-first iOS surface
- [x] Scaffold the macOS app target, the iOS app plus keyboard-extension target, and the CLI entry point

## Phase 1: Core

- [ ] Implement the 20 placeholders and the conditional-block evaluator
- [ ] Build local-first snippet storage with opt-in CloudKit sync
- [ ] Implement the per-snippet allow-list shell-out and the paste-output bridge
- [ ] Ship the `snippety` CLI for listing, expanding, and triggering snippets
- [ ] Add Apple Shortcuts and Siri actions for named snippets
- [ ] Build the iOS custom keyboard carrying the full snippet library
- [ ] Add the 250 built-in themes with configurable colours

## Phase 2: Deploy

- [ ] Submit both apps to App Store review, including the keyboard extension
- [ ] Configure the free tier, the low monthly plan, and the one-time lifetime purchase
- [ ] Verify iCloud sync never surfaces snippets from disabled categories

---

_Generated automatically by Lúa on 2026-08-29_
