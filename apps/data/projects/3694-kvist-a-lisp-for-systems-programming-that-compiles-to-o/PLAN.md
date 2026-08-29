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

## Tech Stack

- **Host compiler:** Odin (any toolchain supported on the host platform — macOS, Linux, full Windows CLI).
- **Kvist compiler:** Odin-built binary at `src/cli/kvist`; Kvist source-to-source lowers to readable Odin that is fed back into `odin build`.
- **Reader / macros:** Clojure-inspired S-expression reader with source-level macroexpansion at compile time; no runtime macro layer added.
- **Native REPL:** terminal client plus an editor-neutral JSONL protocol; both talk to the same native session that holds definitions, supported typed values, and recent results.
- **Editor:** GNU Emacs client (per the README's `emacs/README.md`) with source-buffer evaluation, completion, documentation, retained value inspection, source-level stepping, execution traces, conditions and restarts, and attach-to-running-process.
- **Shipped packages:** native collections, EDN, regular expressions, parallel helpers, testing, bit operations, strings, immutable `Data`; HTML rendering and VevDB live in sibling repos.
- **Tests:** `./scripts/smoke.sh` and the per-example `./kvist test` invocations the README documents.

## Architecture

```
        ┌───────────────────────────────────────────────┐
        │                   User                        │
        │  (terminal)            (Emacs)                │
        └──────────┬────────────────────┬───────────────┘
                   │                    │
                   ▼                    ▼
        ┌────────────────┐    ┌─────────────────────┐
        │ kvist repl CLI │◀──▶│ Emacs client (slime │
        │ (JSONL proto)  │    │ -style over JSONL)  │
        └────────┬───────┘    └─────────┬───────────┘
                 │                      │
                 ▼                      ▼
        ┌─────────────────────────────────────────────┐
        │  Native session                             │
        │  - definitions, typed values, recent results│
        │  - read → macroexpand → type-check →        │
        │    ownership-check → lower to Odin →        │
        │    odin build → load → execute              │
        └─────────────────────────┬───────────────────┘
                                  │
                                  ▼
        ┌─────────────────────────────────────────────┐
        │  Odin toolchain + core:/vendor: packages    │
        └─────────────────────────────────────────────┘
```

The same native session backs the terminal REPL and the Emacs client, so a definition entered at the terminal is visible to the Emacs client and vice versa. The compile pipeline is intentionally one direction: Kvist source goes through the lowerer to Odin, then `odin build` produces a native binary; Kvist never ships its own linker or optimiser.

## Milestones

1. **M0 — Spec freeze.** SPEC.md + DESIGN.md + Kvist→Odin lowering rules approved. End of week 1.
2. **M1 — Compile + run.** `odin build src/cli/kvist`, `kvist run hello.kvist` produces a working `hello` binary on macOS and Linux. End of week 3.
3. **M2 — Native REPL.** `kvist repl hello.kvist` persists definitions across submissions, with type-check + ownership-check + Odin lower + load on every form. End of week 5.
4. **M3 — Data + macros.** `Data` type with EDN values, structural matching, destructuring, typed validation; source-macro examples run. End of week 7.
5. **M4 — Interop + packages.** Direct Odin imports (`core:os`, `core:crypto/sha2`, `vendor:raylib`) callable from Kvist; HTML and VevDB packages install side-by-side. End of week 9.
6. **M5 — Editor + smoke.** Emacs client attached to the JSONL REPL; `./scripts/smoke.sh` green on macOS + Linux. End of week 12.

## Risks

- **Odin toolchain coupling.** Kvist's correctness depends on Odin's package layout and ABI staying stable enough that generated code keeps compiling when users bump Odin. A breaking Odin release is an external risk that can invalidate Kvist's lowerings overnight.
- **Macro model leaking into runtime.** The temptation to add a runtime macro layer to "make Clojure easier" is high, but the README is explicit that Kvist stays free of a runtime object model. Scope creep here silently reintroduces a VM.
- **Ownership model surprises.** A Clojure developer expects `conj` to allocate freely; Kvist's ownership checker will reject patterns that the same Clojure program would express without thinking. The error messages need to be specific enough that a Lisp programmer can debug them without learning Odin first.
- **Platform coverage honesty.** Windows is partial in the README; pretending otherwise to ship a "cross-platform" claim would be a worse defect than documenting the boundary. The smoke script is POSIX-only, and that has to stay explicit.
