---
id: "4025"
slug: murmell-collaborative-cloud-canvas-for-coding-agents
title: Murmell – Collaborative cloud canvas for coding agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49499167"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Murmell – Collaborative cloud canvas for coding agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hey HN!I'm Moss'Ab. Murmell (https://murmell.com) is an infinite canvas where coding agents run together in the cloud instead of on your laptop.It's like Google Docs, except the other editors are you, your teammates, and a set of agents all working in the same canvas.Short demo: https://app.murmell.com/demoThe idea came out of a YC hackathon. We were trying to build the thing under extrem pressure, deploying at the very last minute, but with several agents working in parallel, all the branches collided. Everything broke at the worst
possible moment and we spent the end of it untangling instead of building. We didn't win.Murmell is the thing I wished we'd had that day:
one place where the agents and the people can see each other work,
on machines that don't belong to any one laptop.Each canvas gets its own machine in the cloud. Close your laptop and the agents keep going; open it again anywhere, or have a teammate open the same canvas by sending him the link, and you're inside the same session rather than a copy
of it. The work stays exactly where you left it : same branches, same dev server still running, so an agent picks up mid-task instead of starting from scratch.And you can literally collaborate with your team like google docs, it's se same system, read of edit link, they connect they can type on your terminal, you can see their mouse, wich terminal they're typing in.
And you can interact wich each other sessions, it's pretty useful instead of sharing a screen, copying a prompt, etc.The hardest part was building the cloud infrastructure, trying to make it scalable, and to manage the sessions to make the best experience possible: when the VM shuts down, it snapshots everything and restores everything when you come back, even the conversation with your terminal, it's stored with a system that i built like obsidian wich also make you save a little bit of tokens.So the answer to that hackathon is file claiming. Before an agent works on something, it claims the paths, it's an exclusive lease with a TTL, so nothing stays locked forever because an agent died mid-task. And if another agent asking for the same file gets denied, the denial tells it who holds it, how long is left, and to either pick other work in its scope or message the holder (the agents can communicate through the board)A watcher classifies every write, so if anything writes inside someone else's claim it shows up on the canvas as a
collision right then, instead of as a merge conflict you discover an hour later. And when an agent is done, it can hand its claim to the next one.And agents never hold your provider keys either, they get a token, and a proxy on the container's loopback swaps it for the real key on the way out, which makes a leaked token worthless outside that container.Murmell is paid. I've put prices at 50% off for now, because it's still not where I want to take it yet.
It is fully usable though: I develop Murmell with Murmell, every day (and tbh it's save soooo much time to us with my cofounder)And to be fully transparent with the actual prices it costs us much than we are earning but the goal is to collect feedback to make Murmell as good as possibleFor context: I'm 19, a 4th year computer engineering student, and I've been on this for about three and a half months, day and night. I discovered claude code after my father showed me first Windsurf (today Devin) for a python homework in 2024, and i think i never went somewhere without my laptop since then lol.So feel free to comment or to give feedback, or even subscribe to support the project :)

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49499167) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
