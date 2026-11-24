# Current Spec

# `/aios-ui-system-share`: one design system, many projects, through a shadcn registry

## Metadata

- **Date:** 2026-11-24
- **Status:** in-progress (approved 2026-11-24; block 1 done)
- **Blocks:** 5
- **Review:** cold read by a fresh reviewer on 2026-11-24 (`workflows/project_start.md` step 3b): 0 blockers, 8 majors, all verified against the repo and addressed
- **Author:** Claude (session design-systems-forms)
- **Reviewer:** Edd

## Objective

Add one command, `/aios-ui-system-share`, that publishes a project's design system (tokens and `DESIGN.md`) as a
shadcn registry and installs or updates it in another project, so every project of a scope shares one visual identity
without copying files by hand.

## Context

This is piece 2 of the design-system work. Piece 1 (`/aios-ui-system-create`, `-extract`, `-check`) and piece 3
(`/aios-ui-form-create`) are built and merged (`archive/2026-11-23-aios-ui-system-core.md`,
`archive/2026-11-24-aios-ui-form-create.md`). A system now lives in one project as a stylesheet plus a root
`DESIGN.md`; a second project can only get it by copying.

A research pass on 2026-11-24 (shadcn CLI 4.23.0, primary docs, and a real build plus install into a fresh Vite +
shadcn project) found that a registry can carry the whole contract:

- One `registry:theme` item carried the 31 colours in both modes, `--radius`, fonts, shadows, `--ease-out` and the
  durations. After install every value equalled the source and `tokens.py check` exited 0.
- `DESIGN.md` travels as a `registry:file` item with `target: "~/DESIGN.md"`.
- Re-running `shadcn add` updates tokens, but silently overwrites a token the consumer edited, and `DESIGN.md` with
  `-o`. There is no update command, no lockfile and no version field.
- Six things behave differently from the stylesheet and must be built around (Design, "Placement rules").

Measured on 2026-11-24 for this Spec: shadows and `--ease-out` in `@theme inline` give the same computed
`box-shadow` and `transition-timing-function` as in `@theme`, in light and dark (Chrome, Cockpit dev server). That
settles the one open question the research left.

## Design

### Command

`/aios-ui-system-share <publish|install|update> [args]`, explicit invocation only, in
`ai-config/skills/aios-ui-system-share/` (`SKILL.md`, `scripts/registry.py`). The fourth command of the
`aios-ui-system-*` family; `aios-ui-system-check` stays the gate and is not changed except for a pointer.

- **`publish [dir] --scope <name>`** (producer). Needs a root `DESIGN.md` and `tokens.py check` exiting 0, else
  stops. Runs `registry.py build`, then `shadcn registry validate`. Output: `registry.json` and the item files in
  the project (default folder `registry/`), nothing hosted.
- **`install <address> [dir]`** (consumer). `<address>` is a local path to a built item file in this slice.
  Needs a git repository with a clean tree, else stops and says why. Runs `shadcn add <address> -y` (no
  namespace and no `registry add`: those are for URL addresses, a follow-up), then `tokens.py check`, then writes
  the lock file. Verified 2026-11-24 with CLI 4.23.0: adding by local path changed only `src/index.css`;
  `components.json` and `package.json` stay untouched unless the item has npm `dependencies` (the font item).
- **`update [dir]`** (consumer). Same preconditions. Compares the stylesheet with the lock file (below), lists
  every token the consumer changed locally and every token the new item changes, and asks before going on. Then
  `shadcn add <tokens item> -o -y`, shows `git diff`, rewrites the `colors:` block of `DESIGN.md`, rewrites the
  lock file, runs `check`. A failed step leaves the tree as it is; the skill prints `git checkout -- .` as the
  rollback.

**Lock file.** `ds-registry.lock.json` at the consumer's root, written by `registry.py lock` after `install` and
`update`: the address, item name, `meta.version`, `meta.scope`, and every installed variable with its value per
selector. It is what makes a local edit distinguishable from an upstream change; without it `update` cannot tell
them apart (the CLI has no lockfile of its own).

**`DESIGN.md`.** `install` never writes it when one exists. `update` replaces only the flat `colors:` map in its
frontmatter, through `registry.py write_colors` (new, owned by this skill; `tokens.py` only prints the block). If
the file has no frontmatter or no `colors:` block, or the block has anything but flat `key: "value"` lines, it
stops and prints the block to paste. Address and version live in the lock file, not in `DESIGN.md`.

**Scope guard.** `ai-os scope which` in the producer folder at `publish` and in the consumer folder at `install` and
`update`. `publish --scope` must be one of the scope names in the AI-OS config (`setup/ai-os-scope.py`), else it
stops. `install` and `update` stop when either side resolves to no scope, and when the two differ, printing both.
The guard checks the item's `meta.scope`, which a hand-edited item can lie about: it prevents a mistake, not an attack.

**CLI version.** `registry.py` holds `SHADCN_VERSION = "4.23.0"`, the version the findings were measured on, and runs
`shadcn@<that>` through the project's package runner (`pnpm dlx` or `npx`); `AIOS_SHADCN_VERSION` overrides it.
When the CLI cannot be reached (offline, version unpublished) the command exits 2 with
`shadcn <version> not reachable: <reason>` and changes nothing. Raising the constant means running the gated
integration test below first.

### `scripts/registry.py` (stdlib only)

It loads the sibling `aios-ui-system-check/scripts/tokens.py` by path, resolved from its own real location
(`Path(__file__).resolve().parents[2]`, so it still works through each CLI's symlink; `AI_OS_ROOT` is the fallback).
`aios-ui-system-create` runs `tokens.py` as a command and does not import it; only the tests import by path today.
It reads the stylesheet with `tokens.parse_css` and writes `registry.json` plus these items (prefix `<name>`).

**What is exported.** `parse_css` folds `@theme` and `@theme inline` into one `@theme` key, so the source placement
cannot be recovered and placement is decided by variable name (rules below). The export set is: the contract's
colour variables, `tokens.SINGLE_VARS`, every `--duration-*`, and a short fixed list of extras the Cockpit needs
(`--shadow-color`, `--control-height`) kept as a table in `registry.py`. Any other custom property is not
exported, and `publish` prints each skipped name so the author sees it. A value that points with `var(--x)` at
a name outside the export set makes `publish` fail. The font item is built only when the stylesheet imports a
`@fontsource-variable/<name>` package; otherwise there is none.

| Item | Type | Content | Install policy |
| --- | --- | --- | --- |
| `<name>-tokens` | `registry:theme` | `cssVars` and `css` per the placement rules; `meta.scope`, `meta.version` | safe to re-run with `-o` |
| `<name>-design-md` | `registry:file` | `DESIGN.md` to `~/DESIGN.md` | once; never `-o` |
| `<name>-font` | `registry:font` | only when the system uses a fontsource font | once |
| `<name>` | `registry:theme` | `registryDependencies` on the items above | first install into an existing project |
| `<name>-base` | `registry:base` | same, plus `config` (style, icon library, base colour) | `shadcn init <address>` for a new project |

### Placement rules (each is a verified finding and gets a test)

1. Colours and `--radius` go in `cssVars.light` and `cssVars.dark`.
2. Fonts, shadows, `--ease-out` and `transition-duration-*` go in `cssVars.theme`. They land in `@theme inline`,
   which renders identically to `@theme` (measured); `aios-ui-system-create` step 4 is reworded to allow both.
3. Every other single-mode variable (`--shadow-color`, `--duration-*`, `--control-height`) goes in
   `css: {":root": ...}`, never in `cssVars`: the CLI would emit self-referencing aliases such as
   `--duration-fast: var(--duration-fast)`.
4. `@theme` is never a key of `css` with declarations: the install fails. Only nested at-rules may sit under it.
5. The bundle is `registry:theme`, not `registry:item`: a `registry:item` parent drops its dependencies' tokens.
6. New projects use the `registry:base` item with `config`: `init` on a theme item ignores the style.

Not shipped, and said in the skill: the `.light` selector (the CLI appends it after `.dark`; the specimen page keeps
it locally), components, and removals (a token dropped from the system stays in consumers).

### Changes outside the new skill

- `ai-config/skills/aios-ui-system-create/SKILL.md` step 4: shadows and ease may sit in `@theme` or `@theme inline`;
  the "in `:root` they are ignored" warning stays.
- `ai-config/skills/aios-ui-system-check/SKILL.md`: a one-line pointer to `/aios-ui-system-share`. `DESIGN.md` and
  its template do not change.
- `rules/always_do.md` rule 26 row, `README.md`, `docs/skills-catalog.md`, `setup/skills-routing-bank.json`, then
  `python3 setup/ai-os-stats.py --write` (221 to 222 skills). The skill needs no extra linking: the installers link
  every top-level `SKILL.md`.

### Decisions (defaults chosen; change any at approval)

1. **Home of the registry:** the system's own project folder (`registry/`), local paths in this slice. Where it
   is hosted is a follow-up, decided per scope; only the AI-OS brand may live in the public ai-os repo.
2. **Auth:** none in this slice. For a private GitHub registry later, `gh auth login` or `GH_TOKEN` (already named
   in `dev-env/env-config/.env.example`), never a token in `components.json`.
3. **`DESIGN.md`:** installed once; afterwards the consumer owns it and updates regenerate only the `colors:` block.
4. **Components:** tokens only. Shipping rewritten components is a later piece because every update would overwrite
   local edits.
5. **Shadow placement:** `@theme inline` accepted (measured).
6. **`.light`:** not shipped.
7. **shadcn MCP server:** not registered now; revisit with hosting.
8. **Vue:** not promised; `shadcn-vue` reading the same format is unconfirmed.

## Acceptance criteria

- [ ] `ai-config/skills/aios-ui-system-share/SKILL.md` exists, description at most 350 characters;
      `ai-os-skills.py lint --strict` exits 0 and a routing-bank request for it lands in the top 3.
- [ ] `setup/tests/test_aios_ui_share.py` passes and asserts, on a generated registry (no network): the item's
      variables equal the stylesheet's for both modes (round trip); no `cssVars` value is a self-referencing
      `var()`; no `css` key is `@theme` with declarations; the bundle type is `registry:theme`; `DESIGN.md` is a
      `registry:file` with a `target`; `meta.scope` is set; variables outside the export set are reported and a
      `var()` to one fails; `write_colors` replaces only the `colors:` block and refuses a file without one; the
      scope guard refuses an unresolved scope, a name not in the config, and a mismatch; no bash-only call.
- [ ] A second test class, `AIOS_SHADCN_TESTS=1` only, installs into a temporary Vite + shadcn project with the
      pinned CLI and asserts placement rules 3 to 6 against the real behaviour. It is run in block 4 and its output
      recorded; it is not in the pre-push hook, and a skipped run is never reported as a pass.
- [ ] From the Cockpit project, `publish` writes a registry that `shadcn registry validate` accepts, and a fresh
      Vite + shadcn project installs it by local path: `tokens.py check` exits 0, `vite build` succeeds, and a
      screenshot of the consumer next to the producer shows the same palette, radius, fonts and shadows in light and dark.
- [ ] `update` after changing one token in the producer: the consumer's `git diff` shows only that token (and the
      lock file); a local edit of `--primary` is listed from the lock-file comparison before anything is
      overwritten; a local line in `DESIGN.md` survives; `check` exits 0 afterwards.
- [ ] `install` and `update` stop with both scope names on a mismatch, when a scope is unresolved, on a dirty
      tree and on a folder that is not a git repository.
- [ ] A new project created with `shadcn init <base item>` gets the right style and the tokens.
- [ ] The full `setup/tests` suite passes with PyYAML, `ai-os-stats.py --check` passes, and the pre-push hook
      fed the commit on stdin (no push) passes.

## Non-goals (explicit)

- Hosting the registry (GitHub, Pages, Coolify) and any private-registry auth: a follow-up that needs a repo and
  the owner's decision; nothing is published or pushed.
- Shipping components, hooks or blocks in the registry.
- Registering the shadcn MCP server; indexing the registry in ui-indexador.
- Vue, Nuxt and native projects; Windows execution beyond a path-safe script (no `pwsh` here).
- `extends` on a `registry:style` (not exercised in the research).
- Changing the token contract or `tokens.py` rules.

## Plan (blocks)

### Block 1: lock the contract wording (estimated: 20 min)

**Status:** done (2026-11-24)

- [x] Reword `aios-ui-system-create` step 4 for `@theme` or `@theme inline`; add the pointer in
      `aios-ui-system-check`.
- [x] **Verify:** `tokens.py check` still passes on the Cockpit; the existing system tests pass.

### Block 2: `registry.py` and its tests, test first (estimated: 90 min)

**Status:** not started

- [ ] Write `setup/tests/test_aios_ui_share.py` first and see it fail; then `scripts/registry.py` (`build`, `lock`,
      `write_colors`, the scope guard, the version check).
- [ ] **Verify:** the tests pass; running `build` on the Cockpit and `shadcn registry validate` succeed.

### Block 3: the skill and its wiring (estimated: 45 min)

**Status:** not started

- [ ] `SKILL.md` with the three modes, the scope guard, the update procedure and the not-shipped list; rule 26 row,
      README, catalogue, routing bank; `ai-os-stats.py --write` (PNGs rendered with installed Chrome).
- [ ] **Verify:** lint strict exits 0; bank stays above 70 % with the new request in the top 3; stats check passes.

### Block 4: proof on a fresh consumer (estimated: 90 min)

**Status:** not started

- [ ] A subagent follows the skill as written: publish from the Cockpit, install into a fresh Vite + shadcn
      project, change a token and update, hit the scope guard, then `init` a new project from the base item; it
      reports every place the text was unclear or wrong.
- [ ] **Verify:** the acceptance criteria 3 to 6 in a real browser; screenshots of producer and consumer in both
      modes looked at and sent.

### Block 5: fold back, review, commit (estimated: 30 min)

**Status:** not started

- [ ] Fold the proof's findings into the skill; `aios-reviewer` on the diff; fix what it confirms.
- [ ] Commit locally, feed the pre-push hook the commit on stdin without pushing.
- [ ] **Verify:** the hook prints every check and exits 0; the tree is clean; nothing pushed.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| The shadcn CLI changes registry behaviour (these findings are for 4.23.0) | med | med | the version is pinned in `registry.py`; the gated integration test checks rules 3 to 6 and runs before the pin is raised and in block 4; the always-on tests only guard the generated JSON, so a CLI change is caught only when the gated test runs |
| A consumer's local token edit is overwritten on update | high | med | clean tree required; the lock file lists every local edit before anything is overwritten; `git diff` shown; `tokens.py check` after |
| `DESIGN.md` overwritten by `-o` | med | high | it is its own item, installed once; `update` never passes `-o` to it |
| A system of one scope installed into another scope's project | low | high | scope guard refuses unresolved scopes and mismatches; `--scope` validated against the config; a hand-edited item can still lie |
| Shadows differ in another browser or in a production build | low | low | measured in Chrome dev only; the proof in block 4 builds the consumer and compares both modes |
| Prototype-only evidence for GitHub hosting | med | low | hosting is a non-goal here; slice 2 tests it against a real repo the owner creates |

## Verification (end-to-end)

- [ ] `publish` from the Cockpit, `install` into a fresh project, `update` after a token change, as one run, with
      `tokens.py check` exit 0 and `vite build` passing in the consumer.
- [ ] All acceptance criteria above met and the four screenshots (producer and consumer, light and dark) looked at.

## References

- Research note: `design-systems-forms-study.md` and `piece-2-design-system-registry-research.md` in the shared
  notes folder (outside the repo); sources are the shadcn registry docs read 2026-11-24.
- `ai-config/skills/aios-ui-system-check/scripts/tokens.py`, `references/design-md.md`
- `archive/2026-11-23-aios-ui-system-core.md`, `archive/2026-11-24-aios-ui-form-create.md`
- Producer fixture: a scratch project with a stylesheet and `DESIGN.md` (the Agent Cockpit demo).

## Notes

- The research artefacts (the generator, a local static server, the installed fixtures) live in a scratch
  directory and are rebuilt in block 2; none is reused as is.
