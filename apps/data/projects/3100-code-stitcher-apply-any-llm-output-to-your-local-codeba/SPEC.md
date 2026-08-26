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

## Problem

Copying code from a chat session or markdown response back into a local editor is the most common LLM-developer workflow, and the one most likely to silently break the codebase. A typical copy-paste produces a regex-based search-and-replace, a manual line-by-line merge, or a "trust me, paste it in" instruction — any of which can land malformed Python, silently drop a function definition, or write a half-finished file because the LLM cut off mid-block. The post describes the exact gap Code Stitcher fills: arm the program, paste the LLM output as text or markdown, and have it apply to the local codebase automatically — with Python AST validation that catches syntax errors before they hit disk, and now with GDscript (Godot engine) and its associated files supported.

## Objective

Ship a CLI that takes an LLM-produced code block (text or markdown fenced), locates the matching file and insertion point in a local repo, validates the proposed change against the target language's parser (Python AST, GDscript for Godot), and writes the change atomically — without ever silently producing a half-finished file.

## Target Users

- Primary: solo developers and small teams who use ChatGPT / Claude / Cursor / Copilot Chat to generate code and currently paste the result back into their editor by hand.
- Secondary: Godot engine developers (a smaller niche that the post calls out explicitly) who get GDscript snippets from LLMs and have no good way to validate them before committing.

## MVP Scope

- A CLI that takes a markdown file or text block on stdin, extracts every fenced or inline code block, classifies the language, and routes it to the right applier.
- A Python applier that uses `ast.parse` to validate the proposed replacement against the AST of the current file before writing; rejects and reports the diff if the parse fails.
- A GDscript applier for the Godot engine, including recognition of `.gd`, `.tscn`, and `.tres` file extensions.
- A diff-and-confirm mode that prints the proposed change and waits for `y` before writing to disk.
- A dry-run mode that produces the diff without touching the filesystem.
- A `git worktree` integration so the CLI can stage the change in an isolated branch without disturbing the user's working tree.
- Out of scope for MVP: a GUI, a language-server-protocol mode, support for languages beyond Python and GDscript.

## Design Direction

Design direction for the MVP at `https://github.com/ue-patcher/Code_Stitcher` follows the constraints in this SPEC and the chosen stack (Python, ast module, GDscript parser, Git worktree). The visual language targets the CLI audience: no UI in v1, just clear terminal output.

**Color** — no GUI; terminal output uses standard ANSI colors (green for applied, yellow for diff shown, red for parse failure). No theme files in v1.

**Type** — N/A (CLI only).

**Density** — one line per file, one fenced diff per change, no decorative boxes.

**Motion** — N/A.

## Constraints

- The Python applier must use `ast.parse` (or `ast.unparse` for round-trip checks) to validate every proposed replacement before writing — no regex-only Python changes in v1.
- The CLI must support an explicit `--dry-run` flag and refuse to write without a `--confirm` flag in non-interactive contexts.
- Every write must go through a temp-file-and-rename to avoid leaving a half-finished file on disk.
- The Godot path must recognize `.gd`, `.tscn`, and `.tres` extensions and route them to the GDscript applier, not the Python one.
- The MVP ships as a single `pip install`-able package and a single CLI entry point.
