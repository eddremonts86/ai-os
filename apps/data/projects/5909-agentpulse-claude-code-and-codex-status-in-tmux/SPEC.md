# SPEC.md — AgentPulse – Claude Code and Codex status in tmux

## Problem

I use Claude Code and Codex every day, often across several tmux panes. I kept switching windows to check which agents were still working and which needed an answer. I built AgentPulse so I could see that at a glance.<p>It is a TPM plugin that uses lifecycle hooks to show working, waiting, idle, and interrupted states. It adds indicators to the window list and pane borders, with an optional popup and sidebar for jumping between agents. It works with your existing tmux theme. Because it is tmux you can customize it the way you want and optimize your workflow.<p>This is an early version that grew out of my own setup. How do you keep track of agents in tmux? I would like to hear what would make this useful in your workflow. I know herdr exists, but couldnt leave my tmux setup.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49623768)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T09:41:52Z

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
