---
id: "4216"
slug: free-fast-screenshot-app-for-macos-with-one-click-scree
title: "Free, Fast Screenshot App for macOS with One-Click Screenshot Sharing"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507806"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Free, Fast Screenshot App for macOS with One-Click Screenshot Sharing

## Problem

The author sends many screenshots every day and finds the default macOS screenshot tool useless: capture, save, annotate, save-as-image, send-as-image in chat takes minutes, but should take seconds. The second use case is feeding annotated screenshots to AI agents, which the author finds produces much better edits when given comments and annotations. The app captures, annotates and shares in one click — for both humans and agents. It can do everything the native macOS screenshot tool does, but better; the author describes it as a child of Figma and the native macOS screenshot app.


---

## Objective

Replace the default macOS screenshot tool with a one-click capture-annotate-share flow that works for both human chats and AI-agent feedback.


## Target Users

macOS users who send many screenshots daily — both for human chats and for AI-agent feedback loops. Assumes macOS-only delivery and the user is comfortable with a system-level capture tool.


## MVP Scope

- One-click screenshot capture on macOS.
- Inline annotation tools (rectangles, arrows, text).
- One-click share to chat (link + image).
- One-click share to an AI agent (image + comment metadata).
- All native macOS screenshot features retained.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- macOS-only delivery is implied by the framing.
- Source does not state pricing or monetisation model.
- Source describes the app as a 'child of Figma and the native macOS screenshot app' — i.e. wider feature scope than the default tool.
- Sandbox and screen-capture permissions on macOS are real friction points.

