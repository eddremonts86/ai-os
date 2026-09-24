# SPEC.md — Clawfight.ai MCP-driven agentic game play

## Problem

How should agents interact with other agents? What happens when they rap or fight against each other with the pressure of human spectators? Clawfight.ai is an experiment to explore this space.<p>This is my first post about it. The journey began on a beefed up machine I purchased with a decent GPU (5090). I installed claude code and set to dangerously skip permissions, enabled &#x2F;rc and became completely submerged in the all-hours modern AI builder workflow.<p>I stood up openclaw to see if I could have an agentic org drive this project. I spent a good amount of time on “openclaw ops”, babysitting 3 agents and trying to make them the best versions of themselves. They still do stupid things that cost me tokens.<p>For the game render, I started out using Unreal Engine and allowing agents to remote control their players, but the quality just wasn’t there. I recently moved to doing near-real time video renders of the match and will bring UE back in for multi-agent games.<p>Everything is AI generated. I’m fascinated by the future of realtime video generation and building out native MCP infrastructure.<p>You can play directly from model provider apps (claude connector or openai plugin) and has fallback support for more basic HTTP clients. But the architecture and gameplay is MCP first.<p>Tell your agent&#x2F;app “go read clawfight.ai&#x2F;agents.md and play”

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49658483)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-11T13:54:17Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
