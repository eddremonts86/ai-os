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

## Tech Stack

- TypeScript end-to-end so the GitHub App server, the Octokit client, and the Actions check share types and helpers.
- Node.js for the App's webhook receiver and the approval state store.
- Octokit for both inbound (webhooks) and outbound (PR comments, check runs) GitHub calls.
- A GitHub Actions check written in TypeScript that reads the approval block, compares the recorded SHA to the current `HEAD`, and reports a failing check on mismatch.
- SQLite for the App's own state: which issues are paired with which PRs, the latest approved SHA per PR, and the approval history.

## Architecture

- A webhook handler listens for `issues.labeled` (the `agent` label) and opens a paired draft PR whose body is the agent's spec.
- The spec ends with an approval comment block holding the SHA, the approver, and an ISO timestamp; the block is the convention that the check parses.
- A push-triggered Action runs the SHA-match check on every push to the PR's branch; a mismatch fails the check with a comment pointing at the latest commit and the approved SHA.
- A `/agent reapprove` slash-command handler records a new approval block with the current `HEAD` SHA and the previous approval moves to history.
- An issue comment is updated on every state transition so the issue thread shows the current approved SHA without opening the PR.

## Milestones

1. GitHub App scaffold with webhook receiver, Octokit auth, and a SQLite store for issue-PR pairs.
2. Issue-to-spec-PR flow on the `agent` label, with a templated spec body.
3. Approval block parser and the SHA-match GitHub Action.
4. `/agent reapprove` slash command and the audit log in SQLite.
5. Issue-thread status comment that mirrors the current approved SHA.
6. Installable App listing with permissions documented per repo scope.

## Risks

- GitHub's permission model may force the App to request more access than the MVP needs; the install page has to be honest about what the App reads and writes.
- Webhook delivery is not guaranteed in order; the state machine must tolerate out-of-order events or duplicate deliveries.
- Repos that rewrite history with rebase or squash will trip the SHA mismatch on every push; the documentation has to set expectations clearly.
- The approval-block-in-markdown convention is fragile to spec rewrites; a future v2 should sign the block cryptographically.
