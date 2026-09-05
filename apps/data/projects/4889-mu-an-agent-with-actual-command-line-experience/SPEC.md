---
id: "4889"
slug: mu-an-agent-with-actual-command-line-experience
title: Mu – an agent with actual command line experience
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49550418"
category: show-hn
date: "2026-09-03"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Mu – an agent with actual command line experience

## Problem

I'm an old school user that finds the AI agent TUIs too magical, so I experimented with a new agent UX. I implement mu as a shell plugin (zsh and fish for now). Pressing Tab enters agent mode, where
1. the command line prompt is changed to displays model name and context usage, and
2. a preexec hook sends commands to an agent instead of interpreting them as shell script.Thats it. Each LLM prompt starts a regular process that reads stdin and writes stdout, with no terminal magics. The actually executed commands appear literally in zsh_history, just like other shell commands. This allows a seamless switch between normal shell work and agentic work, with mixed history that uses regular scrollback buffer.I also experimented with a minimum agent design, where only a single bash tool is provided. Special commands are provided for reliable file editing and multi-modal input. So far it worked well for me, as a day to day command line helper.

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
