---
id: "3152"
slug: dependency-graph-and-impact-analysis-for-your-github-re
title: Dependency graph and impact analysis for your GitHub repo
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447666"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Dependency graph and impact analysis for your GitHub repo

## Problem

The poster shipped a dependency-graph and impact-analysis tool at vast-neracu.vercel.app, targeting GitHub repositories. The HN post body contains no further detail.

## Objective

Show the dependency graph of a GitHub repository and answer 'what depends on this file/function?'.

## Target Users

Maintainers of non-trivial repos who want to know the blast radius of a change before they make it.

## MVP Scope

Web app that takes a GitHub repo URL, builds a dependency graph, and answers impact queries.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Repos with binary dependencies or generated code will produce noisy graphs.
