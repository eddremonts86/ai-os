---
name: full-stop
description: Take a change end to end without supervision — prove it, file the PR, babysit it — and stop when it is ready to merge. Use when the user says "full stop", "take it all the way", or wants a ready PR while away.
version: 1.0.0
author: AI-OS
license: MIT
platforms: [linux, macos, windows]
metadata:
  hermes:
    tags: [github, pr, autonomy, verification]
    related_skills: [file-pr, babysit-pr, verification-before-completion]
  scope: universal
  requires: "gh CLI authenticated"
---

# Full Stop

Adapted from Theo Browne's `t3dotgg/tstack` (`full-send` + `full-stop`, MIT). The user is not
watching: updates and the final message are read long after you stop. You own the work from
its current state to a PR that is ready to merge. **You never merge** — the user does.

Only apply this when the user asked for it clearly. Otherwise do not assume this autonomy.

## What the request grants

- Commit, push, rebase, resolve conflicts, and `--force-with-lease` on this task's own branch.
- The testing methods Proof needs, without asking first: running the app or a dev server,
  browser automation, simulators, screenshots. This replaces "ask before testing" rules for
  this task only; rules about *how* to test (the right command, fixture, test user) still apply.

It does not grant: merging, enabling auto-merge, entering a merge queue, pushing to the
default branch or `main`, bypassing branch protection, production changes, deleting data,
changing anything outside the repo, closing a PR, or force-pushing any other branch. It does
not bypass a harness or system approval prompt either. If auto-merge is already on, disable
it before starting and say so.

## Steps

1. **Finish the change.** The smallest change that meets the goal; fix the case that
   happened, not every case that could. On the default branch, branch first.
2. **Prove it** (see Proof).
3. **Get a second look** when the change is non-trivial: `requesting-code-review`, or
   `verifiers/critic_prompt.md` in AI-OS. Keep its findings in scope (see `babysit-pr`).
4. **File the PR** with `file-pr`, rebased on the latest base, with one line on how it was proven.
5. **Babysit it** with `babysit-pr`. Prove each fix before pushing it.
6. **Stop at the gate** and report.

Stay active from step 1 to 6. Ending the turn while checks are pending stops the work,
because nobody will prompt you again — wait with `babysit-pr`'s watcher instead.

## Proof

Proof is evidence you observed yourself in this session, the most direct the change allows:

- Reproduce the original failure, fix it, watch the same reproduction pass.
- Run what the repo's CI runs (typecheck, lint, tests).
- Add one focused test that fails without the fix, when the behavior has none and the repo
  has a test setup.
- For UI and runtime behavior, run the app and look. Green mocked tests do not prove the
  user experience works.

No way to prove a change means no full confidence: ask.

## The gate

Ready means all of these hold on the latest commit:

- Proof covers every change in the diff, including meaningful conflict fixes.
- Required checks are green.
- Review bots finished; each finding fixed or dismissed with a written reason.
- No human review requests changes.
- The branch is up to date with its base and GitHub reports it mergeable.

Report one verdict: **ready to merge**, **waiting for required approval** (confirm that is
the actual blocker), or **blocked** (what blocks it, what you tried, what is needed).

## Asking the user

A question in a plain message goes unseen and the thread looks done. Use the harness's
question tool (`AskUserQuestion` in Claude Code, `request_user_input` in Codex) with all the
context inside it: PR link, the blocker, options with your recommendation first. Ask only when:

- the change cannot be proven;
- the gate cannot pass and you cannot fix that yourself;
- the next step is outside the grant above;
- the goal is ambiguous in a way that changes the result;
- another PR makes this one obsolete.

Decide everything else with sensible defaults and list those decisions in the report. With
no question tool, take the safe path: leave the PR open and open the final message with the question.

## Report

PR link, final head SHA, verdict, proof, reviewer outcome, decisions made for the user,
remaining risks, and an explicit statement that the PR is open and unmerged.
