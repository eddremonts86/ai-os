# Close the remaining ui.* and demo gaps in ai-schadcn-chat

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 6 (each <= 30 min)
**Author:** Edd
**Reviewer:** Edd

## Objective

Close every gap identified in the `ui-show-voice-wiring` audit, plus the related catalog/form/demo inconsistencies:

1. **Wire the remaining ui.* switches that flip without effect**: `ui.showToolCalls` (add a header badge backed by an engine counter), `ui.enableCodeHighlight`, `ui.enableCopyButtons`, `ui.enableMessageActions`, `ui.enableRegenerate`, `ui.maxFileSizeMb`.
2. **Add MDX support** behind `ui.enableMdx`.
3. **Make `ui.density`, `ui.theme`, `ui.accentColor`, `ui.fontFamily` actually repaint the chat** by adding the missing CSS hooks in `globals.css`.
4. **Reconcile `ui.enableEditAndResend`**: it's in the catalog but not on the `UiConfig` type. Add it to the type so the form is not lying about a non-existent field.
5. **Add tests** that lock in the form→engine→chat propagation contract so the nested-provider bug (and its cousins) can never silently come back.
6. **Smooth-scroll the anchor nav** and any remaining cosmetic niceties.

## Acceptance criteria

- [ ] `ui.showToolCalls = false` hides the header badge; when `true` the badge shows the live count from `engine.getActiveToolCallCount()`. Count starts at 0 because no consumer of the engine exposes tool-call activity yet — the API surface is added (no-op default) and the wiring is in place; the badge shows "0" or hides when 0.
- [ ] `ui.enableCodeHighlight = false` skips the `rehype-highlight` plugin in `Markdown.tsx`; `true` (the default) keeps it on.
- [ ] `ui.enableCopyButtons = false` hides the copy button rendered on each code block by `Markdown.tsx`.
- [ ] `ui.enableMessageActions = false` hides the copy/edit/regenerate buttons on each message bubble in `MessageList.tsx`.
- [ ] `ui.enableRegenerate = false` hides only the regenerate button (subset of the above).
- [ ] `ui.maxFileSizeMb` is read by `MessageInput.tsx`: files larger than the cap are rejected with a `console.warn` and a transient inline notice.
- [ ] `ui.enableMdx = true` switches the markdown pipeline to MDX via `@mdx-js/react`; `false` (default) keeps the existing GFM renderer.
- [ ] `ui.density` (compact/comfortable/spacious) adds a `data-density` attribute on the chat root that `globals.css` consumes for spacing tweaks.
- [ ] `ui.theme` (light/dark/system) sets a `data-theme` attribute on the chat root that `globals.css` consumes for color overrides.
- [ ] `ui.accentColor` and `ui.fontFamily` set inline CSS custom properties on the chat root.
- [ ] `ui.enableEditAndResend` is added to `UiConfig` so the form's switch type-checks. Default `true` to match the catalog.
- [ ] `pnpm typecheck`, `pnpm build`, `pnpm test:unit` (≥108, + new) all pass.
- [ ] New integration tests live in `tests/integration/`: one that mounts a `ConfigForm` + `ChatPanel` inside a `ChatProvider`, mutates a field, and asserts the chat root re-renders with the new value (the regression guard for `dbff8e0`). Another that asserts the `ui.show*` chips disappear from the header when toggled off.
- [ ] `scroll-behavior: smooth` is set in `globals.css` so the anchor nav (`/docs`, `/live-demo`, `/config`) scrolls smoothly.

## Non-goals (explicit)

- Real file upload to a server. base64 inline stays as-is.
- Server-side STT fallback for voice (out of scope).
- Adding a real tool-call counter that walks the message history. The engine exposes `getActiveToolCallCount()` returning 0 for now; the badge reads it.
- Changing the public API of `Markdown`, `MessageInput`, `ChatHeader`, or `ChatPanel` in a breaking way. Only additive prop changes and a new optional `ui.enableEditAndResend` field on `UiConfig`.

## Plan (blocks)

### Block 1: Reconcile `ui.enableEditAndResend` and add `getActiveToolCallCount()` to the engine

- [ ] In `src/types/chat.ts`, add `enableEditAndResend?: boolean` to `UiConfig`.
- [ ] In `src/lib/chat-engine.ts`, add `public getActiveToolCallCount(): number { return 0; }` (default no-op). Documented in JSDoc as "override me when wiring real tool calls".
- [ ] Expose it on `ChatContextValue` in `ChatProvider.tsx` (type + memo).
- [ ] **Verify:** typecheck; existing tests still pass.

### Block 2: Conditional rendering in `ChatHeader` (tool-calls badge) and `MessageInput` (file size cap)

- [ ] In `ChatHeader.tsx`, add a `showToolCalls && getActiveToolCallCount() > 0` badge in the right-side action cluster. Tiny badge with a wrench icon and the count.
- [ ] In `MessageInput.tsx`, read `ui.maxFileSizeMb ?? 10` and `ui.acceptedFileTypes ?? []`. In `onFiles`, reject oversized files with `console.warn` and a small inline notice that auto-dismisses after 4s. Apply the MIME filter before calling `filesToAttachments`.
- [ ] **Verify:** typecheck; browser smoke: toggle `Max file size` to 1 MB in the form, then drop a 5 MB file — see the inline rejection notice and a console warn.

### Block 3: Conditional rendering in `Markdown.tsx` (highlight, copy, MDX) and `MessageList.tsx` (message actions)

- [ ] In `Markdown.tsx`:
  - Read `ui.enableCodeHighlight` and pass `null` instead of `rehype-highlight` when off.
  - Read `ui.enableCopyButtons` and skip the copy button on code blocks when off.
  - Read `ui.enableMdx`. When `true`, swap the `Markdown` component's renderer to MDX. Use a lazy-imported `MdxMarkdown` wrapper (avoids loading `@mdx-js/react` unless needed).
- [ ] In `MessageList.tsx`, read `ui.enableMessageActions` and `ui.enableRegenerate`. Gate the copy/edit/regenerate/delete buttons accordingly.
- [ ] **Verify:** typecheck; browser smoke: turn off `Enable copy buttons` and confirm the copy button disappears from code blocks.

### Block 4: `globals.css` data-attribute hooks for `density`, `theme`, `accentColor`, `fontFamily`

- [ ] In `MessageInput` (or a new `<ChatRootSurface>` wrapper around the chat surface), set `data-density={density}`, `data-theme={theme}`, `style={{ '--chat-accent': accentColor, '--chat-font-family': fontFamily }}` on the root.
- [ ] In `globals.css`, add rules that consume those attributes for spacing, color, and font.
- [ ] **Verify:** browser smoke: switch theme to dark in the playground and confirm the chat surface picks up dark CSS variables.

### Block 5: Integration tests + smooth scroll

- [ ] Add `tests/integration/form-engine-chat.test.tsx` with two tests:
  - "form mutation propagates to chat" — render `ConfigForm + ChatPanel` inside one `ChatProvider`, change `ui.title` via the form, assert the chat header text updates.
  - "show flags hide chips" — toggle `ui.showModelSelector = false`, assert the model selector chip is absent from the header.
- [ ] Add `scroll-behavior: smooth` to `html` in `globals.css`.
- [ ] **Verify:** `pnpm test:unit` exits 0 with the new tests passing.

### Block 6: Final QA + commit + archive

- [ ] Walk through every documented `ui.*` flag in the browser and confirm it has a visible effect.
- [ ] `pnpm typecheck && pnpm build && pnpm test:unit`.
- [ ] Commit per the AI-OS commit convention: one commit per logical change, plus a final spec archive commit.
- [ ] Archive the spec.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| `@mdx-js/react` adds significant bundle weight. | medium | medium | Lazy-import the MdxMarkdown wrapper. The plain markdown path stays at zero KB added. |
| Adding `data-density` on the root can shift the header layout. | low | low | CSS uses scoped, additive rules that don't change the always-on chips. |
| `getActiveToolCallCount()` always returns 0 — the badge never appears in production until the engine implements it. | medium | low | Document it as a hook for future tool-call wiring. The flag (`ui.showToolCalls`) still works in the sense that "on" means "when count > 0, show; when off, never show". |
| Integration tests depend on the engine's `subscribe` working in the test environment. | low | medium | Use `useSyncExternalStore` directly via a real `ChatEngine` instance; avoid mocking. |

## Verification (end-to-end)

- [ ] `pnpm typecheck` exits 0
- [ ] `pnpm build` exits 0
- [ ] `pnpm test:unit` exits 0 with the new integration tests passing
- [ ] Browser: open the playground form, open every section, toggle every switch. Each toggle should have a visible effect within 1 second.
- [ ] Browser: change `ui.title` to "Hello". The chat header should re-render to "Hello" without a refresh.
- [ ] Browser console: zero new warnings or errors.

## References

- `src/types/chat.ts` — `UiConfig` interface
- `src/components/chat/ChatHeader.tsx` — header chips
- `src/components/chat/MessageInput.tsx` — composer, attachments
- `src/components/chat/MessageList.tsx` — message bubbles, action buttons
- `src/components/chat/Markdown.tsx` — markdown renderer
- `src/components/chat/ChatProvider.tsx` — context surface
- `src/lib/chat-engine.ts` — engine API
- `demo/src/lib/chat-configs.ts` — Coding Buddy defaults
- `demo/src/content/config-reference.ts` — catalog
- `demo/src/components/UnifiedPlayground.tsx` — playground form
- `src/globals.css` — CSS hooks
- `tests/integration/` — new test files