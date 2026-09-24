# SPEC.md — Compiling Matlab Code to Native Executables with RunMat

## Problem

I&#x27;m on the RunMat team. Prior releases of RunMat focused on accelerating large math w&#x2F; auto offload to GPUs via transpiling to WGPU shaders, and correct interpretation of the MATLAB language semantics (we&#x27;re 99%+ on grammar &#x2F; semantics now).<p>We left a placeholder for a Cranelift based JIT, and when we went back to fill it in, we though -- why not take it a bit further.<p>Since we were putting in the logic for branches of the CFG to be compiled to native code, we figured why not fundamentally build it such that you could run &quot;runmat compile simulation.m -o simulation&quot; and get a standalone binary target.<p>I.e. compile a MATLAB input project into to a standalone native binary target. We&#x27;ve detailed more in the blog.<p>There&#x27;s a bit of work we&#x27;re finishing still, but a build with the core native compile pieces is now out (we still have to propagate some metadata through the runtime library such that the compiler can effectively tree shake, and some portions of the system still need Cranelift translation logic, but the remaining work is relatively mechanical [and already in progress]).<p>The RunMat compiler and runtime are open source: <a href="https:&#x2F;&#x2F;github.com&#x2F;runmat-org&#x2F;runmat" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;runmat-org&#x2F;runmat</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49644323)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T14:28:50Z

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
