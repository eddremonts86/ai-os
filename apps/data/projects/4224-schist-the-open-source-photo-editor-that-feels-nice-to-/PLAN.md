---
id: "4224"
slug: schist-the-open-source-photo-editor-that-feels-nice-to-use
title: "Schist – the open source photo editor that feels nice to use"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507125"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Schist – the open source photo editor that feels nice to use

## Tech Stack

The editor is the desktop app; the surrounding site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the per-format install catalogue. Coolify hosts the site behind Docker.

## Architecture

A desktop photo editor exposes brushes, transforms, selections, and filters; a Photos library integration reads from the OS library. Build artefacts ship as AppImage, Debian, Fedora / RHEL, and Arch packages for x86_64 and aarch64. The site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — Core editor: brushes, transforms, selections, filters.
- M2 — Photos library integration.
- M3 — AppImage build for x86_64.
- M4 — Distro packages (Debian, Fedora, Arch) for x86_64.
- M5 — aarch64 packages across the same formats.

## Risks

- Open source is a hard requirement; a future closed-source tier would break the headline claim.
- aarch64 packaging is real work; every format has to be rebuilt and tested on Raspberry Pi and Ampere.
