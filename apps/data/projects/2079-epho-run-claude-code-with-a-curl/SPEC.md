---
id: "2079"
slug: epho-run-claude-code-with-a-curl
title: Epho – run Claude Code with a curl
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49376256"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
country: Burak
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Epho – run Claude Code with a curl

## Problem

Hey folks, Burak here.Epho is an API that allows running Claude Code, Codex or Opencode in a sandbox in the cloud. It abstracts away sandboxes, and allows running coding agents with a single HTTP request.Epho came out of our own struggles with building our own AI analyst:
- Sandboxes give you bare machines; you need to configure them for agentic workloads.
- Each agent behaves differently, and you need to build integrations with each of them.
- Sandbox providers are not very reliable, which means you need to figure out a multi-provider strategy to avoid failures.
- Logging, artifacts, input/output, event streaming, and all of the other operational aspects need to be figured out.We had to go through the pain ourselves. We got to a point where things got quite reliable, and it became more obvious to us that this should be a primitive on its own: send a POST request, get the events streaming back to you.Epho is an agents-as-an-API product: you send a request, it spins up a sandbox, configures the chosen harness, clones your repos, and kicks off the agent. It takes care of automatic fallbacks across different providers, handles auth stuff, and just streams back the events and outputs.It supports Claude Code, Codex and Opencode out of the box, and pretty much all the models they support out of the box. It streams the events back, handles attachments and output files, automatically manages the fallbacks on different sandbox providers, retries, and all the auth stuff. You just send a prompt, your repo, MCP servers you want to use with it, and it runs them.I recorded a demo here to show a real example: https://youtu.be/HGfly1aytPAI am quite excited for Epho, simply because I think it is a new primitive that would allow building agents into product a lot easier than it is today. We are running our agents on Epho on prod, so we'll keep maintaining it regardless, and we wanted to ship it as an independent product.Epho is free to get started, and you can run it with Opencode's free models to get started with it.I am quite curious to hear what you'd think and would love to get your feedback.Cheers,
Burak

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
