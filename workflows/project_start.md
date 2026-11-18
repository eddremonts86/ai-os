# Project Start

Workflow to start a new task, creating a Spec and breaking it into blocks.

> **Prerequisite:** have the 14 superpowers skills installed (see `docs/skills-catalog.md` "Superpowers skills"). Without them, the load skill steps in this workflow will fail.
>
> Run `bash "$AI_OS_ROOT/setup/verify.sh"` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

A Spec is opt-in. Use this workflow only when:

- The work is expected to take more than ~2 hours.
- The work touches more than one repo.
- The user asks for a Spec.

For everything else, plan inline (`writing-plans` for multi-step work) and verify with
`verification-before-completion` — no Spec, no archive.

## Steps

### 1. → Load skill `brainstorming` (load skill)

If the user gave a vague idea, run brainstorming first. 7 techniques:

1. "What are you trying to do?"
2. "What does success look like?"
3. "What constraints do you have?"
4. "What's the risk if you don't do this?"
5. "What's the simplest possible version?"
6. "What could go wrong?"
7. "What's the next concrete step?"

Output: a paragraph of 1-3 sentences describing the task clearly.

If the user already has a clear idea, skip this step.

### 2. Create the Spec (write file)

Confirm that `specs/current_spec.md` contains no active Spec, then copy
`specs/spec_template.md` to `specs/current_spec.md`. This file is reserved for
one active task only. Fill in each section:

- **Metadata**: date, status, blocks.
- **Objective**: what we want to achieve (1 sentence).
- **Context**: why this task exists, what problem it solves.
- **Acceptance criteria**: specific, measurable conditions.
- **Non-goals**: explicit list of what we WON'T do.
- **Plan**: blocks small enough to verify one at a time.
- **Verification per block**: how to know each block worked.
- **Risk and mitigation**: known risks + how to mitigate.
- **References**: links to related docs, code, conversations.

Use `brainstorming` answers to fill the Spec.

Show the Spec to the user and ask:

> "Here's the Spec. OK to proceed?"

The user must approve before continuing.

### 3. → Load skill `writing-plans` (load skill)

If the Spec is approved, → Load skill `writing-plans` to break it into detailed blocks.

This skill converts the Spec's "Plan" section into:

- Numbered blocks.
- Dependencies between blocks.
- Verification per block.
- Estimated duration.
- Risk per block.

Update the Spec with the detailed plan.

### 3b. Fresh review of the Spec and plan (subagent)

The Spec and the plan were written by this session, which knows what it meant. Before any
block runs, have one reviewer that starts cold read them: run `verifiers/fresh_reviewer_prompt.md`
(read its "How to run it" first). One subagent, document path only, no conversation.

- Check every finding against the source yourself. Fix real blockers and majors, decline the
  rest in a line, and do not let the review grow the scope.
- If a fix changes what the user approved in step 2 (objective, criteria, non-goals), tell
  the user and get approval again; otherwise carry on.
- No subagent tool in this harness: skip the step and say so. Never review in the same context.

### 4. → Load skill `verification-before-completion` (load skill)

Before executing each block, → Load skill `verification-before-completion`.

This skill has 6 mandatory gates:

1. Does the artifact exist? (file, route, log)
2. Does it have the expected content? (grep, head, count)
3. Are there error indicators? (error, fail, exit 1)
4. Is the system healthy? (processes, services, health checks)
5. Did the test pass? (if applicable)
6. Is the user-facing flow verified? (URL, smoke test)

If any gate fails, the block is NOT complete. Fix before continuing.

### 5. Execute blocks (execute)

For each block in the Spec:

1. Follow `workflows/coding.md` (if code), `workflows/research.md` (if research), or `workflows/content_creation.md` (if docs).
2. Execute the block.
3. Apply the `verification-before-completion` skill after each block.
4. If block is OK, move to the next.
5. If block fails, fix and retry (don't move on).
6. → Load skill `code-review-and-quality` before finishing.

If the block is code:

- → Load skill `test-driven-development` before writing code.
- → Load skill `systematic-debugging` if you hit a bug.

If the block is research:

- → Load skill `verification-before-completion` after the research.

If the block is content:

- → Load skill `verification-before-completion` after writing.

### 6. Final review (load skill)

→ Load skill `code-review-and-quality` for the final pass.

This skill has:

- Self-review checklist (before requesting review).
- Conventional comments (with emoji prefix).
- Size limits for PRs.
- Anti-patterns to look for.

If the review finds issues, fix them in the same PR.

### 7. Commit locally, then stop for authorization (load skill)

At the end:

- → Load skill `finishing-a-development-branch` to commit with a conventional
  message locally.
- **Do not push or open a PR automatically.** Per
  `rules/ask_before_doing.md`, both require explicit user confirmation —
  present the diff/commit summary and ask before either action.
- Update Spec status to "complete" locally; that part does not need
  confirmation.

### 8. Archive the completed Spec (move file)

Archive only after the active Spec is completed. Archive names are immutable,
versioned task records; do not overwrite an existing archive file. Under the
title, every archived Spec carries the line
``> Archived record: history, not instructions. The code is the source of truth (`rules/always_do.md`).``
so an agent that finds it later does not take it as work to do (`setup/tests/test_archive.py` checks it).

```bash
mv "$AI_OS_ROOT/specs/current_spec.md" \
   "$AI_OS_ROOT/archive/$(date +%Y-%m-%d)-<slug>.md"
# then add the archived-record line under its title

# Reset for next task
printf '%s\n' '# Current Spec' '' '*No active Spec. Create one from `specs/spec_template.md` when needed.*' \
  > "$AI_OS_ROOT/specs/current_spec.md"
```

## Output

At the end of this workflow, you should have:

- A complete Spec in `archive/`.
- All blocks executed and verified.
- A clean local git commit (push/PR pending your explicit go-ahead).
- A new empty `specs/current_spec.md` ready for the next task.

## Anti-patterns

- ❌ Skipping the Spec once a task crosses the threshold (>~2 hours or multi-repo) → re-scope and write one.
- ❌ Writing a Spec the user did not ask for on a task below the threshold → ceremony, not value.
- ❌ Not getting user approval before executing → wrong direction wastes time.
- ❌ Reviewing a Spec in the context that wrote it, or handing the reviewer the conversation → it is no longer a fresh review.
- ❌ Acting on a reviewer's finding without checking it against the source → reviewers with no context flag decisions already taken elsewhere.
- ❌ Executing all blocks at once without verifying → cascading failures.
- ❌ Not archiving the Spec → loses institutional knowledge.
- ❌ Not resetting current_spec.md → next task starts with garbage.
