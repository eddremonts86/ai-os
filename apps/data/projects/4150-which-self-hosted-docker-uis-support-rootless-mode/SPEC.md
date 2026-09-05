---
id: "4150"
slug: which-self-hosted-docker-uis-support-rootless-mode
title: Which self-hosted Docker UIs support rootless mode?
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49508552"
category: ask-hn
date: "2026-08-31"
tags: [Ask HN, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Which self-hosted Docker UIs support rootless mode?

## Problem

The poster went through the documentation of ten self-hosted Docker web UIs — Portainer, Dockge, Dockhand, Arcane, Dokploy, Coolify, Komodo, Runtipi, Rancher, Stacker — looking specifically for which ones actually work against a rootless Docker daemon. Rootless mode removes the daemon's root privileges on the host and is the default-sane choice for any homelab or shared host, but most UIs assume the daemon runs as root and break or refuse to start against a rootless socket. The post asks whether anyone is running these UIs against a rootless daemon in practice, what specifically broke, and which ones shipped with a real story for it.

## Objective

Compile a comparison note that names, for each of the ten UIs in the post, whether the docs or release notes claim rootless support, and where real users have reported the integration working or failing. The note is a research artefact, not a benchmark suite.

## Target Users

Homelab operators, small-team sysadmins, and self-hosters evaluating Docker UIs who want rootless mode to be a hard requirement rather than a "nice to have". Secondary reader: maintainers of the UIs themselves who want to know where they are on the comparison.

## MVP Scope

A comparison table: rows for each UI in the list, columns for documented rootless support, known caveats, and any reported production usage. Format is a written document with a table. No new product.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

The post only lists the ten UIs by name; it does not enumerate which ones support rootless, what broke for each, or which docs the poster consulted. The note must therefore label every row as "claim sourced from docs, not yet verified by us" and avoid asserting any answer the post itself did not give.