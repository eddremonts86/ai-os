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

## Problem

Most basic PDF utilities force a single stretched picture onto a giant page. Mobile users converting images to PDF for business contracts, tax receipts, design mockups, ID scans, or quick email attachments do not want clunky desktop software or expensive mobile subscriptions that limit pages. They want a layout engine in their pocket, with multi-photo grids, page-size standards, orientation, borders, item spacing, fit-or-fill alignment, and quality compression they can control — and they want it to run 100% locally on the device, with no account, no internet, no upload, no hidden paywalls.

The source is the App Store listing for Photos to PDF — TornadoPDF by AppHive GmbH. The listing names the platform requirements (iOS 26.0+, iPadOS 26.0+, macOS 26.0+ on Apple M1+, visionOS 26.0+), the free price point, the iPhone + iPad form factors, the English + German languages, and the privacy practices (analytics identifiers, usage data, diagnostics — none linked to the user).

The app's differentiators are explicit: multi-photo grid layouts (1 to 6 photos per page), global page standards (US Letter, US Legal, US Tabloid, A4, A5, A3, B5, B4), portrait/landscape orientation, page borders, item spacing, fit-or-fill alignment with custom positions (Center, Top, Top Left, and more), and quality compression from 72 DPI (lightweight for email) up to 300 DPI (crystal-clear for print). Every file is processed locally on the device, no network or internet access required. The app accepts standard pictures from the camera, the camera roll, and iCloud Drive, with no watermarks, no hidden paywalls, no surprise charges, and no account creation.

The source names the actor (an iPhone or iPad user who needs to bundle images into a PDF for email, taxes, business contracts, or ID scans), the pain (desktop software is clunky, mobile subscriptions limit pages, basic utilities force a single stretched picture), and the missing thing (a layout engine in the pocket that runs 100% locally, with no account and no hidden charges). It does not name a specific business vertical, a specific enterprise integration, or a specific cloud-storage alternative.

## Objective

Build the TornadoPDF iOS app: a free PDF maker that turns images into clean, professional PDFs on the device, with multi-photo grid layouts, global page standards, orientation and border controls, fit-or-fill alignment, and quality compression from 72 to 300 DPI — and runs 100% locally with no account, no internet, no upload, no watermarks, no hidden paywalls.

## Target Users

- iPhone and iPad users who need to bundle images into a PDF for business contracts, tax receipts, design mockups, ID scans, or quick email attachments.
- Users who want a layout engine in their pocket (1 to 6 photos per page, multi-page standards, orientation, borders, fit-or-fill alignment) rather than a single stretched picture.
- Privacy-conscious users who want every file processed locally on the device with no network access, no upload, no account, no telemetry on the document content.
- Users who do not want a mobile subscription that limits pages, no watermarks, no hidden paywalls, no surprise charges.
- Users with iCloud Drive who want to import high-quality files directly, plus camera and camera-roll imports.

## MVP Scope

- An iOS app, Photos to PDF — TornadoPDF, by AppHive GmbH, free on the App Store.
- The app supports iPhone, iPad, macOS (on Apple M1+), and visionOS, with iOS 26.0+ as the minimum.
- A layout engine with multi-photo grid templates: 1 to 6 photos per page, with portrait and landscape orientations, page borders, item spacing, and fit-or-fill alignment (Center, Top, Top Left, and more).
- Global page standards: US Letter, US Legal, US Tabloid, A4, A5, A3, B5, B4.
- Quality compression from 72 DPI (lightweight for email) up to 300 DPI (crystal-clear for print).
- Local processing only: every file is processed on the device, no network or internet access, no account, no upload, no watermarks, no hidden paywalls.
- Imports from the built-in camera, the camera roll, iCloud Drive, and Apple's native iOS document scanner (with automatic border detection, perspective correction, and contrast filters).
- No limits on the number of photos imported or the number of pages in the final document.
- English and German as the launch languages.
- Privacy practices that name the analytics identifiers, usage data, and diagnostics collected, none linked to the user's identity.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The app is free. No subscription, no in-app purchase, no hidden paywalls, no surprise charges; the plan does not invent a monetization the source does not name.
- Local processing only. The app does not call out to a network, an API, or a cloud service for any document workflow; the privacy story is structural.
- No account. The user opens the app and uses it without creating an account or remembering a password.
- No watermarks on the output. The PDF is the user's PDF.
- No limit on photos imported or pages in the output. The app does not gate any workflow on a quota.
- The minimum supported iOS version is 26.0; iPadOS 26.0; macOS 26.0 on Apple M1+; visionOS 26.0. The plan does not promise support for older OS versions.
- English and German are the launch languages; the plan does not invent a non-English/non-German translation.
- The privacy practices are documented in the App Store listing: analytics identifiers, usage data, diagnostics (none linked to the user). The plan does not invent additional data collection.
