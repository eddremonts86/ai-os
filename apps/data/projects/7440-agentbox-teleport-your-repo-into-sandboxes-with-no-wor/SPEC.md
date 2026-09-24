# SPEC.md — Agentbox – Teleport your repo into sandboxes with no worktree juggling

## Problem

Hi HN, I&#x27;m Marco,<p>I&#x27;ve built this MIT-licensed CLI command to parallelize my work with claude &#x2F; codex &#x2F; PI, because with worktrees I had ports conflicts, agents conflicting for browser use, or touching external files.<p>It copies your project, skills, subscription oauth, and can optionally carry external files, supports LFS, and adds Chrome and screensharing via webVNC, so I use it for Godot game for eg.<p>To use:<p><pre><code>    agentbox claude  # launch on docker, also with pi, codex, opencode
</code></pre>
and:<p><pre><code>    agentbox hetzner claude  # also digitalocean, e2b, vercel, daytona, islo, Sprites, Tenki
</code></pre>
or your own private cloud:<p><pre><code>    agentbox remote-docker add buildbox marco@10.0.0.9
    agentbox docker:buildbox claude

</code></pre>
Most importantly your git credentials &#x2F; gh tokens are not copied into the sandboxes, but changes are relayed through your pc, with shims for git, gh or any CLI from your host, with your approval.<p>I use it to drive multiple subagents from a &quot;Firstmate&quot; agent:<p>I request several changes or gives him a backlog of items and claude will splits them in groups into parallel cloud sandboxes to avoid conflicts, and drive the sessions with the special &quot;agentbox drive&quot; commands, for eg. to wait-for idle, plan-approval, questions etc.<p>I find it really usefull so far, since it allows me to keep using my existing IDE&#x2F;tools.<p>More info on <a href="https:&#x2F;&#x2F;github.com&#x2F;madarco&#x2F;agentbox" rel="nofollow">https:&#x2F;&#x2F;github.com&#x2F;madarco&#x2F;agentbox</a>

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49728120)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-16T15:01:48Z

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
