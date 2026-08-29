---
id: "3694"
slug: kvist-a-lisp-for-systems-programming-that-compiles-to-o
title: Kvist – a Lisp for systems programming that compiles to Odin
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49484112"
  captured: "2026-08-28"
category: show-hn
date: "2026-08-28"
tags: [Show HN, Product, Problem]
tech: [Odin (host compiler), Kvist source-to-source transpiler, Clojure-inspired reader, Native REPL, Emacs client, POSIX shell tooling]
---
# Kvist – a Lisp for systems programming that compiles to Odin

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3694-kvist-a-lisp-for-systems-programming-that-compiles-to-o/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Install supported Odin toolchain on macOS and Linux dev machines
- [ ] `odin build src/cli/kvist` produces a working `kvist` binary
- [ ] `kvist run hello.kvist` compiles and executes a `defn main` example, printing the expected output
- [ ] `kvist check examples/language/hello.kvist` exits 0 with no diagnostics
- [ ] `kvist repl hello.kvist` opens a native session; `(defn square [x: int] -> int (* x x))` followed by `(square 11)` returns 121
- [ ] REPL persists `square` and `(square 11)` result across submissions, compatible redefinition updates later calls without replaying earlier forms
- [ ] `Data` type with EDN values: maps, vectors, sets, lists, keywords, symbols, tagged values; structural matching and destructuring compile and run
- [ ] Direct Odin import: `(import os "core:os")` callable from Kvist; `os.exists` returns the expected bool
- [ ] Source macro example compiles: macro-expanded form visible via `kvist expand`, runtime object model not introduced
- [ ] `./scripts/smoke.sh` passes on macOS and Linux; Windows acceptance stays at "core CLI only"

## Phase 2: Deploy

- [ ] Tag v1.0.0 on `kvist-lang/kvist`
- [ ] Publish `kvist-lang/html` and `vevdb/vev` install instructions in the main README
- [ ] Document the Odin toolchain compatibility matrix (which Odin release Kvist is built against)
- [ ] Set up CI: `./scripts/smoke.sh` on macOS + Linux runners, core CLI smoke on Windows
- [ ] Post-mortem after week 12 with maintainer + early adopters
