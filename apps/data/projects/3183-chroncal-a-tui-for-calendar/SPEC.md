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

## Problem

The poster has spent weeks building Chroncal, an open-source TUI/CLI with iCalendar (RFC 5545) support and CalDAV sync, using SQLite for storage. The driving goal is to make the CLI commands easy for LLMs to auto-discover and let them query the database, while still providing a usable TUI for the human. It also pairs well with Omarchy, so they built a Quickshell plugin to integrate the calendar into that environment. The post is a request for bug reports and missing-feature feedback from users running it in anger.

## Objective

Ship a stable, open-source TUI/CLI calendar that speaks standard iCalendar, syncs with CalDAV servers, stores events in a queryable SQLite database, exposes a CLI surface that LLMs can self-discover, and integrates with the Omarchy desktop via a Quickshell plugin.

## Target Users

- Primary: terminal-first developers who live in the TUI all day and want a calendar that feels like a native CLI tool rather than a web app.
- Secondary: Omarchy / Quickshell users who want their calendar visible in the bar; LLM-driven workflows (Claude / Codex / etc.) where the assistant reads or writes the calendar through the CLI.

## MVP Scope

- TUI built with `ratatui` showing day / week / month views, with keyboard navigation.
- SQLite-backed event store with the standard iCalendar (RFC 5545) fields.
- CalDAV sync (one-way pull at minimum; two-way if the library supports it cleanly).
- A CLI with stable, discoverable commands (`chroncal list`, `chroncal add ...`, `chroncal today`, etc.) and a `--json` flag for machine consumption.
- A Quickshell plugin for Omarchy that surfaces today's events in the bar.
- Out of scope: mobile sync, free-busy lookup, attendee responses, native notifications daemon.

## Design Direction

The TUI is monochrome with one accent for the current day and another for events with attendees. The CLI mirrors the TUI one-to-one so muscle memory transfers. The Quickshell plugin shows the next 3 events with time + title, no agenda preview, no click-to-join. Help output is verbose on purpose — the audience is LLM-assisted developers who need discoverable command names.

## Constraints

- The SQLite schema must be stable enough that an LLM can `SELECT` against it directly without a custom ORM layer in the way.
- CalDAV sync must work against a mainstream server (Radicale, Nextcloud, Baikal) out of the box; the configuration knob is the URL + credentials, nothing else.
- The TUI must be usable at 80×24 — no assumption of a giant terminal.
- No external telemetry; everything stays in the local SQLite file.
