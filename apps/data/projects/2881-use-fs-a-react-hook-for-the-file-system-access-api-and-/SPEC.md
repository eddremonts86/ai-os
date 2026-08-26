---
id: "2881"
slug: use-fs-a-react-hook-for-the-file-system-access-api-and-
title: Use-Fs – A React Hook for the File System Access API and OPFS
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49441831"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Use-Fs – A React Hook for the File System Access API and OPFS

## Problem

I'm happy to say that https://use-fs.com 2.0 has been released with brand new OPFS support. If you're building browser-based apps that heavily interact with the file-system this package is a must to have in your package.json!A React hook that watches a directory and re-renders when a file is added, changed, or deleted. Point it at a folder the user picked and you're reading and writing their real files — no uploads, no endless file dialogsNew in 2.0: it watches the origin private file system too. No picker, no permission prompt, no user gesture — and, unlike File System API, it works in Safari and FirefoxWhat's OPFS? A file store the browser gives each origin — real directories and files, but readable only by your own site through the File System API, never by the user's file manager or other apps.

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
