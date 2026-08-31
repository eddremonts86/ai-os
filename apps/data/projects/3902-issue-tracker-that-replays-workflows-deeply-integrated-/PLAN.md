---
id: "3902"
slug: issue-tracker-that-replays-workflows-deeply-integrated-
title: "Issue tracker that replays workflows, deeply integrated with the code [video]"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496437"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Git-native storage, event sourcing, deterministic state log, time-travel replay UI, agent workflow tracing, static site deployment]
---
# Issue tracker that replays workflows, deeply integrated with the code [video]

## Tech Stack

- **Git-native storage:** issues and their event logs.
- **Event sourcing:** state is a fold over events.
- **Deterministic state log:** replays reconstruct state exactly.
- **Time-travel replay UI:** scrub controls.
- **Agent workflow tracing:** hooks for multi-agent environments.
- **Static site deployment:** the viewer.

## Architecture

- Issues and their event streams are stored as objects in a Git repository.
- The tracker appends events on every change; state is derived by folding the log.
- The replay player scrubs the log forward and backward, rendering state at each point.
- Git merge and branch semantics apply to the issue store like any other content.
- The viewer is a static web app reading the repository directly.

## Milestones

1. **M0 — Scaffold:** repository model for issues, event schema, static viewer.
2. **M1 — The log:** every issue mutation appends an event; state derives from the fold.
3. **M2 — The movie:** replay player with scrub, step and speed controls.
4. **M3 — The audit loop:** tracing hooks for agent workflows, multi-agent demos, public showcase.

## Risks

- The event model is the product; a hole in it makes replays lie by omission.
- Git semantics for high-frequency issue updates need care (commit volume, merge conflicts).
- The audience that needs replay today is small and technical.
- A static demo site proves the concept, not the operations story.
