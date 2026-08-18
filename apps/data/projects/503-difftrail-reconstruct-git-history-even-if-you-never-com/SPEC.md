---
id: "503"
slug: difftrail-reconstruct-git-history-even-if-you-never-com
title: "DiffTrail: Reconstruct Git history even if you never committed it"
status: enriched
source:
  name: Reddit
  url: "https://www.reddit.com/r/SideProject/comments/1vnypso/difftrail_reconstruct_git_history_even_if_you/"
category: sideproject
date: "2026-08-14"
tech: [TypeScript, Node.js (Fastify), Git, PostgreSQL, Resend, Vercel]
---
# DiffTrail: Reconstruct Git history even if you never committed it

## Problem

Source: https://www.reddit.com/r/SideProject/comments/1vnypso/difftrail_reconstruct_git_history_even_if_you/

Original post:

> Hi everyone! A couple days ago I was looking through the files of an old project and wanted to find the previous version of a file, when I ran into the issue of Git only remembering the versions of your work that you actually committed. The version I wanted had existed, but because I had never committed it, Git had no record of it. I ran into a similar issue a few months ago, when I had forgotten to initialize a Git repo in a separate project and had no reference of my past work. That led me to build DiffTrail over the last couple days, a tool that reconstructs missing Git history from whatever evidence is still available, using a coding agent (I focused on Codex right now, but I don't think it'll be difficult to extend this to other platforms such as Claude Code or OpenCode in the near future). It looks through things like diffs, patches, later file versions, test outputs, local session history, and other project artifacts to recover intermediate states that were never committed. DiffTrail reconstructs only parts of the history it can support with some evidence, and it labels every recovered file as "exact," "reconstructed," or "inferred" based on what it was able to find, so you can see how much confidence to place in it. Everything is written to a separate branch and worktree, so it doesn't affect your existing work. It's still a really early work, but I'd love to know what you all think, and I'd appreciate any feedback/suggestions you might have! :) GitHub: https://github.com/rishaandesai/difftrail submitted by /u/Blackhole1123 [link] [comments]

---

What this plan addresses: DiffTrail: reconstruct Git history even if you never committed, by reading editor autosaves and workspace state.

## Objective

DiffTrail: a tool that reconstructs a chronological diff trail from editor autosaves and workspace state, so you can recover history you never committed. When I forgot to commit and lost work, I want a tool that reconstructs a chronological diff trail from editor autosaves and workspace state, so I do not lose history I never committed.

## Target Users

- Developers who lost work because they forgot to commit
- Solo founders iterating fast who forget intermediate steps
- Engineers who want a "what did I write yesterday?" tool

## MVP Scope

- Reads editor autosaves + workspace state
- Reconstructs a chronological diff trail
- Optional commit-on-detection
- No source-code upload required

## Design Direction

Design direction for the MVP at `https://www.reddit.com/r/SideProject/comments/1vnypso/difftrail_reconstruct_git_` follows the constraints in `503-.../SPEC.md` and the chosen stack (TypeScript, Node.js (Fastify), Git). The visual language is intentionally narrow: a single primary surface, a single accent, and density tuned for the primary user in the country stated in the source.

For the country stated in the source, the defaults lean toward the locale's reading direction, currency glyph, and date format. No third-party tracking is added to the surface; the design is intentionally auditable.

**Color** — neutral surface (off-white / off-black per OS theme), one accent for primary actions, one muted accent for secondary. No gradients in v1.

**Type** — one display family for headings, one text family for body, one mono for code/numbers. Type scale is small (4 steps) so the layout stays compact.

**Density** — tight, table-driven for dashboards; generous spacing for content-heavy screens.

**Motion** — minimal: page transitions only when the user explicitly navigates. No autoplay, no parallax.

## Constraints

- Source body describes DiffTrail as reconstructing Git history even if never committed
- Plan keeps the reconstruction framing
- Source did not name a price or editor
