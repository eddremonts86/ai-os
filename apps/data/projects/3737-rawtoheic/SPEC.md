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

## Problem

Photographers shooting RAW (or Apple ProRAW) on iPhone, iPad, or Mac accumulate files that are visually rich but storage-heavy — a 48-megapixel ProRAW image is several times the size of a same-resolution HEIC. The user wants the storage savings of HEIC and the rest of Apple's Photos-on-device workflow (edits, albums, metadata, search, Memories), but Apple Photos itself does not offer a "convert RAW to HEIC in place" surface. Converting RAW to HEIC today typically means: export via macOS Finder or a third-party tool, lose in-place metadata, or upload to a cloud converter (which contradicts the on-device photos-and-privacy contract that Photos users expect). The ProductHunt listing pins the gap precisely: convert RAW and ProRAW to HEIC from the Photos share sheet on iPhone, iPad, and Mac, up to 10× smaller, with edits / albums / metadata preserved, and entirely on-device (no uploads, no account, no analytics).

## Objective

Ship a small share-sheet extension plus native app for iPhone, iPad, and Mac that converts camera RAW and Apple ProRAW files to HEIC entirely on-device, preserving the edits, albums, and metadata that Apple Photos already tracks for those files. The MVP is the RawToHEIC product as described in the ProductHunt listing: free option, on-device conversion, share-sheet entry, no account.

## Target Users

- **Primary:** iPhone photographers shooting ProRAW (48 MP / 12 MP) who want the storage benefits of HEIC without leaving the Apple Photos library.
- **Secondary:** mirrorless / DSLR shooters who AirDrop their RAWs into the Photos library on iPhone / iPad / Mac and want a one-step way to compress them in place.
- **Tertiary:** Apple Photos users who keep hitting iCloud storage caps because RAW files do not compress as efficiently as HEIC, and want a privacy-respecting local conversion that does not require uploading the photo library to a third-party service.

## MVP Scope

- A share-sheet extension on iPhone, iPad, and Mac that accepts RAW / ProRAW inputs and converts them to HEIC, entirely on-device.
- A small dedicated app (or settings surface) for batch conversion of selected RAW / ProRAW files in Apple Photos.
- Preservation of metadata: EXIF, IPTC, capture-time, GPS, and any non-destructive Photos edits (the listing explicitly says "with edits, albums, and metadata intact").
- Output to HEIC in place, so the user's existing Apple Photos albums, smart albums, and Memories continue to see the files unchanged.
- File-size savings: the listing claims "up to 10× smaller"; the MVP must at minimum measure and report the actual ratio per file so the claim is verifiable.
- No upload, no account, no analytics: the entire conversion runs locally on the user's device.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "Entirely on-device: no uploads, no account, no analytics" is a load-bearing privacy claim. Any future change (a network call for telemetry, an account sync, a "share to friends" feature that leaves the device) breaks the claim and must be flagged before implementation.
- The product sits on top of Apple Photos and inherits its limitations: it cannot make a file visible to Photos that Photos would not otherwise index, and it cannot undo Apple Photos's own edits — it preserves them in the converted file rather than re-deriving the original.
- RAW formats vary by camera vendor (CR2, CR3, NEF, ARW, RAF, DNG, ProRAW). The MVP must commit to a coverage matrix (which RAW formats ship supported, which are detected-but-rejected) rather than promising universal support that crashes on edge cases.
- Storage-savings claims ("up to 10×") are notoriously easy to mis-state. The team should measure per-file compression ratios and surface them in-app rather than printing a single bold number that fails on a particular camera at a particular ISO.
- The launch tag "Free Options" implies the product has free and paid layers; pricing is not stated in the source beyond that. `wtp` is left `absent` rather than invented.
- The runtime stack is necessarily Apple-platform native (Swift / SwiftUI / AppKit, plus a share-sheet extension target). The captured `tech` field's JavaScript defaults are legacy and not the runtime stack.
