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

## Phase 0: Scaffold

- [ ] Stand up the `code-stitcher` package with `pyproject.toml` (setuptools), a `src/` layout, and a single `code-stitcher` console script.
- [ ] Write SPEC.md (this document).
- [ ] Set up CI: pytest on Python 3.11, 3.12, 3.13; lint via ruff; type-check via mypy.
- [ ] Decide on the Markdown parser (`markdown-it-py`) and pin the version.

## Phase 1: Core

- [ ] Implement the markdown extractor (fenced blocks, inline code) using markdown-it-py.
- [ ] Implement the language classifier (Python by ```python fence; GDscript by ```gdscript fence or by file extension in the input path).
- [ ] Implement the Python applier: `ast.parse` the proposed block; locate the target file; compute the diff; atomic write via `tempfile` + `os.replace`.
- [ ] Implement the GDscript applier: a hand-rolled tokenizer + parser covering `.gd`, `.tscn`, and `.tres`; fall back to "best-effort" if the parser cannot fully validate.
- [ ] Implement `--dry-run` (print diff, no write) and `--confirm` (interactive y/N prompt) flags.
- [ ] Implement `git worktree add` integration for the isolated-branch mode.
- [ ] Write tests: golden-file fixtures for Python and GDscript appliers; round-trip tests for `ast.unparse`; atomic-write tests.

## Phase 2: Deploy

- [ ] Publish to PyPI as `code-stitcher`.
- [ ] Verify the CLI entry point works on macOS, Linux, and Windows.
- [ ] Write a README that demonstrates the most common use case (paste a markdown response, see the diff, confirm to apply).
- [ ] Watch for the first 50 GitHub stars and the first 10 external contributors.
