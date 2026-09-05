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

## Value Proposition

A free iOS app that turns images into clean, professional PDFs on the device, with a layout engine in the pocket (1 to 6 photos per page, multi-page standards, orientation, borders, fit-or-fill alignment) and quality compression from 72 DPI (lightweight for email) up to 300 DPI (crystal-clear for print). Every file is processed 100% locally with no network, no account, no upload, no watermarks, no hidden paywalls, no surprise charges.

The app supports iPhone, iPad, macOS (Apple M1+), and visionOS, with iOS 26.0+ as the minimum. Imports come from the camera, the camera roll, iCloud Drive, and Apple's native iOS document scanner. The launch languages are English and German.

**One-liner:** A free iOS PDF maker with a layout engine in the pocket (multi-photo grids, page standards, fit-or-fill, 72–300 DPI), running 100% locally with no account and no hidden charges.

## Target Users

| Stakeholder | Why they care |
|---|---|
| iPhone and iPad users bundling PDFs | Need a layout engine (1 to 6 photos per page, page standards, orientation, fit-or-fill) rather than a single stretched picture. |
| Privacy-conscious users | Want every file processed locally on the device, no network, no upload, no account. |
| Users who refuse mobile subscriptions | Want no watermarks, no hidden paywalls, no surprise charges, no quota on pages. |
| Users with iCloud Drive | Want to import high-quality files directly, plus camera and camera-roll imports. |
| Users scanning IDs, receipts, and contracts | Want Apple's native iOS document scanner integrated with automatic border detection, perspective correction, and contrast filters. |

## Jobs To Be Done

1. **Functional job** — Convert images to a PDF with a chosen page standard (US Letter, US Legal, US Tabloid, A4, A5, A3, B5, B4), orientation, layout (1 to 6 photos per page), fit-or-fill alignment, and DPI (72 to 300).
2. **Functional job** — Import from the camera, the camera roll, iCloud Drive, and Apple's native iOS document scanner with automatic border detection and perspective correction.
3. **Functional job** — Bundle any number of photos into a PDF with any number of pages, with no quota and no paywall.
4. **Emotional job** — Stop the feeling that the PDF utility is forcing a stretched picture onto a giant page, or that the document content is being uploaded to a cloud the user does not control.
5. **Social job** — Be the user whose PDFs are clean, professional, and produced on the device with no network round-trip.

## Success Metrics

- **Conversion completion rate** — share of imported photo batches that ship as a PDF. A batch that imports but never converts is a layout-engine friction point.
- **Multi-photo grid usage rate** — share of conversions that use a multi-photo grid layout (2 to 6 photos per page) rather than a single photo per page. A low rate is the signal the layout engine is not being discovered.
- **Page-standard coverage** — share of conversions that use a non-US-Letter page standard (US Legal, US Tabloid, A4, A5, A3, B5, B4). The metric is the layout engine's international reach.
- **DPI choice distribution** — share of conversions at 72 DPI vs 300 DPI. The metric is the user's email-vs-print use case.
- **iCloud Drive import rate** — share of imports that come from iCloud Drive rather than the camera or the camera roll. The metric is the high-quality-import path.
- **Document-scanner import rate** — share of imports that come from the built-in document scanner. The metric is the scan-to-PDF workflow.
- **No-network verification rate** — share of conversions where the app does not make a network call. The metric is the local-processing privacy guarantee.

## Pricing & Monetization

The source is explicit that the app is free, with no subscription, no in-app purchase, no hidden paywall, no watermark, and no surprise charge. The plan does not invent a monetization the source does not name. The app's distribution is the App Store, with the developer's privacy policy at apphive.studio/privacy.html. The pricing tier is "Free". Any future monetization has to be measured against the conversion completion rate and the no-network verification rate, because those are the metrics the source ties to the free + local-processing value proposition.

## Competitive Landscape

- **Clunky desktop software (the names the source does not provide)** — the source's named critique: clunky, complicated, not on the phone.
- **Expensive mobile subscriptions that limit pages** — the source's named critique: subscription-gated, page-limited.
- **Single-stretched-picture utilities** — the source's named critique: force one picture per page, no layout engine.
- **Cloud-upload PDF tools (the names the source does not provide)** — upload the user's images to a server; the source's pitch is the local-processing privacy guarantee.

The post names no specific incumbent, so no further comparison is claimed here.

## Risks & Open Questions

- [ ] Confirm the local-processing privacy guarantee survives a future feature that calls out (a cloud backup, a sharing integration). The source is explicit that no network call is required; the open question is whether a future feature introduces a network call without breaking the privacy guarantee.
- [ ] Validate the free + no-quota pricing model. The source is explicit that the app is free with no quotas; the open question is whether the platform can sustain the no-quota model under heavy use without a paid tier.
- [ ] Define the policy on a layout that produces a PDF the user did not expect (a stretched picture, a low-DPI output). The source's pitch is the layout engine's control; the open question is whether the app surfaces a preview of the layout before the user commits to the export.
- [ ] Confirm the document-scanner integration's accuracy on low-contrast documents. The source names Apple's native iOS document scanner; the open question is whether the scanner's automatic border detection and perspective correction are robust on receipts and IDs with low contrast.
- [ ] Decide the policy on iCloud Drive files that are not images. The source names iCloud Drive as an import source; the open question is whether the app refuses non-image files at import or silently skips them.
- [ ] Define the policy on a layout that exceeds the page standard. The source names multi-photo grids (1 to 6 per page); the open question is whether the app surfaces a warning when the chosen grid would crop or stretch the photos in a way the user did not intend.
- [ ] Confirm the launch-language scope (English and German) is the right initial set. The source names English and German; the open question is whether the app surfaces a community-contributed translation pipeline or waits for an official localization.
