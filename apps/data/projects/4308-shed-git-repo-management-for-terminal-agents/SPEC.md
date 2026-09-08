---
id: "4308"
slug: shed-git-repo-management-for-terminal-agents
title: Shed – Git Repo Management for Terminal Agents
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49523609"
category: show-hn
date: "2026-09-01"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Shed – Git Repo Management for Terminal Agents

## Problem

Hi HN,Shed is a git repo management system for terminal agents.I built it because I wanted a complete git repo and workspace management system that was agent-first by design and portable across agent harnesses. Tools like ghq, worktrunk, and vanilla git worktrees fill some of the gaps, but personally I feel they all come up short in one way or another as a complete system for agents to manage both git repos and the PR lifecycle.When you add a repo to Shed, it gets tracked in the repo catalog at ~/.shed/repos. This directory is read-only at the OS level and the tracked repos are synced at the start of each agent session. This guarantees your agent's repo catalog is always fresh and pristine. You can add specific repos (shed add python/cpython) or track all repos from a GitHub owner (shed add python). Agents read and grep code directly in ~/.shed/repos, and spin up cheap, writable workspaces with shed on-demand when they need to make changes.Shed includes additional QOL features such as smart workspace pruning (shed prune) which deletes workspaces if the associated PR has been merged.Internally, shed uses worktrees for the read-only catalog but deliberately gives agents plain clones as workspaces. There's a longer discussion of this design decision in the README. TLDR; worktrees have limitations that agents don't really benefit from, and replicating the same flow with local clones is easy, more flexible, and equivalent in speed. The workspace management itself is managed by your agent.To try it out on mac, run: brew trust AndrewHannigan/tap && brew install AndrewHannigan/tap/shed
 shed init
 echo "show me shed" | claude

You can easily uninstall the shed init stuff with shed init --uninstall --purge if you don't end up liking the tool. Shed itself is one Go binary, with no daemon and no telemetry.For the moment, Shed supports claude, cursor-agent, and opencode, and GitHub is the only git host. Will add more if people like it. I hope you give it a try and look forward to hearing your thoughts!

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
