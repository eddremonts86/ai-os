---
name: micro-interactions
description: "Use when adding, auditing, or refining motion in a frontend — hover/press/focus states, enter/exit transitions, list reordering, layout shifts, loading and skeleton states, scroll-linked effects, or page transitions. Covers easing-curve choice, duration budgets, staggering, spring vs tween, reduced-motion accessibility, and a three-lens review (purpose, physics, performance) to catch motion that is decorative, janky, or distracting. Use for React/Vue/Tailwind/Framer-Motion/CSS work when the ask is specifically about how things move, not overall visual design. For broad UI/visual redesign use impeccable or taste-skill instead."
user-invocable: true
allowed-tools: Read, Write, Edit, Grep, Glob, Bash
license: Apache 2.0
---

# Micro-interactions & Motion

Add and audit motion that has a reason to exist. Every animation must earn its
milliseconds: guide attention, confirm an action, or express state — never decorate.

## When to activate

- Adding hover/press/focus feedback, transitions, or page/route animations.
- A UI "feels static", "feels janky", or "feels cheap" and motion is the fix.
- Reviewing existing motion for restraint, accessibility, and performance.

Not for full visual redesign (→ `impeccable`, `taste-skill`) or backend work.

## The three-lens audit

Review every animation through three lenses. If it fails any lens, cut or fix it.

1. **Purpose** — What does this motion communicate? If you can't name the state
   change or the attention it directs, delete it. Decorative motion is noise.
2. **Physics** — Does it move like a real object? Match easing to intent:
   - `ease-out` (fast→slow) for elements entering / responding to user input.
   - `ease-in` (slow→fast) for elements leaving the screen.
   - `ease-in-out` for elements moving within the viewport (A→B).
   - Springs for anything the user directly manipulates (drag, toggle, pull).
3. **Performance** — Animate only `transform` and `opacity` (compositor-only, no
   layout/paint). Never animate `width`/`height`/`top`/`left`/`margin`. Use
   `will-change` sparingly and remove it after. Target 60fps; profile if unsure.

## Duration budget

| Interaction | Range |
|---|---|
| Hover / press / focus feedback | 100–150ms |
| Small enter/exit (tooltip, dropdown, toast) | 150–250ms |
| Modal / drawer / sheet | 250–400ms |
| Page / route transition | 300–500ms |
| Staggered list (per item) | 30–60ms offset, cap total ~400ms |

Slower than these reads as sluggish; faster than ~80ms reads as a glitch.
When in doubt, err shorter.

## Non-negotiables

- **Reduced motion**: wrap non-essential motion in
  `@media (prefers-reduced-motion: reduce)` (or the framework equivalent) and
  fall back to an instant/opacity-only change. This is an accessibility
  requirement, not optional polish.
- **Interruptibility**: user-driven animations (drag, toggle) must be
  interruptible mid-flight — springs handle this; fixed-duration tweens fight it.
- **No layout thrash**: batch reads/writes; prefer `transform` over layout props.
- **Consistency**: reuse a small set of tokens (durations, easings) across the
  app instead of hand-picking values per component.

## Tokens (starting point — adapt to the design system)

```css
--ease-out: cubic-bezier(0.16, 1, 0.3, 1);
--ease-in-out: cubic-bezier(0.65, 0, 0.35, 1);
--dur-fast: 120ms;
--dur-base: 220ms;
--dur-slow: 360ms;
```

## Workflow

1. Identify the state change or intent. If none, stop — no motion needed.
2. Pick the lens-2 easing and a lens-3-safe property (`transform`/`opacity`).
3. Set duration from the budget table; add stagger only for 3+ sibling items.
4. Add the reduced-motion fallback.
5. Verify at runtime: exercise the interaction in the browser, watch for jank,
   toggle "reduce motion" in OS settings and confirm the fallback. Do not claim
   done from code alone.

## Framework notes

- **Framer Motion / motion**: prefer `whileHover`/`whileTap`/`layout` and
  `AnimatePresence` for exits; use `transition={{ type: 'spring' }}` for
  direct-manipulation UI. Respect `useReducedMotion()`.
- **CSS/Tailwind**: `transition-transform`, `transition-opacity`, custom
  easing via arbitrary values; gate with the reduced-motion variant.
- **Vue**: `<Transition>`/`<TransitionGroup>` with `transform`/`opacity` classes.
