# SPEC.md — Sensez – helping coding agents catch their own code smells

## Problem

Hi HN — I’ve been frustrated by how many code smells coding agents produce - no matter how many instructions I put in the AGENTS.md, even the most capable models still reach for dict[str, Any], add multiple boolean flags to functions or hide logic in a heavy nested function that I can&#x27;t easily unit test. I&#x27;ve even implemented duplication checks as soft CI gates at two companies, but neither solved the problem. I narrowed it down to 3 compounding issues:<p>- agent context decays over a long session and skills or instructions become less reliable<p>- CI is way too late for such feedback and soft static analysis warnings are very easy to ignore<p>- none of the tools I found gave me exactly what I wanted at a speed that allows it to run on every agent turn.<p>And then I finally found the answer to a question that had been bugging me - why are coding agents so bad at detecting code smells? Because they don&#x27;t have a nose.<p>So I built them one - sensez is my attempt at fixing all 3. It&#x27;s an open-source static-analysis toolkit for Python and JS&#x2F;TS and its noze module looks for duplication, dead code, cycles and code smells. The idea is for the agent to run it while the context is still fresh, fix what it introduced, then continue. 
It runs locally and the scans are generally well below a second on the repos I&#x27;ve tested - between 160 and 270 ms.  Apart from using it daily for the past 2 months, I also ran an A&#x2F;B eval across ~90 tasks using deepseek-v4-flash. In the final diffs, control runs contained 129 new structural clones and 14 new code smells (as reported by sensez), compared with 0 new clones and 2 new code smells with sensez in the loop, at ~9% more token usage. The sensez runs still produced issues along the way — the feedback gave the agent a chance to detect and address them before finishing.<p>sensez does not replace linters or type-checkers like ruff, ESLint, ty, etc. - it is meant to run alongside them as a separate static signal available to the agent.<p>I have several improvements planned, including better incremental analysis for very large codebases, a VS Code extension and semantic duplication detection. 
I&#x27;d love feedback, bug reports and ideas, including things like:<p>* What problems do agents repeatedly introduce in your codebases, regardless of how you&#x27;ve tried to prevent them?<p>* What static signals would you actually trust enough to put directly into the agent loop?<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;popov95s&#x2F;sensez" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;popov95s&#x2F;sensez</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49536840)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-02T14:29:54Z

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
