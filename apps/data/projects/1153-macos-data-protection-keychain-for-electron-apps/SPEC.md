---
id: "1153"
slug: macos-data-protection-keychain-for-electron-apps
title: macOS data protection keychain for Electron apps
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49349159"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# macOS data protection keychain for Electron apps

## Problem

Hey HN,I've been working on Hansel [1] (an encrypted personal data store you can query with agents), and there wasn't a good way to use the modern macOS Data Protection Keychain.Electron's safeStorage [2] uses the legacy file-based keychain, which allows other apps/agents to query it with the `security` CLI. Not great when you have a dozen agents running in the background! The Data Protection Keychain is nice because it limits access via code-signing access groups and lets you set access rules like Touch ID and/or password.1: https://hansel.so/2. https://www.electronjs.org/docs/latest/api/safe-storage

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
