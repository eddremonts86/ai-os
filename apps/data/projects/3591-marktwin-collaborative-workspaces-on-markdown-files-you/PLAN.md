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

## Tech Stack

- **Editor UI:** TypeScript + React. The editor has four modes (Markdown, canvas, draw, discuss); React keeps the mode-switching story legible without per-mode framework switching.
- **Realtime CRDT layer:** Yjs with the y-markdown binding. Yjs converges concurrent edits without locks, which is the exact posture the author describes.
- **Peer transport:** libp2p for the peer-to-peer session between collaborators. libp2p handles peer discovery, NAT traversal where possible, and falls back to a relay when peers cannot connect directly.
- **Auth:** GitHub OAuth (device flow for CLI parity, web flow for the editor). The OAuth scope is `repo` on the bound repo only; nothing else.
- **Local cache / workspace state:** SQLite, embedded in the editor process. Holds the bound repo file tree, the pending diff, and the review state.
- **Markdown rendering:** a small Markdown renderer that respects frontmatter so the "context that people and agents use" stays intact.
- **Drawing / canvas surface:** a Yjs-bound canvas layer using a vector-backed representation so peers converge on the same drawing without per-pixel locks.
- **Push-back-to-GitHub:** the GitHub REST API for committing or opening a PR, gated behind the review step.
- **Signaling:** a minimal libp2p relay used only for peer discovery. It never sees document content.

## Architecture

A user opens Marktwin, signs in with GitHub, and binds a workspace to a repo they own or have access to. The workspace pulls the relevant files from the repo (the Markdown tree the team has agreed to edit), starts a libp2p session, and invites collaborators by sharing a workspace link. The collaborators join the same libp2p session and the four editor modes start sharing state through Yjs.

All four modes share the Yjs document. The Markdown mode writes to the same document the canvas and drawing modes annotate, and the discussion mode attaches inline threads to the same anchors. Peer-to-peer is the default transport: each peer holds a copy of the document state and Yjs handles convergence.

When the team is ready to push back, the editor opens a review view that diffs the workspace's pending changes against the repo's HEAD, file by file. The user accepts or rejects per change, then the editor either commits directly or opens a PR via the GitHub API, using the OAuth token from the original sign-in. The signaling server never sees document content; it only helps peers find each other.

## Milestones

1. **M0 — GitHub OAuth + repo binding.** A user signs in with GitHub, picks a repo, and the editor shows the Markdown tree from that repo. No editing yet.
2. **M1 — Peer-to-peer session with Markdown mode.** Two peers on the same workspace see each other's Markdown edits in real time via libp2p + Yjs.
3. **M2 — Canvas, draw, and discuss modes.** The other three modes the author named converge through the same Yjs document and survive peer churn.
4. **M3 — Review-and-push step.** A diff view against the repo's HEAD with per-change accept/reject; commit-or-open-a-PR on submit.
5. **M4 — Free-tier + no-AI guardrails.** Pricing UI is absent; no AI suggestions, no AI-generated text in any of the four modes; the "free for now" posture is documented in-app.

## Risks

- **Peer-to-peer reach** — not every pair of peers can connect directly; the MVP needs a relay fallback that does not become a content host, or the no-third-party-server promise breaks.
- **Frontmatter merge collisions** — Yjs handles prose well but structured frontmatter is harder; the MVP must define the merge rule before teams trust it with agent-readable metadata.
- **OAuth scope creep** — if the editor ever asks for more than the bound repo, the "files you own" framing erodes. Scope must be locked to the bound repo on day one.
- **No-AI regression** — the "no built-in AI" stance is structural; without a visible guardrail, a well-meaning contributor can quietly add a "helpful" AI suggestion and undo the product decision.
- **Sustainability of "free for now"** — the author hopes to keep it free; the architecture and operating costs need to be compatible with that, otherwise a future pivot forces a UX-level reversal.
