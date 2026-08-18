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
# Default — clones + installs into ./ai-os
npx @edd_remonts/create-ai-os

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
3. Runs the platform installer with the target folder as its working directory:
   - macOS/Linux → `setup/install-mac.sh`
   - Windows → `setup/install-windows.ps1`
4. Prints next steps (`setup/verify.sh`, `CLAUDE.md`, `context/00_profile.md`).

The installer itself is idempotent and owns its own confirmation prompts and `DRY_RUN` mode — this CLI never duplicates that logic, it only clones and delegates.

## Full project docs

This package ships the CLI only. For the full AI-OS docs (architecture, skills, MCP servers, dev-env), see the [ai-os README](https://github.com/eddremonts86/ai-os#readme).
