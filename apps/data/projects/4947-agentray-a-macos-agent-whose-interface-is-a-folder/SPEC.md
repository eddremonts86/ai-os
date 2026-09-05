---
id: "4947"
slug: agentray-a-macos-agent-whose-interface-is-a-folder
title: "Agentray, a macOS agent whose interface is a folder"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49555446"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Agentray, a macOS agent whose interface is a folder

## Problem

Hi,I'm not a fan of chat as the main UI for interacting with AI, so I'm trying something where you interact with LLMs by handling regular files and folders.Agentray is an invisible AI agent. You point it at a folder, it creates "in" "out", and "done" dirs in it. Whatever you drop into "in" gets summarised, the answer appears in "out", and the original moves to "done" so you can see what's been handled. If you want something other than a summary, make a subfolder and name it: drop a file into "in/translate to french" and that name is the instruction. No prompt to write, no config file, just mkdir.By default it uses Apple's on-device model or Gemma 4 through MLX. You can also set your OpenRouter key for additional models.It'll be a free app but until I work out bugs, you can get it from Test Flight: https://testflight.apple.com/join/MRwp3e1PHappy to get any feedback!

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
