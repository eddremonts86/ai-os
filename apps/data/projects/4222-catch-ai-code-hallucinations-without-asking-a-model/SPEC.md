---
id: "4222"
slug: catch-ai-code-hallucinations-without-asking-a-model
title: Catch AI code hallucinations without asking a model
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49507199"
category: show-hn
date: "2026-08-31"
tags: [Show HN, Product, Problem]
tech: [React, TypeScript, Node.js API (TanStack Start), SQLite with Drizzle ORM, Coolify, Docker]
---
# Catch AI code hallucinations without asking a model

## Problem

"Hallucination" is vague and "lying" is wrong, so the hedgemony library does not use either as a verdict. Every finding is named precisely, and each name is a claim the user can check. The library finds the things that do not exist in code an AI wrote — packages that were never published, methods that were never written, arguments no function accepts — and the code that contradicts its own stated examples. Every verdict comes from the Python interpreter or a package registry; no language model is asked anything. That is the source's point: a finding is a fact about the world, not a second opinion from the same kind of system that produced the mistake.

The source is the GitHub repository for `lovettsendit/hedgemony`, published to PyPI as `hedgemony` under SSPL-1.0, with zero runtime dependencies. The README gives a worked example: `hedgemony dashboard.py` reports 2 fabrications in 21 lines (9.5 per 100 lines), names the line numbers, names the verdict class (`ATTR`), names the offending identifier (`console` has no attribute `table` / `console` has no attribute `progress`), and recommends a rewrite. The example shows the per-line structure the library returns and the way the library refuses to use "hallucination" or "lying" as a verdict.

The library is honest about its scope: every verdict is named precisely because each name is a claim the user can check. The verdict names map to interpreter or registry facts, not to a model's second opinion. The library does not try to detect every kind of mistake an AI can make; it tries to detect the kinds of mistakes that have a verifiable answer (the package was never published; the attribute does not exist; the function does not accept that argument; the example contradicts the code).

The source names the actor (an engineer reviewing AI-written code), the pain (the AI wrote code that names things that do not exist, and the reviewer has no way to spot the fabrication without running the code or asking another model), and the missing thing (a tool that names the fabrication as a fact about the world, not a model's opinion). It does not name a specific project, a specific model, or a specific integration with a coding-agent runtime.

## Objective

Build a Python library that finds the things that do not exist in AI-written code — packages that were never published, methods that were never written, arguments no function accepts — and the code that contradicts its own stated examples, with every verdict named precisely and grounded in the Python interpreter or a package registry, never in a model's second opinion.

## Target Users

- Engineers reviewing AI-written code who need a tool that names the fabrication as a fact about the world, not a model's opinion.
- Coding-agent maintainers who want a post-write check the agent can call before the code is applied, with zero runtime dependencies and zero model calls.
- Open-source contributors who want a library they can drop into a CI step on a Python project without adding dependencies to the project's lockfile.
- Library maintainers who want a tool that catches the case where an AI's docstring example contradicts the function the docstring documents.
- Security teams reviewing an AI agent's output who need a verdict they can audit (line number, verdict class, identifier, claim) rather than a probability score from another model.

## MVP Scope

- A Python library `hedgemony` published to PyPI under SSPL-1.0 with zero runtime dependencies.
- A CLI entry point that takes a file path and emits a per-file report: total fabrications, fabrications per 100 lines, the line numbers, the verdict classes, the offending identifiers, and the recommendation (rewrite, verify, ignore).
- A package-existence check that verifies every `import` and `from ... import` against PyPI and the configured package indexes, with the verdict class `IMPORT` and the offending module name.
- An attribute-existence check that verifies every attribute access against the Python interpreter's introspection, with the verdict class `ATTR` and the offending identifier.
- A function-signature check that verifies every call against the called function's signature, with the verdict class `CALL` and the offending call.
- A docstring-example check that runs the docstring's code example and compares the output against the docstring's stated behaviour, with the verdict class `EXAMPLE` and the offending example.
- A "no model" guarantee at runtime. The library does not call any language model; every verdict comes from the Python interpreter or a package registry.
- A "no second opinion" honesty clause: the verdict names are claims the user can check, and the library refuses to use "hallucination" or "lying" as a verdict.
- A per-line report format the README demonstrates (`hedgemony dashboard.py` reports 2 fabrications in 21 lines = 9.5 per 100 lines, names the line numbers and verdict classes).
- A worked example in the README with the verdict-class table that maps each class to the interpreter/registry fact it claims.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Zero runtime dependencies. The library depends on the Python interpreter and a package registry, nothing else.
- Zero model calls. A finding is a fact about the world, not a second opinion from the same kind of system that produced the mistake.
- Verdict names are precise. The library does not use "hallucination" or "lying" as a verdict; each name is a claim the user can check.
- A package the registry says does not exist is a fabrication. A attribute the interpreter says does not exist is a fabrication. A function signature that does not accept the argument is a fabrication. A docstring example that contradicts the code is a fabrication.
- The library refuses to invent a verdict it cannot ground. A claim the user cannot check is not in the library's scope.
- The per-file report names the line numbers and the verdict classes. The reviewer can follow the report without re-running the library.
- The library is honest about its scope. The verdict-class table in the README maps each class to the interpreter/registry fact it claims; a finding outside the table is a bug.
