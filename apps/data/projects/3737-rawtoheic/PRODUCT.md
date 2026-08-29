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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A 48-megapixel ProRAW file is several times the size of the same shot as HEIC, and Apple Photos — the place most iPhone users already keep their library — has no "convert in place" surface. Cloud converters solve the size problem but trade away the on-device privacy contract that brought the user to Photos in the first place. RawToHEIC lands a share-sheet extension and a small batch surface on iPhone, iPad, and Mac that converts RAW and ProRAW to HEIC locally, preserves edits, albums, and metadata, and reports the actual per-file compression ratio so the marketing number is not the only number the user sees.

## Target Users

| Stakeholder | Why they care |
|---|---|
| ProRAW iPhone photographer | Wants HEIC storage benefits without leaving the Photos library or undoing the edits already applied. |
| Mirrorless / DSLR user AirDropping into Photos | Wants a one-step compression path that does not require exporting out and re-importing. |
| iCloud-storage-capped Photos user | Wants local, on-device compression — not a third-party cloud converter. |
| Privacy-first user | Wants the conversion to never touch a server they don't control. |
| Maker (Sandro Gumz) | Validates that on-device RAW → HEIC is a separable Apple-platform product, not a Photo app feature. |

## Jobs To Be Done

1. **Functional job** — Convert RAW and ProRAW to HEIC, in place, with edits / albums / metadata preserved, so the existing Photos library keeps working.
2. **Emotional job** — Reclaim iCloud / on-device storage without compromising the on-device privacy contract of Apple Photos.
3. **Social job** — Be able to say "compressed my library on-device, no upload" with evidence (per-file ratios, zero network calls).

## Success Metrics

- **Activation:** a user selects their first RAW file, runs the share-sheet extension, and finds the HEIC result in their original Photos album within one session (proxy: the path from "raw file in Photos" to "HEIC in same album" is end-to-end and obvious).
- **Compression fidelity:** median file-size reduction is large enough to be worth the conversion (the "up to 10×" claim is the ceiling; the *median* ratio is the real metric the team should commit to internally).
- **Metadata integrity:** ≥ 99% of converted files retain EXIF, capture time, GPS where present, and non-destructive Photos edits (proxy: the user's library is not visibly degraded by the conversion).
- **Privacy audit:** zero network calls during conversion; verifiable via Little Snitch / NetLimiter or an external privacy audit.
- **Coverage:** the team's published matrix of "supported RAW formats" matches the formats users actually submit; rejections must be honest and well-explained, not silent.

## Pricing & Monetization

The ProductHunt launch tag is "Free Options" — that is the full extent of what the source says about pricing. No number, plan, or IAP tier is quoted, so no `wtp` field is set. Plausible monetisation surfaces for an Apple-platform utility in this position:

- **Free with limits** — a per-session or per-library cap (e.g. free tier converts up to N files per month) with a paid tier above the cap.
- **One-time unlock** — a single IAP that unlocks unlimited conversions and batch mode.
- **Tip jar / supporter tier** — a "buy me a coffee"-style surface, consistent with a privacy-first utility that has no recurring revenue model by design.

The team must publish the actual pricing before scale so a user is not surprised at checkout; in the meantime, the listing's "Free Options" is enough for a directional read.

## Competitive Landscape

- **Apple-native paths** — Preview on Mac, the macOS Image Capture "convert RAW" tool, and Photos' own "Most Compatible" export can produce HEIC but only via an export-then-import flow that breaks edits and albums. RawToHEIC's differentiator is in-place conversion.
- **Cloud RAW converters (Convertio, CloudConvert, Adobe online conversion)** — convert the same file formats but require upload, which contradicts the privacy claim and the Apple library workflow.
- **Adobe Lightroom / Capture One export** — handles RAW-to-anything with full edit fidelity, but is a desktop-only catalog workflow, not a Photos share-sheet utility.
- **RAW-to-JPEG utilities on the App Store (RAW Power, Photo Mechanic, etc.)** — close in spirit but targeted at JPEG, not HEIC, and most of them do not speak Apple Photos natively.
- **Apple's own HEIF support (since iOS 11)** — reads HEIC well but does not provide the "compress my RAW library in place" surface the user needs; this is the gap RawToHEIC occupies.

## Risks & Open Questions

- [ ] RAW format coverage is genuinely heterogeneous. CR3, ProRAW, DNG, ARW, NEF, RAF, and ORF each have idiosyncrasies; a single shared converter that "fails silently on weird RAW" erodes trust. The team must commit to a published support matrix and refuse bad input loudly.
- [ ] "On-device, no uploads" is a claim that lives or dies by network instrumentation. A future patch that adds a "send us your unused original" opt-in or any analytics endpoint breaks the claim; a per-build network-call audit (manual or scripted) is the cheapest insurance.
- [ ] "Up to 10×" is a marketing ceiling. If users with high-ISO / low-detail images see a 3× ratio in practice and feel misled, the brand suffers. The team should publish the *median* ratio honestly, not just the ceiling.
- [ ] The product sits on top of Apple Photos and inherits iCloud syncing behaviour. A converted HEIC may sync to other devices via iCloud Photos; that is by design, but the team should make it explicit in the UX, not implicit.
- [ ] The launch tag "Free Options" implies commercial intent. A pricing change that introduces a subscription (rather than the one-time IAPs that fit a privacy-respecting utility) may read as a category mismatch to the user who chose the product specifically for the privacy contract.
