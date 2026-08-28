---
id: "3149"
slug: music-puzzle-game-on-steroids
title: Music Puzzle Game on Steroids
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447840"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [Web Audio API, static HTML/JS/CSS, static host]
---
# Music Puzzle Game on Steroids

## Problem

The maker, a self-described puzzle and music buff, vibecoded a music puzzle game over a weekend about a year ago and recently noticed it has "blown up". The game splits a song into separate stems and asks the player to guess the track, and uses a custom signal-processing trick to turn vocals into humming as part of the puzzle mechanic.

## Objective

Make the stem-decomposition + humming-puzzle experience feel polished enough that the existing organic traction (the post's "blown up") holds and converts into repeat play. Scope is the gameplay loop and the audio-processing trick — not a streaming or social product.

## Target Users

People who like music and puzzles: casual music-game players (the "sleek and new music puzzle game" the poster is appealing to), plus the maker's existing organic audience who arrived before this post.

## MVP Scope

Stem separation of a song into playable layers, the vocal-to-humming signal-processing step the poster mentions, and a round-based guess flow that surfaces the result of those mechanics. Ship a small but curated song set — the post names no song catalogue size, so do not invent one.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Browser-based audio processing puts heavy work on the client: the humming conversion has to run fast enough on commodity hardware that the puzzle does not stutter. Copyright on the songs used for stem-splitting is the maker's problem to clear — the post does not name a licence, so flag it.
