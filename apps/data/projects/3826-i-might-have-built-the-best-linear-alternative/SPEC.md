---
id: "3826"
slug: i-might-have-built-the-best-linear-alternative
title: I might have built the best Linear alternative
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49494058"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Self-hosted tracker server, SQL database, agent-facing board API, model key passthrough, AGPL-3.0 open-source license, board workspace UI]
---
# I might have built the best Linear alternative

## Problem

The capture announces "It's a Plan", an open-source tracker where humans and AI agents share one board, with a specific ownership pitch: "Your server, your database, your model keys" — self-hosted, on the user's own infrastructure, with the user's own AI credentials. It is AGPL-3.0 licensed, charges no per-seat fees and promises no lock-in. The title stakes the claim directly: "I might have built the best Linear alternative."

## Objective

Build a self-hosted, open-source tracker where human teammates and AI agents work the same board, under AGPL-3.0, without seat-based pricing or lock-in — so teams running agents do not have to choose between their tracker and their agents.

## Target Users

- Dev teams evaluating Linear but wanting self-hosting and no seat fees.
- Teams running AI coding agents that need a board to read and write.
- Operators who insist on "your server, your database, your model keys".

## MVP Scope

- A board with issues and tasks shared by humans and agents.
- Agent access: agents read and write the board, bringing their own model keys.
- Self-hosted single-server deployment on the user's server and database.
- AGPL-3.0 source with no seat limits.

## Constraints

- "Best Linear alternative" is the poster's own claim, not an independently verified fact.
- Self-hosting is a stated requirement, not an option: server, database and model keys are the user's.
- AGPL-3.0 is stated; it shapes who can embed or resell the tracker.
- The capture names no feature list beyond the shared board.

## Design Direction

See `DESIGN.md` for this project's design tokens.
