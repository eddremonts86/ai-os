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

## Value Proposition

Point at a GitHub repository and get its dependency graph plus an answer to what a change to this file would touch.

## Target Users

Maintainers of repositories large enough that the blast radius of a change is no longer obvious from reading it.

## Jobs To Be Done

- See what depends on the file or function I am about to change
- Understand an unfamiliar repository's structure before editing it
- Judge the risk of a change before opening the pull request

## Success Metrics

- Repositories analysed successfully versus analyses that fail or time out
- Whether users run a second impact query after the first, which means the answer was useful
- Time to first graph for a large repository

## Competitive Landscape

Repo-analysis tools (CodeScene, Sourcegraph) exist, but the source does not name any direct competitor that focuses on dependency graph and impact analysis for a GitHub repo.

## Risks & Open Questions

- The source does not state which languages are supported, and that decides the addressable repositories
- Graph accuracy depends on resolving imports, which dynamic languages make ambiguous
- Very large repositories may not be analysable within a request's patience
