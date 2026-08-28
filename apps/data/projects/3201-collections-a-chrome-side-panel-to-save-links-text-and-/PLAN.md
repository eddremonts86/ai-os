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

## Tech Stack

- **Extension shell:** Chrome Manifest V3 extension written in TypeScript, with the side panel API as the UI host.
- **Side panel UI:** React + TypeScript component tree, reusing the same TanStack Start-friendly stack the rest of the projects use. The panel itself runs in the extension context, not on a hosted page.
- **Storage:** chrome.storage.local for the local-first MVP; chrome.storage.sync is intentionally not used so quota issues stay inside the extension.
- **Drag-and-drop intake:** content script that reads selected text and image URLs from the active tab and pushes them through a message channel to the side panel.
- **Markdown export:** a small client-side serializer that turns a collection into a single Markdown document the user can copy to the clipboard.
- **Optional Google sync:** a separate, opt-in module behind a feature flag; not part of the local-first MVP.

## Architecture

```
Active tab (page)
    │   drag / select / one-click save
    ▼
Content script ──▶ message channel ──▶ Side panel (React)
                                              │
                                              ▼
                                     chrome.storage.local
                                              │
                                              ▼
                                     Markdown serializer
                                              │
                                              ▼
                                Clipboard / paste into notes

(opt-in) Google sync: side panel ──▶ Google Drive API ──▶ remote copy
```

- The side panel is the only UI surface; the popup, options page, and content scripts are infrastructure to feed it.
- Storage writes are debounced so a burst of drags does not trigger a quota storm.
- Google sync sits behind a user toggle and writes a remote copy; it never becomes the canonical store, so the local-first promise survives even when sync is on.

## Milestones

1. **M0 — Spec + design tokens + extension shell.** Existing SPEC.md and DESIGN.md approved; Manifest V3 scaffold registers the side panel.
2. **M1 — Local collections + drag intake.** A user can create a named collection, drag a link into it from the active tab, and see it persist across reloads.
3. **M2 — Selected passage + image intake.** Drag works for selected text passages and for images on the active page, with per-site fallback when the content script cannot read the source.
4. **M3 — One-click save current tab.** A toolbar action saves the current tab as a link entry to the active collection.
5. **M4 — Markdown export.** "Copy collection as Markdown" produces a single Markdown document the user can paste into any notes app.
6. **M5 — Optional Google sync.** Toggled behind a feature flag, writes a remote copy, and never becomes the source of truth.

## Risks

- chrome.storage quota: large image collections will hit the limit; the MVP needs a "storage full" UI and a path to evict or offload.
- Per-site content restrictions: some pages block the content script from reading selections or images; the drag flow needs clear fallbacks so it does not silently fail.
- Google sync correctness: bidirectional sync can corrupt a local collection if the remote copy diverges. Local-first means the local store is canonical and the sync is a write-only mirror — anything else breaks the promise.
- Abandonment risk: the source itself names products (Edge Collections, Pocket) that were shut down; the MVP must always offer a working export path so users can leave with their data.
