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

## Tech Stack

- **Python 3** as the runtime, matching the source's PyPI package `hedgemony` and the README's worked example (`hedgemony dashboard.py`).
- **The Python interpreter's introspection** as the source of truth for attribute existence, function signatures, and import resolution.
- **PyPI and the configured package indexes** as the source of truth for package existence.
- **Zero runtime dependencies** as a hard constraint, matching the source's badge ("runtime dependencies: 0").
- **SSPL-1.0** for the license, matching the source's LICENSE file.
- **PyPI** for distribution, matching the source's `pip install hedgemony` quick start.
- **GitHub Releases** for release notes, matching the source's release badge.
- A **CLI entry point** that takes a file path and emits the per-file report the README demonstrates (total fabrications, fabrications per 100 lines, line numbers, verdict classes, offending identifiers, recommendation).

## Architecture

The library has one entry point and four verification paths. The entry point reads a Python file and runs each verification path against it. The four paths share a common report shape (line number, verdict class, identifier, claim, recommendation) but each path grounds its verdict in a different interpreter/registry fact.

The package-existence path walks the file's imports (`import x`, `from x import y`) and verifies each one against PyPI and the configured package indexes. A package the indexes do not list is a fabrication; the verdict class is `IMPORT`, the offending identifier is the module name, the claim is "package does not exist on PyPI", and the recommendation is rewrite or install from a private index.

The attribute-existence path walks the file's attribute accesses (`obj.attr`) and verifies each one against the Python interpreter's introspection at runtime. An attribute the interpreter says does not exist is a fabrication; the verdict class is `ATTR`, the offending identifier is the attribute name, the claim is "object has no attribute", and the recommendation is rewrite.

The function-signature path walks the file's function calls (`f(arg)`) and verifies each one against the called function's signature at runtime. A call that does not match the signature is a fabrication; the verdict class is `CALL`, the offending identifier is the call, the claim is "function does not accept argument", and the recommendation is rewrite.

The docstring-example path walks the file's docstrings, extracts the code example, runs it, and compares the output against the docstring's stated behaviour. An example whose output contradicts the docstring is a fabrication; the verdict class is `EXAMPLE`, the offending identifier is the example, the claim is "docstring example contradicts code", and the recommendation is rewrite or update the docstring.

The library refuses to invent a verdict it cannot ground. A claim the user cannot check is not in the library's scope. The verdict-class table in the README maps each class to the interpreter/registry fact it claims; a finding outside the table is a bug.

The "no model" guarantee is structural: the library does not import any model SDK, does not make any network calls to a language model API, and does not call any language model. The verification paths are interpreter calls and HTTP calls to PyPI; both are facts about the world, not a model's second opinion.

## Milestones

1. **M1 — CLI entry point and per-file report** — the file argument, the per-file report shape (total fabrications, fabrications per 100 lines, line numbers, verdict classes, offending identifiers, recommendation).
2. **M2 — Package-existence path** — the import walker, the PyPI/index check, the `IMPORT` verdict class, the per-line report entry.
3. **M3 — Attribute-existence path** — the attribute-access walker, the interpreter introspection, the `ATTR` verdict class, the per-line report entry.
4. **M4 — Function-signature path** — the function-call walker, the signature match, the `CALL` verdict class, the per-line report entry.
5. **M5 — Docstring-example path** — the docstring walker, the example extraction, the example run, the contradiction check, the `EXAMPLE` verdict class, the per-line report entry.
6. **M6 — Verdict-class table and the no-second-opinion honesty clause** — the table the README demonstrates, the refusal to use "hallucination" or "lying" as a verdict, the per-class claim map.
7. **M7 — Zero-runtime-dependency guarantee** — the install path (`pip install hedgemony`), the dependency declaration, the no-model-SDK enforcement.
8. **M8 — SSPL-1.0 distribution** — the LICENSE file, the PyPI metadata, the GitHub release.

## Risks

- **Verdict-class table too narrow** — an AI fabricates a kind of mistake the library does not cover, and the reviewer is back to guessing. Mitigation: the verdict-class table is the source's honesty clause; new classes are added when the user can check the claim, not when the AI invents a new failure mode.
- **PyPI rate limit** — the package-existence path calls PyPI for every import, and PyPI rate-limits the library. Mitigation: cache the PyPI responses per run; allow the user to configure the package index; document the rate-limit policy.
- **Interpreter version mismatch** — the attribute-existence path uses the system's Python interpreter, and the project's Python version differs. Mitigation: allow the user to pin the interpreter via the project's virtualenv; document the version mismatch as a finding the reviewer can ignore.
- **Docstring-example flake** — the example path runs the example, and the example fails for an environmental reason (no network, missing fixture). Mitigation: the path names the failure mode in the per-line report; a fabrication is a contradiction with the code, not a runtime failure.
- **False positive on a private package** — the package the library says does not exist is on a private index the library is not configured to read. Mitigation: the per-line report names the index the library checked; the user can configure the index.
- **False positive on a runtime-installed attribute** — the attribute the library says does not exist is added by a runtime patch the library cannot see. Mitigation: the per-line report names the interpreter version; the user can ignore a finding the runtime patch resolves.
- **SSPL-1.0 scope creep** — the copyleft license requires the source of any service that offers the library to be published, which is a stronger boundary than the user expected. Mitigation: the LICENSE is explicit; the README documents the scope; the user can vendor the library under a different license with the maintainer's permission.
