# Convert Recurring Tasks into Skills

> Run when you discover a pattern that you repeat frequently. Creates a reusable skill.

---

You have discovered that you (or the AI) repeat this task frequently:

<describe the recurring task here>

## Instructions

1. Determine if the skill should be **global** (`~/.claude/skills/<name>/`) or **local** (`~/Projects/ai-os/skills/<name>/`):

   - **Global** if it applies to any project (debugging, testing, etc.).
   - **Local** if it only applies to AI-OS (creating Specs, archiving, etc.).

2. If global, place it in `~/.claude/skills/<name>/SKILL.md`.
   If local, place it in `~/Projects/ai-os/skills/<name>/SKILL.md`.

3. Use `~/Projects/ai-os/skills/skill_template.md` as the base.

4. Fill ALL sections:

   - **Frontmatter**: `name:` (kebab-case), `description:` (specific triggers).
   - **When to Use**: list of trigger conditions.
   - **When NOT to Use**: list of anti-patterns.
   - **Inputs**: if applicable.
   - **Steps**: concrete procedure with code.
   - **Examples**: 1-2 examples.
   - **Pitfalls**: common mistakes.
   - **Verification**: how to know it worked.
   - **Related**: links to other skills or docs.

5. The `description:` is the most important field — it's what triggers the skill to load.

6. After creating, test it by running a scenario that should trigger it.

7. If global, run `setup/install-mac.sh` to distribute it to supported CLIs.

## Example

Recurring task: "Every time I finish work, I archive the Spec and commit."

Skill name: `finishing-aios-task`

```markdown
---
name: finishing-aios-task
description: Use this skill when finishing a Spec'd task in AI-OS. Archives the Spec, commits with conventional message, updates Spec status.
license: MIT
---

# Finishing an AI-OS Task

When you complete a task with an active Spec.

## Steps

### 1. Verify the Spec is complete

\`\`\`bash
# Check status
grep "^Status:" ~/Projects/ai-os/specs/current_spec.md
\`\`\`

If status is not "completed", apply verifiers/quality_checklist.md first.

### 2. Archive the Spec

\`\`\`bash
cd ~/Projects/ai-os
mv specs/current_spec.md archive/$(date +%Y-%m-%d)-<slug>.md
\`\`\`

### 3. Reset current_spec.md

\`\`\`bash
cat > ~/Projects/ai-os/specs/current_spec.md <<'EOF'
# Current Spec

*No active Spec.* Load a new Spec following \`specs/spec_template.md\` or run \`workflows/project_start.md\`.
EOF
\`\`\`

### 4. Commit

\`\`\`bash
git add specs/current_spec.md archive/
git commit -m "archive: <slug>"
git push origin main
\`\`\`

## Pitfalls

- Forgetting to reset current_spec.md → next task starts with garbage.
- Using wrong commit format → repository convention broken.
```

## After creating the skill

1. Run a scenario that should trigger it (e.g., "I just finished a task").
2. Verify it auto-loads.
3. If global, distribute via `setup/install-mac.sh`.

## When to delete a skill

- If the workflow changes substantially.
- If it's superseded by a better one.
- If it's no longer used.

Use `git rm -r ~/.claude/skills/<name>/` to delete.
