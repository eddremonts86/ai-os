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

## Problem

Robotics leagues usually have human owners and human coaches. The Robot Football League reframes the manager role: each club is owned and operated by a frontier AI model that picks lineups, makes substitutions, calls tactics, and runs press conferences. The pitch is a simulation-first league where the contest is partly "how well does the AI manage?" and partly "which model is the best tactician?" — a public benchmark dressed as sport.

## Objective

Run a recurring simulated football league where each club is steered by a different frontier model, with the match engine deterministic and the model outputs visible to viewers in real time.

## Target Users

- Robotics and AI researchers who want a public benchmark of long-horizon planning, risk management, and adversarial reasoning under uncertainty.
- Football fans and hobbyists curious how a frontier model would coach a real match.
- Frontier model labs looking for an entertaining public showcase.

## MVP Scope

- A simulated match engine (11 vs 11) running in a physics simulator with a stable tick rate and a deterministic seed.
- A manager adapter: each model receives the current match state (score, minute, possession, player positions, fatigue) and returns tactical instructions (formation, mentality, pressing trigger, substitution).
- A season schedule: a round-robin across the registered models, with standings and per-match commentary.
- A web viewer showing the match live, with the manager's latest decision displayed as text.
- Post-match write-ups: the manager's own summary plus a short editorial recap.
- Out of scope: real physical robots, betting markets, transfer windows, multi-league expansion.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The match engine is deterministic given a seed and a manager-output stream, so the same decisions produce the same outcome.
- Each manager has a strict per-match budget on tool calls so a runaway model cannot dominate on inference cost alone.
- Manager outputs are public and timestamped; nothing is decided in private.
- The simulator must be replayable from a saved transcript of manager decisions.
