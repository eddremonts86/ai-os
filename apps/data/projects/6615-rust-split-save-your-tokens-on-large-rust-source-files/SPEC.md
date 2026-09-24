# SPEC.md — Rust-split – save your tokens on large Rust source files

## Problem

A common failure mode for AI SW development is that agents tend to build large &quot;God&quot; files.<p>This is bad on your token burn. A) because the larger your source file the more churn the LLM takes to find and emit edits, which are more likely to fail, and B) the real kicker - the agent&#x27;s process is to move one item at a time, which is an O(n^2) algorithm, but especially bad because it inevitably breaks and the code mushes up and sadness ensues (burning time and tokens).<p>So, I have had lots of success with rust-split and a few skill notes. rust-split uses the AST (syn) to find the correct boundaries. Two passes: explode cuts the file into top-level items with their comments and #[attrs] attached - lossless, cat the chunks together and you get the original back byte for byte, so you can check it before trusting it - then split writes the module layout under a LOC ceiling. What&#x27;s left for the LLM is basically fixing imports, which doesn&#x27;t burn anywhere near as many tokens. It&#x27;s not perfect with the transition but fixing small import issues LLMs can do efficiently.<p>rust-split is released as a GitHub attested release or a crates.io install:<p><a href="https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split</a><p><pre><code>    cargo install rust-split
</code></pre>
Be sure to add the skill file (<a href="https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split&#x2F;blob&#x2F;main&#x2F;skills&#x2F;rust-split&#x2F;SKILL.md" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;owebeeone&#x2F;rust-split&#x2F;blob&#x2F;main&#x2F;skills&#x2F;rus...</a>) and set your project&#x27;s line thresholds. I chose a soft limit of 1000 LOC to trigger the decision to split (I&#x27;ve found that at 2000 LOC agents lose it, so give yourself a safety margin) and the target max size of a split file to be 500 LOC, but preferably more smaller files than 2x500 LOC files.<p>Enjoy

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49671509)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-12T12:10:15Z

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
