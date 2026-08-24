---
id: "2506"
slug: linecast-weather-radar-tides-and-maps-in-the-terminal
title: "linecast – weather, radar, tides and maps in the terminal"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49408089"
category: show-hn
date: "2026-08-23"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# linecast – weather, radar, tides and maps in the terminal

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

_Based on source brief:_ I've been working on linecast, a free and open source collection of six terminal applications: weather, radar, sunshine, moon, tides, and maps.It's as if the Old Farmer's Almanac was built for Minitel.I made it because I'd been using the terminal a lot more over the past couple of years, I'm opinionated about weather forecast IA and design, and I liked the idea of making useful little terminal desk ornaments.The applications use ANSI color and Unicode braille characters rather than graphics. They reflow as the terminal is resized and derive their colors from your current terminal palette, including when the theme changes while they're running. They're mouse friendly where it makes sense.There's no account or required API key. Forecasts and air quality come from Open-Meteo; alerts, tides, and radar use various public sources; Sun and Moon positions are calculated locally; and the maps use OpenStreetMap-derived vector data and public elevation tiles. The code is just the Python stdlib with no package dependencies.If you have uvx, you can run it without installing: uvx linecast weather, uvx linecast radar, uvx linecast maps. It's also installable through Homebrew, uv tool, pipx, or pip. Source: https://github.com/ashuttl/linecastIt currently supports macOS and Linux with Python 3.10+. It doesn't work over SSH and I haven't explored Windows support.Hope you enjoy checking it out! Feedback welcome.

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

_Not written yet — `ai-os plans enrich` fills this section._

## Jobs To Be Done

_Not written yet — `ai-os plans enrich` fills this section._

## Success Metrics

_Not written yet — `ai-os plans enrich` fills this section._

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_Not written yet — `ai-os plans enrich` fills this section._

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

_Source:_ [HackerNews](https://news.ycombinator.com/item?id=49408089) · **Category:** show-hn · **Tags:** Show HN,Product,Problem
