# Ship the shadcn/scroller + shadcn/marker stylesheets from the package

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 4
**Author:** Edd

## Objective

The package's chat components use class names like `scroll-fade-b`,
`scrollbar-thin`, `scrollbar-gutter-stable`, `overscroll-contain`,
`contain-content`, and `data-autoscrolling:scrollbar-none` on the
MessageScroller viewport, plus `scroll-fade-x` and `snap-x` on
Attachment rows. The TypeScript classes are correct, but the CSS that
defines those utilities only lives in the demo's `globals.css` — a
consumer who installs `ai-schadcn-chat` and imports the package's
own `styles.css` gets nothing. Result: the chat viewport renders, the
content sits inside it, but the scroll affordances (fade mask, slim
gutter-stable scrollbar, scroll-pause hiding) silently break.

The same gap exists for the `shimmer` utility used by the `Marker`
component that the catalog and demo both reference, and for the
`Marker` component itself — `MessageList` references
`data-[state=running]` markers for in-flight tool calls but the
component does not exist in the package. Close both gaps.

## Acceptance criteria

- [ ] `src/styles/scroller.css` defines `scroll-fade-b`, `scrollbar-thin`, `scrollbar-gutter-stable`, `overscroll-contain`, `contain-content`, and `data-autoscrolling:scrollbar-none`. The file is a vendor copy of the demo's shadcn utilities, generalized to work without the demo's tailwind theme.
- [ ] `src/styles/marker.css` defines the `shimmer` animation and the necessary `@property` declarations so the marker streaming-text effect works.
- [ ] `src/components/chat/Marker.tsx` exposes `Marker`, `MarkerIcon`, and `MarkerContent` matching the upstream shadcn-rhea API (variant: default | border | separator, role, render prop).
- [ ] `scripts/postbuild.mjs` copies both new CSS files into `dist/`.
- [ ] `package.json` exports declare `./scroller.css` and `./marker.css` as new subpath exports, both pointing at `dist/<name>.css`.
- [ ] `MessageScroller` (existing) and `MessageList` import the new CSS at module load via `import "./scroller.css"` so consumers do not need to remember to wire the CSS.
- [ ] Browser smoke: open the chat in the demo, scroll the message list, and confirm the fade mask animates and the scrollbar appears/disappears per the configured states.
- [ ] Browser smoke: with a message whose `status === "running"`, the `Marker` for that tool call uses the running icon (`Loader2`) and the streaming text gets the shimmer animation.
- [ ] `pnpm typecheck`, `pnpm build`, `pnpm test:unit` (≥115) all pass.
- [ ] No console warnings introduced.

## Non-goals

- The MessageScroller primitives (the headless Provider/Viewport/Content/Item) are already feature-complete — only the styled layer + CSS were missing. This spec does not touch the primitives.
- The Marker component does not need its own story. It just needs to exist and the existing MessageList should swap its inline JSX for the Marker component.

## Plan (blocks)

### Block 1: Vendor the scroller + marker CSS as package-shipped stylesheets

- [ ] Create `src/styles/scroller.css` (scroller utilities).
- [ ] Create `src/styles/marker.css` (shimmer + property declarations).
- [ ] Update `scripts/postbuild.mjs` to copy both files into `dist/`.
- [ ] Add `./scroller.css` and `./marker.css` subpath exports in `package.json`.
- [ ] **Verify:** `pnpm build` emits `dist/scroller.css` and `dist/marker.css`. `pnpm typecheck` passes.

### Block 2: Build the Marker component

- [ ] Create `src/components/chat/Marker.tsx` with `Marker`, `MarkerIcon`, `MarkerContent` — match upstream shadcn-rhea API surface.
- [ ] Export from `src/components/chat/index.ts` and from `src/index.ts`.
- [ ] Replace the inline `Marker` JSX in `MessageList.tsx` with the new component, threading `status` and `name` from the tool call.
- [ ] **Verify:** `pnpm typecheck`; `pnpm test:unit` still passes; browser shows a styled marker for the running tool call.

### Block 3: Wire the CSS into the components and demo

- [ ] Add `import "./scroller.css"` and `import "./marker.css"` at the top of `src/components/chat/MessageScroller.tsx` and `src/components/chat/Marker.tsx` so consumers do not need a separate CSS import.
- [ ] Add the equivalent CSS imports in the demo's main entry, plus a comment explaining that the package auto-loads the CSS internally — the demo is double-loading only for safety.
- [ ] **Verify:** `pnpm typecheck`; browser smoke confirms scroll-fade mask animates when scrolling.

### Block 4: Final QA + commit + archive

- [ ] `pnpm typecheck && pnpm build && pnpm test:unit`.
- [ ] Manual scroll test in the browser.
- [ ] One commit per block, plus the spec archive commit.
- [ ] Archive the spec.

## Risks and mitigation

| Risk                                                                                                                           | Probability | Impact | Mitigation                                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------ | ----------- | ------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| The CSS files contain a `@property` declaration that needs CSS Houdini support (Chromium-only).                                | medium      | low    | Fall back to a simpler animation for non-supporting browsers. The fade mask is progressive enhancement.                                                               |
| Importing CSS at module load side-effect (via `import "./scroller.css"`) makes the package non-tree-shakable for those styles. | low         | low    | Acceptable — the scroller and marker are core surfaces. Treeshaking the styles would force consumers to wire each one manually, which is what caused the current gap. |
| The shadcn-rhea `Marker` API might not match exactly what MessageList already does inline.                                     | medium      | low    | Re-export the same props the existing inline JSX used. The MessageList already calls it correctly.                                                                    |
