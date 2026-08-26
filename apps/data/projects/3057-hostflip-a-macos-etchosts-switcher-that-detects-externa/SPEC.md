---
id: "3057"
slug: hostflip-a-macos-etchosts-switcher-that-detects-externa
title: Hostflip – a macOS /etc/hosts switcher that detects external edits
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49444897"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Hostflip – a macOS /etc/hosts switcher that detects external edits

## Problem

Hi HN — I built hostflip, a native macOS menu bar app for switching /etc/hosts profiles. It is free and open source under the MIT license.The problem I wanted to solve was not just editing hosts entries. It was sharing /etc/hosts with Docker Desktop, VPN clients, scripts, and manual edits without one writer silently erasing another's changes.On first run, hostflip captures a read-only baseline (called Base Hosts) from the existing file and keeps the untouched original as hosts.orig. Active profiles are appended after the baseline in a clearly marked block.Writes are still atomic whole-file replacements under the hood. Before each write, the daemon hashes the live file and compares it with the expected hash. If they differ, it refuses the write; the app shows a diff and asks the user to reconcile the change first.A few other details:- Profiles can live in groups. At most one profile per group is active, while active profiles from different groups and standalone profiles stack together.- After a one-time approval in System Settings, subsequent switches no longer prompt for a password. The root helper is registered through SMAppService and exposes a single XPC operation: atomically replace the hosts file with merged content. The app and daemon verify each other's signing identity.- The bundled CLI shares the same workspace as the app and supports structured JSON output. hostflip doctor dev.example.com traces a hostname from profiles through the merged output and the live /etc/hosts file to the system resolver.- Remote profiles can refresh from HTTPS sources on a schedule. There is also an importer for existing SwitchHosts configurations.- The editor has cross-profile hostname/IP search, comment toggling, basic validation for malformed hosts lines, and stays responsive with large remote profiles.The app is built with Swift and SwiftUI, distributed through Homebrew or a signed and notarized DMG, and currently requires macOS 14 or later on Apple silicon. Intel, Windows, and Linux are not supported.I would especially like feedback on the conservative drift behavior: if another process changes /etc/hosts, hostflip blocks further writes to the system file until the user reviews the diff. How do you handle multiple writers to the hosts file, and would you expect a different reconciliation model?

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
