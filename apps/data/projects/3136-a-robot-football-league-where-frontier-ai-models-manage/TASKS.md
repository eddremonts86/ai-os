---
id: "3136"
slug: a-robot-football-league-where-frontier-ai-models-manage
title: A robot football league where frontier AI models manage the clubs
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449201"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Robotics, AI, Simulation, Sports]
tech: [Python, MuJoCo, OpenAI Gym, WebSocket, FastAPI]
---
# A robot football league where frontier AI models manage the clubs

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3136-a-robot-football-league-where-frontier-ai-models-manage/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Confirm MuJoCo runs headless with a seeded RNG
- [ ] Stand up the FastAPI service with the WebSocket route

## Phase 1: Core

- [ ] Physics simulator with deterministic 11-vs-11 football and a default-tactics manager
- [ ] Manager adapter interface with the first provider (local baseline)
- [ ] WebSocket broadcaster pushing state snapshots at every tick
- [ ] Minimal viewer showing the pitch, score, and the manager's latest instruction
- [ ] Round-robin scheduler with a season standings table
- [ ] Per-match budget controller with a refusal path on overrun
- [ ] Transcript store indexing every manager decision with timestamp
- [ ] Replay viewer that walks the saved decisions in order

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
