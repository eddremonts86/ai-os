---
id: "3201"
slug: collections-a-chrome-side-panel-to-save-links-text-and-
title: "Collections, a Chrome side panel to save links, text and images"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451455"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Collections, a Chrome side panel to save links, text and images

## Value Proposition

Collections, a Chrome side panel for keeping what you find while researching: drag a link, a selected passage or an image from the page into a named collection, save the current tab with one click, copy the collection out as Markdown. Local-first (chrome.storage), no account; optional Google sync is in the works. Built because Edge removed its Collections feature in June and Pocket shut down last year.

**One-liner:** A Chrome side panel that lets a researcher drag links, passages, and images into named collections, save the current tab with one click, and export the whole collection as Markdown — local-first in chrome.storage with optional Google sync coming later.

## Target Users

- Primary: researchers and writers who collect links, quotes, and images from many tabs and want one panel that holds everything for a topic, with no account and no server in the way.
- Secondary: people displaced by Edge removing its Collections feature in June and Pocket shutting down last year, who want a similar workflow that does not depend on a subscription or a hosted account.

## Jobs To Be Done

1. Functional — drag a link, a selected passage, or an image from the current page into a named collection, with one-click tab save as the fast path.
2. Emotional — keep collecting during research without a hosted account standing between the user and their notes.
3. Social — export a collection as Markdown so the user can paste it into shared notes, blog drafts, or wiki pages without a special viewer on the other end.

## Success Metrics

- Collection size: how many items a typical user accumulates in a single collection before exporting.
- Markdown export volume: how often the export path is used; if it is rarely used, the local format is probably enough.
- Edge / Pocket refugee adoption: how many installs come from users who name the Edge Collections or Pocket shutdowns as their reason for switching.

## Pricing & Monetization

Not stated in the source. The post describes a free Chrome extension with local storage and optional Google sync "in the works"; no price, plan, or premium tier is named.

## Competitive Landscape

Edge Collections and Pocket are named in the source as the products whose removal or shutdown created the opening. The post does not name any other currently-maintained competitor.

## Risks & Open Questions

- chrome.storage quotas: large image collections can hit the per-extension quota; the MVP needs a graceful "storage full" path.
- Drag-and-drop from arbitrary pages: some sites prevent content scripts from reading selected text or images; the extension needs fallbacks for those pages.
- Google sync is explicitly "in the works"; if it ships half-built, users will hold it against the local-first experience. Either ship the sync or keep the local-first promise visible.
- The source calls out the Edge and Pocket shutdowns as motivation; the MVP must offer a working export path so users are not trapped if the extension is ever abandoned.
