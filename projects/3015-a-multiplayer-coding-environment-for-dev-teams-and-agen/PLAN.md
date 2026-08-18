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

## Tech Stack

- **Frontend:** CodeMirror 6 for the editor. Picked over Monaco because CodeMirror's Yjs binding is mature and the bundle is smaller.
- **Realtime collaboration:** Yjs with a `y-websocket` server. CRDT-backed so concurrent edits merge deterministically; this is the property the author is selling.
- **Terminal:** xterm.js plus a server-side PTY (`node-pty`) so the terminal is shared across humans and agents.
- **Backend:** Node.js with TypeScript. The collaboration server, the agent runner, and the workspace manager are all Node services in a single repo.
- **Agent runtime:** A thin wrapper around a single model backend wired in via env. The agent reads the shared task list, edits files via the CRDT client, and runs commands in the shared PTY.
- **Hosting:** A single VM (Fly.io or a personal box) plus a Tigris/S3-compatible bucket for workspace snapshots. No Docker orchestration beyond a single container plus a Postgres container.

## Architecture

Each workspace is a CRDT document plus a server-side PTY. A collaborator opens a browser, joins the workspace by URL, and sees the same file tree, the same editor state, the same task list, and the same terminal as every other collaborator and every agent. Agent actions go through the same CRDT and PTY paths, so they are first-class participants.

```
Browser (CodeMirror + xterm + Yjs client)
   |  WebSocket
   v
Collaboration server (Node)
   |--- Yjs document (shared state)
   |--- PTY (shared terminal)
   |--- task list (shared)
   ^
   |  same Yjs client + same PTY
   |
Agent runtime (Node, same process or sibling)
```

A workspace snapshot is written to object storage every minute so a crashed session can be restored.

## Milestones

1. **M0 — Scaffold:** Node + TypeScript repo, CodeMirror wired into a browser page, Yjs document, single-tab edit collaboration.
2. **M1 — Multiplayer presence:** Yjs awareness for cursors and avatars, two-tab test confirming real-time edits merge.
3. **M2 — Shared terminal:** xterm.js in the browser, `node-pty` on the server, two collaborators type into the same PTY.
4. **M3 — Shared file tree and task list:** File tree backed by the workspace directory, task list backed by Yjs, both shared across collaborators.
5. **M4 — Agent slot:** A thin wrapper around a single model backend; the agent reads the task list, edits via the Yjs client, runs commands in the shared PTY.
6. **M5 — Conflict policy:** When two writes collide, the second loses with a clear error and a one-click retry; surfaced in the UI.
7. **M6 — Snapshot and restore:** Workspace snapshot to object storage every minute; a crashed session can be restored to the last snapshot.
8. **M7 — Dogfood with three hackathon-style sessions:** Verify the integration-time savings before declaring v1.

## Risks

- **CRDT scaling.** Yjs handles thousands of edits per document, but a long session can grow large. Mitigation: periodic document compaction; document size is visible to users.
- **PTY abuse.** A shared PTY is also a shared shell. Mitigation: a single-user sandbox per workspace, no privilege escalation paths.
- **Agent runaway.** An agent that loops on a task can monopolize the PTY. Mitigation: per-agent rate limits on edits and a kill switch visible to any collaborator.
- **Single-region latency.** Multiplayer CRDTs amplify latency between distant regions. Mitigation: ship v1 single-region; document the cost.
