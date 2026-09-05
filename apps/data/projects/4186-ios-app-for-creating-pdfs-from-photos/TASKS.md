---
id: "4186"
slug: ios-app-for-creating-pdfs-from-photos
title: "iOS App for creating PDF's from photos"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509776"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# iOS App for creating PDF's from photos

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4186-ios-app-for-creating-pdfs-from-photos/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the app shell with the iOS / iPadOS / macOS / visionOS targets, the iOS 26.0+ / iPadOS 26.0+ / macOS 26.0+ on Apple M1+ / visionOS 26.0+ minimum versions, and the launch languages (English, German).
- [ ] Implement the import layer: the camera via AVFoundation, the camera roll via the Photos framework, the iCloud Drive document picker, the document scanner via VisionKit (or the equivalent) with automatic border detection, perspective correction, and contrast filters.
- [ ] Implement the layout engine: multi-photo grid templates (1 to 6 photos per page), global page standards (US Letter, US Legal, US Tabloid, A4, A5, A3, B5, B4), portrait and landscape orientations, page borders, item spacing, fit-or-fill alignment (Center, Top, Top Left, and more).
- [ ] Implement the quality compression from 72 DPI to 300 DPI, with the per-document and per-page quality choice surfaced in the UI.
- [ ] Implement the PDFKit rendering: the per-document in-memory store, the PDF assembly, the export, the share / attach-to-email path.
- [ ] Enforce the structural privacy guarantee: no third-party analytics SDK on the document content, no network call for any document workflow, no cloud backup the user did not choose, no account.
- [ ] Document the App Store privacy practices: analytics identifiers, usage data, diagnostics (none linked to the user's identity), with the privacy policy at apphive.studio/privacy.html.
- [ ] Run an end-to-end test: a user imports 5 photos from the camera roll, picks the 2x3 grid layout on US Letter at 300 DPI, exports the PDF, attaches it to an email, and confirms the app made no network call during the workflow.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Submit the app to the App Store under developer AppHive GmbH with the launch listing, the screenshots, and the privacy practices
- [ ] Publish the privacy policy at apphive.studio/privacy.html and link it from the App Store listing
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
