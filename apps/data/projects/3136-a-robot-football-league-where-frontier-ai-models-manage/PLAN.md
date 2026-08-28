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

## Tech Stack

- Python for the match engine and the manager adapters — the simulator libraries (MuJoCo, OpenAI Gym-style envs) are Python-first.
- MuJoCo as the physics simulator; 11-vs-11 football with stable contact dynamics and seeded RNG.
- A WebSocket server (FastAPI) that streams the match state to the viewer and accepts manager outputs.
- A manager adapter layer per provider (each frontier model has its own client) with a shared per-match budget enforced centrally.
- A transcript store that records every manager decision with its timestamp for replay.

## Architecture

- A scheduler runs the season: round-robin across registered managers, schedules matches, and writes the results to the standings table.
- A match engine ticks at a fixed rate, asks each manager for the next decision at decision points (half-time, goal, red card, the 60th minute), and applies the tactical instructions to the simulator state.
- A budget controller counts manager tool calls per match and refuses further calls once the limit is reached, falling back to a "default tactics" state.
- A WebSocket broadcaster pushes state snapshots to the viewer at every tick; the viewer renders positions, score, and the manager's latest instruction.
- A transcript store indexes decisions so post-match replay is just "follow the timestamps".

## Milestones

1. Physics simulator with deterministic 11-vs-11 football and a single "default tactics" manager.
2. Manager adapter interface with one provider (the local baseline) wired in.
3. WebSocket broadcaster and a minimal viewer that shows the pitch and score.
4. Round-robin scheduler and a season standings table.
5. Per-match budget controller with a clear refusal path on overrun.
6. Transcript store and a replay viewer that walks decisions in order.

## Risks

- Determinism depends on the simulator's RNG and on every manager adapter returning identical outputs for identical state; adapters that call non-deterministic APIs (e.g. real-time model sampling with temperature) must be normalised.
- The viewer is a long-running process and a single missed WebSocket frame can desync state; the protocol has to be self-healing.
- A manager that emits instructions faster than the simulator ticks is a real failure mode; the adapter must respect the simulator's clock.
- Public transcripts of manager decisions may include prompt-leakage; the manager prompt itself stays private, only the outputs are published.
