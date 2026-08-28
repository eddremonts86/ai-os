---
id: "3126"
slug: neoswarm-neovim-for-controlling-ai-agents
title: Neoswarm – Neovim for controlling AI agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49450219"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Neoswarm – Neovim for controlling AI agents

## Tech Stack

Not stated by the source. A Neovim plugin would normally be Lua, calling each agent's CLI or HTTP API. Specifics are TODO.

## Architecture

A Neovim plugin (Lua) that talks to one or more agent runtimes and renders their state inside the editor — buffers for output, a sidebar for status, keymaps for control.

## Milestones

- [ ] The plugin at neoswarm.dev installs into Neovim and connects to at least one agent runtime.
- [ ] Sending a prompt from inside Neovim results in agent activity the user can see.
- [ ] Anything beyond single-agent control (multi-agent orchestration, swarm coordination) is not specified by the title and is TODO.

## Risks

The risk is API drift on each supported agent; Neoswarm needs an adapter layer or risk breaking every upstream release.
