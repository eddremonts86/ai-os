---
id: "3876"
slug: "murmell-collaborative-cloud-canvas-for-coding-agents"
title: "Murmell – Collaborative cloud canvas for coding agents"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499167"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Cloud VM session orchestration, Exclusive file leases with TTL, Realtime collaborative canvas, Terminal multiplexing, Container loopback token proxy, Session snapshot and restore]
---
# Murmell – Collaborative cloud canvas for coding agents

## Value Proposition

Run several coding agents on the same codebase without the merge hell the author lived through at a YC hackathon. Murmell gives each canvas its own cloud machine: agents and teammates share one live session — same branches, same dev server, mouse and terminal visible — so the work keeps going when the laptop closes and resumes anywhere from a link. Collisions surface the moment a write crosses a claim, and every file claim expires with a TTL, so a dead agent never locks the tree. Agents never see provider keys. The author develops Murmell with Murmell every day, and it is priced at 50% off while it gathers feedback.

**One-liner:** An infinite cloud canvas where coding agents and teammates work in the same live session, with file-claim leases and instant collision detection.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo founders running parallel agents | One repo, several agents, no laptop to keep the session alive; they hit exactly the branch collisions that sank the hackathon. |
| Small teams and cofounder duos | Share one canvas like Google Docs — see each other's mouse and terminal and interact with the same session instead of screen-sharing. |
| Agent-heavy developers | Want agents to keep working after the lid closes and pick up mid-task from the same branches and dev server. |

The post describes no commercial market segmentation; the audience is builders of agent workflows.

## Jobs To Be Done

1. **Functional job** — Give several coding agents one shared cloud workspace where their writes cannot clobber each other.

2. **Functional job** — Keep a session alive across laptop closes and VM shutdowns, restoring branches, dev server and terminal history.

3. **Functional job** — Claim files with a TTL lease so a dead agent never locks paths forever, and hand claims between agents.

4. **Emotional job** — Escape the hackathon trauma: see collisions the moment they happen instead of untangling them at the last minute.

## Success Metrics

- **Collision visibility:** a cross-claim write shows on the canvas immediately, not as a merge conflict discovered an hour later (the poster's stated goal).
- **Session durability:** a VM shutdown snapshots everything — including the terminal conversation — and restores it on return.
- **Self-hosting proof:** the author develops Murmell with Murmell daily; this dogfooding is the stated evidence of usability.
- **Revenue honesty:** costs exceed earnings today; feedback collection is the near-term metric the author names.

## Pricing & Monetization

Murmell is a paid product. The author states prices are currently at 50% off because the product is not yet where he wants it, and that running it costs more than it earns. No specific price figures are stated in the post.

## Competitive Landscape

The post names no competitors. The category is collaborative coding environments for AI agents — shared workspaces, live pair-programming tools and cloud dev environments. The author's own comparison is Google Docs, and the differentiator he claims is session-level identity (same branches, same dev server, terminal history restored) plus file-claim leases with TTL and instant write-collision surfacing, rather than copies of a workspace.

## Risks & Open Questions

- [ ] Unit economics: the author says it costs more to run than it earns; the 50% discount is temporary by his own statement and the real prices are unknown.
- [ ] Cloud infrastructure is the named hard part — scaling VM sessions and snapshot/restore; nothing in the post shows it working beyond his own usage.
- [ ] Single-source evidence: all claims come from the author's post; no external users, testimonials or numbers are provided.
- [ ] Session fidelity is the whole value: if snapshots miss anything (open editors, agent state), the mid-task resume promise breaks.
- [ ] The author is 19 and running it solo with a cofounder; roadmap and support capacity are unstated.
