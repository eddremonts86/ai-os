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

## Tech Stack

The README states the stack explicitly; these are facts from the repo, not inferences.

- **Tauri 2 (Rust backend):** the app shell, giving a small footprint and a Rust core for SSH/security logic.
- **React + xterm.js (frontend):** the terminal UI and the terminal emulator component.
- **russh / russh-sftp:** the SSH and SFTP protocol implementations in Rust.
- **portable-pty:** local shell tabs and process handling.
- **OS keychain mirror:** secrets are mirrored to the OS keychain where it works, with the 0600 file as primary store.
- **Local MCP server:** the optional AI-agent bridge, off by default, bound to 127.0.0.1 behind a random bearer token.

## Architecture

- **Connection layer:** russh sessions with host-key verification (first-connect fingerprint, known_hosts tracking, hard refusal on change); jump hosts verified before credentials are sent.
- **Workspace layer:** tabbed/splittable terminal panes, dual-pane SFTP, local/remote/SOCKS forwarding with keepalive, reconnect-on-drop.
- **Vault layer:** host vault (folders, colors, favorites), key vault, `~/.ssh/config` import, secrets in `~/.ssh-ache/secrets.json` (0600), encrypted export/import (PBKDF2-SHA256 600k → AES-256-GCM).
- **Bridge layer:** the MCP server is localhost-only, bearer-token-gated, per-host opt-in, per-command approval; secrets never leave the vault into agent context.
- **No cloud:** the only outbound call is the GitHub release check for updates.

## Milestones

1. **M0 — Terminal core.** Full SSH sessions with tabs, panes, scrollback search and reconnect-on-drop across the three platforms.
2. **M1 — Files and tunnels.** Dual-pane SFTP with drag-and-drop and conflict handling; local/remote/SOCKS forwarding with keepalive; jump hosts.
3. **M2 — Vault and verification.** Host/key vaults, config import, 0600 secrets store, encrypted backups, hard host-key refusal.
4. **M3 — MCP bridge.** The approval-gated agent bridge ships off-by-default with per-command approval; then code-signing/notarization for macOS.

## Risks

- **Secrets at rest:** the 0600 file is not encrypted; screen-lock passphrase encryption is planned but unshipped — the most serious open item.
- **Unsigned macOS builds:** first-run friction and a legitimate trust concern for a credentials-handling app.
- **MCP abuse surface:** per-host Auto-allow exists and skips prompts; agent errors then have direct host effects.
- **Protocol complexity:** SFTP, forwarding and jump-host edge cases are where SSH clients accumulate bugs; test coverage must lead, not follow.
- **Ecosystem headwinds:** users already have terminals; the app must win on the bundled ergonomics and the security posture, not novelty.
