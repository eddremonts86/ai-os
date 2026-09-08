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

## Problem

The author tried many UI-based Git clients over many years and none of them felt 'good' to them. TinyGit is the author's vision for a super-clean, super-intuitive macOS Git client: no crazy Git graphs, easy-to-understand upstreams and commits, and super-easy local squash-and-merge before pushing. It is a paid App Store app; the author is dropping free codes on the HN thread for the first tranche of testers.


---

## Objective

Ship a paid macOS-native Git client that gets out of the user's way: no graph clutter, clear upstreams/commits, one-click local squash-and-merge before push.


## Target Users

macOS developers who already use Git from the command line and want a simple UI without the visual noise of a typical Git client. Assumes App Store distribution and a paid license.


## MVP Scope

- macOS-native Git client available on the App Store.
- Clean, intuitive UI with no Git graphs.
- Easy-to-understand upstreams and commits.
- Local squash-and-merge before pushing.
- Free codes distributed via the HN thread as the first wave of testers.
- Feedback collection through HN comments.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- App Store distribution means Apple review applies.
- Source calls out 'paid app on the App Store' — there is no freemium tier mentioned.
- Source does not state the price, only that it is paid.
- Source does not state a roadmap beyond the author's vision of cleanness.

