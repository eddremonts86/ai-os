---
id: "2765"
slug: cookwing-an-ai-chef-that-doesnt-hallucinate-quantities
title: "CookWing, an AI chef that doesn't hallucinate quantities"
status: draft
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49429600"
category: show-hn
date: "2026-08-25"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# CookWing, an AI chef that doesn't hallucinate quantities

## Problem

Hey HN!I just released Cookwing. This is an AI app that solves the biggest problem I had when I was cooking with ChatGPT : The quantities are often hallucinated.I was curious, so I even built my own cooking quantity benchmark while development, and here are the results. We're using my system, which is anchoring tables that are searched in the original country of the recipe. For example, when cooking carbonara, it's going to check for the Italian web for the anchoring table, not the English web.
Benchmark results : https://cook.redwi.ng/static/blog/cookbench-v1-cooking-quant...The results were quite stunning, We reached 90% correct runs in average with correct quantities, and I'm saying that because I actually cooked myself these and I know the exact quantities Required for these recipes.Feel free to try it and give me your thoughts!

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
