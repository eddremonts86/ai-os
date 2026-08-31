---
id: "3899"
slug: dice-for-board-games-and-rpgs
title: "Dice for Board Games and RPGs"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49496542"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [canvas animation, cryptographic RNG, dice presets, browser storage, PWA, static hosting]
---
# Dice for Board Games and RPGs

## Problem

The capture for this plan is a URL-only Show HN submission pointing at https://onlinedice.app/. The product claim carried by the title is a dice roller for board games and role-playing games — a browser tool that rolls the polyhedral dice those games use, from the d4 through the d20, with the sums and modifiers tabletop players need. The capture states nothing further: no feature list, no platform details and no pricing.

## Objective

Build the MVP the title promises: a web dice roller that covers the dice board games and RPGs actually use — polyhedral dice, dice pools, modifiers — with rolls that feel physical and results that are visibly fair. The MVP must be trustworthy on randomness, because a dice roller lives or dies on fairness.

## Target Users

- Tabletop RPG players who need dice pools for games like D&D and its relatives.
- Board gamers who lost a die or play where rolling is awkward.
- Online game masters running sessions over video calls who want rolls everyone can see.
- People at the table without a full dice set on hand.

## MVP Scope

- Roll the standard polyhedral set: d4, d6, d8, d10, d12, d20.
- Roll multiple dice at once with a modifier, for example 3d6+2.
- Animated rolls with a visible result history.
- A shared session link so a whole table sees the same rolls.

## Constraints

- Fairness is non-negotiable: the MVP uses a cryptographic-strength random source and says so.
- The source is a bare URL plus title; every feature beyond rolling is our design.
- Roll animation must not compromise the result: the number is decided before the tumble, never during.
- No user counts, platforms or pricing exist in the capture; none may be invented.

## Design Direction

See `DESIGN.md` for this project's design tokens.
