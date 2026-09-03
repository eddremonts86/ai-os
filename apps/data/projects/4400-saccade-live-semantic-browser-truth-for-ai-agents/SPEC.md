# SPEC.md — Saccade – Live semantic browser truth for AI agents

## Problem

I build one this application is to resolve the most of the agent cannot handle the brother they extremely slow. So I come up with this idea, we install one of the extntion on chrome or edge to give continuously compile the tabs authorized by the user into semantically meaningful objects with stable identities, and push page changes as deltas to the local Node.js Broker. The Agent reads the full truth or delta of the specified tab via MCP and executes actions using object IDs bound to document. The preliminary result shows that it is very close to the performance of Playwright in terms of token use and speed.<p>The only problem with this one is that at the very first time, it is going to send the full truth, and after that, for any page changes, it only sends the data. So, after the first read, the continuous operation of the page reaches the millisecond reaction loop.<p>It can also upload filled forms, downloads, and all kinds of stuff. I want somebody to check and use it. If it is possible plz give me some feedback.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49516118)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-08-31T23:35:39Z

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
