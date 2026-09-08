---
id: "4197"
slug: tinygit-a-simple-macos-git-client
title: TinyGit – a simple macOS Git client
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509474"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# TinyGit – a simple macOS Git client

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — applies to the marketing site and any web-side companion (e.g. a code-redemption page, release notes, license lookup). The macOS app itself is a native Swift/SwiftUI binary and is not changed here.

## Architecture

Native macOS client (Swift/SwiftUI) wrapping libgit2 for the Git operations. A small TanStack Start + SQLite/Drizzle backend powers the marketing site and any web-side companion features. Coolify hosts that backend behind Docker.

## Milestones

- M1 — Native macOS app on the App Store, paid.
- M2 — Local squash-and-merge before push.
- M3 — Clear upstream/commits UI without graphs.
- M4 — Free-code distribution + feedback collection via the HN thread.
- M5 — Post-launch telemetry and rating monitoring.

## Risks

- App Store review friction; mitigation is to track Apple's guideline changes.
- Limited demand if the 'no graphs' aesthetic is too spartan for some users; mitigation is to keep the design opinionated and the copy honest.
- Support load for paid users on a single-developer app; mitigation is to start with an email-only support channel.
