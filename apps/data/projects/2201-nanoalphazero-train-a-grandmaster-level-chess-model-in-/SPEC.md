---
id: "2201"
slug: nanoalphazero-train-a-grandmaster-level-chess-model-in-
title: nanoAlphaZero – Train a grandmaster-level chess model in 24h with TPUs
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49363676"
category: show-hn
date: "2026-08-19"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# nanoAlphaZero – Train a grandmaster-level chess model in 24h with TPUs

## Problem

Hello HN,I built a complete, game-agnostic implementation of AlphaZero in JAX.repo: https://github.com/wtedw/nanoAlphaZerodemo (NN + MCTS run locally in your browser): https://nanoalphazero.wtedw.comIt uses no human data, can train grandmaster-level chess models, and supports a variety of games: Chess, Go 3x3 - 9x9, Hex 4x4 - 9x9, Connect FourYou can also use this repo to train AlphaZero on any custom 2-player, perfect-information game.How does it work?At a high level, the entire AlphaZero algorithm gets compiled into a single jitted run_fn that repeatedly performs self-play and model updates: state = make_alphazero()

 def run_fn(state):
 games = selfplay(state) # using Gumbel MuZero

 # Move active games into the self-play buffer
 # Move completed games into the replay buffer

 state = train(state, replay_buffer.sample())

 return state

 while True:
 state = run_fn(state)

There are no threads, queues, or distributed workers to manage. It is just one large JAX function.The repo is primarily focused on making large-scale AlphaZero experimentation fast and easy to run. Training strong models is secondary and mostly serves as a sanity check that the underlying logic is sound.Documentation on training custom / complex games is sparse, so if you have any questions feel free to message me.

---

## Objective

_Not written yet — `ai-os plans enrich` fills this section._

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## MVP Scope

_Not written yet — `ai-os plans enrich` fills this section._

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

_Not written yet — `ai-os plans enrich` fills this section._
