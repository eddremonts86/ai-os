---
name: aios-ui-system-share
description: Share a design system across projects as a shadcn registry - publish a project's tokens and DESIGN.md, install them into another project, or update them there, with a scope guard and a lock file that lists local edits before anything is overwritten. Explicit invocation, /aios-ui-system-share <publish|install|update>.
disable-model-invocation: true
---

# aios-ui-system-share

One system, many projects: the stylesheet tokens and `DESIGN.md` of a project that passes
`/aios-ui-system-check` become a shadcn registry, and another project installs them from it.
`R="$AI_OS_ROOT/ai-config/skills/aios-ui-system-share/scripts/registry.py"`, run as `python3 "$R" <cmd>`
(`python` on Windows). Standard library only; it needs `node` and `pnpm` or `npx` for the shadcn CLI, which it runs at
the version it was measured on (`SHADCN_VERSION`; `AIOS_SHADCN_VERSION` overrides it).
Exit codes: 0 done, 1 a check or the CLI failed, 2 the CLI cannot be reached (nothing changed), 3 stopped before
changing anything (dirty tree, scope guard, or `update` waiting for `--yes`).

## Mode 1: publish (the project that owns the system)

1. `ai-os scope which` in the project, and ask which scope owns the system if it is unclear. A system belongs to
   one scope (personal, an employer, one of your own companies) and never crosses to another.
2. `python3 "$R" publish [dir] --name <slug> --scope <scope> [--version 0.1.0]`. It runs `tokens.py check` first
   and stops on any failure, refuses a scope that is not in the AI-OS configuration, then writes `registry.json` and
   `registry/<name>/DESIGN.md`, runs `shadcn registry validate` and `shadcn build`, and prints the built files in
   `public/r/` and every variable it did not export.
3. Show the "not exported" list. Those variables (`--animate-*`, project-only tokens) stay in the project; a value
   that points at one of them with `var()` makes `publish` fail, so fix it in the stylesheet, not here.
4. Items written: `<name>-tokens` (`registry:theme`, safe to re-run), `<name>-design-md` (`registry:file`, installed
   once), `<name>-font` (only for a fontsource import), `<name>-base` (`registry:base`, for `shadcn init`).
   Nothing is hosted or pushed. Hosting the registry is a separate decision.

## Mode 2: install (a project that should adopt the system)

1. The project must be a git repository with a clean tree; `install` stops otherwise. Rollback is
   `git checkout -- .`.
2. `python3 "$R" install <path to the built <name>-tokens.json> [dir]`. It stops when the item's scope is missing,
   not in the configuration, or different from this folder's (`ai-os scope which`). Then `shadcn add` the tokens, the
   `DESIGN.md` item only when the project has none, and the font item, then `tokens.py check`, then writes
   `ds-registry.lock.json`: the address, version, scope and every installed value.
3. Commit `ds-registry.lock.json` with the change. A brand-new project starts from the base item instead:
   `python3 "$R" init <path to <name>-base.json> <project name> [dir]` creates a Vite project with the system's style,
   icons, tokens and `DESIGN.md` (same scope guard) and writes the lock file, so `update` works there too.

## Mode 3: update (the system changed upstream)

1. Re-run `publish` in the producer with a new `--version`, then in the consumer:
   `python3 "$R" update [dir]`. With a clean tree it compares the stylesheet with the lock file and prints every
   token the project edited locally (these will be overwritten) and every token the new version changes.
2. **Show that list to the user and wait.** Only then `python3 "$R" update [dir] --yes`: `shadcn add -o` on the
   tokens, the `colors:` block of `DESIGN.md` rewritten from the stylesheet (nothing else in the file), the lock file
   rewritten, `check`. Read the `git diff`. If `DESIGN.md` has no flat `colors:` block the script prints the block to
   paste instead of editing.
3. `DESIGN.md` is installed once and owned by the project afterwards; `update` never overwrites its sections.

## What does not travel

- Components, hooks and blocks: tokens and `DESIGN.md` only. Rewritten components would be overwritten on every update.
- The `.light` selector and `@theme`-only placement: shadows and `--ease-out` land in `@theme inline`, which renders
  the same. Variables outside the token contract (the skipped list).
- Removals: a token dropped from the system stays in the projects that had it.
- A local edit of a shared token is not kept; it is listed and overwritten. Change the system, not the copy.

## Limits

The scope guard reads the item's `meta.scope`, which a hand-edited file can lie about: it prevents mistakes, not
attacks. Findings behind the placement rules are for shadcn CLI 4.23.0; raising `SHADCN_VERSION` means running
`AIOS_SHADCN_TESTS=1 python3 -m unittest setup.tests.test_aios_ui_share` first. Hosted registries (GitHub, private
auth), the shadcn MCP server and Vue projects are not covered yet.
