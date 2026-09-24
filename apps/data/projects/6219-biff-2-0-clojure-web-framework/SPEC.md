# SPEC.md — Biff 2.0 (Clojure web framework)

## Problem

Biff is a web framework that I originally released 6 years ago.[1] I&#x27;ve just finished more-or-less rewriting it from scratch. The main changes:<p>- SQLite is now the default database.<p>- Datastar is used for server-side rendering.<p>- Introduces biff.graph[2] and biff.fx, two libraries that both help structure your application logic.<p>- Biff is now &quot;just&quot; a collection of independent libraries rather than a single monolithic framework, which makes it much easier to swap out the various parts. e.g. using a non-default database is much less work now.<p>I&#x27;d been experimenting with a good chunk of this work (the database change and the biff.graph &#x2F; biff.fx stuff) starting 2 years ago. The Datastar and independent libraries stuff goes back 6 months or so. Datastar&#x27;s been on my radar for a while and has been picking up steam in the Clojure community, for good reason IMO. The independent library stuff was instigated by me trying out LLM-driven coding for the first time earlier this year: I wanted to try making a Clojure web app without using Biff to see if web frameworks still seemed helpful (my conclusion: absolutely) and how I might do things from first principles were I to start over. So I did that and then started packaging up&#x2F;rewriting various Biff code as smaller individual libraries as I went.<p>Note that I consider Biff to be mostly &quot;hand-coded&quot;; I start with LLM-written drafts of code but often by the time I&#x27;m done editing it&#x27;s been completely reworked. The initial drafts of docs are all hand-written. I&#x27;m interested to try using it for vibe-coding apps though. e.g. how much of the code that requires good judgment can I pull into the framework so that the apps are then easier for LLMs to not screw up.<p>[1] <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=23921220">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=23921220</a><p>[2] <a href="https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48820361">https:&#x2F;&#x2F;news.ycombinator.com&#x2F;item?id=48820361</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49647635)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T17:45:51Z

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
