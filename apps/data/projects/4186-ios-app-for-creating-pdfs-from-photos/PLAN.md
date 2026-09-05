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

## Tech Stack

- **iOS / iPadOS / macOS / visionOS** as the supported platforms, with iOS 26.0+ / iPadOS 26.0+ / macOS 26.0+ on Apple M1+ / visionOS 26.0+ as the minimum versions.
- **Swift** as the primary language, with the Apple platform toolchain (Xcode, SwiftUI / UIKit as the source does not name which).
- **PDFKit** as Apple's framework for generating the PDF, matching the platform-native PDF workflow.
- **AVFoundation** for camera capture and the document scanner integration.
- **Photos** framework for camera-roll access.
- **FileProvider / UIDocumentPickerViewController** for iCloud Drive import.
- **VisionKit** (or the equivalent document-scanner API) for the built-in document scanner with automatic border detection, perspective correction, and contrast filters.
- **App Store distribution** under the developer AppHive GmbH, with the privacy policy at apphive.studio/privacy.html.
- **No third-party service, no cloud upload, no analytics SDK on the document content** — the privacy guarantee is structural, not policy.

## Architecture

The app has one document workflow and one layout engine. The document workflow accepts imports from the camera, the camera roll, iCloud Drive, and the document scanner; the layout engine renders the imported images into the chosen PDF.

The import layer is the seam between the user's photos and the layout engine. The camera uses AVFoundation; the camera roll uses the Photos framework; iCloud Drive uses the document picker; the document scanner uses VisionKit (or the equivalent). All imports land in a per-document in-memory store the layout engine reads; nothing is uploaded, nothing leaves the device.

The layout engine is the unit of value the app sells. It supports multi-photo grid templates (1 to 6 photos per page), global page standards (US Letter, US Legal, US Tabloid, A4, A5, A3, B5, B4), portrait and landscape orientations, page borders, item spacing, fit-or-fill alignment (Center, Top, Top Left, and more), and quality compression from 72 to 300 DPI. The layout engine renders the imported images into a PDFKit document the user can save, share, or attach to an email.

The privacy guarantee is structural. The app does not import a third-party analytics SDK that touches the document content, does not call out to a network for any document workflow, does not back up the document to a cloud the user did not choose, and does not require an account. The App Store privacy practices name the analytics identifiers, usage data, and diagnostics collected, none linked to the user's identity.

The pricing surface is "Free". No subscription, no in-app purchase, no hidden paywall, no watermark, no quota on photos imported or pages in the output. The plan does not invent a monetization the source does not name.

## Milestones

1. **M1 — App shell and platform setup** — the iOS / iPadOS / macOS / visionOS targets, the minimum-version checks, the launch languages (English, German).
2. **M2 — Import layer** — the camera (AVFoundation), the camera roll (Photos), the iCloud Drive document picker, the document scanner (VisionKit or equivalent).
3. **M3 — Layout engine** — the multi-photo grid templates (1 to 6 per page), the page standards (US Letter, US Legal, US Tabloid, A4, A5, A3, B5, B4), the orientation, the borders, the item spacing, the fit-or-fill alignment (Center, Top, Top Left, and more).
4. **M4 — Quality compression** — the 72 to 300 DPI range, the per-document quality choice, the per-page quality choice.
5. **M5 — PDFKit rendering** — the per-document in-memory store, the PDF assembly, the export, the share / attach-to-email path.
6. **M6 — Privacy and no-network enforcement** — the structural no-network guarantee, the analytics surface that names what is collected (identifiers, usage data, diagnostics), the privacy policy at apphive.studio/privacy.html.
7. **M7 — App Store submission** — the listing, the screenshots, the privacy practices, the developer AppHive GmbH attribution.

## Risks

- **Layout exceeds the user's intent** — the chosen grid crops or stretches the photos in a way the user did not intend. Mitigation: the layout engine surfaces a preview of the layout before the user commits to the export; the preview is the unit of trust the user sees.
- **Local-processing guarantee drift** — a future feature introduces a network call without the user noticing. Mitigation: the privacy guarantee is structural; the network surface is documented; the no-network verification rate is a first-class metric.
- **Free + no-quota sustainability** — heavy use without a paid tier stresses the platform's sustainability. Mitigation: the pricing model is the source's framing; the platform does not invent a paid tier; the conversion-completion rate is the metric the platform measures.
- **Document-scanner accuracy on low-contrast documents** — receipts and IDs with low contrast fail the automatic border detection. Mitigation: the document scanner is Apple's native API; the platform documents the scanner's behaviour; the user can crop manually if the automatic detection fails.
- **iCloud Drive import policy** — non-image files in iCloud Drive are imported. Mitigation: the import layer refuses non-image files at import or silently skips them; the policy is documented.
- **Launch-language scope creep** — the app expands beyond English and German before the launch languages are localised properly. Mitigation: the launch languages are the source's framing; additional languages are a follow-up, not a launch-day requirement.
- **App Store privacy-practices mismatch** — the listing's privacy practices do not match the app's actual data collection. Mitigation: the privacy practices are documented in the listing; the developer confirms the practices match the app's behaviour; the privacy policy at apphive.studio/privacy.html is the source of truth.
