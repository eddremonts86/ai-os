---
id: "3034"
slug: convex-clients-in-100-programming-languages
title: Convex clients in 100 programming languages
status: enriched
source:
  name: manual
  url: "https://news.ycombinator.com/item?id=49342107"
category: show-hn
date: "2026-08-18"
tags: [Show HN, Product, Problem]
---
# Convex clients in 100 programming languages

## Tech Stack

- **Convex realtime database and compute platform** — named explicitly in the post as the substrate.
- **Agent-driven code generation** — the post's own framing is "how far agents could push one deliberately ridiculous experiment," so agent-driven generation is the method.
- **GitHub repository** — the post says "the repository includes all of the implementations if you want to poke around."
- **YouTube video** at youtu.be/l61cLu8e2tg documenting the process.

The post does not name which agent, framework, or harness was used to drive the generation. The plan does not invent one.

## Architecture

The post does not describe an architecture for the 100 bindings. It does not say which language uses which runtime, whether bindings share a code-generation pipeline, or whether they conform to a single Convex protocol contract. The plan does not invent one.

## Milestones

The post does not list milestones. What it does state:

1. The author works at Convex and was curious about agent capability ceilings.
2. They directed agents to generate Convex bindings in 100 languages, including COBOL, Fortran, LOLCODE, and Verilog.
3. The repository was published with all 100 implementations.
4. A video walkthrough was published at youtu.be/l61cLu8e2tg.

Anything beyond publishing — official SDK promotion, production hardening, ongoing maintenance — is not in the post.

## Risks

- **"Experiments rather than official SDKs":** the post names this directly. The risk is readers treating the bindings as production-grade.
- **Uniform quality:** 100 languages is a count, not a quality claim. COBOL, LOLCODE, and Verilog are very different beasts, and the post does not claim parity across them.
- **Drift against upstream Convex:** if Convex's wire protocol changes, the bindings would need regeneration. The post does not state a maintenance plan.
- **No metrics, no WTP:** the post does not state a number to track, so the project's trajectory is purely qualitative.
