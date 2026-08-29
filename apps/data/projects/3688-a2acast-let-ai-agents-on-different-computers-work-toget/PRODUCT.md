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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A developer with Claude Code on a Linux laptop and Codex CLI on a MacBook gets a one-minute setup that wires both sessions into an end-to-end encrypted mesh over `ntfy`, with no server, accounts, or open ports — so the two assistants can send messages, wake each other, and delegate tasks across machines as if they shared a session.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Multi-CLI developer (Claude Code + Codex + Copilot) | They want one assistant to wake the other to run a task and report back, without copy-pasting prompts and outputs between terminals. |
| Solo dev with a pool of worker machines | They want to fan out parallel coding tasks to machines each running an isolated Git worktree and have results aggregate in the controller session. |
| Small-team / agency engineers | They want cross-machine coordination that survives a teammate closing their laptop (the watcher wakes the next session) without requiring a shared backend. |
| AI-coding enthusiasts | They want to mix vendors (Claude + ChatGPT desktop + Copilot) and experiment with cross-vendor A2A without spinning up infrastructure. |

## Jobs To Be Done

1. **Functional job** — Send a task from one AI coding session to another on a different machine and get the result back without copy-paste, terminals, or a server.
2. **Emotional job** — Stop feeling that "every CLI runs in a silo" — the user's AI assistants behave like a team, not three unrelated chat windows.
3. **Social job** — Be the engineer who runs Claude Code on the MacBook and Codex on the Linux tower and gets to show that "they collaborate" without standing up infra to prove it.

## Success Metrics

- **Activation:** ≥ 70% of `pipx install` users reach `MESH_NODE_JOINED` on a second machine within the first session (the README's "one minute" claim).
- **Round-trip:** median `mesh ping NODE` RTT under 1 s on a healthy relay; 95th percentile under 5 s.
- **Plugin coverage:** ≥ 80% of installed meshes have at least one plugin-armed session (Claude Code, Codex CLI, or Copilot CLI) within 24 h of install.
- **Encryption correctness:** 100% of relay messages are unreadable without the join code (verified by automated MITM tests against the test relay).

## Pricing & Monetization

Open-source (MIT, per the security-audit summary); no server, no accounts, no paid tier. The project monetises reputation and adoption only — the README does not state a SaaS price or a paid-cloud plan. Possible future paid surfaces: a managed relay with SLAs, or hosted private ntfy for teams that don't want to use the public `ntfy.sh`.

## Competitive Landscape

- **Public A2A / MCP coordination servers** — account-bound, open ports, central relay; a2acast's headline pitch is "no server, no accounts, no open ports" by riding `ntfy` and a join-code secret.
- **tmux/ssh + shell scripts** — what power users do today; brittle, no encryption, no per-CLI plugin model, no task delegation with `--wait` and a structured reply.
- **dmux / Claude-DevFleet / orch-* skill families (AI-OS)** — multi-agent orchestrators that share one machine; a2acast's pitch is cross-machine without a controller process on a third host.
- **Vendor-bundled "agent teams" (Claude Code Teams, Codex multi-agent)** — only available inside one vendor's CLI; a2acast works across Claude Code + Codex CLI + Copilot CLI in the same mesh.

## Risks & Open Questions

- [ ] Confirm license: the project README does not state a license explicitly in the captured excerpt; the security-audit summary lists MIT, but the LICENSE file should be reviewed before distribution.
- [ ] Validate that `ntfy.sh` (the default public relay) is acceptable for sensitive code snippets — a corporate user will need a self-hosted `ntfy` and the docs must show how.
- [ ] Decide the deprecation policy for the per-CLI `mesh NAME-setup` commands — Copilot's `.github/mcp.json` pin is project-scoped, Claude's is project-scoped, Codex's is machine-scoped, and the README does not explain why the scopes differ.
- [ ] Confirm that `mesh ask NODE "..." --wait 300` is bounded to the timeout — runaway tasks on a worker could exceed `--wait` and silently lose the result if the watcher does not enforce it.

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49484874) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
