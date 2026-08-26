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

## Tech Stack

- **Language:** Python 3.11+ (uses `ast.parse`, `ast.unparse`, and the new parser features).
- **Parsers:** the standard library `ast` module for Python; a small hand-rolled tokenizer + parser for GDscript (the post does not name an existing library).
- **Markdown extraction:** a lightweight markdown parser (e.g. `markdown-it-py`) to pull fenced and inline code blocks out of the input.
- **File I/O:** `pathlib` and `os.replace` for atomic temp-file-and-rename writes.
- **Git integration:** `git worktree add` via `subprocess` for the isolated-branch mode.
- **Distribution:** PyPI as `code-stitcher`; one CLI entry point `code-stitcher`.
- **Testing:** `pytest` with golden-file fixtures for each language.

## Architecture

```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Input       │────▶│  Markdown    │────▶│  Language    │
│  (stdin /    │     │  extractor   │     │  classifier  │
│   file)      │     │              │     │              │
└──────────────┘     └──────────────┘     └──────────────┘
                                                 │
                                                 ▼
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Atomic      │◀────│  AST /       │◀────│  Applier per │
│  write       │     │  parse check │     │  language    │
│  (tmp+rename)│     │              │     │              │
└──────────────┘     └──────────────┘     └──────────────┘
                                                 │
                                                 ▼
                                          ┌──────────────┐
                                          │  Git worktree │
                                          │  staging     │
                                          └──────────────┘
```

The CLI extracts code blocks from the input, classifies each by language (Python or GDscript in v1), routes to the language-specific applier, runs the parser check, and either applies atomically or prints the diff for human review.

## Milestones

1. **M0:** Markdown extractor + language classifier + a Python applier that uses `ast.parse` to validate every replacement.
2. **M1:** Atomic write via `tempfile` + `os.replace`; `--dry-run` and `--confirm` flags.
3. **M2:** GDscript applier covering `.gd`, `.tscn`, and `.tres`.
4. **M3:** `git worktree` integration for the isolated-branch mode.
5. **M4:** PyPI publish as `code-stitcher`; CLI entry point; GitHub Actions CI on Python 3.11 / 3.12 / 3.13.

## Risks

- **`ast.parse` round-trip is lossy.** Some valid Python ASTs do not round-trip cleanly through `ast.unparse`, so a valid block can be flagged as invalid. Plan: fall back to a stricter `ast.parse` + `ast.dump` comparison before writing.
- **GDscript parser coverage.** A hand-rolled GDscript parser will miss edge cases Godot developers hit daily. Plan: ship with a "best-effort" GDscript parser and a `--no-validate-gdscript` escape hatch for advanced cases.
- **Markdown extraction ambiguity.** LLM outputs vary in how they fence code blocks; some embed code inline without fences. Plan: ship with the markdown-it-py default and document the supported subset.
- **Atomic writes on Windows.** `os.replace` is atomic on POSIX but not always on Windows. Plan: document the Windows behavior and ship a separate `--no-atomic` flag if needed.
