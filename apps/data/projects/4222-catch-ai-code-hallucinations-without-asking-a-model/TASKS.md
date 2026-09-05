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

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/4222-catch-ai-code-hallucinations-without-asking-a-model/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Build the CLI entry point that takes a file path and emits the per-file report the README demonstrates (total fabrications, fabrications per 100 lines, line numbers, verdict classes, offending identifiers, recommendation).
- [ ] Implement the package-existence path: walk the file's `import` and `from ... import` statements, verify each against PyPI and the configured package indexes, emit `IMPORT` verdict entries for packages the indexes do not list, cache PyPI responses per run.
- [ ] Implement the attribute-existence path: walk the file's attribute accesses, verify each against the Python interpreter's introspection at runtime, emit `ATTR` verdict entries for attributes the interpreter says do not exist, document the interpreter version in the per-line report.
- [ ] Implement the function-signature path: walk the file's function calls, verify each against the called function's signature, emit `CALL` verdict entries for calls that do not match the signature, document the signature source in the per-line report.
- [ ] Implement the docstring-example path: walk the file's docstrings, extract the code example, run the example, compare the output against the docstring's stated behaviour, emit `EXAMPLE` verdict entries for examples whose output contradicts the docstring.
- [ ] Build the verdict-class table that maps each class to the interpreter/registry fact it claims, and write the no-second-opinion honesty clause the README demonstrates (the library refuses to use "hallucination" or "lying" as a verdict).
- [ ] Enforce the zero-runtime-dependency guarantee: declare the install path as `pip install hedgemony`, refuse to import any model SDK, refuse to make any network call to a language model API.
- [ ] Write the worked example in the README (`hedgemony dashboard.py` reports 2 fabrications in 21 lines = 9.5 per 100 lines, with line numbers, verdict classes, offending identifiers, and a rewrite recommendation).
- [ ] Run an end-to-end test on a representative AI-written file: the package-existence path catches an import from a non-existent package, the attribute-existence path catches an attribute that does not exist on a real object, the function-signature path catches a call that does not match the signature, the docstring-example path catches a docstring example whose output contradicts the code, and the per-file report emits the line numbers, verdict classes, and recommendations.

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Publish `hedgemony` to PyPI under SSPL-1.0 with the README that demonstrates the worked example and the verdict-class table
- [ ] Document the SSPL-1.0 scope in the LICENSE and the README so users understand the network-service copyleft boundary
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-31_
