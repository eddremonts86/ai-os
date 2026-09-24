# SPEC.md — DOOM in the kernel, or fibers in eBPF

## Problem

Some time ago my coworker who was working on first version of Perforator (<a href="https:&#x2F;&#x2F;github.com&#x2F;yandex&#x2F;perforator" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;yandex&#x2F;perforator</a>) kept talking about eBPF, so I got curious about its ISA and restrictions. That was around the time I read about DOOM on pregnancy test, so I thought: &quot;what if someone run DOOM inside of Linux kernel in eBPF? Surely, with some restrictions, this should still be possible?&quot;<p>I started to play around with it somewhere in 2024 - first stripping DOOM to bare minimum that is needed for showcase, simplifying code and trying to pass first restrictions that I encountered - function limit, recursion, memory access and checks. I tried to do this by hand, but it was, well, tedious labor. So I changed direction and instead started to do some of the things with LLVM-passes - rewriting memory access, simplifying and rewriting loops etc. But there were just so many corners. And given absence of time and all, I forgot about this project.<p>But couple months ago I thought: &quot;LLMs are quite good nowadays, so why not try again this time with more hands&quot;. I tried different approaches on how memory access could be &quot;virtualized&quot;, how loops can be made bounded, and in general - how to run unbounded logic on such a machine.<p>When I got DOOM running, I got carried away. Approach was so &quot;generic&quot;, so it would be a crime not to try to run more things. And now we have it - lua running on xdp hot path, llama2 working with softfloats, and even cpython, that did not fit initially into 1M verifier budget, is running there now thanks to freplace.<p>There is ton of work to do in order to make programs run faster, to make integration easier, but working examples are already there.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49630125)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-09T17:31:39Z

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
