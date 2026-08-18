---
id: "1167"
slug: pharos-a-package-manager-for-mcp-servers-like-npm-but-f
title: "Pharos – A package manager for MCP servers (like NPM, but for MCP)"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49347380"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Pharos – A package manager for MCP servers (like NPM, but for MCP)

## Problem

Hey HN! Dev here. I built PHAROS, an open-source CLI package manager for MCP servers. Think npm, but for MCP.What it does:
- Search across all MCP registries in one place
- Install servers with dependency resolution and lockfiles
- Audit installed servers against known vulnerabilities
- Import your existing MCP client configs
- Publish your own serversSingle Go binary, no runtime deps. macOS, Linux, Windows. MIT licensed.
There is a second repo for the Agent SDK it has MCP/MCP-Apps server for empowering AI agents.Install: `curl -fsSL getpharos.dev/install | sh` or Install: 'irm https://getpharos.dev/install.ps1 | iex'Happy to chat about the architecture or how the CLI or MCP and SDK work. Let me know if you have questions, comments, or feature requests!

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
