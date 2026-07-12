# Ask Before Doing

Actions where you MUST always ask me for explicit confirmation before executing. Each item includes the expected format.

## Format of the question

```
I'm going to: <concrete action>
Reason: <why this is needed>
Risk: <what can go wrong>
Alternative: <option that doesn't require this action>
OK? (y/n)
```

## What requires confirmation

### Destructive

- `rm -rf` outside `node_modules/`, `dist/`, `build/`, `.cache/`.
- `git push --force` (including to your own branch).
- `git reset --hard`.
- `git clean -fd`.
- `DROP TABLE` / `DROP DATABASE`.
- Removing a branch.
- Deleting a file outside `node_modules/`, `dist/`, `build/`.

### Security-impact

- Installing a new package (npm, brew, choco, pip).
- Adding a new skill from an unverified source.
- Modifying auth/permission configuration.
- Sharing secrets in a commit.
- Disabling security tools (firewall, antivirus, git hooks).
- Changing dotfiles in another user's home.

### External-impact

- Publishing a package (npm publish, PyPI, brew tap).
- Creating a public GitHub repo (vs private).
- Sending a message on behalf of the user (email, Slack, Discord, SMS).
- Creating a webhook or token with external services.
- Deploying to production.
- `git push` to any branch (not only main) — confirm before every push,
  regardless of whether a PR follows.
- Opening a pull request.
- Commenting on or reviewing an existing PR/issue.

### State-impact

- Modifying another Hermes profile (skills, plugins, cron, memories).
- Changing global config (systemd, launchd, cron, .zshrc, .gitconfig).
- Installing system-level packages.
- Changing the OS (updates, settings).

### Time-impact

- Tasks > 2 hours.
- Long-running scripts (>10 min).
- Heavy builds (cargo build --release, npm ci with cache miss).

### Reversibility

- Anything that is hard to reverse.
- Git history rewrites.
- Force pushes.
- Database schema migrations.
- DNS changes.
- File moves that break symlinks.

## If the user says "go"

- Execute approved, reversible work without further questions.
- Keep the approval boundary for destructive, production, financial, credential,
  publishing, outbound, global-state, and otherwise hard-to-reverse actions.
  Ask for action-specific confirmation before performing any of them.
- If a doubt arises mid-execution, add it to the next "ask" instead of stopping.
- If a plan changes (the user adds requirements), update the Spec, do not silently deviate.

## If the user is ambiguous

- Ask with 2-4 options, not open-ended.
- Use the `clarify` tool.
- Suggest a default and explain why.
- If still ambiguous after one question, pick a reasonable default and proceed (max 1 clarification per task).
