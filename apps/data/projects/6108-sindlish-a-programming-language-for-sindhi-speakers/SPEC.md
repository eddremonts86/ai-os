# SPEC.md — Sindlish, a programming language for Sindhi speakers

## Problem

Hi, I’m Amanat, a student from Pakistan, and I’ve been working on a programming language called Sindlish.<p>The idea started from wondering what programming would feel like if the language used the vocabulary of the language you actually speak. Sindlish is designed for Sindhi-speaking communities and currently uses Romanized Sindhi syntax.<p>A small example:<p>```text
kaam jor(a, b) -&gt; adad {
    wapas a + b
}<p>adad jawab = jor(3, 4) * 2
likh(&quot;jawab =&quot;, jawab)
```<p>It currently has its own lexer, parser, resolver, bytecode compiler, stack-based VM, type system, error handling, collections, closures, CLI&#x2F;REPL and VS Code support.<p>It’s still a work in progress, and I’d really like feedback on the language design and the implementation.<p>Website: <a href="https:&#x2F;&#x2F;sindlish.vercel.app&#x2F;" rel="nofollow">https:&#x2F;&#x2F;sindlish.vercel.app&#x2F;</a><p>The website may be a little slow right now since most of my time is going into the language itself rather than the website.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49639784)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T07:33:44Z

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
