---
id: "3358"
slug: wallps-set-different-live-wallpapers-for-macos-desktop-
title: "Wallps: set different live wallpapers for macOS desktop and lock screen"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49460234"
category: show-hn
date: "2026-08-27"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Wallps: set different live wallpapers for macOS desktop and lock screen

## Problem

macOS ties the lock screen to your desktop wallpaper, with no built-in option to set them separately. Wallps decouples the two, letting you choose one static image for the desktop and another for the lock screen, including live video wallpapers.What it does:
- Set desktop and lock screen wallpapers independently
- Use live wallpapers from local videos or Apple’s aerials
- Run silently in the background as a menu bar app and automatically apply settings after a reboot
- Open source, free, and compatible with macOS 13 and laterBehind the scenes, the lock screen is rendered by `loginwindow` without third-party code. As a result, live lock screen video requires registering the clip as a system aerial in macOS 26 and re-encoding user videos with Apple’s temporal scalability scheme. This is the format expected by the stock wallpaper engine; videos without it freeze after the first unlock.demo: https://x.com/dipxsyy/status/2092845512722625007?s=20

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
