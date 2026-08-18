---
id: "2947"
slug: slivingdoc-conflict-resolving-notebook-for-agents-w-s3-
title: "Slivingdoc, conflict-resolving notebook for agents w. S3 backend"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49330403"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# Slivingdoc, conflict-resolving notebook for agents w. S3 backend

## Problem

Agents needs to store context, and share context. We haven't yet figured out how to do muli-agent swarms in a good way, but letting agents synchronize durably seems to be a key point, a problem which needs a solution regardless. So I decided to separate the concerns and tackle this bit before trying to build a swarm.Slivingdoc is git + s3 combined into a "hot path". Conflict resolution via git, persistent storage + backup via s3. Agents + humans see gitlike-semantics, without needing to worry about the complexities. See website above for details.Intended to be run as cli or mcp server (stdio).

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
