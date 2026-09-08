---
id: "4216"
slug: free-fast-screenshot-app-for-macos-with-one-click-scree
title: "Free, Fast Screenshot App for macOS with One-Click Screenshot Sharing"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507806"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Free, Fast Screenshot App for macOS with One-Click Screenshot Sharing

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — applies to the marketing site and any web-side companion (share links, an annotation library web demo). The macOS app itself is a native Swift/SwiftUI binary and is not changed here.

## Architecture

Native macOS app (Swift/SwiftUI) using the system ScreenCaptureKit API for capture and a CoreGraphics-based annotation layer. A small TanStack Start + SQLite/Drizzle backend hosts the share-link shortener and (optionally) the agent-feedback inbox. Coolify hosts that backend behind Docker.

## Milestones

- M1 — Native macOS capture with one-click region/window/full-screen.
- M2 — Annotation tools (rectangles, arrows, text).
- M3 — Share-to-chat link shortener.
- M4 — Share-to-agent with comments attached.
- M5 — macOS permissions guide and onboarding flow.

## Risks

- Apple privacy/sandbox changes can break capture; mitigation is to track ScreenCaptureKit changes.
- App Store review risk for system-level apps; mitigation is to plan a direct distribution path.
- 'One click' UX is hard to get right; mitigation is to test with new users before locking the flow.
