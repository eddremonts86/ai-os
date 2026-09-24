# SPEC.md — Attar – Compile React apps to native machine code

## Problem

Hi HN, my cofounder and I are building Attar. It compiles React and TypeScript into native desktop apps, with Blink for HTML and CSS.<p>I like building things with web tools. We wanted to take that experience all the way to a compiled desktop app: familiar components, familiar styles, native machine code.<p>Attar builds on Static Hermes and Chromium. React’s reconciler compiles alongside your application, and a native host connects its updates to Blink. JavaScript objects and garbage collection are handled by the compiled runtime.<p>Its been about eight weeks since we started. We already have stateful React interfaces, Tailwind CSS, and an example with 15 unchanged shadcn&#x2F;ui components compiling together. There’s a lot to explore here.<p>You can try the starter on macOS 15+ with Apple silicon and Xcode Command Line Tools:<p>brew install occam-tech&#x2F;attar&#x2F;attar<p>attar init my-app --template tsx<p>attar build my-app<p>We’re also working toward Attar Electron. In an early Etcher experiment for that project, app size went from 375.1 to 73.3 MiB, idle memory from 293.9 to 91.8 MB, and time to the first window from 1,081 to 469 ms on the same Mac. Those results give us plenty of motivation to keep going.<p>Today along with release on ProductHunt we’re sharing the standalone SDK. I’m around to talk about the compiler, how React runs as machine code, and how we connected it to Blink. Curious what you’d build with it.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49751702)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-18T08:47:08Z

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
