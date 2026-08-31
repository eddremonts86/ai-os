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

## Tech Stack

Chosen for a self-hosted tracker whose contract is user ownership of server, database and model keys.

- **Self-hosted tracker server:** one deployable service that runs on the user's infrastructure.
- **SQL database:** the user's own database holds all board state.
- **Agent-facing board API:** agents read and write issues through a defined interface.
- **Model key passthrough:** agent calls use the user's model credentials, never the vendor's.
- **AGPL-3.0 open-source license:** distribution under the stated license.
- **Board workspace UI:** a board view for human teammates.

## Architecture

- **Board service:** issues, states and assignments in the user's SQL database.
- **Agent API:** the same board surface exposed to AI agents.
- **Key pass-through:** model keys are supplied by the operator per agent.
- **Self-host package:** single-binary or container deploy to the user's server.
- **UI:** the board workspace humans use.

## Milestones

1. **M0 — Board.** Issues with states and assignments in a self-hosted server.
2. **M1 — Agents.** Agents read and write the board through the API with user-supplied keys.
3. **M2 — Self-host fit.** One-command install on the user's server and database.
4. **M3 — OSS release.** AGPL-3.0 source public, docs written, and no seats anywhere in the product.

## Risks

- **Scope vs Linear:** the title's ambition is large; the capture's scope is one board.
- **AGPL friction:** enterprise adopters often refuse AGPL.
- **Key handling:** user model keys flowing through the product needs careful, transparent handling.
- **Support burden:** self-hosted OSS means free users and support nobody is paid for.
- **Differentiation:** many OSS trackers exist; the agent-sharing board is the edge that must hold.
