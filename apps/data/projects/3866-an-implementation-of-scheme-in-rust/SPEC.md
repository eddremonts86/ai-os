---
id: "3866"
slug: an-implementation-of-scheme-in-rust
title: An Implementation of Scheme in Rust
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49500050"
category: show-hn
date: "2026-08-30"
tags: [Show HN, Product, Problem]
tech: [Rust, Scheme runtime, S-expression reader, Evaluator with closures, REPL, Embedding library crate]
---
# An Implementation of Scheme in Rust

## Problem

This Show HN capture is a bare link to github.com/vinay/rscheme; the product claim is the title: "An Implementation of Scheme in Rust". The project is a Scheme language implementation built in Rust — the classic route of learning a host language through a language-implementation project, and a potential foundation for embedding Scheme scripting into Rust applications. The capture states nothing about feature coverage, standards compliance, performance or the author's goals, so all of that remains open.

## Objective

Build a working Scheme implementation in Rust: a reader, an evaluator and a REPL covering a practical core of the language, clean enough to serve both as a learning artifact and as an embeddable scripting foundation.

## Target Users

- Language implementers and students studying interpreters.
- Rust developers evaluating Scheme as an embeddable scripting option.
- Scheme users curious about implementations outside the C lineage.

## MVP Scope

- Reader and parser for Scheme s-expressions.
- Evaluator for a core subset: quoting, lambdas, closures, conditionals.
- REPL for interactive use.
- Public repo with examples and tests.

## Constraints

- The capture is a bare repo link; scope, compliance level and maturity are unstated.
- Rust as the implementation language is fixed by the title.
- No claim of R7RS or other standards completeness may be made without verification.

## Design Direction

See `DESIGN.md` for this project's design tokens.
