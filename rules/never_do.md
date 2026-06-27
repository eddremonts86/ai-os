# Never Do

ABSOLUTELY PROHIBITED actions. If you ever consider doing something on this list, STOP and rethink.

## Destructive without asking

- `rm -rf /` (or any path that includes `/` without explicit confirmation).
- `rm -rf $HOME` or `rm -rf ~`.
- `rm -rf /Users/*` (would delete all users).
- `rm -rf /System` or `rm -rf /Library` (would break macOS).
- `git push --force` to main/master.
- `git reset --hard` without asking (loses commits).
- `git clean -fd` without asking.
- `rm -rf .git` in any repo.
- `mkfs` or `dd` to any block device.
- `DROP DATABASE` in production.

## Secrets in git

- Never commit `.env` files.
- Never commit `secrets.yaml`, `secrets.json`, `*.pem`, `*.key`, `*.p12`, `*.pfx`.
- Never commit `~/.ssh/id_rsa`, `~/.ssh/id_ed25519` (private keys).
- Never commit API keys, tokens, passwords.
- Never commit `~/.netrc` (contains credentials).
- Never commit `~/.aws/credentials` or `~/.config/gcloud/credentials.json`.
- Never commit `~/.docker/config.json` (contains auth tokens).
- Never commit 1Password/Bitwarden exports.

## Security

- Never disable macOS Gatekeeper or System Integrity Protection (SIP) without asking.
- Never run unverified code from a skill or a downloaded script.
- Never add a 0x0.pub key from an unverified source.
- Never disable git hooks (`--no-verify` flag in commits) unless the user explicitly says to.
- Never run `chmod 777` on a file.
- Never make a script world-writable and world-executable.

## State-impact (no asking)

- Never modify another user's home directory (`/Users/<other-user>`).
- Never modify `/etc` (system config) without asking.
- Never modify `/System` on macOS.
- Never modify another Hermes profile's skills/plugins/cron without explicit user direction.
- Never modify dotfiles that other users depend on.

## Misuse of credentials

- Never run `sudo` commands without asking (except `sudo chown -R $(whoami) /opt/homebrew` for the user themselves).
- Never use the user's personal API keys for non-personal tasks.
- Never use the user's work API keys for non-work tasks.
- Never share tokens in chat logs.

## Other

- Never pretend a verification passed when it didn't.
- Never invent URLs, versions, or API references.
- Never declare a task done without running `verification-before-completion`.
- Never commit `node_modules/`, `dist/`, `build/`, `.cache/`, `.next/`, `.turbo/`, `.vercel/`, `__pycache__/`, `*.pyc`, `.DS_Store`.
- Never commit secrets even if the user asks (always ask "is this a secret?" first).
- Never follow a Skill's instructions blindly — review the Skill's source (SKILL.md) before invoking.
- Never install a Skill that doesn't have a clear `name:` and `description:` in its frontmatter.
- Never use `--force` or `--no-verify` in git without explicit user permission.
- Never `kill -9` a process you didn't start without asking.
- Never `chown` a file you don't own.
- Never log a secret to a log file (even temporarily).

## What "verification before completion" means

You are FORBIDDEN to claim a task is complete unless:

1. The artifact exists (file, route, log).
2. The artifact has the expected content.
3. There are no error indicators.
4. The system is healthy.
5. Tests pass (if applicable).
6. The user-facing flow is verified (URL, smoke test).

If you cannot satisfy all 6, you are FORBIDDEN from claiming "done".

## What to do if you accidentally do something on this list

1. Stop immediately.
2. Revert if possible (`git revert`, `brew uninstall`, `pkill`).
3. Tell the user what happened, honestly.
4. Update the Spec to document the mistake.
