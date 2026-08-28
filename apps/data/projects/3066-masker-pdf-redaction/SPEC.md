---
id: "3066"
slug: masker-pdf-redaction
title: Masker – PDF Redaction
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49444084"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Masker – PDF Redaction

## Problem

I built Masker after needing to share financial PDFs with a tax strategist without also sharing names, addresses, tax IDs, phone numbers, and account numbers.It is a native macOS app. It finds repeated PII, uses Apple’s on-device OCR for scanned pages, and lets you review every mask before export. Institution names and amounts can remain visible while account identifiers are covered. Mask sets and labels can be reused across folders.Everything runs locally. The tests generate fake PDFs, export them, and use text extraction and OCR to check that the selected values are gone.Built with Swift, SwiftUI, PDFKit, and Codex. Free and open source. Feedback on missed matches, false positives, and the folder workflow would be useful.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
