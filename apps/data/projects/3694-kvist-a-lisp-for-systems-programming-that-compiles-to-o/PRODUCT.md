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

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

A systems programmer writes Clojure-shaped code with the read-eval-print loop and source macros they already know, and the Kvist compiler lowers it to readable Odin that imports `core:os`, `core:crypto/sha2`, `vendor:raylib` and any other Odin package directly. Generated programs require no VM and no garbage collector; allocation, mutation, and cleanup stay explicit the way Odin programmers expect. Kvist and Odin source files can live in the same package and call each other without a wrapper layer.

## Target Users

| Stakeholder | Why they care |
|---|---|
| Systems programmer | Wants Lisp's interactive development without giving up native, statically typed, ownership-explicit execution; needs the Kvist REPL to persist definitions and values across submissions. |
| Clojure developer porting to native | Wants to keep Clojure-shaped code (`defn`, `defstruct`, threading macros, destructuring) when calling Odin packages instead of rewriting the same logic in Odin by hand. |
| Tooling author (HTML, VevDB, Datalog) | Wants an EDN-shaped `Data` type with structural matching and destructuring that lowers to efficient Odin instead of staying dynamic at runtime. |

## Jobs To Be Done

1. **Functional job** — Write Lisp-shaped systems code and have it produce a native binary that uses Odin packages without an intermediate VM.
2. **Emotional job** — Stop choosing between the interactive feel of a Lisp REPL and the static guarantees a systems program needs at run time.
3. **Social job** — Be able to say "this is Kvist" when shipping a library, instead of "this is a hand-written transpiler that happens to look like Lisp".

## Success Metrics

- **Adoption:** ≥ 100 GitHub stars and ≥ 20 distinct package repos importing `kvist-lang/kvist` within 90 days of v1 tag.
- **Interop coverage:** ≥ 80% of the `core:` Odin packages importable from a Kvist source file with documented signatures.
- **REPL feel:** Median time from `(defn f ...)` to evaluating `(f 11)` at the REPL ≤ 1 second on a typical laptop, so the loop still feels interactive.
- **Parity:** All examples in `examples/language/`, `examples/collections/`, `examples/interop/` build and run under `odin build` unchanged after Kvist lowering.

## Pricing & Monetization

Kvist is MIT-licensed, including the README's explicit clause that programs written in Kvist and Odin code generated from user-authored source are not required to use the MIT License. There is no commercial tier in v1, no paid support plan, no hosted REPL — the project monetises through adoption and downstream packages, not through per-seat licensing.

## Competitive Landscape

- **Clojure / Babashka** — Lisp-shaped source, JVM or scripted Clojure runtime; excellent REPL, but the runtime stays in the picture and there is no first-class ownership model.
- **Common Lisp (SBCL, CCL)** — Native compilation, GC included; mature ecosystem but the type story at the boundary with C/Rust is manual.
- **Janet** — Lispy, native, embeddable; dynamic typing, no source-to-static lowering.
- **Hand-written Odin** — what users do today when they want Odin's ownership story; loses the Lisp ergonomics that Kvist preserves.
- **Fennel → Lua** — similar source-to-target idea; Lua is the target, not Odin, and there is no static-typed execution model at the boundary.

## Risks & Open Questions

- [ ] Validate that the Kvist reader + macroexpander can express enough of Clojure's surface (transducers, spec, `core.async`) to feel like Clojure at the REPL, without forcing the lowering to invent a runtime.
- [ ] Confirm that Odin ABI compatibility is stable enough across Odin releases that Kvist's generated code keeps compiling when users bump the Odin toolchain.
- [ ] Decide whether the Emacs client stays the only editor story in v1, or whether an LSP server is in scope; the README ships an Emacs client but the editor-neutral JSONL protocol is a separate question.
- [ ] Settle the Windows story: the README documents core CLI on Windows but explicitly notes the full test suite and shell tooling are not covered there; the v1 acceptance criteria must be honest about that boundary.
