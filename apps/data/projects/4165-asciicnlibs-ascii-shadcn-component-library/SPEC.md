---
id: "4165"
slug: asciicnlibs-ascii-shadcn-component-library
title: "ASCII/cnlibs – ASCII Shadcn component library"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49511358"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# ASCII/cnlibs – ASCII Shadcn component library

## Problem

The author wanted every shadcn/ui component drawn in characters — real, accessible shadcn components but dressed for the terminal. The site at ascii.cnlibs.com ships the standard shadcn/ui component set (button, dialog, dropdown, tabs, accordion, tooltip, and so on) rendered in a monospace ASCII palette rather than with the usual CSS. Built on Base UI for keyboard and accessibility correctness so the components keep working when you change the visual layer. Each component is a copy-paste shadcn recipe, but the typography has been swapped for monospace characters that fit a terminal aesthetic.


---

## Objective

Ship an open component library that lets a developer drop shadcn/ui components into a terminal-style site without losing accessibility or keyboard behavior, by reusing Base UI as the behavior layer under an ASCII-styled rendering.


## Target Users

Developers building terminal-aesthetic interfaces, docs sites, retro consoles, or any web product where the visual register is monospace / ASCII. Assumes the reader already uses shadcn/ui (or wants to) and wants the terminal look without losing the Base UI accessibility story.


## MVP Scope

- A copy-paste component set mirroring the standard shadcn/ui catalogue (button, card, dialog, dropdown, input, select, tabs, accordion, tooltip, toast, separator, etc.).
- A monospace / ASCII visual treatment applied at the typography and decoration level — characters instead of icons, box-drawing borders, no images.
- Base UI as the behavior layer so keyboard navigation, ARIA, focus management, and screen-reader semantics stay correct.
- An installer story compatible with the shadcn CLI: a developer pastes a command, picks a component, and gets the styled source.
- A documentation page that shows each component in its terminal outfit.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state a pricing or business model.
- Visual treatment is constrained to monospace characters; no icon fonts, no SVG decorations, no images.
- Accessibility is delegated to Base UI, so the library cannot skip or override the behavior layer without losing the shadcn claim.
