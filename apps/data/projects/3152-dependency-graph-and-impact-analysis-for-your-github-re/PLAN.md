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

## Tech Stack

A web app over a static import-graph extractor: dependency edges come from parsing source, not from running it, so analysis is a read-only pass over a fetched repository and results cache well per commit.

## Architecture

Fetch a repository at a commit, parse it into a module and symbol graph, store the graph keyed by commit, and answer impact queries as reverse-reachability over that graph. Caching by commit is what makes it usable, since the graph is expensive to build and only changes when the code does.

## Milestones

1. Import-graph extraction for one language
2. Graph visualisation for a fetched repository
3. Reverse-reachability impact queries per file
4. Ship at the public URL with per-commit caching

## Risks

- Binary dependencies and generated code produce noisy or misleading graphs
- Dynamic imports cannot be resolved statically, so the graph will be incomplete
- Large repositories make graph building slow enough to hurt the first-run experience
