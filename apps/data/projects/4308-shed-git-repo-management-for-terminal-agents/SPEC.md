# SPEC.md — Shed – Git Repo Management for Terminal Agents

## Problem

Hi HN,<p>Shed is a git repo management system for terminal agents.<p>I built it because I wanted a complete git repo and workspace management system that was agent-first by design and portable across agent harnesses. Tools like ghq, worktrunk, and vanilla git worktrees fill some of the gaps, but personally I feel they all come up short in one way or another as a complete system for agents to manage both git repos and the PR lifecycle.<p>When you add a repo to Shed, it gets tracked in the repo catalog at ~&#x2F;.shed&#x2F;repos. This directory is read-only at the OS level and the tracked repos are synced at the start of each agent session. This guarantees your agent&#x27;s repo catalog is always fresh and pristine. You can add specific repos (shed add python&#x2F;cpython) or track all repos from a GitHub owner (shed add python). Agents read and grep code directly in ~&#x2F;.shed&#x2F;repos, and spin up cheap, writable workspaces with shed on-demand when they need to make changes.<p>Shed includes additional QOL features such as smart workspace pruning (shed prune) which deletes workspaces if the associated PR has been merged.<p>Internally, shed uses worktrees for the read-only catalog but deliberately gives agents plain clones as workspaces. There&#x27;s a longer discussion of this design decision in the README. TLDR; worktrees have limitations that agents don&#x27;t really benefit from, and replicating the same flow with local clones is easy, more flexible, and equivalent in speed. The workspace management itself is managed by your agent.<p>To try it out on mac, run:<p><pre><code>  brew trust AndrewHannigan&#x2F;tap &amp;&amp; brew install AndrewHannigan&#x2F;tap&#x2F;shed
  shed init
  echo &quot;show me shed&quot; | claude
</code></pre>
You can easily uninstall the shed init stuff with shed init --uninstall --purge if you don&#x27;t end up liking the tool. Shed itself is one Go binary, with no daemon and no telemetry.<p>For the moment, Shed supports claude, cursor-agent, and opencode, and GitHub is the only git host. Will add more if people like it. I hope you give it a try and look forward to hearing your thoughts!

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49523609)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-01T15:47:31Z

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
