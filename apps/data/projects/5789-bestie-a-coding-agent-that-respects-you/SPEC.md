# SPEC.md — Bestie, a coding agent that respects you

## Problem

hi friends! this year, i&#x27;ve been working on a general purpose, native terminal coding agent harness. i remember being absolutely struck the first time i ever used claude code and it could just <i>do</i> things. i&#x27;m also a big fan of crush and pi.<p>it&#x27;s pretty early on. i still have yet to build all the higher-level behaviors that make something go from a harness to a proper agent. it turns out, making a coding agent is incredibly hard because you have to strap a development environment to an llm. in my hubris, i had thought &quot;oh—it&#x27;s just a terminal app that calls some api&#x27;s!&quot;<p>i&#x27;m trying to provide all the things that i think an agent should have out of the box: subagents, sandboxing, compaction, cross-platform support, a beautiful interface, etc. i would be absolutely delighted if you&#x27;d give it a go (as far as safety goes, the sandbox tends to be too restrictive rather than too lenient—i&#x27;m trying to figure it out as i go).<p>i made bestie because i don&#x27;t like it when agents do things and don&#x27;t tell you what they&#x27;re doing. or when the harness itself won&#x27;t provide visibility into things. so bestie is architected around being able to inspect anything that happens in an inspector pane that shows you the inputs&#x2F;outputs of every tool call, background job update, and shell process.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49612123)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-08T15:52:13Z

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
