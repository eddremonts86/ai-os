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

## Value Proposition

One desktop app for everything SSH: a real terminal, SFTP, port forwarding and jump hosts, with security as a design principle rather than a setting — host-key changes refuse the connection, secrets live in a 0600 file on your machine, and nothing is uploaded anywhere. The optional MCP bridge lets an AI agent work on your hosts through a default-deny, per-command approval gate, without ever seeing your secrets. Local-first, open source (Apache-2.0), no account.

**One-liner:** A local-first desktop SSH client with terminal, SFTP, tunnels and an approval-gated AI-agent bridge.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Daily SSH users (devs, operators) | Terminal, SFTP and tunnels in one app instead of three tools. |
| Security-conscious users | No cloud, no account, hard MITM refusal, encrypted backups, local secrets. |
| AI-agent workflow adopters | The MCP bridge gives agents host access under explicit per-command approval. |

The README also signals a fourth audience: teams, via the separate SSH Ache Teams product.

## Jobs To Be Done

1. **Functional job** — Open full SSH sessions in a tabbed, splittable terminal and stay connected (reconnect-on-drop).
2. **Functional job** — Move files over SFTP with dual-pane drag-and-drop, conflicts handled.
3. **Functional job** — Set up local/remote/SOCKS forwarding and reach hosts through jump hosts.
4. **Functional job** — Trust the connection: fingerprints verified on first connect, refused on change, no override.
5. **Functional job** — Let an AI agent operate hosts through the MCP bridge, approving each command, with secrets never exposed.

## Success Metrics

- **Daily-driver completeness:** terminal + SFTP + tunnels cover the workflows users otherwise split across tools.
- **Security posture:** zero bypass paths — host-key changes refuse, MCP is default-deny, backups encrypt.
- **Agent-bridge safety:** MCP sessions run behind the bearer token with per-command approval; secrets are never in agent context.
- **Cross-platform reach:** macOS, Windows and Linux builds exist and run.
- **The source names no revenue target; the community edition is free.**

## Pricing & Monetization

The community edition is Apache-2.0 and free. The README mentions a separate product, SSH Ache Teams (encrypted connection sharing), and a "buy me a coffee" link for the author — neither with pricing. Monetization for the community edition is out of scope.

## Competitive Landscape

The README does not name competitors. The landscape is terminal emulators plus standalone SSH/SFTP tools on one side and commercial desktop SSH clients on the other; SSH Ache's differentiation is the combination — one local-first app with terminal, SFTP, tunnels, jump hosts and vault — plus the MCP bridge, which few established clients offer, and the no-cloud/no-account posture. No feature or price comparison appears in the source.

## Risks & Open Questions

- [ ] Secrets are not encrypted at rest (0600 file, keychain as mirror); the README discloses this, but it is the top security objection a reviewer will raise.
- [ ] Unsigned/notarized macOS builds force users through the "unidentified developer" gate for an app that handles SSH credentials — the README itself flags this.
- [ ] The MCP bridge is the riskiest surface: approval fatigue can push users to per-host Auto-allow, which is exactly where agent mistakes become host damage.
- [ ] Competing on features against mature terminal + SSH ecosystems is a long grind for an early project (1 star, 11 commits at capture time).
- [ ] The "no connect anyway" host-key stance is correct but will frustrate users behind unstable infrastructure; the product must hold the line anyway.
