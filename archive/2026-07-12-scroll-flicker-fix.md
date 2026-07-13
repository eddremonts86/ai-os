# Fix scroll flicker in MessageScroller when navigating up/down

**Date:** 2026-07-12
**Status:** draft
**Blocks:** 4
**Author:** Edd

## Objective

The chat surface has visible flicker on scroll up/down. Reproducible
in any chat that has multiple messages:

  - Flicker on first paint: scrollbar vanishes and reappears because
    `data-autoscrolling="false"` is hardcoded on the viewport but the
    CSS rule `data-autoscrolling:scrollbar-none` is active. The
    "autoscroll" attribute is a remnant of an unfinished feature.
  - Flicker while streaming: the viewport's `MutationObserver` fires
    on every character delta appended to a markdown <p>, calls
    `stateStore.setState({ scrollTop })`, which re-renders all
    `useSyncExternalStore` consumers (Header, JumpButton, etc.). The
    scroll position visually shifts because React re-renders the
    viewport at the same `scrollTop`, but the layout may have shifted
    by 1px due to font measurement rounding, and the user's eye picks
    it up.
  - Flicker on auto-scroll: the auto-scroll subscriber unconditionally
    sets `scrollTop = scrollHeight` on any state change, even if the
    user is trying to scroll up. The "is at the bottom" check uses a
    hardcoded 80px threshold that fires too early.
  - Flicker on prepend: when older messages are loaded (the
    "load earlier" pattern), React replaces the content tree and
    `scrollTop` resets to 0, snapping the viewport to the top
    instead of preserving the user's reading position.

## Acceptance criteria

- [ ] No `MutationObserver` on the viewport. Content mutations during
  streaming do not re-render the scroller state.
- [ ] `data-autoscrolling` is removed from the viewport's default
  attributes. The `data-autoscrolling:scrollbar-none` CSS rule is
  removed from `scroller.css` (or only kept behind a different name).
- [ ] Auto-scroll-to-bottom only triggers when the **last message
  content** changes (e.g. its height grows) and the user is **at the
  bottom edge** (within 4px, not 80px). It does not fire on
  arbitrary state changes.
- [ ] When older messages are prepended, the scroll position is
  preserved: the new content is rendered, then `scrollTop` is
  bumped by the prepended height delta so the previously-visible
  message stays in the same visual position.
- [ ] Browser smoke: open the playground, send 5 messages, scroll up
  to the second message, then verify the scroll position does not
  jump, flicker, or reset when streaming a new reply.
- [ ] `pnpm typecheck`, `pnpm build`, `pnpm test:unit` (≥121) all
  pass. Zero new console warnings.

## Non-goals

- The `MessageScrollerButton` (jump-to-end) keeps its current API and
  behaviour. It already works correctly when called.
- "Load earlier" is not implemented as a feature; we just guard
  against scroll position loss when a future caller uses
  `registerMessage` to add an item at index 0.
- The radix-rhea upstream API stays compatible. Public types and
  exports do not change.

## Plan (blocks)

### Block 1: Strip the MutationObserver + the stuck `data-autoscrolling` attr

- [ ] Remove the `MutationObserver` block in the Viewport's
  `useLayoutEffect`. The scroll + ResizeObserver subscriptions stay.
- [ ] Remove `data-autoscrolling="false"` from the viewport's
  rendered attributes. (It was a placeholder for an unfinished
  feature.)
- [ ] Remove the `[data-autoscrolling] { scrollbar-width: none }`
  rule from `scroller.css`. If a future need arises, document it as
  an opt-in via a new utility class, not an attribute.
- [ ] **Verify:** the viewport still updates `scrollTop`/`scrollHeight`
  on user scroll and on container resize.

### Block 2: Rewrite the auto-scroll to be content-driven, not state-driven

- [ ] Delete the subscribe-based auto-scroll effect in the Viewport.
- [ ] Replace it with a content-driven effect: take a
  `contentSignal` prop (a number or string that changes whenever the
  last message's content or height changes — wired by the parent
  MessageList) and call `scrollToEnd({ behavior: "auto" })` when it
  changes AND `useMessageScrollerVisibility().atEnd` is true.
- [ ] `MessageList` passes `contentSignal={messages.at(-1)?.id ?? ""}`
  to the scroller — when the last message's identity changes OR a
  streaming token arrives, the signal changes and the scroller
  re-runs the effect.
- [ ] Change the bottom-edge threshold from 80 to 4 pixels. 80px is
  the human "feels like the bottom" radius; we use 4 to mean "I
  was at the edge".
- [ ] **Verify:** programmatically scroll up to the middle of the
  transcript, send a new message, and confirm the scroller does
  not jerk back to the bottom.

### Block 3: Preserve scroll position on prepend

- [ ] The `MessageScrollerContent` component tracks its `scrollHeight`
  before and after its children change. If `scrollHeight` grew but
  `scrollTop` did not (i.e. the user was anchored to the top), bump
  `scrollTop` by the delta so the previously-first visible item
  stays put.
- [ ] The tracking is content-driven (uses the children identity,
  not a mutation observer). The previous block's content signal
  already gives us a stable handle.
- [ ] **Verify:** programmatically scroll to the top of a 50-message
  transcript, then load 10 older messages, and confirm the visible
  top item is still the same (or within 1px of it).

### Block 4: QA + commit + archive

- [ ] Run `pnpm typecheck && pnpm build && pnpm test:unit`.
- [ ] Manual browser smoke: open the playground, send 5 messages,
  scroll up, send a 6th, and watch for any scroll position change.
- [ ] One commit per block, then archive the spec.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| Removing the MutationObserver breaks some consumer that depended on the store firing on text changes. | low | low | Consumers that need the store can subscribe directly. The `setState` from the scroll/resize listeners is the supported contract. |
| Content-driven auto-scroll with a 4px threshold feels too eager. | low | low | Test on real-world chats; the upstream radix-rhea also uses a tight threshold. |
| Scroll-position preservation on prepend requires a layout-stable ancestor (no remounting of the content tree on the prepend tick). | medium | low | The fix is in the Content component, which is the direct ancestor of the items. As long as the items array reference is stable (only new items prepended), React reuses existing DOM nodes. |
| The `data-autoscrolling:scrollbar-none` rule may have been depended on by external CSS. | low | low | It was never documented, and the attribute was never set to `"true"`. Safe to remove. |
