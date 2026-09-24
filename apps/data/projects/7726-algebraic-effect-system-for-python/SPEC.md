# SPEC.md — Algebraic Effect System for Python

## Problem

Effecton is effect system for python allowing to write *very* typesafe apps like:<p>```py
def charge(order: Order) -&gt; E.Effect[Receipt, CardDeclined | CardExpired, PaymentGateway]: ...
```<p>So not only success value but also errors and requirements are typed. This makes not only people but also agents more productive. Effecton also comes with many building blocks like http client or file system (including in memory implementation for tests).

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49743169)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-17T16:30:30Z

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
