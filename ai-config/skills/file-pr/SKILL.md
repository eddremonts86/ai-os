---
name: file-pr
description: File a concise pull request that leads with the problem, not a change inventory. Use when the user asks to file, open, or create a PR.
version: 1.0.0
author: Edd
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [github, pr]
    related_skills: [babysit-pr, full-stop, finishing-a-development-branch]
  scope: universal
  requires: "gh CLI authenticated"
---

# File PR

Adapted from Theo Browne's `t3dotgg/tstack` (MIT).

## Before filing

1. Check whether a PR for this branch already exists (`gh pr list --head <branch>`). If it
   does, update it instead of opening a second one.
2. Pick the base the repo's flow expects. AI-OS and repos that follow it: feature → `dev`;
   `dev` → `main` only as a promotion PR. Never open a PR from the default branch — branch first.
3. Review the diff against the base (`git diff origin/<base>...HEAD`) and make sure it
   matches the goal and nothing unrelated rode along.

## Title

PR titles usually become commit messages: follow the repo's convention (read recent merged
PRs and `git log`). Say why the change matters.

- BAD: `perf(server): negotiate permessage-deflate on the websocket`
- GOOD: `perf(server): cut websocket frame size by 70%+ with gzipping`

## Description

Open with the problem in plain words, from the user's original request, then the solution
in a sentence or two. Then one line on how the change was proven (command, test, screenshot).
No implementation inventory — the diff already is one.

- BAD: "Removed implicit workspace carry-over from every new-thread entry point (cmd+n,
  sidebar buttons, command palette). Deleted buildContextualThreadOptions and …"
- GOOD: "My 'new worktree' default was ignored when starting threads on existing
  worktrees. Now the preference always applies. Proven: reproduced, fixed, re-ran the repro."

End with the attribution line the harness specifies; if it specifies none, write
`Created with <model> in <harness>.` using the model name the harness reports (do not guess).

## Filing

- Scan the title, body, and attachments for secrets and private details before submitting.
- Open a real PR, not a draft, so review bots run.
- If `gh pr create` fails on the GraphQL rate limit, use REST:
  `gh api repos/<owner>/<repo>/pulls -f title=... -f head=... -f base=... -F body=@<file>`.
- No follow-up PR comment unless the request needs one; if so, use the comment format in
  `babysit-pr`.
- If the user also asked to watch it, continue with `babysit-pr`.
