---
id: "3015"
slug: a-multiplayer-coding-environment-for-dev-teams-and-agen
title: A multiplayer coding environment for dev teams and agents
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339145"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# A multiplayer coding environment for dev teams and agents

## Problem

The author used to attend hackathons and found collaboration hard even when every teammate was a strong programmer. With "vibe coding" — where each teammate drives an AI agent to write their part — the failure mode is concrete: agents lose context, individual solutions drift out of sync, and the team's pieces fail to come together at the end. The author built Forklane to fix this: a multiplayer coding platform with a built-in agent and orchestration stack, designed for live real-time collaboration between humans and agents without stepping on each other. The Show HN post is a request for community feedback; the problem is specific and the proposed solution is specific.

## Objective

Build a multiplayer coding environment where two or more developers (each potentially driving one or more agents) collaborate in a shared workspace with shared context. The MVP focuses on the property the author calls out — agents losing context and individual pieces drifting out of sync — by giving every teammate and every agent a single shared view of the codebase, the task list, and the in-flight changes. It is a wedge: a working IDE-shaped surface that solves the hackathon pain first, with deeper orchestration features layered on top.

## Target Users

- The author and hackathon teammates like them: small groups of strong programmers who want to ship together in a single evening without agents stepping on each other.
- Remote dev teams trying out "AI-assisted pairing" where each developer drives an agent and wants shared state.
- Solo developers using multiple agents in parallel who want a single surface that does not require them to manually reconcile context between sessions.

## MVP Scope

- A multiplayer IDE-shaped surface (browser-based) where 2–5 collaborators join a shared workspace by URL.
- A shared file tree, shared editor state with cursors, and a shared terminal pane.
- A task list visible to every collaborator and every agent, so each agent's goal is explicit.
- A built-in agent slot per collaborator: an agent that reads the shared task list, edits files, and runs commands in the shared terminal, with its actions visible to every human.
- A simple conflict policy: when two agents or humans edit the same file region, the second write loses with a clear error and a one-click retry.
- No agent marketplace, no model selection UI, no billing in v1. The MVP assumes a single model backend wired in via env.
- No team-management features, no role-based access, no audit log.

## Design Direction

Design direction for the MVP follows the constraints in `3015-.../SPEC.md`. The visual language is IDE-forward with multiplayer cues: shared cursors, presence avatars, and a task list that always sits at the top.

**Color** — neutral IDE background, one accent reserved for "in-flight task" markers, one muted accent for agent actions in the shared feed.

**Type** — one mono family for code, one text family for the task list and shared feed, no display family needed.

**Density** — high in the editor and terminal, medium in the task list and shared feed.

**Motion** — presence cursors and task-list updates only. No parallax, no autoplay.

## Constraints

- The MVP is browser-based. No desktop app, no mobile app.
- The MVP does not include a billing or seat-management surface. A self-hosted instance is the deployment model in v1.
- The MVP assumes a single model backend wired in via env. Switching backends is not a v1 surface.
- The MVP does not claim to replace a full IDE — it is a wedge surface for hackathon-style sessions and small-team pair work, not a daily driver for a 50-engineer org.
