---
id: "2674"
slug: sandbox-the-install-step-of-any-npm-package
title: Sandbox the install step of any NPM package
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49308683"
category: show-hn
date: "2026-08-15"
tags: [Show HN, Product, Problem]
---
# Sandbox the install step of any NPM package

## Problem

It fetches the exact tarball npm install would, runs the declared install scripts in a sandbox (no network, all capabilities dropped, read-only filesystem), and returns a verdict signed under a published Ed25519 key, bound to the sha256 of the bytes. No account, it mints an anonymous rate-limit key on first call. Node and Python, 20 checks/hour.I built it to put a denominator under "npm install runs arbitrary code." Of 658 MCP-related packages, 20 declare an install script (3.0%). Running the twenty is where reading the manifest misled me: four were preinstall: npx only-allow pnpm, which I had filed as a benign guard, and all four make a network call at install because npx fetches only-allow from the registry. A manifest tells you what a script is; only running it tells you what it needs.Honest scope: dependencies are not installed, so this is a package's own declared install surface, not its transitive closure; and install-time is not the whole attack surface, a package can act at first import or at runtime instead. The verdict is a bounded, signed observation ("under these constraints, these bytes did X"), not a safety oracle.Tell me where it is wrong. The failure I most want is a package it clears that you would have flagged.

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
