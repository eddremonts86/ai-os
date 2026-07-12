# Spec: rewrite ai-schadcn-chat with official shadcn chat components + full test suite + browser verification

## Metadata
- **Date:** 2026-06-28
- **Status:** in-progress
- **Blocks:** 4 (each <= 30 min, dispatched in parallel)
- **Author:** Edd
- **Reviewer:** Edd
- **Project root:** `/Users/edd/Projects/eddremonts86/ai-schadcn-chat/`

## Objective
Replace the hand-rolled "shadcn-style" chat components in `ai-schadcn-chat` with the OFFICIAL shadcn chat components sourced from `ui.shadcn.com` / `github.com/shadcn-ui/ui`. Add a real test suite (vitest unit + playwright e2e). Verify end-to-end with the browser MCP that the demo at `http://localhost:5173/` renders and connects to MiniMax without errors.

## Context
The package was scaffolded with custom components (`MessageBubble.tsx`, `Markdown.tsx`, `AttachmentChips.tsx`, `ChatHeader.tsx`, etc.) that only *look* like shadcn but are not the official ones. The user (Edd) flagged this and asked for:

- The 7 official shadcn components (Attachment, Bubble, Marker, Message, MessageScroller, MessageInput)
- The 2 official utility files (scroll-fade, shimmer)
- A real test suite (30+ unit tests, 1 e2e)
- Browser verification with screenshots
- Parallel execution via sub-agents

The user is paying per token. I delivered a half-baked result that the user rightly called out. The lesson: never claim "typecheck verde" as done. The acceptance bar is **runtime evidence** + **real tests** + **browser screenshots**.

## Acceptance criteria
- [ ] `Attachment`, `ChatBubble`, `MessageMarker`, `Message`, `MessageScroller`, `MessageInput` exist in `src/components/chat/` and are sourced from the shadcn-ui repo or `ui.shadcn.com` (not re-implementations).
- [ ] `scrollFadeStyles` and `shimmerStyles` utilities exist (or are merged into the existing `src/lib/utils.ts`).
- [ ] Old hand-rolled components (`MessageBubble.tsx`, `AttachmentChips.tsx`, `Markdown.tsx`) are removed or no longer exported.
- [ ] `src/components/index.ts` re-exports the new components.
- [ ] `pnpm typecheck` exits 0.
- [ ] `pnpm build` produces `dist/`.
- [ ] `pnpm test:unit` runs 30+ tests, all passing.
- [ ] `pnpm test:e2e` runs at least 1 playwright test against the demo (auto-skip if server is down).
- [ ] Browser screenshot of `http://localhost:5173/` taken with chrome-devtools-mcp, saved to `/tmp/ai-schadcn-chat-final.png`, shows the chat panel with no console errors.
- [ ] Real MiniMax reply verified: send a message, get a streamed response (text "PONG" works as a smoke test).
- [ ] No infinite-update loop in MessageList (the `useLayoutEffect → measure → setState` loop we just hit is fixed and stays fixed).
- [ ] Final git commit does NOT include `.env`, `node_modules/`, `dist/`, `coverage/`, `playwright-report/`, `*.tsbuildinfo`.

## Non-goals (explicit)
- Will NOT publish to npm.
- Will NOT change the public API surface of `defaultConfig`, `ChatPanel`, or `ChatProvider` (the user accepted the current shape; we're swapping internals only).
- Will NOT change the streaming provider code (anthropic.ts, openai.ts, base.ts) unless a shadcn component requires it.
- Will NOT add a state-management library (zustand, jotai, etc.). React 19 hooks only.
- Will NOT migrate to a different bundler (sticking with tsup + Vite).

## Plan (blocks)

### Block 1: source official shadcn components (parallel sub-agent) — ~25 min
- Clone `github.com/shadcn-ui/ui` at depth 1 into `/tmp/shadcn-ui`.
- Extract the 6 chat components (Attachment, ChatBubble, MessageMarker, Message, MessageScroller, MessageInput) and 2 utility files (scroll-fade, shimmer).
- Copy them into `src/components/chat/` and `src/lib/utils.ts` (or `src/components/chat/utils.ts`).
- Adapt props to accept our `ChatMessage` / `ChatConfig` types via thin adapter wrappers.
- Update `src/components/index.ts` to re-export.
- **Verify:** `pnpm typecheck` exits 0.

### Block 2: test suite (parallel sub-agent) — ~25 min
- Add devDeps: `@testing-library/jest-dom`, `@testing-library/react`, `@playwright/test`.
- `vitest.config.ts` + `tests/setup.ts` (jsdom, matchMedia/IntersectionObserver/ResizeObserver stubs).
- 30+ unit tests across `tests/lib/`, `tests/providers/`, `tests/components/`.
- 1 playwright e2e test that hits the live demo (auto-skip if server is down).
- Update `package.json` scripts: `test`, `test:unit`, `test:e2e`, `test:watch`.
- **Verify:** `pnpm test:unit` reports 30+ tests, all passing, exit 0.

### Block 3: browser verification (parallel sub-agent) — ~20 min
- Use `chrome-devtools-mcp` to:
  - Navigate to `http://localhost:5173/`.
  - Capture `/tmp/ai-schadcn-chat-initial.png` (empty state).
  - Type "Responde SOLO con la palabra: PONG" and submit.
  - Capture `/tmp/ai-schadcn-chat-reply.png` (after 8s).
  - Verify `document.querySelectorAll('[data-message-id]').length >= 2` via `evaluate_script`.
  - Send a longer message with code block request, capture `/tmp/ai-schadcn-chat-codeblock.png`.
  - Check `list_console_messages` for errors.
- **Verify:** all 4 screenshots saved, no console errors, "PONG" present in assistant reply.

### Block 4: integration + commit (parallel sub-agent, after blocks 1-3) — ~15 min
- After blocks 1-3 complete: re-run `pnpm typecheck`, `pnpm test:unit`, `pnpm build`.
- Take final browser screenshot → `/tmp/ai-schadcn-chat-final.png`.
- Update `package.json` scripts (ensure `test` is the runner, `prepare` is `npm run build`).
- Update `README.md` to list the official shadcn components.
- `git add -A` (verify `.env`, `node_modules`, `dist`, `coverage`, `playwright-report` are NOT staged).
- `git commit -m "feat: rewrite chat with official shadcn components + full test suite"`.
- **Verify:** clean commit, all gates from `verification-before-completion` skill pass.

## Risks and mitigation
| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| shadcn-ui repo doesn't have the chat components in the expected paths | med | high | Fall back to `web_fetch` of each `ui.shadcn.com` URL. The user gave the URLs explicitly. |
| shadcn components pull deps the package doesn't have | high | med | Add deps minimally; document each one. |
| The new MessageList still has the infinite-update loop | low | high | Block 1 must verify with `data-message-id` count staying stable after 5s idle. |
| Tests are flaky due to async streaming | med | med | Use `vi.useFakeTimers` for engine tests; mock the provider. |
| Playwright can't reach `http://localhost:5173/` | low | med | Auto-skip the e2e test if `fetch` fails. Don't fail the test suite. |
| `pnpm build` fails after component rewrite | med | high | Block 1 must include `pnpm typecheck` as a gate before declaring done. |
| `miniMax` API rate-limits during browser test | low | low | Smoke test with short prompt ("PONG"). |

## Verification (end-to-end)
- [ ] `pnpm typecheck` exits 0
- [ ] `pnpm test:unit` 30+ tests, all passing
- [ ] `pnpm test:e2e` runs (or skips with reason) and produces a screenshot
- [ ] `pnpm build` produces `dist/`
- [ ] `pnpm demo` serves on `http://localhost:5173/` returning 200
- [ ] `chrome-devtools-mcp` shows the chat panel with no console errors
- [ ] Sending "Responde SOLO con la palabra: PONG" returns a reply containing "PONG"
- [ ] `git log --oneline | head -3` shows the new commit
- [ ] `git ls-files | grep -E '\.env$|node_modules|dist' | wc -l` returns 0

## References
- https://ui.shadcn.com/docs/components/radix/attachment
- https://ui.shadcn.com/docs/components/radix/bubble
- https://ui.shadcn.com/docs/components/radix/marker
- https://ui.shadcn.com/docs/components/radix/message
- https://ui.shadcn.com/docs/components/radix/message-scroller
- https://ui.shadcn.com/docs/utils/scroll-fade
- https://ui.shadcn.com/docs/utils/shimmer
- https://github.com/shadcn-ui/ui (source of truth)
- `/Users/edd/Projects/ai-os/workflows/coding.md`
- `/Users/edd/Projects/ai-os/verifiers/critic_prompt.md`
- `/Users/edd/Projects/ai-os/verifiers/quality_checklist.md`
- `~/.claude/skills/verification-before-completion/SKILL.md`
- `~/.claude/skills/code-review-and-quality/SKILL.md`

## Notes
- The user explicitly demanded the **OFFICIAL** shadcn components. Re-implementations are not acceptable.
- The user is paying per token. No drive-by refactors, no re-implementing things that already exist.
- I previously had a `useLayoutEffect → virtualizer.measure() → setState` infinite loop. The new MessageScroller from shadcn must NOT recreate this. Block 1 must verify.
- The dev server on port 5173 may still be running from the previous session. Block 3 must handle this (either reuse it or restart cleanly).
