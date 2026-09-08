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

## Problem

mcp-speak (fellowgeek.github.io/mcp-speak) is a specialised Model Context Protocol server for macOS that synthesises real-time speech via OmniVoice and the native macOS `say` command. AI agents using the server proactively announce status updates, ask clarifying questions, and deliver vocal feedback during pairing sessions. The landing page frames the system in retro-CRT visual language ("SIGNAL ACQUIRED // BUFFER COPIED") and lists synthesis engine, audio queue (non-overlapping FIFO), and a latency profile under a second on Apple Silicon MPS. The author's framing is "we gave the agents a voice. Sorry in advance." — the post is the demo of what an audible agent loop sounds like.


---

## Objective

Ship an MCP server for macOS that turns AI agent output into real-time speech, with a non-overlapping audio queue and a sub-second latency profile on Apple Silicon, so a developer pairing with an agent gets audible status instead of just a transcript.


## Target Users

Developers who pair with AI agents in long sessions and want audible cues instead of having to read a transcript; macOS-only by design. Assumes the reader is comfortable installing an MCP server and connecting it to an agent runtime.


## MVP Scope

- An MCP server for macOS that exposes a synthesise-speech tool.
- OmniVoice and the native `say` command as the synthesis backends.
- A non-overlapping FIFO audio queue so announcements do not stack on top of each other.
- A latency profile under one second on Apple Silicon MPS.
- A "persona" set so the agent can pick a voice and an attitude per announcement.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the project ships as a free MCP server.
- macOS-only by design (uses the native `say` command and Apple Silicon MPS).
- The audio queue has to be non-overlapping; overlapping speech is the bug the whole thing exists to prevent.
