---
id: "3794"
slug: ssh-ache-open-source-desktop-ssh-client-with-sftp-tunne
title: "SSH Ache – open-source desktop SSH client with SFTP, tunnels and MCP"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49492712"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Tauri 2 (Rust), React + xterm.js, russh/russh-sftp, portable-pty, OS keychain mirror, local MCP server]
---
# SSH Ache – open-source desktop SSH client with SFTP, tunnels and MCP

## Phase 0: Scaffold

- [x] Read the repository README to confirm features, security posture and the MCP bridge design
- [x] Write SPEC.md (this document)
- [x] Scaffold the Tauri 2 (Rust) app with React + xterm.js across macOS/Windows/Linux
- [x] Implement host-key verification: first-connect fingerprint, known_hosts tracking, hard refusal on change

## Phase 1: Core

- [ ] Implement the terminal workspace: tabs, split panes, local shells, scrollback search, reconnect-on-drop
- [ ] Implement dual-pane SFTP with drag-and-drop, conflict prompt, remote create/rename/delete
- [ ] Implement local/remote/SOCKS forwarding with keepalive and jump-host verification
- [ ] Implement host/key vaults, ~/.ssh/config import, 0600 secrets store, encrypted backups

## Phase 2: Deploy

- [ ] Ship the MCP bridge: off by default, bearer token, per-host opt-in, per-command approval, secrets never exposed
- [ ] Sign and notarize macOS builds
- [ ] Publish releases and a security disclosure path (SECURITY.md)

---

_Generated automatically by Lúa on 2026-08-29_
