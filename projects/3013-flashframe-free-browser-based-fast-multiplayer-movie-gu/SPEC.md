---
id: "3013"
slug: flashframe-free-browser-based-fast-multiplayer-movie-gu
title: FlashFrame-Free Browser-Based Fast Multiplayer Movie Guessing Game
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49339210"
category: show-hn
date: "2026-08-17"
tags: [Show HN, Product, Problem]
---
# FlashFrame-Free Browser-Based Fast Multiplayer Movie Guessing Game

## Problem

The author is a movie fan whose friends already play daily movie-frame guessing games, but none of them are multiplayer or timed. Existing options (Frame, MovieClues, and various subreddit threads) are solo or turn-based and drag on. The author wanted a fast-paced, browser-based, real-time experience and built one with HTML, Node, and Postgres, pulling frames from the TMDB API. The post is a Show HN request for feedback, not a feature list. The implicit problem is real: there is no quick, live, browser-native movie-frame guessing game with a real-time room model and a fast tick.

## Objective

Build a real-time multiplayer movie-frame guessing game where 2–8 players join a room, see a series of movie frames at a fast tick (a few seconds per frame), and race to type the movie title. The MVP focuses on the loop the author actually built: a room with a host, frames from TMDB, a shared tick, a chat-style answer box, and a score that updates each round. It is browser-only (no install), free, and tuned for short sessions — five-minute rounds with friends.

## Target Users

- Movie-loving friend groups who already play daily frame-guessing games and want a live, timed version they can open in a browser tab.
- Trivia enthusiasts who want a quick break-time game with a low friction (no install, no account needed in v1).
- The author, who wants feedback on the loop and a small group of regular players to iterate against.

## MVP Scope

- A browser landing page where a player creates or joins a room via a short code.
- A room screen: 2–8 players, a shared frame displayed at the top of each round, a chat-style input where every player types their guess, and a per-round score update.
- Frame sourcing from the TMDB API, with a curated "safe-for-guessing" filter (no obscure festival-only releases, no frames that spoil the answer in one glance).
- A round timer with a tick of 10 seconds and a five-round default game.
- A post-game summary screen with the per-player scoreboard and the ability to start a new game with the same players.
- A simple anti-cheat measure: guesses are only accepted after the round starts and before the timer hits zero.
- No accounts, no login, no persistent player profiles in v1. A nickname per room is enough.

## Design Direction

Design direction for the MVP follows the constraints in `3013-.../SPEC.md`. The visual language is energetic and frame-forward: the movie frame is the dominant surface, the chat-style guess box sits below it, and the scoreboard sits at the side.

**Color** — dark background so frames pop, one accent for the timer countdown, one muted accent for correct-guess feedback.

**Type** — one display family for the timer, one text family for guesses, one mono family for room codes.

**Density** — medium. The frame should breathe; the guess box should be a single line.

**Motion** — round transitions only (frame fade-in, scoreboard pulse on correct guess). No parallax, no autoplay.

## Constraints

- The MVP depends on the TMDB API for frames. Rate limits, key revocation, and content licensing are out of the MVP's control.
- The MVP is browser-only. No mobile app, no desktop app.
- The MVP does not persist game history beyond a single browser session unless the user explicitly opts in.
- The MVP does not include a leaderboard across rooms — only within a single room's session.
