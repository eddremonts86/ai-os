---
id: "5150"
slug: moadim-io-a-scheduler-for-agents
title: Moadim.io – A scheduler for agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49571537"
category: show-hn
date: "2026-09-04"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Moadim.io – A scheduler for agents

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ Why can't we get an agent scheduler that supports all of the following:- git compatible- agent agnostic- 100% open source- os and system-agnostic- multi-runner support- support mcp/ui/http- unlimited routines/cronsSo I built one, moadim.io is a local Rust daemon you install in the target machine, give it a name and manage its routines via a Git repository, wants a new routine that send you a daily message from this machine? Create a pr and merge, have another routine that run every hour to pull the latest changes to the ~/.config/moadim folder.With more than 1,000 users, I define this project as almost "done" and ready for production. Me and thousand more people are use it in a daily manner.It currently supports Claude, Codex, Hermes, and Pi, and you are welcome to add your agent of choice as well because it's 100% configurable.You are welcome to have a look at the source code of the daemon in "http://github.com/moadim-io/daemon"Feel free to provide me with suggestions for more features around this topic. I don't want to branch out to new off road topics likt webhooks, this is a "done" software in the realm of agents schedulers that focus on cron-like work.Also feel free to start the github repository and open issues and PRs for your suggestions.

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

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49571537) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
