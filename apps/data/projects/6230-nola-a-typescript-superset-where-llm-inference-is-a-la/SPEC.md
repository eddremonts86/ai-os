# SPEC.md — Nola – a TypeScript superset where LLM inference is a language feature

## Problem

Hi HN, in a world where 100% of code is written by AI (phew, sometimes even 200%), there might still be a small percentage of us who want to write code in a more efficient way, especially when it comes to LLM interaction. 
I honestly tired converting my existing TS types into JsonSchemas or wrapping a function into tool object with all this bells and whistles around arguments.<p>And I started experimenting with an idea - how can make LLM integration feels native? How can an LLM become part of the language &#x2F; compiler, instead of being just one more external API that we have to integrate through yet another SDK?<p>And I took the async &#x2F; await &#x2F; Promise idea as a starting point, ok so:
&#x27;async&#x27; - defines an asynchronous boundary,
&#x27;Promise&#x27; - represents an asynchronous intention,
&#x27;await&#x27; - resolves it.<p>So I started thinking, what if we could do something similar for LLMs?
That led me to create Nola, a TypeScript superset built around three concepts:<p>&#x27;infer&#x27; - like `async`, defines the LLM inference context,<p>&#x27;Intent&#x27; - encapsulates the data and instructions that will be sent to the LLM,<p>&#x27;ask&#x27; - like `await`, resolves the `Intent` into a typed result<p>Right now, Intent represents two operations: extract the data and call the function (yes native TS function), but more to come soon.<p>Docs at: <a href="https:&#x2F;&#x2F;nola.sh&#x2F;docs" rel="nofollow">https:&#x2F;&#x2F;nola.sh&#x2F;docs</a><p>Thanks for your honest feedback

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49646501)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T16:33:27Z

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
