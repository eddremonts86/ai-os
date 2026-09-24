# SPEC.md — Back Me Up – Find papers that back your argument

## Problem

Back Me Up is a tiny science-ish machine that finds published papers that back your argument. It stemmed from a conversation with a friend around life sciences, where we kind of landed at &quot;surely there’s a paper confirming most arguments&quot;, i.e. coffee is bad, coffee is great, etc.<p>You enter a claim, e.g. &quot;drinking wine is good for the heart&quot; -&gt; the system does a semantic search across a corpus (PMC, bioRxiv, medRxiv and arXiv) -&gt; pulls in relevant quotes if they fit your claim, and gives you a verdict.<p>Frontend was done with a combination of Sol + Opus, I spent a bit of time exploring different designs and landed on this slightly ridiculous printer that spits out your evidence.<p>Some notes: 
- I have no accuracy evals, this was a throwaway thing I built, so no clue on reliability. It does pass the vibe test, so give it a whirl!
- Initially built a RAG for a tiny set of PMC, but scaling that up seemed like a lot of work for an evening project. Luckily found an API that does the semantic search across the different sources.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49709678)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-15T08:57:08Z

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
