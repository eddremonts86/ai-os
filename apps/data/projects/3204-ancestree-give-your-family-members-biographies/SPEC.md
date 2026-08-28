---
id: "3204"
slug: ancestree-give-your-family-members-biographies
title: Ancestree – Give your family members biographies
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49451007"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Ancestree – Give your family members biographies

## Problem

Every time I talk to my older family members, especially my grandparents, I find out a new super interesting fact about them. Last week: my Croatian grandfather served in the French marine corps... Not worth mentioning I guess.I realized that these stories are passed down only by re-telling them. Just think about how much you don't know about your family from 2 generations ago.For this reason, I created ancestree.marindedic.comIt's a really cool family tree creation app, where each person gets their own book. Inside it, write what they did, what happened to them, what they were like... whatever you want.Little biographies of your loved ones.Apart from exporting normal and detailed versions of your family tree, you can even export someone's chapters as one long biography.Of course, open-sourced, no account, no server. Nothing you draw or write ever leaves your browser.

## Objective

Build a browser-based family tree app where each person has their own book of written biographies, with the ability to export the whole tree as well as any one person's chapters as a single long biography, fully local-first so nothing the user draws or writes ever leaves the browser.

## Target Users

1. People who want to record the stories their older relatives tell them — grandparents, parents, aunts, uncles — before those stories are no longer available, and who want a place to keep each person's biography as a "book".
2. Family historians who want to export a tree plus per-person biographies for printing or sharing with relatives, without trusting a hosted service with private family information.

## MVP Scope

- A browser-based family tree editor that runs entirely client-side.
- Per-person "book" entries where the user can write free-form text about what the person did, what happened to them, what they were like — the source's own examples.
- Tree linking (parent/child, partner) so the biographies sit inside a navigable structure.
- Export of the tree as a normal and as a detailed version (two distinct outputs the source names).
- Export of a single person's chapters as one long biography.
- No account, no server: all data stays in the browser.
- Open-source distribution.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Strictly local-first: nothing the user draws or writes ever leaves the browser. No backend, no telemetry, no analytics that touch the user's family content.
- Open source from day one.
- Two export formats the source names (normal and detailed tree) must both work and look distinct.
- Per-person biography export must produce a single document, not a bundle of fragments the user has to stitch together.
