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

## Problem

Collections, a Chrome side panel for keeping what you find while researching: drag a link, a selected passage or an image from the page into a named collection, save the current tab with one click, copy the collection out as Markdown. Local-first (chrome.storage), no account; optional Google sync is in the works. Built because Edge removed its Collections feature in June and Pocket shut down last year.

## Objective

Build a Chrome side panel that lets a researcher save links, selected passages, and images into named collections while staying on the page they are reading, with one-click tab saving and a Markdown export, stored locally in chrome.storage with optional Google sync later.

## Target Users

1. Researchers and writers who collect links, quotes, and images from many tabs and want a single panel that holds everything for a topic, with no account and no server in the way.
2. People displaced by Edge removing its Collections feature in June and Pocket shutting down last year, who want a similar workflow that does not require a subscription or a hosted account.

## MVP Scope

- A Chrome side panel UI built with the side panel API.
- Drag-and-drop intake from the active page: a link, a selected text passage, or an image.
- One-click save of the current tab as a link entry.
- Named collections so the user can sort intake by topic.
- Copy the entire collection out as Markdown for pasting into notes, blog drafts, or wiki pages.
- Local-first storage using chrome.storage; no account required.
- Optional Google sync as an in-progress feature, behind a user-controlled toggle.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Stay local-first; the user must be able to use every feature without signing in or hitting a server.
- The Chrome side panel and the active tab must stay in sync so dragging from the page into the panel feels immediate.
- The Markdown export must round-trip cleanly: a copied collection should paste as usable Markdown, not as a flat blob of URLs.
- Edge removed Collections in June and Pocket shut down last year per the source — do not reintroduce those products' specific failure modes (no mandatory subscription, no abandoned shutdown without an export path).
