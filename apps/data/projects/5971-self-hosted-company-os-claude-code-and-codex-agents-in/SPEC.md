# SPEC.md — Self-hosted company OS, Claude Code and Codex agents in departments

## Problem

Hi HN, I am Dimitris. 
This is a company OS that I built and use to run my business and anyone can install it and self host it for free. Think of it as Claude Code, Cowork and the cloud sessions in one self hosted application.<p>Is is a Multi-tenant application by design where many people can collaborate on the company agents with 4 different modes of collaboration, and it runs with your Anthropic or OpenAi subscription or even with local models.<p>Every agent can run on Claude Code or Codex CLI running as a persistent process on your server in a kernel sandbox (bubblewrap) with network isolation always on (pasta), with its own workspace, memory, schedules and tools. The same agents can also be configured to run identical on any remote computer through one outbound WebSocket (no inbound ports, no VPN needed).<p>The agent already have lots of built in features, as an example they can answer and place phone calls through Twilio or your own Asterisk, they can edit videos and excel, word, ppt files and preview them directly inside the chat with collabora and many more.<p>Trying it is one install script and a docker compose, no signup. The license is Fair Source, all the code is public and self hosting is free up to 5 users. 1.6.0 went out today.<p>AI Disclaimer: large parts of OtoDock are written using OtoDock itself, running Claude Code.<p>I would love people to read the code, take a look in the sandbox model, and tell me what would stop you from running this on your own hardware.<p>GitHub: <a href="https:&#x2F;&#x2F;github.com&#x2F;OtoDock&#x2F;oto-dock" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;OtoDock&#x2F;oto-dock</a>
Website: <a href="https:&#x2F;&#x2F;otodock.io" rel="nofollow">https:&#x2F;&#x2F;otodock.io</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49630606)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T17:57:55Z

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
