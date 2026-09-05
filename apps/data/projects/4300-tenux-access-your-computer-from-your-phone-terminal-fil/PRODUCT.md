---
id: "4300"
slug: tenux-access-your-computer-from-your-phone-terminal-fil
title: "Tenux – Access your computer from your phone (terminal, files, browser)"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49524367"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Tenux – Access your computer from your phone (terminal, files, browser)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Hi HN,If you've been using claude code or codex, you may have been like me and used some sort of SSH/VPN combo to get remote access to your computer from your phone. It (kinda) works, but it is clunky.Tenux bundles everything into one smooth experience. You install the npm package, login through the cli to link the computer to your account, and start.npm i -g @tenux/cli
tenux login
tenux startInside Tenux, you can open your device's workspace from the dashboard, and a terminal (as many as you want), a localhost preview (just type the port number), and an AI agent will be ready for you (BYO API key compatible).The AI agent has some built-in tools that allow it to view output and type on any terminal within tenux. It can also screenshot and view the localhost preview content (as you see it) and control the preview on the same window, or open its own window to control. I've been experimenting recently with a 'UX' mode that allows you to touch a component within the localhost browser and make direct UI changes (this is a newly added feature), or just talk to the agent with the component selected and it will have the context it needs.You can try all this out for free. The free tier is p2p and uses WebRTC to connect to your device, it will work as long as you are on the same network (pro tip: if your machine and your phone are on the same VPN, you can access your machine remotely).I've tested Windows and Linux, if you're on Mac I would appreciate any feedback.Happy to answer any questions.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49524367) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
