---
id: "5074"
slug: danterm-a-fast-macos-terminal-emulator-compare-with-gh
title: "DanTerm – a fast macOS terminal emulator (compare with Ghostty, iTerm2)"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49567153"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# DanTerm – a fast macOS terminal emulator (compare with Ghostty, iTerm2)

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ danterm started out as a small AppKit wrapper around libghostty so I could get vertical tabs.Repo: https://github.com/danneu/dantermAbout 3-4 weeks ago, I decided to replace libghostty with my own Swift terminal engine implementation, and the whole project is just Swift with no third-party deps -- only Apple's swift-collection for a Deque impl.I started with a naive correctness implementation that passed third-party tests, and then I incremented to the optimized release of today with things like a packed byte arena for scrollback that grows on demand.The result is that it's an 8 MB application that sits at 52 MB with 10 empty tabs open and grows to just 250 MB when those tabs are filled with 10k lines each. (kitty: 240 -> 790 MB, ghostty 1.3: 780 -> 1400 MB). It also has the best pty throughput as measured by kitty's `kitten __benchmark__ --render`.Perhaps most interestingly is that this project is my latest experiment in how to use rigor to automate high-quality software with LLMs. I use things like ADRs, a docs/research/ system, a review/revise cycle on plans, and multi-pass workflows to pay back debt and find code improvement opportunities.For example: https://github.com/danneu/danterm/blob/749942ffa1198f520c8b7...This project has put yet more writing on the wall, for me, that most software -- and then all software -- can be fully automated with just a human "taste-maker".It has some cute features like:- A `danterm ` CLI- A replayable pty flight recorder (`danterm tape`)- Usual fare like tabs, panes, themes, search, and a recovery system so that you can close danterm, reopen it, and it reads its prev state from disk. Even has a gimmicky todo system (per pane and per tab).- A semantic model powered by shell/agent integrations where you notify danterm things like "command started (vim foo.sh)" and "agent waiting (claude code)". This seemed a lot more reasonable than trying to cleverly determine the state of the session from the pty stream.- A companion iPhone app that lets me control danterm remotely over Tailscale- A reusable Swift terminal engine that compiles on Linux (for fun, I started a gtk4 frontend)Anyways, I hope it's interesting. It was a lot of work and it's my daily driver terminal.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49567153) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
