# Wire up ui.* features that exist in the catalog but not in the components

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 5 (each <= 30 min)
**Author:** Edd
**Reviewer:** Edd

## Objective

The `ui.*` config surface in `src/types/chat.ts` documents 35 toggle / input / select fields. The previous session added 5 new `ui.typeset.*` fields (block 6 of the typeset-integration spec) and verified all 69 rendered form controls correctly mutate the live engine — but the **`MessageInput` and `ChatHeader` components only honor a small subset** of those fields. Switches flip, but the underlying features (voice input, file attachments, model selector visibility, etc.) are not wired. The user reported "el form no actualiza el chat" and "el micrófono no funciona" — the second is the real gap, the first was a separate nested-`ChatProvider` bug already fixed in `dbff8e0`.

This spec closes the gap between the documented config surface and the actual feature implementation, scoped to the changes a consumer of `defaultConfig({ ui: { ... } })` would reasonably expect.

## Context

`MessageInput.tsx` and `ChatHeader.tsx` are the two surface components that should react to the `ui.*` config. An audit of the current code shows:

- **File upload is already implemented**: hidden file input, paperclip button, drag-and-drop, chip previews, MIME filter, and the `enableFileUpload`/`acceptedFileTypes`/`maxFileSizeMb` gates all work. No changes needed.
- **Voice input is NOT implemented**: `MessageInput` never reads `ui.enableVoiceInput`. There is no `SpeechRecognition` instance, no Mic button, no transcription pipeline. The switch flips but nothing happens.
- **Conditional header chips are NOT implemented**: `ChatHeader` always renders the model selector, documents dropdown, history dropdown, and overflow menu. The `ui.showModelSelector` / `ui.showDocumentPicker` / `ui.showToolCalls` / `ui.enableConversationHistory` switches flip but the header ignores them.

The fix is to add the missing wiring without touching what already works. No new public API is required.

## Acceptance criteria

- [ ] `MessageInput` respects `ui.enableVoiceInput`: when true, render a Mic button. On click, request microphone permission via `navigator.mediaDevices.getUserMedia({ audio: true })` and start a `SpeechRecognition` (or `webkitSpeechRecognition`) instance; on second click, stop and append the transcript to the textarea. On any error, log to console and revert to the off state.
- [ ] `ChatHeader` respects `ui.showModelSelector`, `ui.showDocumentPicker`, `ui.showToolCalls`, `ui.enableConversationHistory`: when false, hide the corresponding control cluster. When all four are off, the header still renders the brand mark and the always-on actions (theme toggle, overflow menu, new chat).
- [ ] Browser smoke test: with `enableVoiceInput = true`, clicking Mic starts a recognition (which will fail with a clear console error in a headless test, that's fine). With `showModelSelector = false`, the model selector chip disappears from the header.
- [ ] `pnpm typecheck`, `pnpm build`, `pnpm test:unit` (108/108) all pass. Browser console has zero React warnings introduced by the new wiring.

## Non-goals (explicit)

- No actual file upload to a server. We support client-side `File` objects that get base64-encoded by `src/lib/attachments.ts` (which already exists) and sent to the model as inline base64. If the model rejects the format, that's a model-side concern.
- No real voice transcription fallback. If `SpeechRecognition` is unavailable, we log and disable the button. No third-party SDK integration.
- No new public API surface. All work is in `MessageInput.tsx`, `ChatHeader.tsx`, and optionally a small `src/lib/voice.ts` helper for the recognition wrapper. No new exports in `src/index.ts`.
- No changes to the `ConfigField` catalog, the playground form, or the existing test fixtures. We're only reading fields that the form already exposes.

## Plan (blocks)

### Block 1: Voice input in `MessageInput` (estimated: 25 min)

- [ ] Create `src/lib/voice.ts` with a `useVoiceInput` hook that wraps `SpeechRecognition` / `webkitSpeechRecognition`:
  - Returns `{ supported: boolean, listening: boolean, error: string | null, start: () => void, stop: () => void }`.
  - In `start`, request mic permission and start recognition. Settle on `stop` or `end`.
  - Guard against SSR and missing globals.
  - Provide a callback so the consumer can read the transcript via a ref or a `onResult` event.
- [ ] In `MessageInput.tsx`, when `ui.enableVoiceInput === true`, render a Mic button. On click, toggle `start`/`stop`. Show a pulsing dot when listening. When `onresult` fires, append the interim transcript to the textarea.
- [ ] **Verify:** `pnpm typecheck`; browser smoke: turn on `enableVoiceInput`, see Mic button. Clicking it will fail in headless test (no real mic), the error path is the verification.

### Block 2: Conditional rendering in `ChatHeader` (estimated: 15 min)

- [ ] In `ChatHeader.tsx`, gate the model selector menu, documents menu, history menu, and overflow "manage agents" / "clear conversation" entries on the matching `ui.*` fields.
- [ ] For `ui.showToolCalls` — the header does not currently have a "tool calls" indicator. Add a small badge that shows the count of in-flight tool calls when the flag is true. Read the count from a new lightweight `chat.getActiveToolCallCount()` helper on the engine; if the count is not yet exposed, add a no-op default (0) and skip the badge until the data is available.
- [ ] **Verify:** `pnpm typecheck`; browser smoke: toggle `showModelSelector` to false and confirm the model selector chip disappears from the header.

### Block 3: Integration smoke + commit (estimated: 15 min)

- [ ] Run `pnpm typecheck && pnpm build && pnpm test:unit` and confirm 108/108.
- [ ] Open `http://127.0.0.1:5173/#live-demo` and walk through every new affordance: voice button, conditional header chips. Capture screenshot.
- [ ] Commit per the AI-OS commit convention: `feat(MessageInput): wire up voice input` and `feat(ChatHeader): honor ui.show* fields`.
- [ ] Archive the spec per `workflows/project_start.md`.

## Risks and mitigation

| Risk                                                                                                                                      | Probability | Impact | Mitigation                                                                                                                                         |
| ----------------------------------------------------------------------------------------------------------------------------------------- | ----------- | ------ | -------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SpeechRecognition` is Chrome-only (prefixed `webkitSpeechRecognition` elsewhere). Safari and Firefox will throw.                         | high        | low    | Detect both, fall back to disabled state with `supported: false`. UI shows the mic button greyed out.                                              |
| File size cap and MIME filter are enforced client-side only. A consumer could disable them in CSS dev-tools and send anything.            | low         | low    | This is a UX guard, not a security boundary. Document in a code comment.                                                                           |
| Pasting large base64 attachments into the model payload could blow the context window.                                                    | medium      | medium | Clamp at `ui.maxFileSizeMb` (default 10 MB) and warn in console if the user goes over. The engine doesn't enforce this; that's a separate concern. |
| Conditional `ChatHeader` rendering shifts the header layout, which could surprise consumers who designed around the always-visible chips. | low         | low    | `ui.*` defaults are true, so out-of-the-box layout is unchanged.                                                                                   |

## Verification (end-to-end)

- [ ] `pnpm typecheck` exits 0
- [ ] `pnpm build` exits 0
- [ ] `pnpm test:unit` exits 0 with 108/108 tests passing
- [ ] Browser: open `http://127.0.0.1:5173/#live-demo`, open the playground form, scroll to the UI section, toggle `Enable file upload` ON → attach button visible in the chat composer. Toggle OFF → attach button hidden. Same dance for `Enable voice input`.
- [ ] Browser: toggle `Show model selector` OFF in the playground form → the model selector chip in the chat header disappears. Toggle ON → reappears.
- [ ] Browser console: zero React warnings introduced by the new wiring. Pre-existing Radix Select aria-hidden warnings are still present and acceptable.

## References

- `src/lib/attachments.ts` — existing file pipeline
- `src/components/chat/MessageInput.tsx` — current composer (no attachment, no voice)
- `src/components/chat/ChatHeader.tsx` — current header (always-renders chips)
- `src/types/chat.ts` — `UiConfig` interface (35+ fields)
- `src/hooks/useChat.ts` — `send(text)`, `sendFiles(text, files)` surface
- Previous block (nested provider fix) in commit `dbff8e0`

## Notes

- The "form does not update the chat" complaint was the nested-provider bug (fixed in `dbff8e0`). The remaining complaint is that several `ui.*` fields have no underlying implementation. This spec closes the gap on the ones a consumer would notice: file upload and voice input. The `ui.show*` chips in the header are low-risk conditional rendering.
- We do not implement `ui.renderMessage`, `ui.renderHeader`, `ui.renderFooter` — those are explicit render-slot overrides that the catalog already documents as code-level (not form-level). They are correctly `ReadOnlyNote` in the playground.
