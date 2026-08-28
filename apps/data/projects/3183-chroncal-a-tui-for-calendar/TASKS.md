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

## Phase 0: Scaffold

- [x] Capture problem + write SPEC.md skeleton
- [ ] Decide licence (MIT or Apache 2.0 — pick what the Omarchy ecosystem standardises on)
- [ ] Cargo workspace: `core/`, `cli/`, `tui/`, `quickshell-plugin/`, `docs/`
- [ ] SQLite schema: `events`, `alarms`, `sync_state`, `calendars`
- [ ] Pick / write the iCalendar parser and lock the supported RFC 5545 subset
- [ ] Test CalDAV server matrix: Radicale, Nextcloud, Baikal — each as a docker-compose service in CI

## Phase 1: Core

- [ ] `core::EventStore` API: CRUD + recurrence expansion
- [ ] iCal parser: round-trip a known-good corpus (.ics in, .ics out, byte-identical except for property order)
- [ ] CalDAV client: PROPFIND + REPORT against the matrix servers; pull events into the local store
- [ ] CLI (`clap`): `today`, `week`, `month`, `add`, `edit`, `delete`, `sync`, each with `--json`
- [ ] LLM discoverability test: a one-shot prompt ("list my meetings tomorrow") succeeds against the CLI without custom glue
- [ ] TUI: day / week / month views, keyboard navigation, 80×24 verified
- [ ] Quickshell plugin: shells out to `chroncal today --json`, renders next 3 events
- [ ] `docs/caldav.md` with config snippets per server

## Phase 2: Deploy

- [ ] `cargo install chroncal` published to crates.io
- [ ] Homebrew formula + AUR package
- [ ] Show HN writeup with the TUI screenshot and a CalDAV setup walkthrough
- [ ] Open issues for the next round (Waybar fallback, two-way write, mobile sync)
- [ ] Bug-bash week: invite CalDAV-server admins to file issues against their backend
