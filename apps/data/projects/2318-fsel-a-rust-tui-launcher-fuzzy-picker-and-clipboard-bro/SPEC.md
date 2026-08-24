---
id: "2318"
slug: fsel-a-rust-tui-launcher-fuzzy-picker-and-clipboard-bro
title: "Fsel –. a Rust TUI launcher, fuzzy picker and clipboard browser"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49382968"
category: show-hn
date: "2026-08-21"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Fsel –. a Rust TUI launcher, fuzzy picker and clipboard browser

## Problem

fsel is a terminal app launcher for Linux/*BSD. It also has a dmenu-style mode for piping arbitrary input through it, and a clipboard-history mode with text and image previews, I started it because I started using otterlauncher and needed a tui app laucnher bc otterlauncher was tui, i looked around and nothing was up to par, then i found Gyr, it was the closest thing but it needed sum work so i add the things I needed, and it eventually grew into fsel.its evolved to be more than an app launcher, i use the normal launcher mode for desktop apps, but I also use --dmenu for shell scripts, and it has --cclip for clipboard picker. It can also output selections or app data to stdout/JSON, preserve original indices for scripts, preview clipboard images in supported terminals, and the UI/keybinds/layout are configurable. A lot of the work lately has been making those modes behave consistently across weird Linux/Wayland setups and cleaning up ux.

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
