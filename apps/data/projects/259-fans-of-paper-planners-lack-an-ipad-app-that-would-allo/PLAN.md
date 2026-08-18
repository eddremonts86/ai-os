---
id: "259"
slug: fans-of-paper-planners-lack-an-ipad-app-that-would-allo
title: Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes
status: enriched
source:
  name: manual
  url: "https://problemhunt.pro/en/productivity/l3grb6t2f1-fans-of-paper-planners-lack-an-ipad-app"
category: productivity
date: "2026-01-06"
tags: [Productivity, Other]
country: USA
---
# Fans of paper planners lack an iPad app that would allow importing PDF layout templates and using them as a foundation for digital notes

## Tech Stack

- Swift 5.9 + SwiftUI for the iPad app (iPadOS 17+); chosen because SwiftUI + PencilKit gives Apple Pencil handwriting at the lowest latency Apple supports, and the iPad-native feel is the product.
- PencilKit for the handwriting layer; PDFKit for PDF import and rendering.
- Core Data (with CloudKit-backed store) for local-first notebook persistence; the user's notebooks live on the iPad and in iCloud Drive.
- Combine + Swift Concurrency for the notebook loading and the background PDF rendering pipeline.
- App Store distribution via TestFlight for the MVP beta; App Store release once the MVP is validated.
- No server-side rendering, no OCR, no ML in the MVP. The app is local-first.

## Architecture

Three pieces:

1. **Notebook store** — Core Data with a CloudKit-backed store; notebooks live locally and sync via iCloud Drive; the app does not require a backend account.
2. **Template import + render** — PDFKit loads the PDF; each page becomes a background layer; PencilKit captures the handwriting layer above. Pages are labelled by the user (daily, weekly, monthly, custom).
3. **Date badge + export** — pages labelled daily or weekly get a "today's date" badge that updates on open; export flattens background + handwriting into a PDF via UIGraphicsPDFRenderer.

The MVP does not include automatic handwriting OCR, automatic region detection, or a template marketplace.

## Milestones

- **M1 — Notebook + import.** Create a notebook, import a PDF, render each page as a background layer.
- **M2 — PencilKit writing layer.** Handwriting and erasing at PencilKit latency; tested on iPad Air and iPad Pro.
- **M3 — Template labelling.** User labels each page (daily, weekly, monthly, custom); daily/weekly pages show a date badge.
- **M4 — iCloud Drive sync.** Notebooks sync via the user's iCloud Drive; no separate account required.
- **M5 — Export.** Flatten background + handwriting into a PDF; share via the standard iPad share sheet.

## Risks

- PencilKit latency is a hard constraint. Anything worse than the iPad's stock Notes app on the same iPad is a regression. The MVP must be tested on iPad Air (M1) and iPad Pro (M2/M4) generations.
- Template recognition honesty: the MVP labels templates by hand. The MVP must not pretend to detect regions automatically; a wrong claim erodes trust faster than an honest "you label this page."
- Local-first storage: the user's notebooks must live on the iPad and iCloud Drive, not on a server the user did not opt into. Server-side OCR is out of scope.
- iCloud Drive sync conflicts: large PDFs edited across devices can conflict. The MVP must publish its conflict-resolution policy (last-write-wins for now) and not pretend to merge.
- App Review: iPad apps importing arbitrary user PDFs and writing on top must respect iOS storage rules and the PencilKit data-model limits. The MVP must plan for iCloud Drive backup before launch.
