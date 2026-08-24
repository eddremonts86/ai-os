---
id: "1558"
slug: clinch-local-first-warp-fork-built-for-agent-session-ma
title: Clinch – Local-first Warp fork built for agent session management
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49353724"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Clinch – Local-first Warp fork built for agent session management

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Warp was my daily driver for years, and I still love the core product. But I wanted more privacy, less Oz agent stuff and a better UX experience for managing all my Claude Code/Codex sessions, especially across the repos I'm working on at once.So I forked Warp, gutted all the telemetry, account requirements, Oz agent stuff and have fine tuned the UX over the months to optimize it for session management. The awesome Warp terminal is still first class (auto complete, auto command suggestion etc) but with lots of QoL improvements for agent session management and organization.Some notable features:* Claude Code and Codex sessions auto resume with the correct flags if you ever quit/restart Clinch -- this is a huge issue in Warp for me and always prevented me from updating to the latest version of Warp.* Clinch CLI + Skill so Claude and Codex can auto create new tabs for you and even auto suggest quick response buttons (see below). This is especially nice when you ask Claude to run a local web server, it will auto run it in a new tab so it's not hidden in the background of a Claude session.* Remote control using Tailscale, use and control Clinch from your phone.* Left side panel contains all your sessions/terminal tabs (switch between with CMD + SHIFT + [) for a repo. Each repo/project has its own tab in the header, quickly switch between them with CMD + [.* Instantly see agent status (working, done, needs input, idle).* Customizable sections in the left side panel to organize your sessions into groups i.e. "In Progress" and "Backlog" etc.* Customizable quick response buttons in the footer of Claude and Codex sessions to quickly respond with: "/compact", "LGTM, continue" or "Review this with Fable" etc.* Action buttons in the footer: One-click transfer a Claude Code session to a Codex session and vice versa.

 One-click fork session in new tab.

100% open source and free. No account or signup needed.This is a personal project that I enjoy working on in my spare time. macOS only for now, but if there is interest I will add Linux support next.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49353724) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
