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

## Phase 0: Scaffold

- [x] Capture problem from HN + write SPEC.md skeleton
- [ ] Pick the parser strategy: hand-rolled Rust grammar vs. `mvdan/sh` (Go) consumed via FFI; document the choice
- [ ] Set up a reproducible benchmark corpus (a known shellcheck-validated bash repo) and a CI job comparing `kosh` vs. shellcheck wall-clock + RSS
- [ ] Define the SC-rule parity scope: minimum 25 named rules covering the most-cited shellcheck diagnostics
- [ ] Choose the cache backend (sled vs. sqlite vs. flat file) and the content-hash key (BLAKE3 over file content)
- [ ] Pre-flight: check GitHub org availability, existing "kosh" projects, and any trademark concerns

## Phase 1: Core

- [ ] `kosh check FILE...` — parse, walk rule registry, emit diagnostics to stdout (text + `--format=json`)
- [ ] Stable exit codes: 0 clean, 1 findings, 2 internal error
- [ ] Content-hash cache so unchanged files re-run in < 5 ms
- [ ] `kosh lsp` — JSON-RPC over stdio, `textDocument/didOpen` / `didChange` / `didSave` / `didClose`
- [ ] `publishDiagnostics` with severity, code, message, source `kosh`, range
- [ ] `textDocument/hover` for rule IDs (e.g. hover over SC-equivalent warning shows the rule description)
- [ ] `textDocument/completion` for common Bash keywords and project symbols
- [ ] `--severity=info|warning|error` filter for both CLI and LSP
- [ ] Neovim smoke-test config (nvim-lspconfig) and a VS Code extension stub that launches the binary
- [ ] Embedding-mode skeleton: Tree-sitter YAML/JSON, feature-flagged, behind `--features=embed`
- [ ] Benchmark job in CI: fail the build if `kosh` regresses below 30× shellcheck speed on the corpus

## Phase 2: Deploy

- [ ] Pre-built release tarballs for linux/amd64, linux/arm64, darwin/amd64, darwin/arm64 on GitHub Releases
- [ ] README rewrite leading with the benchmark numbers and a one-liner install
- [ ] "Known gaps vs. shellcheck" page so users know exactly which SC rules are not yet covered
- [ ] Issue-triage labels and a CONTRIBUTING.md to absorb the incoming bug reports the author is soliciting
