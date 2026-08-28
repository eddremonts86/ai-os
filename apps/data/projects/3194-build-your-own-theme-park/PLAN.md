---
id: "3194"
slug: build-your-own-theme-park
title: Build your own theme park
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49452037"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Build your own theme park

## Tech Stack

- **Generator agent:** TypeScript orchestrator on top of an LLM API, with the prompt, rule set, and rubric loaded as versioned skill files so the eval loop can update them between iterations.
- **Park data model:** a typed representation of worlds, paths, rides, rollercoasters and their tracks, with validation that the same rules the grader checks are checkable in code as well.
- **Park renderer / editor:** React + TypeScript front-end (the same TanStack Start stack already in frontmatter) so the user can preview, edit and export the generated park.
- **DB:** SQLite with Drizzle ORM for per-park runs, the rule files in effect, and the rubric history. The MVP is single-user and does not need a remote database.
- **Eval loop:** a second agent process that reads a generated park, scores it against the rubric, and emits a structured list of failures that the generator agent can turn into rule-file edits.
- **Deployment:** Coolify + Docker for the hosted pieces (the web preview and the rubric service); the generator can also run locally for the author.

## Architecture

```
Prompt ──▶ Generator agent ──▶ Park JSON
                                 │
                                 ▼
                            Grader agent ──▶ Rubric score + failure list
                                 │
                                 ▼
                         Rule-file updater ──▶ New rule version
                                 │
                                 └──── loop back to generator
                                 │
                                 ▼
                       React preview + export (TanStack Start)
```

- The rule set is treated as data: the grader writes structured failures, the updater rewrites the rule files, and the next generator run loads the updated rules.
- The rubric items named in the source (valid coaster tracks with a drop, ride accessibility via paths, themed scenery per world, overall coherence) are the seed set; the user can add to them.
- The export pipeline produces a park artifact the user can take into their own editor — no live integration with Rollercoaster Tycoon itself is in scope.

## Milestones

1. **M0 — Spec + design tokens + park data model.** Existing SPEC.md and DESIGN.md approved; the typed park schema can express worlds, paths, rides, and rollercoaster tracks.
2. **M1 — Single-shot generator.** Given a prompt, the agent emits a park JSON that the rule checks can validate.
3. **M2 — Grader agent + rubric.** The grader scores the park against the source's enumerated rubric items and returns structured failures.
4. **M3 — Rule-update loop.** The updater rewrites the rule files from grader failures; the generator retries with the new rules. The loop terminates when the rubric passes.
5. **M4 — Preview + export.** A React + TanStack Start app previews the generated park and exports it for downstream use.
6. **M5 — Theme packs.** Pirate, jungle, space, etc., each with its own scenery vocabulary so the per-world scenery rule has something to enforce.

## Risks

- Eval loop cost: each iteration pays for one generate, one grade, and one rule-update call; long loops can burn budget fast. Need a max-iteration cap and a "ship the best so far" fallback.
- Rubric completeness: the source's enumerated items are necessary but probably not sufficient for "the park works as a whole". New rubric entries will surface only through user feedback.
- Theme-pack authoring: per-world scenery is content, not code, and the MVP depends on the author (or contributors) writing good packs.
- The author is upfront that "simply giving the model the right components wasn't enough" — the same caveat applies here; the MVP cannot promise the rubric alone is the whole answer.
