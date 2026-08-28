---
id: "940"
slug: i-made-a-secure-way-for-agents-to-request-secrets-from-
title: I made a secure way for agents to request secrets from you using HyperDHT
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49346770"
category: ask-hn
date: "2026-08-18"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# I made a secure way for agents to request secrets from you using HyperDHT

## Problem

Hi all,I kinda got sick of having to give secrets to my agents and all the potential leakage in the pipeline (with the harness, the model router, the model provider, the training set, the chat application etc etc) so I decided to make peardrop.fyi - this tool allows your agent to declaratively generate secret request pages/links which you can fill in via web or CLI. The agent can determine a script that runs once the values are received or can put them in a target folder. This is useful if you want to put something in your machine vault/keychain without either giving access to the credentials or the browser to the agent.here is the repo: https://github.com/smashah/peardrop(cli, core and self-hostable relay are all open source)

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
