---
id: "3100"
slug: code-stitcher-apply-any-llm-output-to-your-local-codeba
title: Code Stitcher – Apply any LLM output to your local codebase
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49446964"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Developer-Tools, AI]
tech: [Python, ast module, GDscript parser, Git worktree, GitHub]
---
# Code Stitcher – Apply any LLM output to your local codebase

## Value Proposition

Take an LLM-produced code block, paste it into the CLI, and have it land in your local codebase with parser-validated correctness — no half-finished files, no silently broken Python.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Solo developers using LLM assistants | They paste code from ChatGPT/Claude/Cursor back into their editor dozens of times a day and have been bitten by malformed output. |
| Small team leads reviewing AI-generated PRs | They want a tool that catches malformed Python before the code reaches a reviewer. |
| Godot engine developers | The post calls out GDscript explicitly; this niche has almost no good LLM-output validators. |

## Jobs To Be Done

1. **Functional job** — get a block of LLM-generated code into the right file in the right place, with parser validation, without manual line-by-line merging.
2. **Emotional job** — never again lose an hour to a half-finished file because the LLM cut off mid-block.
3. **Social job** — be the developer on the team who reliably ships LLM-assisted code that passes CI on the first try.

## Success Metrics

- **Activation:** 70% of new installs successfully apply their first code block within 24 hours of `pip install`.
- **Retention:** 40% week-4 retention of installs (a developer who has used it on four separate days in a month is keeping it).
- **Revenue:** this is an MIT-licensed hobby project per the post; the success metric is GitHub stars and adoption, not revenue.

## Pricing & Monetization

Open source under MIT. The founder has not signaled any monetization path in the post; future revenue shape (if any) is most likely consulting for shops that want to wire the applier into their CI.

## Competitive Landscape

- **Manual paste + edit** — the status quo; the wedge is removing the manual merge step.
- **`ruff --fix` / `black` / `isort` over pasted code** — formats but does not validate that the pasted block parses; Code Stitcher runs the parser first.
- **Cursor / Copilot apply-edit primitives** — vendor-locked to specific editors; Code Stitcher is editor-agnostic and works from the CLI.

## Risks & Open Questions

- [ ] Confirm the GDscript parser path is robust against Godot's many `.tscn` / `.tres` edge cases; the post only mentions the feature, not the coverage.
- [ ] Validate that the `ast.parse` round-trip is safe for all valid Python (some AST nodes do not round-trip cleanly).
- [ ] Confirm the founder wants to grow this beyond a hobby project before sinking time into packaging, CI, and a documentation site.
