---
id: "3692"
slug: kosh-bash-shell-runtime-with-100x-faster-shellcheck-and
title: Kosh – Bash shell runtime with 100x faster Shellcheck and LSP built-in
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484178"
  captured: "2026-08-29"
category: show-hn
date: "2026-08-29"
tags: [Show HN, Product, Problem]
tech: [Rust (or C/Go), Bash parser (vdifonova or mvdan/sh), LSP server, Tree-sitter for embedded-shell]
---
# Kosh – Bash shell runtime with 100x faster Shellcheck and LSP built-in

## Tech Stack

- **Language:** the project ships as a single Rust binary (consistent with the author's `toiletbril` GitHub presence and the speed claim). If the MVP rewrite ends up in another language, the speed claim must still hold.
- **Bash parser:** reuse an existing parser rather than write one from scratch — `mvdan/sh` (Go, the canonical one) or a hand-rolled Rust grammar. Whichever is picked, the parser must produce a typed AST that supports incremental edits.
- **Diagnostics engine:** typed visitor over the AST, with a rule registry that mirrors shellcheck's SC-numbered checks at minimum (SC2086, SC2046, SC2155, SC2207, etc.).
- **LSP server:** standard LSP over stdio (JSON-RPC 2.0); supports `textDocument/didChange`, `publishDiagnostics`, `textDocument/hover`, `textDocument/completion`.
- **Cache:** per-file content-hash cache for "no-change re-runs"; a small sled / sqlite / flat-file store is enough.
- **Embedding mode:** Tree-sitter grammars for `yaml`, `json`, and `toml`; flag-gated.
- **Distribution:** `cargo install kosh` plus pre-built GitHub release tarballs for `x86_64-unknown-linux-gnu`, `aarch64-unknown-linux-gnu`, `x86_64-apple-darwin`, `aarch64-apple-darwin`.

## Architecture

Kosh is a single static binary that hosts two surfaces: the `kosh check` CLI and the `kosh lsp` LSP server. Both share the same front-end (lexer + parser + AST cache) and diagnostics engine. The CLI is a thin wrapper that walks a path argument, asks the cache for "is this file stale?", and emits diagnostics. The LSP server holds an in-memory document map keyed by URI, with content-hash invalidation.

```
                ┌─────────────────────────────┐
                │      kosh (Rust binary)     │
                └──────────────┬──────────────┘
                               │
   ┌───────────────────────────┼───────────────────────────┐
   │                           │                           │
   ▼                           ▼                           ▼
Lexer + parser          Diagnostics engine           Content-hash cache
(Bash grammar)          (SC-equivalent rule set)     (sled / sqlite)
   │                           │                           │
   ▼                           ▼                           ▼
AST (typed, incremental)   Diagnostic list         Cache hit/miss
                               │
            ┌──────────────────┴──────────────────┐
            ▼                                     ▼
       kosh check CLI                     kosh lsp (JSON-RPC)
       (terminal, JSON)                   (editor integration)
```

## Milestones

1. **M0 — Benchmark harness.** Lock down a reproducible benchmark corpus and a CI job that times `kosh` vs. shellcheck on it. End of week 1 — without this, the headline speed claim is unfalsifiable.
2. **M1 — Diagnostic parity pass.** Implement enough SC-equivalent rules to hit ≥ 90% of shellcheck's findings on the corpus; document the gap. End of week 4.
3. **M2 — `kosh check` CLI.** Stable flag set, JSON output, exit codes that play nicely with CI (`0` clean, `1` findings, `2` internal error). End of week 6.
4. **M3 — LSP server.** `textDocument/*` plumbing, Neovim + VS Code smoke tests, ≤ 50 ms warm-cache diagnostic round-trip. End of week 9.
5. **M4 — Embedding mode (feature-flagged).** Tree-sitter-driven extraction of Bash fragments from YAML / JSON / Compose / GitHub Actions; gated by `--features=embed`. End of week 12.
6. **M5 — Release polish.** README rewrite leading with the benchmark numbers, pre-built release tarballs, Neovim / VS Code install snippets. End of week 14.

## Risks

- **Performance claim credibility.** "100× faster" without a published harness reads as marketing; the README must link to the benchmark and the methodology. The risk is reputational, not technical.
- **Bash dialect coverage.** Bash has decades of edge cases (`[[ ... ]]`, arrays, process substitution, arithmetic context, here-strings). Each unhandled case is a diagnostic that silently misses the bug shellcheck would have caught.
- **Embedding-mode false positives.** Naively scanning every `run: bash -c '...'` in a YAML file will surface diagnostics on lines that aren't actually executed in the runtime context. Embedding mode must be conservative and opt-in.
- **Naming collision.** "Kosh" already exists as a Python package and a few other projects. Confirm trademark / GitHub-org availability before promoting widely.
- **Single-maintainer bus factor.** The author is solo. A maintainer handbook (release process, issue triage labels, "good first issue" curation) is cheap insurance against being the only responder to incoming issues.
