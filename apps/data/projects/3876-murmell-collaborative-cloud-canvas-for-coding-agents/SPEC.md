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

## Problem

The poster is Moss'Ab, a 19-year-old fourth-year computer engineering student who built Murmell (murmell.com) out of a YC hackathon experience: several coding agents working in parallel on the same repo collided on branches, everything broke at the last minute, and the team spent the end of the hackathon untangling the mess instead of building. Murmell is what he wishes the team had that day — an infinite cloud canvas where coding agents run together on a machine that belongs to no single laptop. Each canvas gets its own machine in the cloud: close the laptop and the agents keep going; open the canvas anywhere, or send a teammate the link, and you are inside the same session — same branches, same dev server still running — so an agent picks up mid-task instead of starting from scratch. Collaborators see each other's mouse and which terminal they are typing in, and can interact with each other's sessions instead of sharing a screen or copying prompts. Two mechanisms handle the collision problem that sank the hackathon project: file claiming, an exclusive lease with a TTL so nothing stays locked when an agent dies, and a write watcher that surfaces a cross-claim collision on the canvas the moment it happens instead of an hour later as a merge conflict. Agents never hold provider keys — they get a token that a loopback proxy swaps for the real key, making a leaked token worthless outside its container. When a VM shuts down it snapshots everything, including the terminal conversation, and restores it on return. Murmell is paid, currently at 50% off because it is not yet where the author wants it; it costs him more than it earns, and he is looking for feedback and subscribers. He develops Murmell with Murmell every day.

## Objective

Grow Murmell from a working paid tool into the collaboration layer for coding agents the author intended: a cloud canvas where people and agents share one live session, and where file claiming plus write watching prevent the branch collisions that wrecked the original hackathon. The MVP is what already runs — paid, 50% off, usable daily — with the near-term goal of collecting feedback to fix what is rough and reach a price that covers its costs.

## Target Users

- Solo founders and small teams who run multiple coding agents in parallel on one repo and hit merge conflicts and clobbered work.
- Developers who want their agents to keep working after the laptop lid closes, resumable from any machine.
- Duos like the author and his cofounder who pair-program with agents in the same live session instead of screen-sharing.

## MVP Scope

- One cloud machine per canvas, shared by people and agents through a link, with live presence (mouse and terminal visibility).
- Exclusive file-claim leases with TTL, denial messages that route an agent to other work or to the holder, and claim hand-off between agents.
- A write watcher that marks cross-claim collisions on the canvas immediately.
- Snapshot and restore of the whole session, including terminal conversation, on VM shutdown and return.
- Loopback token proxy so agents never hold provider keys.
- Paid subscriptions at the current 50% launch pricing.

## Constraints

- The author is explicit that Murmell costs more to run than it earns; pricing is discounted 50% for now and the real price points are not stated.
- Cloud infrastructure is the hard part: session management, scaling and snapshot/restore are the named engineering risks.
- Claims must be TTL-bound so a dead agent never leaves a file locked forever.
- Agents must not hold provider keys; the loopback proxy is a hard security boundary.
- All specifics come from a single Show HN post by the author; nothing is verified against independent usage data.

## Design Direction

See `DESIGN.md` for this project's design tokens.
