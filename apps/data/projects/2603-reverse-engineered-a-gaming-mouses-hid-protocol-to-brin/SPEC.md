---
id: "2603"
slug: reverse-engineered-a-gaming-mouses-hid-protocol-to-brin
title: "Reverse-engineered a gaming mouse's HID protocol to bring it to Linux"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49397560"
category: show-hn
date: "2026-08-22"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Reverse-engineered a gaming mouse's HID protocol to bring it to Linux

## Problem

I’ve been reverse-engineering the HID protocol of an Attack Shark X6 gaming mouse (no official Linux support) using Ghidra and USB captures, and building a native Linux desktop app around it in Go + Wails, with a React frontend.The protocol itself is fairly advanced. DPI, RGB lighting, polling rate and button remapping are all documented at the protocol level. The app currently only exposes DPI configuration though, the rest is reverse-engineered but not yet wired into the UI.One piece is still unsolved: the macro report isn’t captured yet, so there’s no macro editor. If you’ve done HID/USB reverse engineering before, I’d appreciate a hand there.There’s also plenty of non-reversing work: building out the RGB/polling/remap screens in the frontend, implementing what’s already known in the Go backend, or testing on other Attack Shark models (X3, R1, X11) that likely share the same dongle and protocol.Happy to answer questions about the protocol work or the architecture in the comments.

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
