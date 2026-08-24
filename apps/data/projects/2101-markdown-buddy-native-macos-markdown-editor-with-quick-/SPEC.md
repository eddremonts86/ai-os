---
id: "2101"
slug: markdown-buddy-native-macos-markdown-editor-with-quick-
title: Markdown Buddy – Native macOS Markdown Editor with Quick Look and Xcode
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49374127"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Markdown Buddy – Native macOS Markdown Editor with Quick Look and Xcode

## Problem

I write a lot of project documentation in Markdown, and two things kept annoying me on macOS: Quick Look shows .md files as raw text, and Xcode shows a README as plain source. So I built the app I wanted.
Swift and AppKit, 4.8 MB, sandboxed. The editor is a plain NSTextView. The rendered view is WKWebView, so it uses the system engine rather than a bundled browser, which is where the size difference comes from. Quick Look and Finder thumbnails are separate app extensions sharing the same renderer.Beyond preview: open a folder as a workspace and browse every .md in a tree, search across all of them, and see a graph of the links between documents with broken ones flagged. An Xcode Source Editor extension opens the file you are looking at, rendered, from the Editor menu.One implementation detail I found non-obvious. The live preview restyles the NSTextStorage as you type. The hard rule is that it must never touch attributes while an input method is composing, or Japanese, Chinese and Korean input breaks, and so do dead keys for accented Latin. It is a single hasMarkedText() guard in three places, but without it the app is unusable for a large part of the world. Several competing editors have review complaints about exactly this.Caveats up front: Mac App Store only, so there is no trial. macOS 14+. 0.99 EUR, one off, no subscription, no IAP, nothing collected. It is not trying to be Obsidian: no vault, no plugins, no backlink database.I will happily send promo codes, just reply here.One last thing, since Show HN is for feedback. I have sold two copies in a year. The product page gets about a hundred views annually. I am clearly doing something wrong on the distribution side rather than the code side, and I would genuinely like to hear what.https://markdownbuddy.inawa.app/

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
