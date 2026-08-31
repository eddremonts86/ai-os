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

## Value Proposition

See your codebase instead of reading it. RepoWorld turns a GitHub repository into a walkable voxel city — files as buildings, directories as neighborhoods, open issues as monsters — laid out deterministically so the same repo always yields the same city. Dependency edges show what depends on what, Greptile's analysis flags the riskiest files, and a chase simulation turns bugs and risk into visible events with a review panel. Everything is read-only toward your repo, verified: every GitHub call is a GET.

**One-liner:** Paste a GitHub repo and walk through it as a voxel city where issues are monsters and risk is visible.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Developers onboarding to new repos | Spatial overview beats folder-diving: where the weight sits, what depends on what. |
| Maintainers triaging rot | Issue-monsters and risk analysis make the problematic corners visible. |
| Visual learners and demo audiences | Code as a navigable place, not an archaeology dig. |

The post does not describe enterprise licensing; it is an MIT hackathon project.

## Jobs To Be Done

1. **Functional job** — Turn a repo URL into a walkable city in seconds.
2. **Functional job** — Navigate by landmarks: files, neighborhoods, dependency edges, hazards — with the same layout every visit.
3. **Functional job** — Spot the risk: Greptile analysis flags the riskiest files; the chase turns bugs into reviewable events.
4. **Emotional job** — Feel oriented in an unfamiliar codebase, the way a map orients better than a list.

## Success Metrics

- **Time-to-city:** a playable city renders in a few seconds (the stated progressive-pipeline goal).
- **Determinism:** the same repo produces the same city on every load.
- **Read-only proof:** zero non-GET GitHub calls, verified by instrumentation (the README's stated method).
- **Risk visibility:** the riskiest files and open issues are visually distinct (hazards/monsters) and surface in the review panel.
- **The source names no revenue target.**

## Pricing & Monetization

None stated. RepoWorld is an MIT-licensed hackathon build deployed on Vercel. Monetization is out of scope for the MVP.

## Competitive Landscape

The README does not name competitors. The landscape is code visualization and onboarding tooling — treemap visualizations, dependency graphs, code-atlas tools — where RepoWorld's differentiation is the embodied, game-like city metaphor plus the Greptile risk layer. The comparison is implicit: flat tools show structure; RepoWorld makes structure a place you walk. No feature or price comparison appears.

## Risks & Open Questions

- [ ] Hackathon scope: built in an afternoon with Codex — robustness, error handling and edge cases are unproven.
- [ ] Greptile dependence: the risk layer requires Greptile API keys and indexing; without them the city loses its analysis layer.
- [ ] GitHub API limits: fetching trees, issues and PRs per repo can hit rate limits on large repos.
- [ ] The metaphor's ceiling: a city view is compelling for demos, but whether it aids real daily work (vs. a good file tree) is unvalidated.
- [ ] Determinism vs. repo churn: the city changes as the repo changes; landmarks shift on every refactor — the property cuts both ways.
