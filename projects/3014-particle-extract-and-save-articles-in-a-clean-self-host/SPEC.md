---
id: "3014"
slug: particle-extract-and-save-articles-in-a-clean-self-host
title: "Particle – Extract and save articles in a clean, self-hosted reader"
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339175"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Particle – Extract and save articles in a clean, self-hosted reader

## Problem

The author has been seeing "Every fucking website in 202*" examples and feels the same frustration as everyone else: auto-play videos, modal CTAs, cookie banners, and other noise make article reading miserable. As a result, they built what they call their most-used self-developed app: a tool where you paste (or visit) a URL and it extracts the article's main content — preserving structure, formatting, pullquotes, and images — and saves it into an SQLite library so it can be revisited later. It also installs as a PWA so they can read on a tablet or phone. The author calls this the app they run most often, which is a strong signal that the problem is real for them and for the kind of reader they are targeting.

## Objective

Build a self-hosted, PWA-installable article reader where a user can drop in a URL, get a clean extracted version of the article (structure, formatting, pullquotes, images preserved), save it to a personal SQLite library, and read saved articles later on phone, tablet, or desktop. The MVP is the same product the author describes — drop URL, get clean text, save, read later — with no social features, no recommendations, no newsletter, no cross-device sync.

## Target Users

- The author and readers like them: people who already feel the modern web is hostile to reading long-form articles and want a quiet alternative.
- Power readers who maintain a personal "read later" library and want a tool they control rather than a SaaS that can be shut down or acquired.
- Tablet-and-phone readers who want a PWA they can install from the browser without going through an app store.

## MVP Scope

- A web interface where a user pastes a URL and gets a clean extracted view of the article, with structure, formatting, pullquotes, and images preserved.
- A personal SQLite-backed library of saved articles, browsable by date saved and by source domain.
- A reader view with adjustable typography (font size, line height, theme) and a "mark as read" action.
- A PWA install path with a service worker so saved articles work offline.
- An export-to-HTML button so a user can take their library out as a folder of static files.
- A share-sheet target on mobile (where supported) so a user can send a URL into the app directly from the browser share menu.

## Design Direction

Design direction for the MVP follows the constraints in `3014-.../SPEC.md`. The visual language is reading-first: the article surface dominates, the library surface is a list of titles and source domains, no decoration that competes with the text.

**Color** — light and dark themes, both reading-friendly; one accent reserved for the "save" action and the "mark as read" toggle.

**Type** — one display family for article titles, one text family optimized for long-form reading, one mono family for source-domain labels in the library.

**Density** — generous in the reader view, compact in the library view.

**Motion** — none beyond the save/save-state transition.

## Constraints

- The MVP is self-hosted. No SaaS, no account, no central server beyond the user's own instance.
- The extractor is a server-side pass on the user's own instance. No third-party extraction API in v1.
- No social features, no recommendations, no comments.
- No newsletter integration, no cross-device sync, no push notifications.
