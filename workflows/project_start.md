# Project Start

Workflow to start a new task, creating a Spec and breaking it into blocks.

> **Prerequisite:** have the 14 superpowers skills installed (see `~/Projects/ai-os/CLAUDE.md` section 16). Without them, the load skill steps in this workflow will fail.
>
> Run `bash ~/Projects/ai-os/setup/verify.sh` to verify. If it reports `14/14 superpowers skills OK`, you're good.

## When to use

- Task >30 min estimated.
- Task touches multiple files.
- New feature, large refactor, complex bug.
- Anything that needs a Spec before execution.

Do not use for: trivial tasks, single-line fixes, quick questions.

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
- **Plan**: blocks of <=30 min each.
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

### 7. → Load skill `finishing-a-development-branch` (load skill)

At the end:

- → Load skill `finishing-a-development-branch` to:
  - Commit with conventional message.
  - Push to remote.
  - Open PR (if applicable).
  - Update Spec status to "complete".

### 8. Archive the completed Spec (move file)

Archive only after the active Spec is completed. Archive names are immutable,
versioned task records; do not overwrite an existing archive file.

```bash
mv "$AI_OS_ROOT/specs/current_spec.md" \
   "$AI_OS_ROOT/archive/$(date +%Y-%m-%d)-<slug>.md"

# Reset for next task
echo "# Current Spec\n\n*No active Spec.* Load a new Spec following \`specs/spec_template.md\` or run \`workflows/project_start.md\`." \
  > "$AI_OS_ROOT/specs/current_spec.md"
```

## Output

At the end of this workflow, you should have:

- A complete Spec in `archive/`.
- All blocks executed and verified.
- A clean git commit (or PR open).
- A new empty `specs/current_spec.md` ready for the next task.

## Anti-patterns

- ❌ Skipping Spec creation for "small" tasks → they grow and become unmanageable.
- ❌ Not getting user approval before executing → wrong direction wastes time.
- ❌ Executing all blocks at once without verifying → cascading failures.
- ❌ Not archiving the Spec → loses institutional knowledge.
- ❌ Not resetting current_spec.md → next task starts with garbage.
