# SPEC.md — Myjs An accidental pure-Python JavaScript interpreter

## Problem

Hi HN! byteface here. myjs was a recent accident I&#x27;d like to share.<p>Several years ago I began writing DOM API&#x27;s in Python as a curiosity: <a href="https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic&#x2F;</a><p>Every now and then I do another pass rolling in more features from the MDN pages. I have lots of unit tests but found that porting real code and libraries was a useful test of the DOM compatibility. But I didn&#x27;t want to pollute the core any further as had already ported d3 and jquery.<p>So I created a new repo called domonic-libs: <a href="https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic-libs&#x2F;" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;byteface&#x2F;domonic-libs&#x2F;</a><p>Anyways a couple of days ago while porting some js libraries faithfully to run against dom.py and javascript.py I came across Acorn (a Javascript parser) and coverted it into pure python.<p>Once Acorn.py was producing an AST, I mapped that against domonic&#x27;s Javascript and DOM nodes and to my surprise... actual JS code started executing inside the Python process!<p>Give it a try:<p>pipx install myjs<p>Would love to hear your thoughts, edge cases to test, or feedback!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49579498)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-05T18:51:56Z

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
