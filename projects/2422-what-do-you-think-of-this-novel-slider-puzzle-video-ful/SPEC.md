---
id: "2422"
slug: what-do-you-think-of-this-novel-slider-puzzle-video-ful
title: "What do you think of this novel slider puzzle? [video, full rules, beta]"
status: draft
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49274075"
category: ask-hn
date: "2026-08-12"
tags: [Ask HN, Problem]
---
# What do you think of this novel slider puzzle? [video, full rules, beta]

## Problem

Beta link: https://testflight.apple.com/join/3sstMjRK [iOS/iPadOS]Gameplay video: https://www.youtube.com/watch?v=lC34LO_bL4k# Game Rules# ObjectiveThe game is played on a 6 × 6 grid using six colors.Each color begins with:1 gate5 tilesThe six gates are fixed in place. They cannot move or be removed. Every row and every column contains exactly one gate.Your goal is to leave as many of the grid's 30 non-gate cells empty as possible in the given number of moves.# ShapesEvery tile and gate has one of two shapes:SquareCircleA tile can be removed only when both its *color* and its *shape* match the gate it passes through.# Making a MoveSwipe any row or column to rotate its tiles and empty spaces by one position.Anything that passes an edge wraps around to the opposite edge. The gate remains fixed in place.During each rotation, exactly one tile or empty space passes through the gate. That interaction may change the passing tile and the gate. Everything else simply moves to its new position.# Passing Through a GateThere are three possible interactions:* A matching tile is removed.* Any other tile causes both shapes to change.* An empty space creates a new tile.# Matching tileWhen a tile matches both the gate's color and shape, the tile is removed, leaving an empty space.For example:* A square blue tile is removed by a square blue gate.* A circle red tile is removed by a circle red gate.The gate does not change when it removes a tile.# Any other tileIf a tile does not match both the gate's color and shape, both the tile and gate change shape:* Square becomes a circle.* Circle becomes a square.Their colors do not change.For example, when a circle green tile passes through a square green gate:* the tile becomes a square* the gate becomes a circleMatching is checked before either shape changes, so the tile is not removed during that move.Similarly, when a square green tile passes through a square red gate:* the tile becomes a circle* the gate becomes a circleThe tile is not removed because its color and shape did not both match the gate before the shapes changed.# Empty spaceWhen an empty space passes through a gate, it becomes a new tile with the gate's current color and shape.The gate does not change.The newly created tile cannot be removed during the same move.# Reversing a MoveEvery move can be reversed by swiping the same row or column in the opposite direction.Reversing restores the previous board position, including any removed or created tiles and any shape changes.The reverse swipe still costs one move.# Tile SizesAmong tiles of the same color, larger tiles are closer to the gate of that color.Tile sizes update as the tiles move. Size does not affect how tiles interact with gates.# Ending the GameThe game ends when you run out of moves.You may also end the game early. Removing every tile may not always be possible.# ScoringScore = (% empty × 1000) + moves remainingThe empty percentage is the percentage of the grid's 30 non-gate cells that are empty.# Betahttps://testflight.apple.com/join/3sstMjRK [iOS/iPadOS]

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
