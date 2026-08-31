---
id: "3801"
slug: "3d-embodiment-of-your-git-repo"
title: "3D Embodiment of your Git repo"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49491794"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [React Three Fiber, instanced WebGL rendering, squarified treemap layout, GitHub REST API, Greptile API, Vercel functions]
---
# 3D Embodiment of your Git repo

## Problem

The Show HN post is URL-only, pointing at RepoWorld. The README states the problem in one line: "Codebases are invisible. You can read a file, but you can't see a system — where the weight sits, which corners are rotting, what depends on what." RepoWorld's answer is to make a repository a place: paste a GitHub repo URL and it becomes an explorable voxel city — every file a building, every directory a neighborhood, every open issue a monster roaming the streets. Placement is deterministic, seeded from file paths (never `Math.random()`), so the same repo always produces the same city and landmarks stay put. The pipeline is progressive: a playable city appears in a few seconds, then dependency edges, Greptile's risk analysis and a generated sky stream in and re-render in place. The README is explicit that the app never modifies the repo — every GitHub call is a GET, verified by instrumenting fetch through a full deploy-and-kill cycle — and the only writes are POSTs to Greptile (to analyze and index). Performance is engineered: instanced meshes, one shared box geometry, and top-only ground tiles cut the scene from roughly 989k triangles to 310k. It was built in an afternoon at the Greptile Fast Hackathon with OpenAI Codex as the primary coding agent, and deploys on Vercel.

## Objective

Ship the "codebase as walkable city" experience: a repo URL becomes an explorable 3D world in seconds, with files, dependencies and issue-hazards visible in place, and risk analysis layered on via Greptile. The MVP is the hackathon build hardened — deterministic cities, read-only repo access, and the progressive pipeline made reliable.

## Target Users

- Developers onboarding to unfamiliar repos who want the spatial overview a flat file tree cannot give.
- Engineers hunting for the "rotting corners" — where issues, PRs and risk concentrate in the codebase.
- Hackathon/demo audiences: the project proves a visual, AI-assisted take on repository understanding.
- People who enjoy code as a navigable space rather than an archaeology dig.

## MVP Scope

- Repo URL → voxel city: deterministic layout from file paths, playable in seconds.
- Visual encoding: file = building, directory = neighborhood, open issue = monster; dependency edges drawn between buildings.
- Risk layer: Greptile indexing/query surfaces the riskiest files and drives hazards and the chase simulation.
- Review panel: kill events from the chase surface issues/PRs for review.
- Read-only guarantee: all GitHub access is GET; writes only to Greptile.
- Vercel deployment with server-side credential injection via api/ functions.

## Constraints

- Determinism: placement is seeded from file paths, not randomness — the same repo must always build the same city.
- Read-only repo access is a stated, verified property; any feature needing writes to GitHub is out.
- Progressive loading is the architecture: a usable city in seconds, enrichment streaming in after.
- Performance is a hard constraint (instancing, shared geometry, ~310k-triangle budget); new visual features must stay inside it.
- Built at the Greptile Fast Hackathon with Codex — the MVP inherits hackathon scope, not product scope.

## Design Direction

See `DESIGN.md` for this project's design tokens.
