---
id: "4167"
slug: turn-repeated-coding-agent-corrections-into-rulesskills
title: Turn repeated coding-agent corrections into rules/skills
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511274"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Turn repeated coding-agent corrections into rules/skills

## Tech Stack

The chosen stack — React, TypeScript, TanStack Start, SQLite with Drizzle ORM, Coolify, Docker — is the desktop-app shell and backend supporting the rule/skill diffs, local session index and recurrence state. The local signal extraction runs in the user's existing Claude Code or Codex harness, not on the server side.

## Architecture

Local desktop app (Electron/Tauri-style) that watches Claude Code, Codex and Cursor session files and reads their skill/rule/doc directories. A local pipeline clusters corrections and only calls the user's existing coding-agent harness once a cluster crosses a pain/recurrence threshold. The app surfaces diffs for review; the only outbound traffic is whatever the user's harness itself does when invoked. Coolify hosts a small companion backend that handles diff review sync and (eventually) optional cloud agents.

## Milestones

- M1 — Local file watcher for Claude Code / Codex / Cursor session directories.
- M2 — Cluster engine that groups repeated corrections into recurring patterns.
- M3 — Threshold logic that decides when to spawn an improvement agent.
- M4 — Diff review UI: propose / approve / dismiss rule and skill updates.
- M5 — Before/after counter so the user can see if an accepted change actually helped.
- M6 — Optional cloud agent path (future monetisation).

## Risks

- Threshold tuning is a UX and correctness risk; mitigation is to ship sensible defaults and a 'tune the threshold' setting.
- Session file formats can change across agent versions; mitigation is to keep parsers isolated so a format change does not cascade.
- Local-only claim must hold even when invoking the user's harness; mitigation is to never proxy session content.
- The team already flagged the missing before/after measurement; shipping it is the highest-leverage risk-reduction move.
