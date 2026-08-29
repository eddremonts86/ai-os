---
id: "3591"
slug: marktwin-collaborative-workspaces-on-markdown-files-you
title: Marktwin – collaborative workspaces on Markdown files you own
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49479555"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [TypeScript, React, Yjs, libp2p, GitHub OAuth, SQLite]
---
# Marktwin – collaborative workspaces on Markdown files you own

## Phase 0: Scaffold

- [x] Capture problem from HackerNews + write SPEC.md skeleton
- [ ] Stand up the TypeScript + React workspace, with Vite for the editor shell
- [ ] Wire Yjs into a minimal Markdown editor and confirm two browser tabs converge on the same text
- [ ] Add libp2p with the relay enabled; confirm two peers can find each other through the relay
- [ ] Implement GitHub OAuth (web flow first, device flow later) and confirm the editor can list the user's repos
- [ ] Pick the SQLite schema for the workspace's local cache (repo file tree, pending diff, review state)
- [ ] Decide and document the frontmatter merge rule so concurrent edits to agent-readable metadata converge predictably

## Phase 1: Core

- [ ] Bind a workspace to a single repo after OAuth: pull the Markdown tree, store it locally in SQLite
- [ ] Markdown mode over Yjs: real-time editing between peers on the same workspace
- [ ] Canvas mode: vector-backed canvas bound to the same Yjs document; peers converge on shape changes
- [ ] Draw mode: freehand drawing layer also bound to Yjs so the canvas and the drawing share one source of truth
- [ ] Discuss mode: inline threads attached to anchors in the Markdown or the canvas; the threads share Yjs state
- [ ] Peer presence indicators (who is in the workspace, which file they are looking at)
- [ ] Review step: diff pending changes against the repo's HEAD, per-change accept/reject
- [ ] Push-back-to-GitHub: commit directly or open a PR on submit, using the OAuth token from sign-in
- [ ] Lock OAuth scope to the bound repo only; no extra permissions requested
- [ ] Audit the four modes and the discussion thread for any AI feature accidentally introduced; remove it
- [ ] Tests: peer-to-peer convergence across reconnect, frontmatter merge rule, push-back idempotency

## Phase 2: Deploy

- [ ] Public landing at marktwin.com with the four modes and the review step as the primary surface
- [ ] No pricing page, no quota screen, no paywall — the "free for now" posture is visible in-app
- [ ] A documented "no AI" stance in the README and the editor UI, so the design decision is checkable
- [ ] Onboarding doc that explains peer-to-peer connectivity, the relay fallback, and what the signaling server does and does not see
- [ ] First ten external workspaces onboarded; collect feedback on the four modes and the review step
- [ ] Release checklist that fails if any AI suggestion, paywall, or pricing UI is detected in a build
