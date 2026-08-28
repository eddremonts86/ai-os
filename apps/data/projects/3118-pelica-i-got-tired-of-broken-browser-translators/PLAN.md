---
id: "3118"
slug: pelica-i-got-tired-of-broken-browser-translators
title: Pelica – I got tired of broken browser translators
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450690"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Pelica – I got tired of broken browser translators

## Tech Stack

Not stated by the source. A Chrome extension translating pages would normally use Manifest V3 and a hosted AI translation API; specifics are TODO.

## Architecture

A browser extension that captures the active page (or selected text), calls an AI translation endpoint, and renders the translation back into the DOM. No further subsystems are implied by the title.

## Milestones

- [ ] Manifest V3 extension installed from the Chrome Web Store listing.
- [ ] Page-level translation and selection translation both work.
- [ ] Anything beyond a competent translator (offline, custom terminology, multi-language UI) is not implied by the source.

## Risks

Translation API cost per page can be high; the source does not say whether usage is metered, capped or free.
