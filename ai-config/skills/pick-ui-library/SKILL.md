---
name: pick-ui-library
description: Pick the library for a frontend task (toasts, charts, command menu, drag and drop, virtualization, animated numbers, OTP input, state, styling) from a curated list, checking package.json first. Only runs when explicitly invoked.
disable-model-invocation: true
license: MIT (Emil Kowalski) — see LICENSE
---

# Picking the right library

Adapted from Emil Kowalski's `pick-ui-library` ([emilkowalski/skills](https://github.com/emilkowalski/skills), MIT, `LICENSE` here).
The picks are his, deliberate and taste-driven; the "Our stack" section is AI-OS's.

A lookup, not a survey. Given a task ("I need toasts", "what for drag and drop?"), match it to the
list and recommend **one** library with a sentence on what it is for. Do not offer a menu when the
list has a clear answer.

## How to use it

1. **Identify the task**, not the library the user named. "A dropdown" is a UI-primitives task.
2. **Read `package.json` first.** If the project already uses a listed library, use it. If it uses a
   competitor (react-window instead of Virtuoso), say so but do not swap the dependency unasked.
3. If the task is not on the list, say so and recommend from your own knowledge, labelled as off-list.
4. Install and wire it up only when that is part of the request.

## Our stack

Our projects are shadcn/ui + Tailwind v4 + TanStack, so some picks already arrive through shadcn:

- **Primitives (dialogs, popovers, menus, selects):** the shadcn component in `components/ui/`, which
  sits on Radix or Base UI depending on the project's `components.json`. Do not add `base-ui` next to it.
- **Toasts** = Sonner, **charts** = recharts, **`className`** = `cn()` (clsx + tailwind-merge), **variants** = cva:
  shadcn already ships all four; reuse what is installed.
- **Not on this list, owned by other skills:** server state `tanstack-query`, routing `tanstack-router`,
  tables `tanstack-table`, forms `react-hook-form-zod`. State shared on the client: zustand, below.

## Components and blocks: the ranked registry index

For a component, block or section (not a library), search ui-indexador before writing one: the MCP tool
`search_items` (or `${UI_INDEXER_URL:-http://127.0.0.1:3040}/items?q=&kind=&type=block`). It indexes every item of
the ~300 healthy registries of the shadcn directory, ranked by proof of use (GitHub stars, then size, then endpoint
health), and returns the install command. The search is semantic: describe one piece at a time in English
("airport autocomplete", "passenger count stepper"), not the whole page; icons and demos are hidden by default. `list_registries` / `/registries?category=` ranks the registries themselves.

- Prefer the top of the matching category, an OSI licence (MIT, Apache-2.0) and a recent push. `NOASSERTION`
  means read the repo's licence before using it.
- Install the piece itself, not the whole library: `npx shadcn add @<registry>/<item>`.
- The detected repo can be wrong (it is read from the homepage); check it before relying on the stars.
- `list_facets` shows what the catalog can be filtered by (kind, type, layout, feature). Look at the shortlist
  (homepage, `list_captures`) before choosing; the index tags are heuristics read from names and code.

## The list

| Task | Library |
| --- | --- |
| Unstyled accessible primitives | [base-ui](https://base-ui.com) (see "Our stack") |
| Command menus (⌘K) | [cmdk](https://cmdk.paco.me) |
| Toasts | [Sonner](https://sonner.emilkowal.ski) |
| One-time password / code inputs | [input-otp](https://input-otp.rodz.dev) |
| Control panels / tweakable GUIs | [Leva](https://github.com/pmndrs/leva); [dialkit](https://joshpuckett.me/dialkit) as an alternative |
| Springs, layout and exit animations, gestures | [motion](https://motion.dev) |
| Animated numbers (counters, prices, stats) | [NumberFlow](https://number-flow.barvian.me) |
| Animated text | [torph](https://torph.lochie.me/) |
| 3D globes | [Cobe](https://cobe.vercel.app) |
| Dynamic OG images (HTML/CSS → SVG/PNG) | [Satori](https://github.com/vercel/satori) |
| Syntax highlighting | [shiki](https://shiki.style) |
| Live / streaming charts | [Liveline](https://github.com/benjitaylor/liveline) |
| Other charts (static, dashboards) | [recharts](https://recharts.org) |
| Drag and drop | [dnd kit](https://dndkit.com) |
| Virtualization (long lists, big tables) | [Virtuoso](https://virtuoso.dev) |
| Client state | [zustand](https://zustand.docs.pmnd.rs) |
| Conditional `className` | [clsx](https://github.com/lukeed/clsx) |
| Variant-driven styling for Tailwind | [cva](https://cva.style) |
| Theme switching without a flash | [next-themes](https://github.com/pacocoursey/next-themes) (works outside Next; check for an existing theme provider first) |

Use `motion` for springs, layout and exit animations or gesture-driven values; a plain hover or fade
needs only a CSS transition. Liveline is for data that arrives live and scrolls with time; everything
else is recharts. clsx for ad-hoc conditional classes, cva when a component has real variants.

## Mismatches worth catching

- Toasts built by hand or with a modal library → Sonner.
- A `<div>` dropdown or dialog with hand-rolled focus handling → the shadcn/Base UI/Radix primitive.
- A number animated by re-rendering text → NumberFlow.
- A 1,000+ row list rendered directly → Virtuoso before pagination hacks.
- Props threaded through many components for shared state → zustand.
- Template-literal className ternaries three deep → clsx, or cva if variant-shaped.
