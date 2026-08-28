---
id: "3160"
slug: vyukov-mpsc-queue-in-c20-with-a-six-claim-formal-memory
title: Vyukov MPSC queue in C++20 with a six-claim formal memory-model proof
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49447000"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Product, Problem]
---
# Vyukov MPSC queue in C++20 with a six-claim formal memory-model proof

## Problem

The poster open-sourced mpsc-queue (github.com/nisgemML/mpsc-queue), a C++20 implementation of Dmitry Vyukov's bounded MPSC queue with a formal memory-model proof stated as six claims. The HN post body gives no further detail beyond the repo.

## Objective

Provide a Vyukov-style bounded MPSC queue in C++20 with a formal memory-model proof written as six explicit claims.

## Target Users

C++ systems programmers who want a bounded MPSC queue they can audit against an explicit memory-model argument.

## MVP Scope

Header-only C++20 bounded MPSC queue plus a write-up that lists the six memory-model claims and the reasoning for each.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

Formal claims are only as good as the model assumed; reviewers must agree on the model first.
