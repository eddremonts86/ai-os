# Unified Config Playground for ai-schadcn-chat demo

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 5 (each <= 30 min)
**Author:** Edd
**Reviewer:** Edd

## Objective

Collapse the two duplicated live-chat sections (`#live-demo` "Try it live" and `#config-reference` "Try the config before you read it") into a single two-column playground that combines the persona-driven defaults of the Coding Buddy with a comprehensive, multi-expandable form that lets the user mutate **all** documented `ChatConfig` / `UiConfig` fields in real time.

## Context

In the previous session we shipped a `ConfigReferenceSection` with a live `<ChatPanel />` above the documentation grid. The landing page now renders two near-identical chat panels (`#live-demo` and the playground inside `#config-reference`), both backed by different `ChatConfig` objects — visual duplication, two `ChatEngine` instances mounted at the same time, and the form only exposed 4 fields (provider kind/baseUrl/apiKey/model).

The user wants one section, one chat, and a form that covers every documented knob. The Coding Buddy persona (system prompt, personality, suggestion chips, always-on demo document) is the one that earned its place — we keep that, drop the other, and rebuild the form to expose the 72 fields grouped by the same 6 sections the reference doc uses (Provider, Model, Behavior, Resilience, Personality & tools, UI). The form lives in a right-hand column when there's room (desktop), collapses to a footer-drawer on mobile — and uses collapsible sections (one per config section) so it doesn't become an unusable wall.

## Acceptance criteria

- [ ] Only one `<ChatPanel />` is mounted in the demo page; the second instance is removed without breaking the rest of the landing.
- [ ] The single panel uses the **Coding Buddy** config (`buildCodingBuddyConfig()` in `demo/src/lib/chat-configs.ts`) as its starting state — system prompt, personality, suggestions, always-on document, persistKey all preserved.
- [ ] The playground form exposes controls for every documented field on `ChatConfig` / `UiConfig` (72 fields across 6 sections), grouped under 6 collapsible expand sections that mirror the reference doc.
- [ ] Each field control calls `useChat().updateConfig(partial)` on commit (debounced for text/number fields, instant for toggles and selects). The panel reflects the change without remounting.
- [ ] The playground renders in a two-column layout on desktop (`lg:` breakpoint): `<ChatPanel />` left, form right, both at full content height. On mobile it collapses to a stacked layout with a button to toggle the form.
- [ ] `pnpm typecheck` and `pnpm build` both pass with zero new errors. `pnpm test:unit` passes (existing tests untouched).
- [ ] Browser smoke test: open `http://127.0.0.1:5173/#live-demo`, confirm only one `<ChatPanel />` is on the page, mutate 5+ different fields across at least 3 sections (provider, model, UI), confirm each mutation visibly affects the panel state without remounting. Screenshot captured for the report.

## Non-goals (explicit)

- No changes to the package source (`src/**` is the published npm package — we only touch `demo/**`).
- No new dependencies. We only use shadcn primitives already vendored in `src/components/ui/**` (Tabs, Select, Input, Switch, Slider, Collapsible, Badge, ScrollArea).
- No refactor of `demo/src/lib/chat-configs.ts` — we keep `buildCodingBuddyConfig()` as-is and just consume it from the new playground.
- No persistence UI changes — `persistKey` is exposed as a field in the form but the persistence behavior itself is unchanged.
- No changes to the reference doc cards themselves (`ConfigField.tsx`, `ConfigReference.tsx`) — those keep working. The playground becomes a sibling, not a replacement for the reference.

## Plan (blocks)

### Block 1: De-duplicate the chat panels (estimated: 10 min)

- [ ] Delete `demo/src/components/LiveConfigPlayground.tsx` (replaced by new file in block 2).
- [ ] Update `demo/src/components/ConfigReferenceSection.tsx` to no longer render `<LiveConfigPlayground />` — it only renders `<ConfigReference />` (the doc grid).
- [ ] Keep the existing `LiveDemoSection` for now (will be its replacement).
- [ ] **Verify:** `pnpm typecheck` passes; only one `<ChatPanel />` left in the source tree (grep for `<ChatPanel` returns 2: one in `LiveDemoSection.tsx`, one in the new file we'll create in block 2). Page still loads on the dev server.

### Block 2: Create `UnifiedPlayground.tsx` with Coding Buddy defaults + two-column layout (estimated: 25 min)

- [ ] New file `demo/src/components/UnifiedPlayground.tsx`:
  - Renders the same shape as `LiveDemoSection` but internally uses a two-column `lg:grid-cols-[1fr_360px]` grid: left column = `<ChatPanel config={codingBuddyConfig} layout="panel" className="shadow-2xl" />`; right column = placeholder for the form (filled in block 3).
  - Imports `buildCodingBuddyConfig` from `demo/src/lib/chat-configs.ts` so the persona, system prompt, suggestions, and always-on document are exactly what shipped before.
  - Wraps everything in a single `<ChatProvider>` so the form can call `useChat()`.
- [ ] Wire `UnifiedPlayground` into `LiveDemoSection.tsx` (replace the inline `<ChatPanel />` with `<UnifiedPlayground />`).
- [ ] Remove the `<ConfigReferenceSection />` from `App.tsx` (its form is gone, the reference doc cards remain accessible via the doc page).
- [ ] **Verify:** `pnpm typecheck && pnpm build` pass; browser shows the Coding Buddy panel on the left and an empty card on the right at `lg` viewport; `ChatHeader` shows "Coding buddy" persona; form side has no content yet but layout is solid.

### Block 3: Form — Provider + Model sections (estimated: 30 min)

- [ ] In `UnifiedPlayground.tsx`, add a `<Form />` component on the right column that calls `useChat()` and renders 2 collapsible sections: **Provider** (10 fields) and **Model** (8 fields).
- [ ] Field controls: `Select` for enums (`provider.kind`, `authHeader`, `model.provider`), `Input` for strings (`baseUrl`, `apiKey`, `model.id`, `model.label`), `Input type="number"` for numbers (`contextWindow`, `maxOutput`), `Switch` for booleans (`vision`, `tools`).
- [ ] On any change: `updateConfig({ provider: { ...current, kind: next } })` (shallow merge, debounce 250ms for text fields).
- [ ] **Verify:** Browser smoke test — change `provider.kind` to `openai`, confirm `Select` updates the value, the "unsaved" badge appears, click Apply → panel header model info updates without remount. Change `model.id` from `MiniMax-M3` to `gpt-4o` → same. Console clean (no React warnings about controlled/uncontrolled inputs).

### Block 4: Form — Behavior + Resilience + Personality & tools sections (estimated: 30 min)

- [ ] Add 3 more collapsible sections to the right-column form: **Behavior** (systemPrompt as Textarea, temperature/topP as number Input sliders, maxContextTokens as number, stopSequences as comma-separated string), **Resilience** (retry.attempts/initialDelayMs/maxDelayMs as number Inputs, persistKey as string Input with a "disable persistence" Switch, onResponse/onError left as read-only code chips because they require closures), **Personality & tools** (personality.name/avatar/locale as Inputs, personality.tone as Select, personality.customTone as Textarea).
- [ ] Tools array: render a single-line summary ("3 tools registered" or "no tools") and a Button "Add sample tool" that pushes a weather tool into `config.tools` for demo purposes (handler is a stub `async () => ({})`).
- [ ] **Verify:** Smoke test — change `systemPrompt` from "Edd's friendly coding buddy..." to "You are a pirate." and confirm the assistant's next response reflects the new system prompt. Toggle persistKey to `false` and confirm the conversation is no longer saved. Browser console clean.

### Block 5: Form — UI section + mobile responsiveness + final verification (estimated: 30 min)

- [ ] Add the **UI** section to the form: 35 toggles/inputs grouped in sub-categories (text: title/subtitle/placeholder/greeting; toggles: 14 booleans for show/enable flags; attachments: maxFileSizeMb number + acceptedFileTypes comma string; theming: theme Select, accentColor Input, fontFamily Input, density Select; layout: layout Select, height/width Inputs, position Select).
- [ ] Add a small `<media>` query (Tailwind `lg:` breakpoint already used) — on mobile, the right column collapses to a `<Collapsible>` drawer triggered from a button above the panel ("Open config").
- [ ] **Verify:** End-to-end smoke test (acceptance criteria #6): mutate fields in Provider + Model + UI sections, confirm each applies, screenshot, attach to report. `pnpm typecheck && pnpm build && pnpm test:unit` all pass. Browser console clean across the full smoke run.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| 72 inputs in one form causes React re-render storms / laggy typing | medium | medium | Use `useDeferredValue` for the draft state; commit `updateConfig` debounced (250ms for text, instant for selects/toggles). Memoize per-section subcomponents. |
| Updating `systemPrompt` mid-conversation breaks the engine's pending stream | low | medium | The engine reads `config` on each new turn, so mid-stream changes don't affect the in-flight response. We document this in a one-line comment near the field. |
| Two-column layout breaks on smaller `lg` viewports (laptops 1024-1280px) | medium | low | Use `lg:grid-cols-[1fr_360px]` only above 1280px; below that the form stacks under the panel via `lg:flex` + `order-` utilities. Verified manually after block 2. |
| Form fields desync from `config` (controlled inputs going stale) | medium | medium | All field values are derived from `config` via `useMemo`; reset on `config` change (already a known pattern from the existing `PlaygroundFooter`). |
| Mixing `useChat().updateConfig()` (partial) with the Playwright test fixtures | low | low | No new tests for the form (acceptance is browser smoke test); existing tests in `tests/` are package-level and don't touch the demo. |

## Verification (end-to-end)

- [ ] `pnpm typecheck` exits 0
- [ ] `pnpm build` exits 0
- [ ] `pnpm test:unit` exits 0
- [ ] Browser: `http://127.0.0.1:5173/#live-demo` shows one `<ChatPanel />`, left column on `lg` viewport
- [ ] Browser: mutate 5+ fields across Provider / Model / UI, each applies without remount
- [ ] Browser: console has 0 errors and 0 React warnings during the smoke run
- [ ] Screenshot of the unified playground in its final state attached to the final report
- [ ] `grep -r "<ChatPanel" demo/src/` returns exactly 1 hit (in `LiveDemoSection.tsx`)

## References

- Previous chat playground: `demo/src/components/LiveConfigPlayground.tsx` (to be deleted in block 1)
- Catalog of 72 fields: `demo/src/content/config-reference.ts`
- Field card component: `demo/src/components/ConfigField.tsx` (we mirror its visual style for the form controls)
- Persona config: `demo/src/lib/chat-configs.ts` — `buildCodingBuddyConfig()`
- `useChat().updateConfig` signature: `src/components/chat/ChatProvider.tsx:114-116`
- Spec template: `specs/spec_template.md`
- AI-OS workflow: `workflows/project_start.md`

## Notes

- We keep `ConfigReference.tsx` and `ConfigField.tsx` because the doc grid below the playground still uses them — they're not duplicated by the new form, they complement it.
- The user's decision "todos los posibles" (all possible fields) drove the 72-field scope. The collapsible-section pattern keeps the form usable at that scale.
- The previously shipped `LiveConfigPlayground.tsx` was 258 lines and exposed only 4 fields. The replacement is one file but ~600-700 lines because the field count demands explicit control elements per field.
- Branching: this is `main`, same as the previous session's commits. No branch isolation needed (no `design-v3-definition` sandbox pattern here — this is the public npm demo).