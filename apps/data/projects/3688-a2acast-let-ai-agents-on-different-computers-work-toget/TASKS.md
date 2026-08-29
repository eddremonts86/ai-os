---
id: "3688"
slug: a2acast-let-ai-agents-on-different-computers-work-toget
title: A2acast – Let AI agents on different computers work together
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484874"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Python (stdlib only single-file CLI), ntfy relay transport, asymmetric end-to-end encryption, plugins for Claude Code, Codex CLI, Copilot CLI]
---
# A2acast – Let AI agents on different computers work together

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Define DESIGN.md (terminal UX tokens for `MESH_NODE_JOINED`, `MESH_PONG`, `mesh ask` reply formatting)
- [ ] Lock `mesh.py` subcommand surface: `init`, `join`, `send`, `ping`, `ask --wait N`
- [ ] Decide the canonical public relay (ntfy.sh) and document the self-hosted `ntfy` path as the recommended production posture
- [ ] Define the join-code format (`mesh1-XXXX...`) and the asymmetric encryption scheme that uses it as a shared secret

## Phase 1: Core

- [ ] `mesh init home` prints a paste-block the second machine runs to join; on success the initiator prints `MESH_NODE_JOINED`
- [ ] `python3 mesh.py join mesh1-XXXX...` joins an existing mesh, names the node after its hostname, and starts listening
- [ ] `mesh send all "hello mesh"` delivers a ciphertext message to every peer in under 2 s on a healthy relay
- [ ] `mesh ping NODE` returns `MESH_PONG node=NAME rtt=~Nms`
- [ ] `mesh ask NODE "..." --wait 300` delegates a task to the named session and prints the structured result; enforces the `--wait` timeout with a non-zero exit on expiry
- [ ] End-to-end encryption verified: a packet captured on the relay is unreadable without the join code (automated MITM test)
- [ ] Claude Code plugin: `/plugin install a2acast` + `mesh claude-setup` per project; uses async `Stop` + `asyncRewake`
- [ ] Codex CLI plugin: `codex plugin add a2acast@a2acast` + `mesh codex-setup` per machine; uses `Stop` hook
- [ ] Copilot CLI plugin: `copilot plugin install a2acast@a2acast` + `mesh copilot-setup` per project; runs `mesh mcp-serve` via `.github/mcp.json` and stops cleanly on Ctrl-C and crash
- [ ] End-to-end test: from machine A's Claude session, `mesh ask NODE "summarize the failing tests"` returns the Codex session's reply within `--wait`

## Phase 2: Deploy

- [ ] Publish `pipx install git+https://github.com/husker/a2acast` and the raw `curl | python3 mesh.py join` install paths in the README
- [ ] Document the self-hosted `ntfy` quickstart as the production-recommended path
- [ ] Document the per-CLI plugin scope rules (Claude / Copilot project-scoped, Codex machine-scoped)
- [ ] Worker-pool playbook: one controller + N workers each in an isolated Git worktree, with `mesh ask` fanning out tasks
- [ ] Post-launch: monitor MESH_NODE_JOINED / MESH_PONG ratios and `--wait` timeout frequency; ship a release-notes pattern when defaults change
