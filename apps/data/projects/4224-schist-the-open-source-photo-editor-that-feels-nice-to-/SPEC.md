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

## Problem

Schist (schist.app) is a free, open-source photo editor distributed across Linux desktop formats (AppImage, Debian, Fedora / RHEL, Arch, portable binary) for both x86_64 and aarch64 (Raspberry Pi, Ampere). The page positions it as "Beautiful and feature-rich shouldn't mean closed source" — the editor ships with brushes, transforms, selections, filters, and direct integration with the OS Photos library. The pricing story is "free but not feature-less"; the deployment story is "every Linux desktop format a developer could want".


---

## Objective

Ship an open-source photo editor that ships brushes, transforms, selections, filters, and a Photos library integration for every common Linux desktop format (x86_64 and aarch64), without locking features behind a closed-source tier.


## Target Users

Linux desktop users who want a free, open-source photo editor that integrates with their Photos library and works on x86_64 and aarch64 machines (including Raspberry Pi and Ampere). Assumes the reader can install an AppImage or a distro package.


## MVP Scope

- A photo editor with brushes, transforms, selections, and filters.
- A Photos library integration on Linux desktops.
- AppImage, Debian, Fedora / RHEL, and Arch packages for both x86_64 and aarch64.
- A portable binary for users who cannot install packages.
- A documentation page that links to the per-format install steps.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the product is presented as free.
- Open source is a hard requirement; the product cannot lock features behind a closed-source tier.
- aarch64 (Raspberry Pi, Ampere) is a real target, not an afterthought.
