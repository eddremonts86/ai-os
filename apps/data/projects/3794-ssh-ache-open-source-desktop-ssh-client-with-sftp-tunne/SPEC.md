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

## Problem

The Show HN post is URL-only, pointing at the SSH Ache repository. The README positions the project as "a fast, local-first, open-source desktop SSH client" whose community edition bundles what usually requires several tools: a real terminal (russh + xterm.js) with tabs and split panes, a dual-pane SFTP browser with drag-and-drop, port forwarding (local, remote and SOCKS5) with keepalive, jump hosts, a host and key vault, and — the unusual part — an optional AI-agent bridge over MCP, off by default, bound to localhost behind a bearer token, with per-host opt-in and per-command in-app approval. The trust posture is explicit throughout: host-key verification with hard refusal on change (no "connect anyway" button), secrets stored in a 0600 file outside the config, password-encrypted backups (PBKDF2-SHA256, 600k iterations, AES-256-GCM), and "no cloud — nothing is uploaded and no account is required; the only outbound request is the GitHub release check". It is Apache-2.0, built with Tauri 2 (Rust) for macOS, Windows and Linux; macOS builds are not yet signed or notarized. A separate commercial product, SSH Ache Teams, is mentioned as the optional way to share connections end-to-end encrypted.

## Objective

Ship the community edition as a credible desktop SSH daily driver: terminal + SFTP + tunnels + vault + verification, with the MCP bridge as an approval-gated add-on that never leaks secrets to the agent. The MVP is the feature set the README already lists, packaged for macOS, Windows and Linux.

## Target Users

- Developers and operators who use SSH every day and want one desktop client instead of a terminal plus separate SFTP and tunnel tools.
- Security-conscious users who want local-first behavior, host-key verification with no override, and no cloud or account.
- Agent-workflow users who want their coding agent to reach hosts through an approval-gated, default-deny MCP bridge.

## MVP Scope

- Real terminal: full SSH sessions, tabs, split panes, local shell tabs, scrollback search, reconnect-on-drop.
- Host vault with folders/colors/favorites, key vault, import of `~/.ssh/config` (including ProxyJump links).
- SFTP browser: dual-pane navigation, drag-and-drop multi-file/folder transfer, conflict prompt, remote create/rename/delete.
- Port forwarding: local (-L), remote (-R) and dynamic SOCKS5 (-D), with keepalive.
- Security: first-connect fingerprint confirmation, known_hosts tracking, hard refusal on key change; secrets in a 0600 file; encrypted backup export/import.
- MCP bridge: off by default, localhost-bound, bearer-token, per-host opt-in, per-command approval; secrets never exposed to the agent.

## Constraints

- Local-first: nothing is uploaded, no account exists; the only outbound request is the release check.
- Default-deny security: host-key changes refuse the connection; MCP is off and per-command approval is the default.
- The 0600 secrets file is the primary store; it is not encrypted at rest today (keychain is a mirror), and the README says so — the MVP must keep that honesty.
- macOS builds are unsigned/notarized; that friction is accepted and disclosed for now.
- Apache-2.0 community edition; SSH Ache Teams is a separate product and out of MVP scope.

## Design Direction

See `DESIGN.md` for this project's design tokens.
