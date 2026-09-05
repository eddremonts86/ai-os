---
id: "4160"
slug: rta-smriti-local-first-project-memory-for-coding-agents
title: Rta-Smriti – local-first project memory for coding agents
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511544"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Rta-Smriti – local-first project memory for coding agents

## Problem

Every developer using a coding agent has hit the same loop: new chat, same project, same explanations, same lost context. Coding agents (Codex, Claude Code, Cursor, or any MCP-capable agent) start each session without the project's prior decisions, constraints, repo conventions, or captured evidence, so the developer re-explains everything. Rta-Smriti Brain (the v1.0.4-alpha release per the repo at the time of the HN post) is a sovereign local project-memory and evidence layer that turns a project repository, long agent threads, durable decisions, and evidence into a small local memory graph that any MCP-capable agent can query before doing work. Capture is opt-in, bounded, and redacted before durable queuing, and captured claims are explicitly treated as untrusted evidence until an operator or verifier promotes them. The current release adds deterministic Project Cognition and a Project Reality cockpit on top of canonical project identity, bitemporal truth, governed context compilation, and Universal Capture. The product is an evidence and continuity layer: it does not execute project work, route models, or replace an agent harness.

## Objective

Ship a local-first project-memory layer that any MCP-capable coding agent can read before doing work, with explicit evidence boundaries and an inspectable Project Reality cockpit that surfaces readiness, coverage, conflicts, change impact, and decision debt under bounded output budgets.

## Target Users

AI-assisted developers and small engineering teams using Codex, Claude Code, Cursor, or any MCP-capable agent who repeatedly lose project decisions and context across sessions. Secondary reader: agent-harness authors who want a portable memory backend that does not route their model.

## MVP Scope

The README and current release notes name the deliverables: canonical project identity, bitemporal truth, governed context compilation, Universal Capture (opt-in, bounded, redacted), deterministic Project Cognition projection, Project Reality cockpit (readiness, coverage, conflicts, change impact, decision debt under output budgets), an Ed25519 snapshot-signing path included in the standard install, optional local backends installed via `python -m pip install -e ".[all-local]"`, a static-built frontend bundled into the Python package so runtime users do not need Node, and CI on Windows / macOS / Linux for Python 3.11/3.12/3.13. The product stays as an evidence and continuity layer and does not execute project work or silently promote captured text into trusted truth.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The source is the repo README plus the release notes for v1.0.4-alpha. Specific failure modes of older checkpoints, the exact list of MCP tools exposed, and the schema of the bitemporal truth tables are referenced but not in the post itself; the page must treat those as "see repo docs" rather than re-asserting them. The product is local-first and deliberately does not ship a hosted backend, so any feature that needs a server is out of scope by design.