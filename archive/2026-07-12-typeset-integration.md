# Configurable Markdown Typeset in ai-schadcn-chat

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 6 (each <= 30 min)
**Author:** Edd
**Reviewer:** Edd

## Objective

Make the markdown rendering inside `<ChatPanel />` configurable per-instance by adopting shadcn's [typeset](https://ui.shadcn.com/docs/typeset) system. Each chat can pick a preset (`chat`, `docs`, `reading`, `compact`, `large`) or override the three rhythm controls (`--typeset-size`, `--typeset-leading`, `--typeset-flow`) directly — so a "Docs guide" panel can ship in `reading` mode while the "Coding buddy" stays in `chat`, both driven by the same `ChatConfig`.

## Context

The package currently styles markdown with hardcoded Tailwind classes inside `Markdown.tsx` (a `p`, an `h1` with `text-lg`, a `ul` with `my-2.5`, etc.) plus an `ai-prose` container class. Every chat looks identical; there is no way for a consumer to ask for serif reading mode, denser chat bubbles, or larger accessibility text without shipping their own renderer.

shadcn/typeset solves exactly this with a single CSS file (`typeset.css`) that styles every markdown element through CSS variables. Three variables — `--typeset-size`, `--typeset-leading`, `--typeset-flow` — drive the entire rhythm. A consumer picks a preset class (`typeset-chat`, `typeset-docs`, etc.) or sets the variables inline. The system is container-aware (sizes scale with `1em`) and streaming-stable (a new block does not restyle earlier ones — critical for chat).

We adopt it wholesale: copy `typeset.css` into the package, expose it through the same `ai-schadcn-chat/styles.css` import consumers already use, extend `UiConfig` with a `typeset` block, and have `Markdown.tsx` apply the right class + variables from config. The 4 new fields join the existing `CONFIG_FIELDS` catalog and the playground form alongside `theme`, `density`, `accentColor`, etc.

The chosen CSS delivery model is "bundle it once": consumers get typeset by importing `ai-schadcn-chat/styles.css` (which they already do) — no extra import step. Size cost is ~3 KB unminified, negligible.

## Acceptance criteria

- [ ] `src/styles/typeset.css` exists in the package and contains the official shadcn typeset rules, with a header comment crediting the source and version.
- [ ] `pnpm build` copies `src/styles/typeset.css` → `dist/typeset.css` and `package.json` exposes `"./typeset.css": "./dist/typeset.css"` as an export.
- [ ] `UiConfig` in `src/types/chat.ts` gains a `typeset?: TypesetConfig` block with fields `preset`, `size`, `leading`, `flow`, `fontBody`, `fontHeading`, `fontMono`, `enabled`. The new type is re-exported from `src/types/index.ts`.
- [ ] `Markdown.tsx` applies `typeset` + the right preset class when `config.ui.typeset` is set, with CSS variables for the overrides; falls back to the existing `ai-prose` look when `config.ui.typeset` is undefined or `enabled === false`.
- [ ] `CONFIG_FIELDS["ui"]` in the demo catalog gains 4 entries for the new typeset fields, each with a description and a copy-able example.
- [ ] `form-labels.ts` maps the 4 new paths to human labels ("Markdown preset", "Markdown size override", etc.).
- [ ] `FieldControl` in `UnifiedPlayground.tsx` renders the 4 new fields: a `SelectField` for `preset` and three `TextField`s for the optional overrides.
- [ ] Browser smoke test: in the playground, change `preset` to `reading`, confirm the assistant's markdown in the chat switches to a serif/roomier style. Change it to `compact`, confirm the chat bubbles get denser.
- [ ] `pnpm typecheck`, `pnpm build`, and `pnpm test:unit` (108/108) all pass. Browser console has zero errors and zero React warnings.

## Non-goals (explicit)

- No new external dependencies. `typeset.css` is plain CSS, copied verbatim from shadcn into the package — no `npm install` needed.
- No new markdown renderer. We keep `react-markdown` + the existing `components` map; typeset just replaces the per-element class names with a single container class.
- No "auto-detect" of preset from context. The consumer picks the preset explicitly. (Auto-detection could come later; not in this round.)
- No preset builder UI in the demo. The presets are documented in the doc grid with copy-able CSS snippets so consumers can build their own; we don't ship a builder.
- No changes to the `Markdown` package public API (signature stays `{ children, className }`). The typeset styling is applied inside the component, not exposed as a prop.

## Plan (blocks)

### Block 1: Vendor `typeset.css` into the package (estimated: 10 min)

- [ ] Fetch the latest `typeset.css` from `https://ui.shadcn.com/docs/typeset` (already downloaded to `/tmp/typeset.html` for reference; re-fetch the actual CSS via curl).
- [ ] Save it to `src/styles/typeset.css` with a header comment crediting shadcn/ui and the source URL.
- [ ] **Verify:** file exists, contains the canonical `.typeset`, `.typeset-docs`, etc. selectors, ~3 KB.

### Block 2: Build pipeline + package.json export (estimated: 10 min)

- [ ] Edit `scripts/postbuild.mjs` to copy `src/styles/typeset.css` to `dist/typeset.css` after the vite build.
- [ ] Add `"./typeset.css": "./dist/typeset.css"` to the `exports` block in `package.json` (above the existing `"./styles.css"` entry).
- [ ] **Verify:** `pnpm build` produces both `dist/styles.css` and `dist/typeset.css`. `node -e "console.log(require('./package.json').exports['./typeset.css'])"` prints `./dist/typeset.css`.

### Block 3: Extend `UiConfig` with `TypesetConfig` (estimated: 15 min)

- [ ] In `src/types/chat.ts`, define and export `TypesetConfig` interface:
  ```ts
  export interface TypesetConfig {
    /** Master switch. Default true. When false, falls back to ai-prose. */
    enabled?: boolean;
    /** Preset class to apply. See TYPESET_PRESETS in src/index.ts. */
    preset?: "default" | "chat" | "docs" | "reading" | "compact" | "large";
    /** Override --typeset-size. Any CSS length. */
    size?: string;
    /** Override --typeset-leading (unitless multiplier). */
    leading?: number;
    /** Override --typeset-flow. Any CSS length. */
    flow?: string;
    fontBody?: string;
    fontHeading?: string;
    fontMono?: string;
  }
  ```
- [ ] Add `typeset?: TypesetConfig;` to `UiConfig`.
- [ ] In `src/types/index.ts`, re-export `TypesetConfig` and a new `TYPESET_PRESETS` tuple const.
- [ ] In `src/index.ts`, export `TYPESET_PRESETS` so consumers can iterate the available presets without hardcoding strings.
- [ ] **Verify:** `pnpm typecheck` passes; importing `TypesetConfig` and `TYPESET_PRESETS` from `ai-schadcn-chat` resolves.

### Block 4: Wire `Markdown.tsx` to use typeset (estimated: 25 min)

- [ ] Modify `src/components/chat/Markdown.tsx`:
  - Remove the `ai-prose` hardcoded class. Replace with a computed `className`:
    ```ts
    const presetClass = typeset?.preset && typeset.preset !== "default" ? `typeset-${typeset.preset}` : "typeset";
    const enabled = typeset?.enabled !== false;
    const containerClass = enabled
      ? `typeset ${presetClass}`
      : "ai-prose"; // legacy fallback when disabled
    ```
  - When enabled, compute a `style` object from `typeset.size`, `typeset.leading`, `typeset.flow`, `typeset.fontBody`, `typeset.fontHeading`, `typeset.fontMono` and pass it to the outer `<div>`.
  - Accept a new optional prop `typeset?: TypesetConfig` on `MarkdownProps` so parents that want to bypass `ChatConfig` plumbing can still apply typeset directly.
- [ ] **Verify:** `pnpm typecheck` passes. Browser smoke: existing playground still renders markdown correctly with default `ai-prose` look (because the default config has no `typeset` block). No console errors.

### Block 5: Catalog + form labels for the 4 new fields (estimated: 15 min)

- [ ] In `demo/src/content/config-reference.ts`, add 4 entries to `CONFIG_FIELDS["ui"]`:
  - `ui.typeset.enabled` (boolean, default `true`)
  - `ui.typeset.preset` (enum: `default | chat | docs | reading | compact | large`, default `"default"`)
  - `ui.typeset.size` (string, default unset — falls back to preset)
  - `ui.typeset.leading` (number, default unset)
  - `ui.typeset.flow` (string, default unset)
- [ ] Each entry gets a description (1 paragraph) and an example (TS snippet). Include a "see typeset.dev" link in the preset's description.
- [ ] In `demo/src/content/form-labels.ts`, add the 4 paths to `FormLabelKey` and `FORM_LABELS`:
  - `ui.typeset.enabled` → "Markdown typeset"
  - `ui.typeset.preset` → "Markdown preset"
  - `ui.typeset.size` → "Markdown base size"
  - `ui.typeset.leading` → "Markdown line height"
  - `ui.typeset.flow` → "Markdown block spacing"
- [ ] **Verify:** `pnpm typecheck` passes; browser smoke shows the new fields in the UI section of the playground.

### Block 6: Form dispatch + final verification (estimated: 25 min)

- [ ] In `demo/src/components/UnifiedPlayground.tsx`, add 5 cases to `FieldControl` for the new paths. Each one reads `config.ui?.typeset?.field`, calls `updateConfig` with the right merge shape.
- [ ] Smoke test in browser:
  - Default state: no `typeset` block → markdown uses `ai-prose` legacy styles.
  - Toggle `Markdown typeset` ON → container now has `typeset` class + `typeset-default` preset class.
  - Pick preset `reading` → container switches to `typeset-reading`. Verify by sending a long markdown answer and seeing the visual change.
  - Switch back to `compact` → verify the chat bubbles get denser.
  - Override `size` to `20px` with preset `chat` → verify the base text grows.
  - Set `enabled` to `false` → verify the markdown reverts to `ai-prose` legacy styling.
- [ ] Run `pnpm typecheck && pnpm build && pnpm test:unit` and confirm 108/108 tests pass, no new errors.
- [ ] Take a screenshot of the playground with preset `reading` selected for the final report.
- [ ] Archive the spec per project_start.md.

## Risks and mitigation

| Risk                                                                                       | Probability | Impact | Mitigation                                                                                                                                                                                                                                                                                                                                                                    |
| ------------------------------------------------------------------------------------------ | ----------- | ------ | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Bundling shadcn typeset.css means we own its future bug fixes                              | medium      | low    | Header comment credits source + version. If shadcn ships a fix, `git diff` reveals it; we re-fetch and replace. The CSS is small (~3 KB) and stable.                                                                                                                                                                                                                          |
| Existing `Markdown.tsx` styling hardcoded per element conflicts with `.typeset`            | high        | medium | When `config.ui.typeset?.enabled !== false`, the per-element class names from the `components` map (e.g. `p: ({children}) => <p className="my-2.5">`) coexist with typeset's container rules. Tailwind utilities win via specificity in our DOM, so visually it should be fine; if there's a regression, the fix is to drop the per-element classes and let typeset own them. |
| Test fixture in `tests/components/` mocks `<Markdown>` and breaks when we add the new prop | low         | low    | New prop is optional with a default; existing tests that don't pass `typeset` keep working.                                                                                                                                                                                                                                                                                   |
| `react-markdown` re-renders the whole tree when the `components` map identity changes      | low         | low    | We don't change the map identity, only the conditional className derived from the prop. Memoization preserved.                                                                                                                                                                                                                                                                |
| Playwright e2e fixtures (if any) have snapshots that include `ai-prose` class              | low         | low    | Only unit tests exist (`tests/lib`, `tests/components`); no snapshot tests.                                                                                                                                                                                                                                                                                                   |

## Verification (end-to-end)

- [ ] `pnpm typecheck` exits 0
- [ ] `pnpm build` exits 0 and produces both `dist/styles.css` and `dist/typeset.css`
- [ ] `pnpm test:unit` exits 0 with 108/108 tests passing
- [ ] Browser: open `http://127.0.0.1:5173/#live-demo`, confirm the Coding Buddy chat renders with `ai-prose` (default look) — no regression on existing path.
- [ ] Browser: open the UI section of the playground form, toggle "Markdown typeset" ON, change preset to `reading`. Send a long markdown answer and confirm the chat visually switches (larger base text, more vertical rhythm).
- [ ] Browser: zero console errors and zero React warnings during the smoke run.
- [ ] Screenshot of preset `reading` selected saved to `/tmp/typeset-integration.png`.
- [ ] `grep -r "ai-prose" src/` returns at most 1 hit (the fallback in `Markdown.tsx`).

## References

- shadcn typeset spec: https://ui.shadcn.com/docs/typeset
- Current `Markdown.tsx`: `src/components/chat/Markdown.tsx`
- Current `ChatConfig` types: `src/types/chat.ts:106` (`ChatConfig`), `:137` (`UiConfig`)
- Catalog of fields: `demo/src/content/config-reference.ts`
- Form labels: `demo/src/content/form-labels.ts`
- Playground dispatcher: `demo/src/components/UnifiedPlayground.tsx` (`FieldControl`)
- Postbuild script: `scripts/postbuild.mjs`
- Package exports: `package.json:38-69`

## Notes

- We do NOT remove the per-element class names in `Markdown.tsx`'s `components` map. They coexist with typeset; if the consumer disables typeset (`enabled: false`), they get the same look as today. This is the safest migration path.
- The `ai-prose` class stays in `globals.css` as the opt-out look. Nothing changes for consumers who don't set `config.ui.typeset`.
- If the consumer sets a `preset` other than `default`, we apply both `typeset` (base) and `typeset-{preset}` (override). Per shadcn docs, the cascade is intentional — the preset wins because it's later in the CSS.
