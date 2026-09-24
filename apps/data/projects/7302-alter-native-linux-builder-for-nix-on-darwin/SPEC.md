# SPEC.md — (alter)native-Linux-builder for Nix on Darwin

## Problem

A swift-based binary that can be used as an external builder for nix (via external-builders experimental feature) to build linux packages on darwin without having to setup a full remote build VM. This project aims to reproduce the functionality of Determinate Nix&#x27;s native-linux-builder for upstream Nix installs. It also provides a Nix-darwin module to configure the external builder.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49721253)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T01:55:22Z

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
