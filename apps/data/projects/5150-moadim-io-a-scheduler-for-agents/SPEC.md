# SPEC.md — Moadim.io – A scheduler for agents

## Problem

Why can&#x27;t we get an agent scheduler that supports all of the following:<p>- git compatible<p>- agent agnostic<p>- 100% open source<p>- os and system-agnostic<p>- multi-runner support<p>- support mcp&#x2F;ui&#x2F;http<p>- unlimited routines&#x2F;crons<p>So I built one, moadim.io is a local Rust daemon you install in the target machine, give it a name and manage its routines via a Git repository, wants a new routine that send you a daily message from this machine? Create a pr and merge, have another routine that run every hour to pull the latest changes to the ~&#x2F;.config&#x2F;moadim folder.<p>With more than 1,000 users, I define this project as almost &quot;done&quot; and ready for production. Me and thousand more people are use it in a daily manner.<p>It currently supports Claude, Codex, Hermes, and Pi, and you are welcome to add your agent of choice as well because it&#x27;s 100% configurable.<p>You are welcome to have a look at the source code of the daemon in &quot;<a href="http:&#x2F;&#x2F;github.com&#x2F;moadim-io&#x2F;daemon" rel="nofollow">http:&#x2F;&#x2F;github.com&#x2F;moadim-io&#x2F;daemon</a>&quot;<p>Feel free to provide me with suggestions for more features around this topic. I don&#x27;t want to branch out to new off road topics likt webhooks, this is a &quot;done&quot; software in the realm of agents schedulers that focus on cron-like work.<p>Also feel free to start the github repository and open issues and PRs for your suggestions.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49571537)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-04T23:50:29Z

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
