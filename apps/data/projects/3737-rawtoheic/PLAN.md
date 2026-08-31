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

## Tech Stack

Chosen for an Apple-platform conversion that must never leave the device — the runtime is native, and the captured JavaScript stack is legacy.

- **Swift / SwiftUI / AppKit:** native iPhone, iPad, and Mac apps.
- **Share-sheet extension:** the conversion entry point from Apple Photos on all three platforms.
- **On-device codec pipeline:** RAW and ProRAW decode to HEIC encode, with edits, albums, and metadata preserved.
- **RAW coverage matrix:** a published list of supported formats (CR2, CR3, NEF, ARW, RAF, DNG, ProRAW), with unsupported input rejected loudly.
- **No network path:** zero calls during conversion, verifiable with Little Snitch or NetLimiter.

## Architecture

- **Share-sheet entry:** accepts RAW and ProRAW from Photos on iPhone, iPad, and Mac.
- **Conversion engine:** on-device decode and encode preserving EXIF, IPTC, capture time, GPS, and non-destructive Photos edits.
- **In-place output:** the HEIC lands in the same albums so Photos, smart albums, and Memories keep working.
- **Batch surface:** a small app or settings surface for converting selected files.
- **Ratio reporting:** the per-file compression ratio is displayed, so the "up to 10x smaller" claim is verifiable per file rather than a banner.

## Milestones

1. **M0 — iPhone ProRAW.** A ProRAW file converts to HEIC in place via the share sheet with metadata intact.
2. **M1 — Coverage matrix.** The published RAW-format matrix ships, with loud rejection for unsupported formats.
3. **M2 — iPad and Mac.** Share-sheet and batch surfaces land on all three platforms.
4. **M3 — Launch.** "Free Options" goes live with the actual pricing published and a network-call audit showing zero traffic.

## Risks

- **Silent format failures:** a converter that crashes on an odd RAW erodes trust; loud rejection beats silent failure.
- **Privacy drift:** any future telemetry endpoint breaks the no-upload claim; per-build network audits are the insurance.
- **"Up to 10x" ceiling:** high-ISO images may only hit 3x; publishing the median ratio honestly prevents letdown.
- **iCloud sync surprise:** converted HEICs may sync to other devices via iCloud Photos; make that explicit in the UX.
- **Pricing mismatch:** introducing a subscription where one-time IAPs fit a privacy-first utility could read as a category mismatch.
