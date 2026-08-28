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

## Tech Stack

- **Language:** Rust (single static binary, no runtime dependencies).
- **TUI:** `ratatui` + `crossterm` for the keyboard-driven interface.
- **DB:** `rusqlite` against a single SQLite file in `~/.local/share/chroncal/calendar.db`.
- **iCalendar:** a hand-rolled or maintained Rust parser/writer for RFC 5545 (the post implies a parser already exists).
- **CalDAV:** thin client on top of `reqwest` doing the XML verbs; one-way pull in v1, two-way write behind a feature flag.
- **Quickshell plugin:** QML + shell script calling `chroncal today --json` and rendering the result.
- **Distribution:** `cargo install chroncal`, with a Homebrew formula and an AUR package as the install grows.

## Architecture

```
┌──────────────────┐
│ TUI (ratatui)    │──┐
└──────────────────┘  │
┌──────────────────┐  │   ┌────────────────────────────┐
│ CLI (clap)       │──┼──▶│ chroncal-core              │
└──────────────────┘  │   │   iCal parser ─┐           │
┌──────────────────┐  │   │   SQLite store │           │
│ Quickshell plugin│──┘   │   CalDAV sync ─┘           │
└──────────────────┘      └────────────┬───────────────┘
                                        │
                                        ▼
                              SQLite (events, alarms, sync state)
                                        ▲
                                        │
                              CalDAV server (Radicale / Nextcloud / Baikal)
```

The CLI and the TUI share a `chroncal-core` library crate; both call into the same `EventStore` API. The Quickshell plugin is a thin QML shell that runs `chroncal today --json` on a timer and re-renders.

## Milestones

1. **M0 — Core schema + iCal parser.** SQLite schema for events, alarms, sync state; round-trip a known-good .ics file. End of week 2.
2. **M1 — CalDAV pull sync.** One-way sync against Radicale, Nextcloud, Baikal verified end-to-end. End of week 5.
3. **M2 — CLI surface.** `clap` commands with stable names, `--json` everywhere, machine-readable help. End of week 7.
4. **M3 — TUI.** ratatui day / week / month views, keyboard navigation, 80×24 usable. End of week 9.
5. **M4 — Quickshell plugin + Show HN.** Plugin published, Omarchy install doc, Show HN writeup. End of week 12.

## Risks

- **CalDAV XML verb coverage.** Server-by-server quirks in PROPFIND / REPORT responses are inevitable; a CI matrix against Radicale / Nextcloud / Baikal is the only honest way to validate.
- **Two-way write.** Recurrence edits, exceptions, and time-zone handling are notoriously fragile; v1 must stay pull-only.
- **Rust CalDAV libraries.** The ecosystem is thin; a hand-rolled client is likely and must be tested against the same matrix.
- **Omarchy coupling.** Pinning the Quickshell plugin to Omarchy limits the audience; a generic Waybar fallback is a small addition with a big reach upside.
