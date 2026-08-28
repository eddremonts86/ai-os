---
id: "3194"
slug: build-your-own-theme-park
title: Build your own theme park
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452037"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Build your own theme park

## Problem

I built an agent that helps you build Rollercoaster Tycoon-influenced theme parks. You can prompt something like "Build me a cool theme park" and it'll build a cohesive theme park with multiple worlds and connected with paths and rides.The weird part is that I built it using the same ideas we use to make AI-generated websites follow a company's design system.I work as an engineer at Magic Patterns, focused on building our Design System Agent, aimed to use your existing brand, components, and conventions instead of producing something that looks like generic AI-generated UI.By default, models tend to converge on similar-looking designs. This is part of that "vibe coded slop" feeling: the same typography treatments, shadows, cards, icons, animations, etc… My job is to figure out the right context and guardrails so that when you prompt "Build me a dashboard," the result actually looks like your existing product.At some point I realized those same ideas could be applied to RCT.While in web, you might have rules about which typography, colors, spacing, and components should be used together.In a theme park, you need rules like: rollercoasters need complete tracks, rides need entrances connected to paths, paths need to connect different areas of the park, and a pirate-themed world should actually use pirate-themed scenery.It was interesting seeing how closely the problem of building a coherent theme park resembled the problem of building a coherent product UI. Similarly with web design, simply giving the model the right components wasn't enough.I ended up building an eval loop where Magic Patterns would generate a park, another agent would grade it against a rubric, and then the agent would update its rules and skill files before trying again.The rubric checked things like whether rollercoasters formed valid tracks with at least one drop, whether rides were accessible by paths, whether each world used the appropriate themed scenery, and whether the park worked as a whole.

## Objective

Build an agent that takes a natural-language prompt ("build me a cool theme park") and produces a Rollercoaster Tycoon-influenced park with multiple worlds, paths, and rides that hold together as a coherent whole — using the same kind of rule-set + rubric-driven guardrails the author uses for brand-consistent web UI.

## Target Users

1. People who want a starting point for a Rollercoaster Tycoon-style park without having to lay every path and ride by hand, and who care that the result feels coherent rather than random.
2. Builders who already have a Magic Patterns workflow for UI generation and want to see whether the same design-system discipline transfers to a non-UI domain.

## MVP Scope

- A prompt-to-park generator that takes a text request and returns a park layout with multiple worlds, paths connecting them, rides in each world, and one or more rollercoasters.
- A rule layer: rollercoasters need complete tracks with at least one drop; rides need entrances connected to paths; paths connect different park areas; each world uses scenery that matches its theme.
- A rubric-driven eval loop where a separate grader scores a generated park against the rules and the agent updates its rule files before retrying.
- Per-theme scenery packs so the pirate world looks pirate-y, the jungle world looks jungle-y, and so on.
- An export that drops the resulting park into something the user can load and edit further.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Rules come from the source's enumerated rubric items (valid coaster tracks, ride accessibility, themed scenery, world coherence); the MVP does not invent new aesthetic rules beyond them.
- No multiplayer or persistence beyond the exported park in the MVP — the source describes a generator, not an MMO.
- No live integration with the actual Rollercoaster Tycoon game; the MVP produces a park artifact the author controls.
