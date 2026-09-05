---
id: "3876"
slug: murmell-collaborative-cloud-canvas-for-coding-agents
title: Murmell – Collaborative cloud canvas for coding agents
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

## Tech Stack

- **Cloud VM orchestration:** one machine per canvas, provisioned and managed behind the scenes.
- **File-claim leases with TTL:** exclusive claims over paths, expiring automatically so dead agents cannot lock the tree.
- **Realtime collaborative canvas:** shared board where agents, mice and terminals are visible live.
- **Terminal multiplexing:** collaborators see which terminal each other is typing in and interact with sessions directly.
- **Container loopback token proxy:** agents hold tokens, not provider keys; the proxy swaps token for key on the way out.
- **Session snapshot and restore:** VM shutdown captures everything, including terminal conversation, for full restore on return.

## Architecture

- **Canvas layer:** one cloud VM per canvas hosts the repo, branches and dev server for all participants.
- **Claim layer:** a lease store tracks exclusive file claims with TTLs; denials tell an agent who holds a path, how long remains, and how to message the holder.
- **Watch layer:** a write watcher classifies every write against active claims and surfaces collisions on the canvas in real time.
- **Identity layer:** provider keys stay server-side; agents receive tokens that a loopback proxy swaps for real keys per request.
- **Persistence layer:** VM shutdown snapshots the session — filesystem, processes, terminal conversation — and restores it when a user returns.

## Milestones

1. **M0 — Working paid canvas.** The cloud machine per canvas, live presence and link-based joining are usable; the author dogfoods daily.

2. **M1 — Collision system.** File claiming with TTL leases, denial messaging and the write watcher ship and are exercised under real multi-agent load.

3. **M2 — Snapshot and restore.** VM shutdown captures and restores the full session including terminal history, verified by users returning mid-task.

4. **M3 — Pricing reality.** Collect feedback from paying users, reassess the 50% discount, and bring revenue in line with infrastructure cost.

## Risks

- **Infrastructure cost:** each canvas is a VM; the author admits costs exceed revenue today and scaling the session layer is the hardest part.
- **Lease correctness:** TTL expiry, denial routing and claim hand-off must behave under agent churn or files lock or collide again.
- **Snapshot completeness:** restoring a session requires capturing processes and terminal state, not just files.
- **Token proxy security:** the loopback swap must make a leaked token worthless outside its container — a subtle piece of security engineering.
- **Solo capacity:** a 19-year-old author with a cofounder maintains this; bus factor is real.
