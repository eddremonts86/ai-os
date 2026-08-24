---
id: "2092"
slug: bisecto-a-minimalist-game-about-cutting-shapes-into-505
title: Bisecto – A minimalist game about cutting shapes into 50/50 halves
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49374879"
category: show-hn
date: "2026-08-20"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Bisecto – A minimalist game about cutting shapes into 50/50 halves

## Problem

Hey HN,I built Bisecto (https://bisecto.com), a minimalist browser game with one simple mechanic, cutting (bisecting) a procedural 2D shape into two exact 50/50 halves with a single straight line.Confession: I got completely hooked watching those viral reels of people trying to cut fruits and vegetables into perfectly equal halves, and that was my inspiration for this game :D I've been writing code for 12+ years, but for this project I leaned heavily on LLMs to quickly spin up this game, I thought it's going to be quick, but it took me some time (around 2 weeks) to make the game the way I want it to be.A few game modes to try:
- Classic: Endless run, you get to choose difficulty and line cutting mode- Arcade mode: You get 3 lives, you have to keep accuracy above 95%.- Daily challenge: A shared daily seed, 10 identical shapes for everyone, see how you rank.- Friends challenges: Create a challenge and send it to your friends and see who is better at cutting shapes in half.Under the hood:- Runs 100% client-side with pure TypeScript and HTML5 Canvas 2D. No framework or build bloat.- Procedural polygon generation (with concave traps and inner cut-through holes on higher difficulties).- Slicing uses Sutherland-Hodgman polygon clipping against an infinite line plane, and areas are calculated on the fly using the Shoelace formula.- No ads, tracking cookies, account signups needed only to create a challenge, email is optional and needed for password recovery only.Give it a spin on desktop or mobile. I'd love your thoughts on the gameplay, UI feel, controls, or any ideas to make the game better and more addictive (if that's even possible :D)

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
