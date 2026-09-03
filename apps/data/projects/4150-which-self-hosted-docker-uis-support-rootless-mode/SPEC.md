# SPEC.md — Which self-hosted Docker UIs support rootless mode?

## Problem

I went through the docs of 10 Docker web UIs (Portainer, Dockge,
Dockhand, Arcane, Dokploy, Coolify, Komodo, Runtipi, Rancher,
Stacker) looking for one thing: which actually support rootless
Docker? Anyone actually running these against a rootless daemon? What
broke?

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49508552)
**Primary category:** ask-hn
**Tags:** Ask HN,Problem
**Date:** 2026-08-31T11:55:03Z

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
