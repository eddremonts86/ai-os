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

## Tech Stack

- **Core CLI:** one stdlib-only Python file (`mesh.py`) with subcommands `init`, `join`, `send`, `ping`, `ask --wait N`; distributed via `pipx install git+https://github.com/husker/a2acast` or a raw `curl ... | python3 mesh.py join ...` paste.
- **Transport:** `ntfy` topic as a public relay for messages and control packets; no inbound ports on either peer.
- **Cryptography:** asymmetric end-to-end encryption using the join code (`mesh1-XXXX...`) as the shared secret; the relay sees only ciphertext.
- **Watcher:** long-running background process per node that subscribes to the mesh topic, decrypts inbound packets, and either prints them or wakes the appropriate CLI session.
- **Plugins:**
 - **Claude Code** — `/plugin install a2acast`, then `mesh claude-setup` per project; uses asynchronous `Stop` with `asyncRewake` to wake the session on inbound.
 - **Codex CLI / ChatGPT desktop** — `codex plugin add a2acast@a2acast`, then `mesh codex-setup` per machine; uses `Stop` hook.
 - **GitHub Copilot CLI** — `copilot plugin install a2acast@a2acast`, then `mesh copilot-setup` per project; runs as an MCP server (`mesh mcp-serve`) wired via `.github/mcp.json` so the watcher starts with the session and stops on Ctrl-C or crash.

## Architecture

```
Machine A (Linux laptop)            Machine B (MacBook)
┌─────────────────────────┐         ┌─────────────────────────┐
│ Claude Code session     │         │ Codex CLI session       │
│  ▲ Stop + asyncRewake   │         │  ▲ Stop hook            │
│  │                      │         │  │                      │
│  ▼                      │         │  ▼                      │
│ mesh watcher ───────────┼─── ntfy ┼── mesh watcher          │
│  ▲           ▲          │ topic   │  ▲           ▲          │
│  │           │          │ (E2E    │  │           │          │
│  │   mesh.py │  mesh.py │  enc.)  │  │   mesh.py │          │
└──┼───────────┼──────────┘         └──┼───────────┼──────────┘
   │ join code │ send / ask --wait     │ join code │ send / ask
   │ (secret)  │                        │ (secret)  │
   └────────────────────────────────────┘
```

Each node learns about peers from `MESH_NODE_JOINED` events on the topic — no static machine list is required; any machine with the join code can join and every other node picks up its presence.

## Milestones

1. **M0 — Spec freeze.** Single-file `mesh.py` interface (`init`, `join`, `send`, `ping`, `ask --wait`) and the ntfy topic schema signed off. End of week 1.
2. **M1 — Core mesh.** `init` / `join` / `send` over ntfy with end-to-end encryption; `MESH_NODE_JOINED` print on the original node. End of week 3.
3. **M2 — Ping + ask.** `mesh ping NODE` returning `MESH_PONG node=NAME rtt=...`; `mesh ask NODE "..." --wait N` returning the delegated result. End of week 5.
4. **M3 — Claude Code plugin.** `/plugin install a2acast`, `mesh claude-setup` arms presence; asynchronous Stop + asyncRewake wakes the session on inbound. End of week 6.
5. **M4 — Codex + Copilot plugins.** `codex plugin add a2acast@a2acast` + `mesh codex-setup`; `copilot plugin install a2acast@a2acast` + `mesh copilot-setup` wires `.github/mcp.json`. End of week 8.
6. **M5 — Hardening.** Worker-pool playbooks (each machine in its own Git worktree), `mesh ask --wait` timeout enforcement, and a self-hosted `ntfy` quickstart. End of week 10.

## Risks

- **Public `ntfy.sh` as the default relay.** Code snippets and prompts traverse a public relay; even with end-to-end encryption, metadata (topic name = mesh identity, message timing, message size) is visible. Ship a documented self-hosted `ntfy` path as the recommended production posture and stop claiming the public relay is "private enough".
- **Per-CLI plugin scope asymmetry.** The README documents Claude and Copilot setup as project-scoped, Codex as machine-scoped, without an explanation. A user who runs `mesh codex-setup` once may assume the same scope applies to Claude and get surprised that a new project on the same machine is not mesh-armed. Document the rationale and unify where possible.
- **Copilot MCP-server lifecycle.** `mesh mcp-serve` must start with the session, stop on Ctrl-C, and stop on crash — if any of those fail the watcher leaks. The plugin must wire the lifecycle via `.github/mcp.json` and a smoke test must verify no orphaned processes after a forced kill.
- **`mesh ask --wait` result loss.** If the worker session crashes mid-task and never replies, the controller's `--wait` expires with no result and the user has no error code. Enforce a timeout that returns a non-zero exit and a structured "worker did not respond in Ns" message so callers can retry or fall back.
