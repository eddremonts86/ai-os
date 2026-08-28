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

## Value Proposition

Tie the human's spec sign-off to a specific commit SHA, so an AI coding agent cannot push past the approval with extra changes and still hand the PR to the reviewer. The PR enters review only if the working tree matches what was approved.

## Target Users

- Solo developers running AI coding agents end-to-end from issue to PR.
- Small engineering teams where one human owns the approval gate per PR.
- Maintainers of OSS repos who accept agent-driven PRs and want a reliable guard against silent scope drift.

## Jobs To Be Done

- When I approve a spec, I want the approval to mean that exact commit, so a later commit by the agent cannot quietly enlarge the PR.
- When I review a PR, I want a guarantee that the working tree matches what was approved, so I do not have to diff the spec against the diff manually.
- When an agent's first attempt is wrong, I want a clean re-approval path against the new SHA, so iteration does not require closing and reopening the PR.

## Success Metrics

- Number of agent-driven PRs in repos where the App is installed (installs is the funnel top).
- Number of PRs blocked by the SHA mismatch check per week — this is the guardrail firing.
- Time from `/agent approve` to PR entering review, as a latency signal for the workflow.
- Number of `/agent reapprove` invocations per PR, as a signal of how often the agent iterates after the first approval.

## Competitive Landscape

_Source does not name any competing product._ The post is a GitHub repo link with no comparable SHA-bound approval workflow mentioned.

## Risks & Open Questions

- GitHub Apps have a tight permission surface; the check must run without write access to anything it does not strictly need.
- Force-push on the working branch invalidates the SHA by definition; the workflow must communicate this clearly so it does not feel like a bug.
- The approval block is the source of truth; if the agent edits it (legitimately, to re-approve), the change must be visible in the PR's audit trail.
- Whether the spec itself should be cryptographically signed (e.g. with the approver's SSH key) instead of relying on GitHub's identity — a v2 hardening.
