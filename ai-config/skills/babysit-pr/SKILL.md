---
name: babysit-pr
description: Watch a PR through review bots and CI until green and approved. Use when the user asks to monitor, watch, or babysit a PR.
version: 1.1.0
author: AI-OS
license: MIT
platforms: [linux, macos]
metadata:
  hermes:
    tags: [github, pr, review, ci]
    related_skills: [file-pr, full-stop, requesting-code-review, receiving-code-review]
  scope: universal
  requires: "gh CLI authenticated"
---

# Babysit PR

Watch a pull request through review bots and CI until it is green and approved.
Adapted from Theo Browne's `t3dotgg/tstack` (MIT) with the AI-OS branch model: never push to
`main`/`master`, never merge. The user merges. Babysitting means keeping the PR fresh and
answering feedback, not landing it.

## Waiting — never poll

Do not write a watcher, a polling loop, or a `sleep` loop, and never post or say "still
waiting". Every watcher on a GitHub account shares one rate limit. Use what wakes you:

- **Claude desktop app**: the PR's Auto-fix / CI monitor (`ccd_pr` tools) wakes you on
  failures, conflicts and review comments.
- **Claude Code CLI**: one background command under the `Monitor` tool that ends on its own,
  e.g. `gh pr checks <n> --watch --fail-fast`.
- **Other CLIs**: the same command run once in the foreground.

One watcher per PR. Start it again after you push or after handling an event. When an event
needs no action, end the turn without a message.

## GitHub rate limits

`gh pr create/view/checks` use GraphQL. When it is used up (`gh api rate_limit --jq
.resources.graphql`), the REST limit is separate and usually has room:
`gh api repos/<owner>/<repo>/pulls/<n>` for the PR,
`gh api repos/<owner>/<repo>/commits/<sha>/check-runs` for checks.

## Workflow

1. **Baseline**: note the PR head SHA. Only act on checks and comments newer than the
   latest push — never re-address old feedback.
2. **Verify before changing code**: check every bot finding against the source. Bots are
   helpful, not always right. If the repo has `.macroscope/check-run-agents/*.md`, read them
   before answering a Macroscope finding. CodeRabbit is advisory: never wait or hold for it.
3. **Fix real findings** and genuine CI failures. Tell repo failures from infra flakes
   (retry a flake once; report it if it persists).
4. **Dismiss false positives with a written reason**, then resolve the thread. Never
   silently dismiss.
5. **Rebase when needed**: if the base branch moves in a way that touches this PR's files,
   rebase the feature branch and push with `--force-with-lease`. Never force-push anything else.
6. **Ready check** — right before calling the PR ready, `git fetch` and confirm on the latest
   head: required checks green, every finding fixed or dismissed, no human review requesting
   changes, the PR is neither BEHIND nor DIRTY, and no base commit that landed after the last
   green run touches this PR's files.
7. **Stop**: ready → report it and leave the merge to the user. An overlapping PR made this one
   obsolete → stop, report, ask before closing.

## Comments posted on the user's behalf

Every comment, review reply, or dismissal reason an agent posts starts with this callout:

```md
> [!NOTE]
> 🤖 **<model> responding on behalf of <user>**

The reply starts here.
```

Use the model name the harness reports (the harness name if none — do not guess) and the
user's name or GitHub login. Lead with the conclusion, cite code/check/output, no filler or
canned thanks, separate verified facts from judgment. Before posting, scan the whole comment
(quotes and attachments included) for secrets and private details. After posting, confirm
GitHub returned the comment URL; resolve a thread only after its reply landed. The callout
does not go in PR descriptions, commit messages, or text the user asked to post verbatim.

## Hard rules

- **Keep the PR at the size the goal needs.** Review loops grow a PR one cheap-looking fix
  at a time. Fix real bugs in the intended case; decline the rest with a written reason and
  list them as follow-ups: unneeded tests, guards for edge cases that do not matter, extra
  compatibility, small perf costs. Prefer the fix that deletes or narrows code.
- Never merge, never push to main, never delete branches, never use `--admin` bypasses.
- No draft PRs — drafts skip review bots. Convert an inherited draft to ready once the
  requested changes are addressed.

## Anti-patterns (from real history)

- BAD: polling `gh pr checks` every minute and posting "still waiting".
- GOOD: one watcher that wakes the agent; silence when nothing needs doing.
- BAD: treating every bot nit as mission-critical, tripling the diff.
- GOOD: fix real findings, dismiss nits with reasons, keep the diff in scope.
