# SPEC.md — Fountain – OSS API to give your app a computer it can talk to

## Problem

Building tools for engineering teams running a bajillion Claude Code sessions, I kept hitting the same problem. To build the apps I wanted, I needed long-running processes that could scale to 0 when idle, resume quickly and retain their files and context. That meant I had to own the machine lifecycle, sandbox setup, credential handling, and communications plumbing. A bunch of stuff that isn&#x27;t core to the products I wanted to build, but I needed all of it to make the product work.<p>After several attempts to build directly on Fly Machines and reimplement this layer in each app, I threw my hands up. There was ANOTHER missing abstraction. Thankfully Fly.io shipped Sprites.dev, which gave me the compute primitive I needed: a vm that could idle between turns without losing its disk.<p>Agent Client Protocol solved the communication side. Fountain uses ACP to talk to different agent harnesses and exposes ACP on the client side so users can drive Fountain conversations from ACP-enabled apps.<p>Fountain is the api I wanted all along. Setup an environment, spec out an agent, give it some access and then just prompt it over http. It handles the machinery of managing the sandbox, running the agent harness, and streaming the response.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49528322)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T21:16:38Z

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
