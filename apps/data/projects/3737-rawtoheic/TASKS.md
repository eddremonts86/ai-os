---
id: "3737"
slug: rawtoheic
title: RawToHEIC
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/rawtoheic"
category: product-launch
date: "2026-08-25"
tags: [ProductHunt, Product Launch]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# RawToHEIC

## Phase 0: Scaffold

- [x] Read the ProductHunt listing to confirm the share-sheet entry, the on-device claim, the edits / albums / metadata preservation, and the "up to 10x smaller" language
- [x] Write SPEC.md (this document)
- [x] Confirm the native Swift / SwiftUI / AppKit stack decision against the legacy captured tech field
- [x] Scaffold the iOS share-sheet extension target and the on-device conversion pipeline stub

## Phase 1: Core

- [ ] Implement RAW and ProRAW to HEIC conversion on-device via the share sheet
- [ ] Preserve EXIF, IPTC, capture time, GPS, and non-destructive Photos edits through conversion
- [ ] Output HEIC in place so existing albums, smart albums, and Memories keep working
- [ ] Build the batch surface for selected files on iPhone, iPad, and Mac
- [ ] Publish the RAW coverage matrix and reject unsupported formats loudly
- [ ] Show per-file compression ratios instead of a single "up to 10x" banner

## Phase 2: Deploy

- [ ] Ship on the App Store under the "Free Options" tag with the actual pricing published
- [ ] Run a network-call audit (Little Snitch / NetLimiter) confirming zero traffic during conversion
- [ ] Make the iCloud Photos sync behaviour of converted files explicit in the UX

---

_Generated automatically by Lúa on 2026-08-29_
