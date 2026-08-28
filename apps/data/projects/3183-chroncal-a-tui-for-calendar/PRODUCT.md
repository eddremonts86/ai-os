---
id: "3183"
slug: chroncal-a-tui-for-calendar
title: Chroncal – A TUI for Calendar
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49453176"
category: show-hn
date: "2026-08-26"
tags: [Show HN, CLI, TUI, Calendar, Open Source]
tech: [Rust (ratatui + crossterm), SQLite via rusqlite, caldav-client, iCalendar (RFC 5545) parser, Quickshell plugin (Omarchy)]
---
# Chroncal – A TUI for Calendar

## Value Proposition

A terminal-first calendar that lives in SQLite, syncs with CalDAV, exposes a stable CLI that LLMs can self-discover, and integrates with Omarchy via a Quickshell plugin — so the calendar behaves like a native terminal tool instead of a web app in disguise.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Terminal-first developers | Want a calendar that feels like a CLI tool, not a web app. |
| Omarchy / Quickshell users | Want their next 3 events visible in the bar without a second app. |
| LLM-driven workflows | Want an assistant that can read / write calendar entries through a discoverable CLI + a queryable DB. |

## Jobs To Be Done

1. **Functional job** — View, add, and edit calendar events from the terminal and from LLM-driven tooling.
2. **Emotional job** — Stop switching context to a browser tab just to check what's next on the calendar.
3. **Social job** — Show up to meetings already knowing what they are, because the calendar is in the same shell as the rest of the work.

## Success Metrics

- **Adoption signal:** number of GitHub stars + number of CalDAV server backends (Radicale / Nextcloud / Baikal) confirmed working in the issue tracker.
- **Bug reports per release:** bug reports from real-world CalDAV servers drive the roadmap; track by server backend.
- **LLM discoverability:** a one-shot LLM prompt ("list my meetings tomorrow") completes against the CLI without a custom plugin layer.
- **Quickshell plugin usage:** unique Omarchy installs running the plugin (self-reported via opt-in ping or GitHub issue tag).

## Competitive Landscape

- **khal** — Python TUI calendar, similar audience; no CalDAV sync, no LLM-friendly CLI surface.
- **calcurse** — long-standing TUI calendar, more dated UI; weaker iCalendar / CalDAV story.
- **Gcalcli** — Google-only, not CalDAV.
- **Nextcloud / Radicale web UIs** — what terminal users are escaping.

## Risks & Open Questions

- [ ] CalDAV library maturity — Rust CalDAV support is sparser than Python; the MVP may need a hand-rolled client on top of `reqwest` for the harder verbs.
- [ ] LLM discoverability — stable command names help, but the SQLite schema may need a documented "view" layer for agents to query without learning raw table names.
- [ ] Omarchy / Quickshell dependency — pinning to one desktop environment limits the audience; a fallback for plain Waybar would broaden reach.
- [ ] Two-way CalDAV write — recurrence edits and time-zone handling are notoriously fiddly; v1 should pull-only and surface conflicts.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49453176) · **Category:** show-hn · **Tags:** Show HN,CLI,TUI,Calendar,Open Source
