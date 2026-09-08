---
id: "4191"
slug: doglm-can-you-pet-the-dog-in-an-ai-generated-gam
title: "DogLM – Can you pet the dog in an AI-generated game?"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49509649"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---

# DogLM – Can you pet the dog in an AI-generated game?

## Problem

DogLM (mikeushakov.github.io/doglm) is a benchmark that measures whether an LLM, when prompted to build a video game with a background dog character, lets the player pet that dog. The benchmark is named after the "Can You Pet the Dog?" Twitter / X account: the design rule that if a game has a dog, the player should be able to pet it. DogLM tests whether a model applies that rule when two conditions are met in the game-generating prompt — a dog is present and a pet interaction is plausible.


---

## Objective

Ship a benchmark that scores an LLM on whether, given a game prompt with a dog, the model builds a pet-the-dog interaction. The score is a yes/no per prompt plus an aggregate rate across the prompt set.


## Target Users

LLM evaluators, model builders, and game-design researchers who want a single-number signal on whether a model respects a small but well-known design rule. Assumes the reader is comfortable running an LLM benchmark.


## MVP Scope

- A prompt set where each prompt asks the model to build a game with a dog in the background.
- An automated grader that checks the generated game code for a pet-the-dog interaction.
- A score per model and an aggregate rate across the prompt set.
- A public leaderboard so a model can be compared against others.
- A documented methodology page that explains what counts as a pet interaction.


## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Source post does not state pricing; the benchmark is presented as a public artefact.
- The grader has to be precise; false positives (counting a non-pet interaction as a pet) would invalidate the leaderboard.
- Models change; the prompt set has to be stable across versions so scores are comparable.
