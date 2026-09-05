# SPEC.md — Mu – an agent with actual command line experience

## Problem

I&#x27;m an old school user that finds the AI agent TUIs too magical, so I experimented with a new agent UX. I implement mu as a shell plugin (zsh and fish for now). Pressing Tab enters agent mode, where 
1. the command line prompt is changed to displays model name and context usage, and
2. a preexec hook sends commands to an agent instead of interpreting them as shell script.<p>Thats it. Each LLM prompt starts a regular process that reads stdin and writes stdout, with no terminal magics. The actually executed commands appear literally in zsh_history, just like other shell commands. This allows a seamless switch between normal shell work and agentic work, with mixed history that uses regular scrollback buffer.<p>I also experimented with a minimum agent design, where only a single bash tool is provided. Special commands are provided for reliable file editing and multi-modal input. So far it worked well for me, as a day to day command line helper.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49550418)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-03T14:31:41Z

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
