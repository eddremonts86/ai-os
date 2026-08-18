---
id: "543"
slug: i-wrote-a-simple-script-to-automate-my-keywording-and-i
title: "I wrote a simple script to automate my keywording, and it accidentally turned into a full app."
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SaaS/comments/1vo9quq/i_wrote_a_simple_script_to_automate_my_keywording/"
category: saas
date: "2026-08-14"
tags: [saas, creator, chrome-extension, ai]
tech: [Next.js, TypeScript, Chrome Extension MV3, Anthropic Claude, Supabase, Stripe]
---
# I wrote a simple script to automate my keywording and it became a Chrome extension

## Problem

A student and microstock contributor wrote a simple script to auto-generate tags for stock images using AI; it saved so much time that they turned it into a full Chrome extension and web app called ExifGarden. The app writes the AI-generated tags directly into the EXIF data of an image; the contributor does it once and every agency the image is uploaded to reads the tags automatically. The product is free to try. The implicit product: a B2C creator tool that generates AI tags for stock-photography uploads and writes them into EXIF, with a Chrome extension that works on the agency's upload UI.

## Objective

Define the MVP scope for ExifGarden as a B2C creator tool focused on EXIF-keyword automation for microstock contributors. The MVP has to demonstrate the round-trip: drop an image, get AI tags, write to EXIF, upload to a stock agency, and have the agency read the tags automatically.

## Target Users

- **Primary:** microstock contributors (Adobe Stock, Shutterstock, Alamy, iStock) who upload hundreds of images a week and need keyword coverage.
- **Secondary:** photographers who want consistent, AI-assisted tagging without manual data entry.
- **Tertiary:** digital asset managers at small studios with similar tag-volume problems.

## MVP Scope

- Drag-and-drop a batch of images; AI generates keyword suggestions.
- One-click "write to EXIF" with a per-keyword confidence score shown.
- Chrome extension that visits a stock-agency upload page and pre-fills the keyword field from the EXIF.
- Free tier: 50 images/month. Pro at $9/month: 1,000 images/month + bulk upload + per-keyword confidence thresholds.
- Excluded in v1: direct agency API integration, video tagging, IPTC / XMP sidecar writes.

## Design Direction

See `DESIGN.md` for this project's design tokens. Default visual: a single drop-zone surface — drag images on the left, see generated tags on the right with confidence, one-click "write to EXIF". No marketing-site chrome; the product is the drop zone.

## Constraints

- EXIF writes must preserve all existing metadata (camera, lens, GPS); never overwrite non-keyword fields.
- AI inference cost must be bounded per image (target: < $0.001 per image at default settings).
- The Chrome extension must work on the most common agency upload UIs (Adobe Stock, Shutterstock, Alamy).
