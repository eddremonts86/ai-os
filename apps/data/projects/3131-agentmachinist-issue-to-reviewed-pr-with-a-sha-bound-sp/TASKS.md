---
id: "3131"
slug: agentmachinist-issue-to-reviewed-pr-with-a-sha-bound-sp
title: "AgentMachinist, issue to reviewed PR with a SHA-bound spec approval"
status: enriched
source:
  name: HackerNews
  url: "https://news.ycombinator.com/item?id=49449501"
  captured: "2026-08-26"
category: show-hn
date: "2026-08-26"
tags: [Show HN, Developer-Tools, AI, GitHub]
tech: [TypeScript, Node.js, GitHub Actions, Octokit, SQLite]
---
# AgentMachinist, issue to reviewed PR with a SHA-bound spec approval

## Phase 0: Scaffold

- [ ] Create the project folder under `apps/`
- [ ] Initialise the git repo
- [ ] Copiar `edd-app-template` → `apps/3131-agentmachinist-issue-to-reviewed-pr-with-a-sha-bound-sp/`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire `tailwind.config.ts` to the DESIGN.md tokens
- [ ] Set up the development environment
- [ ] Register a GitHub App in a dev org with minimum scopes
- [ ] Stand up the SQLite schema for issue-PR pairs, approvals, and audit log

## Phase 1: Core

- [ ] Webhook receiver for `issues.labeled` with the `agent` label
- [ ] Draft PR opened from the issue, with the spec template body
- [ ] Approval block: machine-readable block with SHA, approver, timestamp
- [ ] GitHub Actions check that compares recorded SHA to `HEAD` on every push
- [ ] `/agent reapprove` slash command that records a new approval and archives the old one
- [ ] Issue-thread status comment that mirrors the current approved SHA
- [ ] Install page with per-scope permissions documented

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on 2026-08-26_
