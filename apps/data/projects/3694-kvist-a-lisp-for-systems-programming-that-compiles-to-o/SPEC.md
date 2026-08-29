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

## Problem

The poster's "Show HN" link is https://github.com/kvist-lang/kvist, a language repository that describes itself as "A native, statically typed Lisp with a REPL that compiles to Odin." The README frames the gap Kvist fills as the absence of a Lisp that keeps Clojure-style interactive development (REPL, source macros, immutable data, EDN-shaped values) without giving up the concrete, statically typed execution model a systems program needs — allocation, mutation, ownership and cleanup stay explicit, generated programs run without a VM and without a garbage collector. Existing Lisps on the systems side (Common Lisp, Scheme with Racket's worst-case-pause story) either carry a runtime that systems code does not want, or they go fully dynamic and lose the type guarantees Odin gives for free. Kvist's answer is to keep the Lisp surface at the source level and lower it to Odin, so the programmer writes Kvist and the compiler emits Odin that imports Odin core and vendor packages directly, with Kvist and Odin source files allowed to live side-by-side in the same package.

## Objective

Ship the Kvist compiler and CLI so a systems programmer can write `(defn square [x: int] -> int (* x x))`, run `kvist run hello.kvist`, get a native binary that compiles and executes as expected, and drop into `kvist repl hello.kvist` to evaluate forms interactively against the same native session — without ever writing Odin unless they want to import a package that has no Kvist binding yet.

## Target Users

- Primary: systems programmers who like the Lisp read-eval-print loop but have been forced to choose between dynamic-typed Lisp ergonomics and static-typed native execution, and want Kvist's source macros + REPL without giving up Odin's ownership model.
- Secondary: Clojure developers porting code that needs to touch the metal (game engines, raylib bindings, custom allocators, OS-level work) and would rather call into `vendor:raylib` from Lisp-shaped code than rewrite in Odin by hand.
- Tertiary: tool authors building on the Kvist `Data` model — the repo explicitly names HTML rendering, VevDB transactions, Datalog queries, and Hiccup as consumers of the same EDN-shaped value model.

## MVP Scope

- Kvist CLI binary built from `src/cli/kvist` via `odin build`.
- Three commands in v1: `kvist run FILENAME`, `kvist check FILENAME`, `kvist repl FILENAME`.
- The native REPL session persists definitions, supported typed values, and recent results across submissions; compatible redefinitions update later calls without replaying earlier forms.
- Direct Odin interop: `(import os "core:os")`, `(import sha2 "core:crypto/sha2")`, `(import raylib "vendor:raylib")` work without a wrapper layer.
- Data model: `Data` type with EDN-shaped immutable maps, vectors, sets, lists, keywords, symbols, and tagged values; structural matching and destructuring supported.
- One official HTML package (kvist-lang/html) and one official VevDB package (vevdb/vev) already shipped by the project; the MVP needs to coexist with both, not re-implement them.
- macOS and Linux as first-class platforms; Windows support is partial (core CLI only, no shell tooling).

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Target output is Odin only — Kvist does not lower to C, C++, Rust, or LLVM IR directly in v1; that would mean re-implementing Odin's package ecosystem.
- The Kvist compiler itself must build with a supported Odin toolchain; the project does not vendor Odin.
- Tests and shell tooling require a POSIX-compatible shell; Windows is documented as not yet covered by the complete test suite.
- Programs written in Kvist and generated Odin code from user-authored source are not required to use MIT, but Kvist packages and runtime support stay MIT; the license boundary is documented and load-bearing for downstream redistribution.
- No garbage collector in generated binaries: allocation, mutation and cleanup must remain explicit at the Odin level, and the Kvist compiler must not silently insert a GC to make a Lisp program type-check.
