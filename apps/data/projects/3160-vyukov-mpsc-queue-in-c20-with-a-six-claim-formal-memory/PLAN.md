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

## Tech Stack

Header-only C++20 library.
Markdown write-up of the six-claim proof, with one benchmark in the repo.
CMake or Meson for the benchmark build; CI on GCC and Clang.

## Architecture

Single-process deliverable: Header-only C++20 bounded MPSC queue plus a write-up that lists the six memory-model claims and the reasoning for each.

## Milestones

MVP: header-only queue, six-claim write-up, one benchmark.

## Risks

Formal claims are only as good as the model assumed; reviewers must agree on the model first.
