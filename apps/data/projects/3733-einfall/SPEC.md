---
id: "3733"
slug: einfall
title: Einfall
status: enriched
source:
  name: ProductHunt
  url: "https://www.producthunt.com/products/einfall-a-place-for-fugitive-thoughts"
category: product-launch
date: "2026-08-24"
tags: [ProductHunt, Product Launch]
wtp:
  raw: $29.99 one-time for unlimited routing (15 free routing actions)
  currency: USD
  period: one-shot
  min: 29.99
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Einfall

## Problem

People have many thoughts during the day, and they capture them across many surfaces — voice notes, system to-do apps, paper notebooks, pieces of paper, inboxes, chat windows. The Einfall maker's own list of examples (voice notes, notebooks, papers, multiple apps) is itself the problem statement: the capturing tools are abundant, but the *destination* is missing, and a thought that lives across five tools is a thought that does not exist. The ProductHunt listing names the failure mode precisely: the "fugitive" thought, the one that falls into your head at the strangest times, is gone before the user can park it anywhere that matters. Compounding the problem, existing thought-capture apps have filled the gap with features the maker considers actively counter-productive — folders, a scripting language, engagement mechanics, unread counts, server-side processing — none of which help with the actual moment of capture, and several of which require the server to be live before a thought can be parked. The implication is that there is room for a deliberately small product that holds a thought in one trusted place until the user decides what to do with it, and routes it from there to the tool that already owns the work.

## Objective

Ship a Mac / iPhone / iPad capture surface that catches a thought as fast as the user can park it — from menu bar, share sheet, Shortcuts, widgets, Spotlight, or Siri — and holds it as a flat stream until the user decides what to do with it. From the stream, the thought can be routed to Reminders, Calendar, a file (explicitly named for the Obsidian-daily-note crowd), a Shortcut, or to a user-owned AI agent via a small local MCP server running on the Mac. The MVP is the Einfall product as described in the ProductHunt listing: capture is free and unlimited, the first 15 routing actions are free, after which a one-time $29.99 IAP unlocks unlimited routing; no account, no server, no data collected.

## Target Users

- **Primary:** Mac / iPhone / iPad power users who already capture lots of thoughts across Notes, Reminders, paper, voice, and chat, and want one trusted "inbox" without losing the connection to the tools those thoughts should land in.
- **Secondary:** Obsidian / Daily Note users who want a frictionless way to dump a thought into today's note without typing it directly into Obsidian first.
- **Tertiary:** Shortcuts / AI-agent builders who want a local MCP-friendly capture endpoint they can wire into their own automation.

## MVP Scope

- A macOS app with a menu-bar entry that opens a minimal capture surface — single field, fast keyboard path, no friction.
- An iPhone / iPad app capturing into the same trusted stream via share sheet, Spotlight extension, widget, and Siri / Shortcuts.
- A flat stream of captured thoughts (no folders, no nesting) that lives on-device across the user's Apple devices.
- Routing actions to: Reminders, Calendar, a file (with the format / destination the user selects — explicitly mentioned for Obsidian daily-note use), and a user-configured Shortcut.
- A small MCP server that runs locally on the Mac and exposes the stream to the user's own AI agent (e.g. Claude Code / Codex running locally) so the user can decide which thoughts the agent acts on.
- A 15-routing-action free counter, after which the one-time $29.99 unlock (per the listing) opens unlimited routing.
- Capture itself (typing or dictating into the stream) is free, unlimited, and never gated.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- "No account, no server, no data collected" is a load-bearing privacy claim and the reason the local-MCP approach exists. Any future change (a backend sync, an analytics SDK, push notifications tied to an identifier) breaks that claim and must be flagged.
- The product must remain deliberately small. The maker's explicit exclusions — folders, a scripting language, engagement mechanics, unread counts, actions that require a running server — are part of the product's identity, not roadmap debt.
- Routing actions that touch Calendar / Reminders / Files will request the relevant Apple system permissions; permission denials must be surfaced honestly, not silently swallowed.
- The MCP server is local to the Mac; iOS devices do not run their own MCP server. Routing from an iPhone-captured thought to an agent still has to go via the Mac once the user is back at the desk.
- Pricing is given in the listing: capture free forever, 15 routing actions free, then a one-time $29.99 unlock. That maps cleanly to a StoreKit IAP, not a subscription.
- The maker built Einfall as a personal project to learn Swift, treating Claude Code as a coding tutor. Runtime stack is native Apple (Swift / SwiftUI); the captured `tech` field's JavaScript defaults are legacy and not the runtime stack.
