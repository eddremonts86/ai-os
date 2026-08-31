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

## Tech Stack

The README documents the pipeline and rendering approach explicitly.

- **React Three Fiber:** the 3D scene framework — player, buildings, bugs, roads, hazards, dependency lines and the HUD/minimap/review panel.
- **Instanced WebGL rendering:** one InstancedMesh per material and a shared BoxGeometry for the whole world, zero allocation in the frame loop.
- **Squarified treemap layout:** file sizes become districts, buildings, roads, plots and sidewalks — the geometry of the city.
- **GitHub REST API:** tree, issues, PRs and file contents — all GET, never writes.
- **Greptile API:** indexes the repo and queries the riskiest files; POSTs go only here.
- **Vercel functions:** the api/ directory replaces the dev proxy in production and injects GREPTILE_API_KEY and GITHUB_TOKEN server-side.

## Architecture

- **Ingest:** `github.js` fetches the tree, issues, PRs and file contents (GET only).
- **Layout:** `layout.js` runs the squarified treemap → deterministic city from file paths, never `Math.random()`.
- **Enrichment (progressive):** `hazards.js` places issue/PR dangers, `deps.js` parses imports into dependency edges, `greptile.js` indexes and queries the riskiest files, `skybox.js` generates the environment — each streams in after the playable city.
- **Interaction:** `chase.js` simulates bugs/Greptile findings; kill events feed the review panel.
- **Performance budget:** instancing + shared geometry + top-only ground tiles (~989k → ~310k triangles).

## Milestones

1. **M0 — City from URL.** A repo URL yields a walkable, deterministic city in seconds on Vercel.
2. **M1 — Enrichment layers.** Dependency edges, hazards and the Greptile risk layer re-render in place after the city.
3. **M2 — Interaction.** The chase simulation and review panel surface issues/PRs from kill events.
4. **M3 — Hardening.** Rate-limit handling, large-repo behavior and error states beyond hackathon scope.

## Risks

- **Hackathon durability:** built in an afternoon with Codex; the jump from demo to dependable tool is unproven work.
- **Third-party coupling:** Greptile keys and indexing are required for the risk layer; without them the most distinctive feature disappears.
- **Rate limits:** large repos stress GitHub API limits and token budgets; the progressive pipeline must degrade gracefully.
- **Metaphor ceiling:** a city view may delight but not outperform existing tools for real work; utility beyond the demo is the open question.
- **Churn vs. determinism:** repos change, so landmarks move; returning users may lose the orientation the determinism promise was meant to give them.
