---
id: "3650"
slug: cursor-buddy-get-archived-cursor-chats-out-of-renderer-
title: "Cursor Buddy, get archived Cursor chats out of renderer RAM"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49483592"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python, psutil, pywin32, ctypes, mitmproxy, Click, Chromium DevTools Protocol]
---
# Cursor Buddy, get archived Cursor chats out of renderer RAM

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3650-cursor-buddy-get-archived-cursor-chats-out-of-renderer-/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement process discovery for Cursor's main process and renderer children on each supported platform
- [ ] Add a renderer-access path that reads the address space directly and a fallback that attaches to the debugging port
- [ ] Walk the JavaScript heap to locate chat data structures and extract the message log
- [ ] Write one readable text file per recovered chat with timestamps and participants preserved
- [ ] Ship the cadence mode that snapshots, diffs structurally, and writes only new or changed chats
- [ ] Surface explicit failure messages for Cursor not running, renderer not accessible, and layout changed
- [ ] Add a small viewer command that opens a recovered chat in the terminal
- [ ] Document the supported Cursor versions and the half-life of the technique so the user knows when to expect breakage
- [ ] Refuse to write when the in-memory layout has changed in a way the tool does not recognise
- [ ] Keep the cadence mode's CPU and memory footprint below a stated budget so the tool does not visibly slow Cursor

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-28_
