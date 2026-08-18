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

## Problem

A Convex employee publicly ran an experiment: they used agents to make Convex — "a realtime database and compute platform" — work in 100 different programming languages. The post names some of the languages explicitly: COBOL, Fortran, LOLCODE, and Verilog. The author is honest that "these are experiments rather than official SDKs, but the repository includes all of the implementations if you want to poke around." They also made a video of the process, linked at youtu.be/l61cLu8e2tg.

The post does not state a customer pain, a willingness-to-pay, a target user, or a planned official release. It does not claim the bindings are production-ready. The motivation the post gives is the author's own curiosity about "how far agents could push one deliberately ridiculous experiment."

## Objective

The post's stated objective: push the agent-driven SDK generation as far as it will go, then publish the repository and a video of the work. Anything beyond that — official SDKs, commercial releases, customer adoption — is not stated and is left as out of scope.

## Target Users

The post does not name target users. The repository is hosted openly, the post is on HN, and the video is on YouTube, so the audience implied by the post is the HN/Show HN crowd and anyone curious about agent-driven SDK generation. The plan does not invent a commercial user.

## MVP Scope

- A public repository containing 100 language bindings for Convex, including COBOL, Fortran, LOLCODE, and Verilog.
- An honest framing in the README/post that the bindings are experiments, not official SDKs.
- A public video walkthrough of the work at youtu.be/l61cLu8e2tg.

The post does not promise correctness, conformance, or production readiness. The plan does not invent a more aggressive MVP.

## Design Direction

See `DESIGN.md` for project tokens.

## Out of Scope

- Positioning the bindings against official Convex TypeScript/JavaScript/Python SDKs — the post does not make that comparison.
- Pricing, paid tiers, or commercial support — the post does not state any.
- A roadmap to make all 100 bindings production-grade — the post names none.

## Constraints

- Bindings are explicitly framed in the post as "experiments rather than official SDKs," which is the only status the post assigns.
- The 100-language count is a quantity claim; the post does not state uniform correctness or coverage across all of them.
- Convex's wire protocol is upstream-owned; the post does not state a regeneration cadence if the protocol evolves.
