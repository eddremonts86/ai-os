---
id: "4176"
slug: what-happens-when-you-give-your-ai-agents-a-voice-and-a
title: "What Happens When You Give Your AI Agents a Voice and an Attitude"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49510547"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# What Happens When You Give Your AI Agents a Voice and an Attitude

## Tech Stack

mcp-speak is a Python MCP server plus a macOS audio backend; the surrounding demo site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the persona registry. Coolify hosts the demo site behind Docker.

## Architecture

The MCP server sits between the agent runtime and the macOS audio stack; the synthesis backends are OmniVoice and the native `say` command. A FIFO queue serialises announcements so they do not overlap. The persona registry is a small SQLite store; the demo site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — MCP server exposes the synthesise-speech tool.
- M2 — OmniVoice and `say` backends wired up.
- M3 — Non-overlapping FIFO queue in place.
- M4 — Persona registry ships with a default set.
- M5 — Public release.

## Risks

- Apple Silicon MPS is the only hardware story; Intel macs would need a separate path the post does not describe.
- Audible agents can be annoying; persona design matters and a bad default would put users off the project entirely.
