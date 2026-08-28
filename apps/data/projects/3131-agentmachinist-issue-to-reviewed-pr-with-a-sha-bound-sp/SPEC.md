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

## Problem

When an AI coding agent opens a PR from an issue, the agent may iterate on the implementation after the human has already approved the spec. The "what we agreed to build" drifts from "what got built": commits land after the approval and there is no link tying the human's sign-off to a specific commit. AgentMachinist's pitch is to bind the spec approval to a specific commit SHA on the working branch, so the PR can only be marked ready-for-review against a commit that matches what was actually approved.

## Objective

Ship a GitHub App that lives between the issue and the PR for an AI agent workflow: the agent drafts a spec, the human approves it pinned to a commit SHA, and the agent's later commits are checked against that SHA before the PR is allowed to enter review.

## Target Users

- Solo developers who use an AI coding agent (Claude Code, Codex, Cursor Agent, Hermes) to drive PRs from issues and want a hard guard against silent scope drift.
- Small teams with one human approver per PR who want the approver's decision to outlive the agent's next commit.

## MVP Scope

- A GitHub App that watches for issues labelled `agent` and creates a paired spec PR with the agent's proposed plan.
- A spec file (Markdown) inside the PR that ends with a machine-readable approval block containing the commit SHA at the time of approval.
- A GitHub Actions check that runs on every push to the PR's branch: if the latest commit SHA does not equal the SHA recorded in the approval block, the check fails and the PR is blocked from review.
- A `/agent reapprove` comment command that re-runs the approval flow against the new SHA, producing a new approval record.
- A status comment on the issue that links the issue to the PR and shows the currently approved SHA.
- Out of scope: multi-party approvals, post-merge audit trail, integration with non-GitHub forges.

## Design Direction

See `DESIGN.md` for this project's design tokens.

## Constraints

- The approval must be cryptographically tied to the SHA it approves: editing the spec after the fact must invalidate the approval.
- The check must run on every push, not just on PR open, so a sneaky force-push after approval cannot slip past.
- The App must be safe to install on a public repo without leaking other PRs' spec content; all access is per-PR.
- The model of "one human, one SHA" is the contract for MVP — adding parties is a v2 problem.
