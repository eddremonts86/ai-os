# SPEC.md — HexBOTs – a cellular automaton with robotic lawnmowers

## Problem

Double-click or press N to start a new experiment.<p>I built hexBOTs, an unusual cellular automaton based on deterministic robots.<p>The robots behave a bit like robotic lawnmowers, moving through their environment and reacting according to their individual rules.<p>The robots themselves are fully deterministic — no random functions are used while they are running. What makes them different is their “genetics”: each robot&#x27;s behavior is defined by a randomly generated genome, which allows for an enormous number of different robot types.<p>Randomness creates the robots, but it doesn&#x27;t drive them.<p>Once an experiment starts, everything follows deterministically from the generated genomes and the initial state. What fascinates me is the complexity that emerges from these relatively simple machines interacting with each other and their environment.<p>Controls:<p>B — enable&#x2F;disable robots
(also: hold mouse&#x2F;finger down)<p>R — restart<p>N — new experiment
(also: mouse&#x2F;finger double-click)<p>D — save as picture<p>I — show information &#x2F; controls

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49590247)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-06T19:56:41Z

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
