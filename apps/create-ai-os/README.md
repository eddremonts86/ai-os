# @edd_remonts/create-ai-os

[![npm version](https://img.shields.io/npm/v/@edd_remonts/create-ai-os.svg)](https://www.npmjs.com/package/@edd_remonts/create-ai-os)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)
[![Node ≥ 18](https://img.shields.io/badge/node-%E2%89%A518-brightgreen.svg)](https://nodejs.org)

> Bootstrap [AI-OS](https://github.com/eddremonts86/ai-os) — skills, workflows, MCP servers, and a replicable dev-env — with one command. Clones the canonical `ai-os` repo and delegates to its existing platform installer (`setup/install-mac.sh` or `setup/install-windows.ps1`).

## Install

You don't install it — you run it. The whole point is a single `npx` invocation.

```bash
npx @edd_remonts/create-ai-os
```

There's nothing to add to your `package.json` and nothing to remove — this is a one-shot bootstrapper, not a dependency.

## Usage

```bash
# Default: clones into ./ai-os, lets you choose, installs
npx @edd_remonts/create-ai-os

# Every CLI, component and package, no questions
npx @edd_remonts/create-ai-os --full

# Custom folder
npx @edd_remonts/create-ai-os ~/Projects/ai-os

# Clone only, skip running the installer
npx @edd_remonts/create-ai-os --clone-only /tmp/ai-os-preview

# Help / version
npx @edd_remonts/create-ai-os --help
npx @edd_remonts/create-ai-os --version
```

## What it does

1. Validates Node ≥ 18 and that `git` is on `PATH`.
2. Clones `https://github.com/eddremonts86/ai-os.git` (shallow) into the target folder.
3. Lets you choose what to install (when it has a terminal and you did not pass `--full` or `--yes`): the install mode, the AI CLIs, the components, then every package, grouped as in the repo's Brewfile, with the ones AI-OS needs marked required. The choice is saved to `context/personal/machine/install.yaml`, which the installers read, so the next run starts from it.
4. Runs the platform installer with the target folder as its working directory:
   - macOS/Linux → `setup/install-mac.sh`
   - Windows → `setup/install-windows.ps1`
5. Prints next steps (`setup/verify.sh`, `CLAUDE.md`, `context/personal/`).

The installer itself is idempotent and owns its own `DRY_RUN` mode; this CLI chooses, saves and delegates.

| Option | What it does |
|---|---|
| `--full` | Every CLI, component and package, no questions (the installer ignores `skip:` / `exclude:`). The shell and terminal look stay opt-in. |
| `-y`, `--yes` | No questions: the saved `install.yaml`, else the installer defaults. |
| `--here [DIR]` | Use an existing ai-os checkout instead of cloning (`ai-os install` runs this). |
| `--dry-run` | Run the installer in `DRY_RUN` mode. |
| `--clone-only` | Clone, do not install. |

## Tests

```bash
npm test
```

No network. The selector's data side (the catalog read from the repo, the `install.yaml` round trip) is tested directly; the tests also run the real CLI as a child process against a stand-in `git` and installer, simulate Windows and old Node versions, and cover every exit code.

## Full project docs

This package ships the CLI only. For the full AI-OS docs (architecture, skills, MCP servers, dev-env), see the [ai-os README](https://github.com/eddremonts86/ai-os#readme).
