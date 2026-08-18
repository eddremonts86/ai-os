---
id: "3015"
slug: a-multiplayer-coding-environment-for-dev-teams-and-agen
title: A multiplayer coding environment for dev teams and agents
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339145"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# A multiplayer coding environment for dev teams and agents

## Phase 0: Scaffold

- [ ] Create project folder `apps/3015-forklane/`
- [ ] Initialize Node + TypeScript repo
- [ ] Add CodeMirror 6 to a browser page with Yjs document and a `y-websocket` server
- [ ] Wire design tokens from DESIGN.md into the editor chrome
- [ ] Add the README's "wedge, not daily driver IDE" disclaimer at the top
- [ ] Confirm a single-region deployment model in the README

## Phase 1: Core

- [ ] Implement Yjs awareness for cursors and avatars; verify two-tab real-time edits merge
- [ ] Build the shared file tree backed by the workspace directory, with a CRDT-backed file index
- [ ] Build the shared task list backed by Yjs; every collaborator reads and writes the same list
- [ ] Add xterm.js in the browser and `node-pty` on the server for the shared terminal
- [ ] Build the agent slot: a thin wrapper around a single model backend (env-wired) that reads the task list, edits files via the Yjs client, and runs commands in the shared PTY
- [ ] Implement the conflict policy: when two writes collide, the second loses with a clear error and a one-click retry
- [ ] Add the per-agent rate limits on edits and the kill switch visible to any collaborator
- [ ] Implement the workspace snapshot to object storage every minute
- [ ] Implement the restore-from-snapshot flow for a crashed session
- [ ] Add a sandboxed PTY per workspace; document the security model in the README
- [ ] Run three hackathon-style sessions with the author and friends, log the integration-time savings, iterate before declaring v1

## Phase 2: Deploy

- [ ] Create GitHub repo
- [ ] Provision object storage and a single-region VM (Fly.io)
- [ ] Deploy the collaboration server, the agent runtime, and the snapshot worker
- [ ] Wire CI: type-check + Yjs merge regression tests + PTY isolation tests on every push
- [ ] Verify the deployed instance supports two collaborators and one agent finishing a five-task session end-to-end
