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

## Problem

Shell scripts are notoriously hard to debug, and the existing toolchain is slow on real-world codebases: Shellcheck on a large `.bashrc` / monorepo of shell scripts pegs CPU and memory, and the popular Bash Language Server / `bash-language-server` is perceived as sluggish when editors re-run it across many files. The author of `toiletbril/kosh` reports the project started from "frustration with how difficult shell errors can be to debug, and how slow some tools are." They claim ~100× speed-ups over shellcheck-style analysis and ship an LSP that already works on `.sh` files, with plans to extend to every config/YAML/etc file that may have Bash embedded (GitHub workflows is the stated first example).

## Objective

Ship a Bash-compatible runtime and editor toolchain (analyzer + LSP) that gives shell authors "very detailed diagnostics" with deterministic, sub-second feedback even on large codebases — fast enough that editor integrations feel live and CI checks cost effectively nothing. The MVP is "run kosh on a large bash repo, get the same (or stricter) findings shellcheck would have given, in a fraction of the wall-clock and memory."

## Target Users

- **Primary:** working shell scripters — sysadmins, SREs, DevOps, build / release engineers — who edit `.sh` and `.bashrc`-style files daily and want editor-quality feedback without the latency of stock shellcheck or bash-language-server.
- **Secondary:** DevX / platform engineers who run shell lint in CI on monorepos and want it to finish in seconds, not minutes; maintainers of GitHub Actions / YAML workflows that contain embedded `run: bash -c '...'` blocks.
- **Tertiary:** distro packagers and Linux distribution maintainers auditing shell scripts at scale.

## MVP Scope

- `kosh check FILE...` CLI — drop-in replacement-style static analysis for Bash scripts, with diagnostics at least as informative as shellcheck.
- `kosh` Language Server — speaks LSP over stdio, integrates with Neovim, VS Code, Helix, etc.
- Cached incremental analysis so re-linting an unchanged file is essentially free (the "100× faster" claim is most credible here).
- A small embedding-aware mode that flags Bash fragments inside common hosts — `run:` blocks in GitHub Actions YAML, `command:` in Docker Compose, `script:` in JSON — gated behind a feature flag.
- Distribution as a single static binary via `cargo install` or pre-built GitHub release tarballs for Linux + macOS.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Author explicitly says the project "is feature-complete and the core is usable enough to experiment with" but requests reports of bash incompatibilities, broken diagnostics, and cases where existing tools solve the problem better — i.e. correctness vs. stock Bash is a hard MVP constraint.
- Must remain BSD / MIT compatible OSS — the post is a community Show HN, not a paid product launch.
- Embedding-mode support (YAML, JSON, etc.) is explicitly flagged as "planning to expand"; the MVP should not over-promise it.
- Performance claims ("100× faster") must hold on a reproducible workload (e.g. a known shellcheck benchmark corpus) or the project loses credibility immediately on its main promise.
