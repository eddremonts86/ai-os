---
id: "4190"
slug: linux-server-management-over-ssh-written-in-rust-and-ta
title: "Linux server management over SSH – written in Rust and Tauri"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509679"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# Linux server management over SSH – written in Rust and Tauri

## Tech Stack

The desktop app is Rust + Tauri; the surrounding docs site uses React + TypeScript on TanStack Start with SQLite/Drizzle for the docs catalogue. Coolify hosts the docs behind Docker.

## Architecture

A Tauri shell hosts a Rust backend that opens SSH sessions and surfaces commands; the UI is the local web view. Credentials live in an encrypted vault on disk. The docs site is a TanStack Start app Coolify hosts behind Docker.

## Milestones

- M1 — Tauri shell with an SSH session per server.
- M2 — Live dashboard per server.
- M3 — Real terminal tab.
- M4 — File manager over SFTP.
- M5 — Tabs for Docker, services, cron, users, firewalls.
- M6 — Encrypted credential vault.

## Risks

- Agentless is a hard requirement; if any feature silently depends on a server-side helper, the claim collapses.
- Distro coverage is a constant maintenance burden; a single distro regression breaks a real user.
