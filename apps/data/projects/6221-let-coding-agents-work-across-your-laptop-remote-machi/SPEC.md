# SPEC.md — Let coding agents work across your laptop, remote machines, and S3

## Problem

I wanted to use Codex on my laptop to run kernel optimization experiments on my GPU box, with models stored in S3. That meant having Codex figure out file transfers and remote execution just to get an experiment running. Lots of opportunities to get something wrong before touching the actual kernel. Then what happens in the next session? Either Codex figures it out again, or the previous session leaves behind scripts and instructions. That works, but now there&#x27;s a small infrastructure project to maintain along with the actual experiments.<p>I decided to try out a more streamlined approach and started building Ridge. It gives agents common operations for accessing data and running commands across different environments, through MCP, a CLI, or Python. Local, SSH, Docker, and S3 are the initial providers. Copying a model from the bucket to the GPU box is one operation. There&#x27;s also support for giving subagents narrower access and coordinating operations on shared resources with locks.<p>I&#x27;m curious who else has run into this. What were you trying to do, and what did you end up building to make it work? Would appreciate feedback on the approach.

**Source:** [HackerNews](https://news.ycombinator.com/item?id=49647368)
**Primary category:** show-hn
**Tags:** Show HN,Product,Problem
**Date:** 2026-09-10T17:27:36Z

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
