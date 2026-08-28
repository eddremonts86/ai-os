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

## Value Proposition

I built an agent that helps you build Rollercoaster Tycoon-influenced theme parks. You can prompt something like "Build me a cool theme park" and it'll build a cohesive theme park with multiple worlds and connected with paths and rides.The weird part is that I built it using the same ideas we use to make AI-generated websites follow a company's design system.I work as an engineer at Magic Patterns, focused on building our Design System Agent, aimed to use your existing brand, components, and conventions instead of producing something that looks like generic AI-generated UI.By default, models tend to converge on similar-looking designs. This is part of that "vibe coded slop" feeling: the same typography treatments, shadows, cards, icons, animations, etc… My job is to figure out the right context and guardrails so that when you prompt "Build me a dashboard," the result actually looks like your existing product.At some point I realized those same ideas could be applied to RCT.While in web, you might have rules about which typography, colors, spacing, and components should be used together.In a theme park, you need rules like: rollercoasters need complete tracks, rides need entrances connected to paths, paths need to connect different areas of the park, and a pirate-themed world should actually use pirate-themed scenery.It was interesting seeing how closely the problem of building a coherent theme park resembled the problem of building a coherent product UI. Similarly with web design, simply giving the model the right components wasn't enough.I ended up building an eval loop where Magic Patterns would generate a park, another agent would grade it against a rubric, and then the agent would update its rules and skill files before trying again.The rubric checked things like whether rollercoasters formed valid tracks with at least one drop, whether rides were accessible by paths, whether each world used the appropriate themed scenery, and whether the park worked as a whole.

**One-liner:** A prompt-to-park generator that uses the same design-system guardrails the author uses for Magic Patterns UI work — rules and a rubric-driven eval loop that score whether rollercoasters form complete tracks, rides are path-accessible, each world uses the right scenery, and the park works as a whole.

## Target Users

- Primary: people who want a coherent Rollercoaster Tycoon-style park as a starting point without having to lay every path and ride by hand.
- Secondary: builders familiar with the Magic Patterns workflow who want to see whether design-system discipline transfers to a non-UI domain.

## Jobs To Be Done

1. Functional — turn "build me a cool theme park" into a park with multiple worlds, paths, and rides that hang together as a coherent layout.
2. Emotional — avoid the "vibe coded slop" feeling the author names, where every AI-generated result converges on the same patterns; here the convergence is on the wrong track.
3. Social — share a generated park with other builders, with the rule set and rubric visible so others can see why the park looks the way it does.

## Success Metrics

- Rubric pass rate: what fraction of generated parks satisfy the source's enumerated rubric items (valid coaster track with at least one drop, ride accessibility via paths, themed scenery per world, overall park coherence).
- Iteration count: how many generate → grade → update-rules cycles it takes to hit the pass rate.
- Not stated in the source: there is no published number for what a "good" rubric pass rate looks like.

## Pricing & Monetization

Not stated in the source. The author is an engineer at Magic Patterns describing a personal project; no price, plan, or commercial intent is named.

## Competitive Landscape

Not stated in the source. The author references Rollercoaster Tycoon as the visual reference but does not name any other AI park generators or competing tools.

## Risks & Open Questions

- Rubric gaps: a hand-built rubric can miss aesthetic rules the user actually cares about (ride pacing, line-of-sight, sound mix); the rule layer needs to be editable.
- Eval cost: running a second agent to grade and a third to update rules before each retry is expensive, and the source does not say how the cost is bounded.
- Theme drift within a world: a pirate world that includes one out-of-theme ride breaks the rule; the per-world scenery check has to be tight enough to catch that.
- The author admits that "simply giving the model the right components wasn't enough" — the same lesson applies here. The MVP cannot promise the rubric alone makes every output coherent.
