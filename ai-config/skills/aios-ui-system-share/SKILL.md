---
name: aios-ui-system-share
description: Share a design system across projects as a shadcn registry - publish a project's tokens and DESIGN.md, install them into another project, or update them there, with a scope guard and a lock file that lists local edits before anything is overwritten. Explicit invocation, /aios-ui-system-share <publish|install|update|init>.
disable-model-invocation: true
---

# aios-ui-system-share

One system, many projects: the stylesheet tokens and `DESIGN.md` of a project that passes
`/aios-ui-system-check` become a shadcn registry, and another project installs them from it.

`R="$AI_OS_ROOT/ai-config/skills/aios-ui-system-share/scripts/registry.py"`, run as `~/.ai-os/venv/bin/python "$R" <cmd>`
(on Windows, the `python` that `install-windows.ps1` gave PyYAML). Use a python that has PyYAML, not any python: the
scope guard reads AI-OS's scope config with it, and without it every command stops with "cannot read the AI-OS scope
config". The scope config is the one under `AI_OS_ROOT` (the same one `ai-os scope which` reads when it is set). Node and
`pnpm` or `npx` are needed for the shadcn CLI, which the script runs at the version it was measured on
(`SHADCN_VERSION`; `AIOS_SHADCN_VERSION` overrides it).
Exit codes: 0 done, 1 a check or the CLI failed, 2 the CLI cannot be reached or the version does not exist, 3
stopped before changing anything (dirty tree, scope guard, or `update` waiting for `--yes`).

## Mode 1: publish (the project that owns the system)

1. `ai-os scope which` in the project: the system belongs to that scope and `--scope` must be the same one, or
   `publish` stops. A system never crosses scopes.
2. The project's `DESIGN.md` colours must equal its stylesheet. After changing a token, regenerate the block first
   (`python3 "$T" frontmatter <stylesheet>`, with `T` the `aios-ui-system-check` script) or the check below fails.
3. `~/.ai-os/venv/bin/python "$R" publish [dir] --name <slug> --scope <scope> [--version 0.1.0]`. It runs
   `tokens.py check` and stops on any failure, makes sure the CLI answers, and only then writes `registry.json` and
   `registry/<name>/DESIGN.md`, runs `shadcn registry validate` and `shadcn build`, and prints the built files in
   `registry/dist/` (not `public/`, which a Vite app ships) and every variable it did not export. Style, icons and base
   colour of the base item come from the project's `components.json`.
4. Show the "not exported" list. Those variables (`--animate-*`, `--font-heading`, project-only tokens) stay in the
   project and are not part of the shared system; a value that points at one with `var()` makes `publish` fail, so fix
   it in the stylesheet.
5. Items written: `<name>-tokens` (`registry:theme`, safe to re-run), `<name>-design-md` (`registry:file`, installed
   once), `<name>-font` (only for a fontsource import), `<name>-base` (`registry:base`, for `init`).
   Nothing is hosted or pushed. Hosting the registry is a separate decision.

## Mode 2: install (a project that should adopt the system)

1. The project must be a git repository with a clean tree; `install` stops otherwise.
2. `~/.ai-os/venv/bin/python "$R" install <path to the built <name>-tokens.json> [dir]` (relative paths are fine). It
   stops when the item's scope is missing, not in the configuration, or different from this folder's. Then
   `shadcn add` the tokens, the `DESIGN.md` item only when the project has none, and the font item, then
   `tokens.py check`, then writes `ds-registry.lock.json`: the address (made absolute), version, scope and every
   installed value.
3. If the project had no `DESIGN.md`, the one it received is the producer's: edit its `name` and description now.
   Commit `ds-registry.lock.json` and `DESIGN.md` with the change. The lock's address is a path on this machine until the
   registry is hosted.
4. Rollback, if something is wrong before the commit: `git checkout -- .` and delete the untracked `DESIGN.md` and
   `ds-registry.lock.json` the install added.

A brand-new project starts from the base item: `~/.ai-os/venv/bin/python "$R" init <path to <name>-base.json> <project name> [dir]`
creates a Vite project with the system's style, icons, tokens and `DESIGN.md` (same scope guard) and writes the lock
file, so `update` works there too. Edit the `DESIGN.md` name and description, then commit everything (the lock
file and the CLI's own files) before the first `update`: it refuses a dirty tree.

## Mode 3: update (the system changed upstream)

1. Re-run `publish` in the producer with a new `--version` (mode 1, step 2 first), then in the consumer:
   `~/.ai-os/venv/bin/python "$R" update [dir]`. With a clean tree it compares the stylesheet with the lock file and
   prints every token the project edited locally (these will be overwritten) and every token the new version
   changes. Nothing has changed yet.
2. **Show that list to the user and wait.** Only then `update [dir] --yes`: `shadcn add -o` on the tokens, the
   `colors:` block of `DESIGN.md` rewritten from the stylesheet (nothing else in the file), the lock file rewritten,
   `check`. Read the `git diff`. If `DESIGN.md` has no flat `colors:` block the script prints the block to paste
   instead of editing, and it notes any prose in `DESIGN.md` that still quotes the old value of a token that changed
   (a radius, a duration): update that text by hand.
3. `DESIGN.md` is installed once and owned by the project afterwards; `update` never overwrites its sections.
   Rollback before the commit: `git checkout -- .`.

## What does not travel

- Components, hooks and blocks: tokens and `DESIGN.md` only. Rewritten components would be overwritten on every update.
- The `.light` selector. Shadows and `--ease-out` land in `@theme inline`, which renders the same as `@theme`.
  Variables outside the token contract (the skipped list).
- Removals: a token dropped from the system stays in the projects that had it.
- A local edit of a shared token is not kept; it is listed and overwritten. Change the system, not the copy.

## Limits

The scope guard reads the item's `meta.scope`, which a hand-edited file can lie about: it prevents mistakes, not
attacks. The findings behind the placement rules are for shadcn CLI 4.23.0; raising `SHADCN_VERSION` means running
`AIOS_SHADCN_TESTS=1 ~/.ai-os/venv/bin/python -m unittest setup.tests.test_aios_ui_share` first, because the tests that
run by default only guard the generated JSON. Hosted registries (GitHub, private auth), the shadcn MCP server and Vue
projects are not covered yet.
