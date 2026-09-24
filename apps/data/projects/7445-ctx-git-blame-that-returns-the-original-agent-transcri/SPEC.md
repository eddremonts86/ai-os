# SPEC.md — ctx – Git blame that returns the original agent transcript

## Problem

I built ctx to give agents a way to do a fast local search over previous session transcripts.<p>But I wanted to also give them a way to immediately surface &quot;which agent wrote this exact line of code&quot;.<p>So you can start with a commit, a file, a line, or a PR, and then deterministically surface the exact tool call that wrote it, and the full agent transcript from that session.<p>It&#x27;s really useful when you want your agents to know why code was written the way it was. It&#x27;s kind of like a &quot;super comment&quot;.<p>A normal code comment does leave some information about why code is the way it is.<p>But if you have selective access to the full original transcript, you can see everything about the code&#x27;s provenance (like what tests were run, what was the reason it was there in the first place, etc)<p>This type of information would be way too verbose for a human to find useful. But agents can just ingest this stuff and make great use of it.<p>I like to instruct the agents to delegate this type of research work to cheaper high-throughput subagents like Luna for example.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49727859)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T14:46:13Z

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
