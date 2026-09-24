# SPEC.md — Replay – Audit silent prompt cache misses in AI agent transcripts

## Problem

I built Replay because AI agent bills spike without a single warning or error in your logs when a prompt cache breaks. Whether your team runs Claude Code, Cursor, or Aider, the provider just silently re-bills your entire conversation history at cold-write prices instead of cached read prices.<p>Replay is a zero-telemetry, zero-dependency local Go CLI that forensically reads your on-disk log transcripts, replays them against reverse-engineered provider caching state-machines, and names the exact turn the cache broke, the cause, and the exact token leakage.<p>Repo: <a href="https:&#x2F;&#x2F;github.com&#x2F;RedRobotKK&#x2F;Replay" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;RedRobotKK&#x2F;Replay</a><p>Core Subcommands (What it actually does):<p>- `replay` : Computes total avoidable re-billed cost across your local transcripts.<p>- `replay diff &lt;transcript&gt;` : Pinpoints the exact turn the cache sharded and why.<p>- `replay advise &lt;dir&gt;` : Outputs structural prompt optimization adjustments based on your history.<p>- `replay context &lt;transcript&gt;` : Ranks and isolates exactly what content is bloat-filling your context window.<p>- `replay route &lt;dir&gt; --to &lt;model&gt;` : Simulates what switching models would cost, factoring cold-start prefixes.<p>Why Go &#x2F; Design Constraints:<p>1. Zero Dependency: Avoids messing with Python virtual environments or Docker runtimes for local diagnostics.<p>2. 100% Sandboxed: Absolutely no remote tracking, cloud accounts, or telemetry. Your prompt text never leaves your machine.<p>3. Mutant Testing Isolation: Keeps 76 real past defects frozen as re-runnable mutants to enforce code stability.<p>It&#x27;s completely free and source-available (BUSL 1.1). To check your local developer logs or audit the setup script before running, use:<p><pre><code>                curl -fsSL https:&#x2F;&#x2F;replay.doctor | less</code></pre>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49691257)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-14T02:38:58Z

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
