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

## Problem

I've been working on linecast, a free and open source collection of six terminal applications: weather, radar, sunshine, moon, tides, and maps.It's as if the Old Farmer's Almanac was built for Minitel.I made it because I'd been using the terminal a lot more over the past couple of years, I'm opinionated about weather forecast IA and design, and I liked the idea of making useful little terminal desk ornaments.The applications use ANSI color and Unicode braille characters rather than graphics. They reflow as the terminal is resized and derive their colors from your current terminal palette, including when the theme changes while they're running. They're mouse friendly where it makes sense.There's no account or required API key. Forecasts and air quality come from Open-Meteo; alerts, tides, and radar use various public sources; Sun and Moon positions are calculated locally; and the maps use OpenStreetMap-derived vector data and public elevation tiles. The code is just the Python stdlib with no package dependencies.If you have uvx, you can run it without installing: uvx linecast weather, uvx linecast radar, uvx linecast maps. It's also installable through Homebrew, uv tool, pipx, or pip. Source: https://github.com/ashuttl/linecastIt currently supports macOS and Linux with Python 3.10+. It doesn't work over SSH and I haven't explored Windows support.Hope you enjoy checking it out! Feedback welcome.

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
