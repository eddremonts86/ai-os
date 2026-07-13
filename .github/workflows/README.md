# GitHub Actions CI

> Three workflows that validate that `install-{mac,linux,windows}` and `verify-*` work in dry-run mode.

## Workflows

| Workflow           | OS                               | Triggers          | Estimated time |
| ------------------ | -------------------------------- | ----------------- | -------------- |
| `test-mac.yml`     | `macos-latest` (GitHub runner)   | PR + push to main | 3-5 min        |
| `test-linux.yml`   | `ubuntu-latest` (GitHub runner)  | PR + push to main | 2-3 min        |
| `test-windows.yml` | `windows-latest` (GitHub runner) | PR + push to main | 5-8 min        |

## What they test

The workflows run `install-{mac,windows}.sh/ps1` with `DRY_RUN=1`. This:

1. **Does NOT** install real packages (Brew, Chocolatey, npm, pip).
2. **Does NOT** modify the runner's system.
3. **Does** validate that the script runs without syntax errors.
4. **Does** validate AI-OS structure, Brewfile, MCP YAMLs, skills frontmatter.
5. **Does** simulate symlinks in a temporary HOME.

## What they do NOT test (requires manual testing)

- Real package installation (takes 10-15 min, can fail due to rate limits).
- Interactivity (p10k wizard, Windows prompts).
- Real OS configuration (Warp defaults, Terminal.app).
- Connection to external services (GitHub API for gh cli, etc.).

## How to run locally

Simulate what CI does on your machine:

```bash
# Mac
DRY_RUN=1 bash setup/install-mac.sh

# Linux (change $HOME to something writable)
DRY_RUN=1 bash setup/install-mac.sh

# Windows (PowerShell)
$env:DRY_RUN = "1"
powershell -File .\setup\install-windows.ps1
```

## When it breaks

If a workflow fails in CI:

1. View the full log in GitHub Actions.
2. Identify which check failed (structure, Brewfile, MCP, frontmatter, etc.).
3. If it's a real error → fix and push.
4. If it's a false positive (eg: yq not installed in runner) → add install step.

## Runner limitations

- **macOS runner:** has Xcode CLI tools, brew, git pre-installed. Does NOT have Warp, p10k, or Oh My Zsh.
- **Linux runner:** has apt-get, snap, git, python pre-installed.
- **Windows runner:** has PowerShell Core, git, choco pre-installed.

If a check requires specific tools (Warp, Powerlevel10k), the verify.sh marks it as `warn` (not fail) in dry-run. Only syntax/logic errors are `err` (fail).

## Triggers

```yaml
on:
  pull_request:
    branches: [main]
  push:
    branches: [main]
```

- **PRs to main:** runs before merging.
- **Push to main:** runs after merging.

To run manually: Actions tab → "Test macOS" / "Test Linux" / "Test Windows" → Run workflow.

## Costs

GitHub Actions:

- **macOS runner:** 10x more expensive than linux (~$0.08/min).
- **Linux runner:** free for public repos, free up to 2000 min/month for private.
- **Windows runner:** 2x more expensive than linux.

Current setup: 3 workflows × ~5 min average × 10 min timeout = ~30 min per PR.

**For private repo:** ~$0.50 per PR with macOS, ~$0.05 with linux/Windows.

## Future improvements

- [ ] Add a real `install-mac.sh` test (with `brew bundle`) in a separate job (15 min timeout).
- [ ] Cache `node_modules` and python deps.
- [ ] Add status badge to README.
- [ ] Matrix strategy: test on macos-13, macos-14, ubuntu-22.04, ubuntu-24.04, windows-2022, windows-2025.
