# shadcn/ui — docs, tooling, and the composition rule

Companion to `SKILL.md`. That file covers how a shadcn component is *built*
(cva, forwardRef, tokens). This one covers how to **find the right primitive**
and the traps that only show up once you compose them.

---

## 1. Reach for the primitive before writing markup

The single highest-value rule, and the one most often skipped:

> Before writing a control, look in `src/components/ui/` (or wherever
> `components.json` points `aliases.ui`). If a primitive covers it, compose it.
> Only fall back to raw markup when nothing there does — and say so in a
> comment when you do.

A hand-rolled control looks identical in a screenshot and behaves worse. The
primitives carry the parts you would not reimplement:

| Instead of | Use | What you would otherwise lose |
| --- | --- | --- |
| `<div class="flex items-center border rounded">` + `<input>` + `<span>%</span>` | `InputGroup` + `InputGroupInput` + `InputGroupAddon` | addon inside the border, click-addon-focuses-input, one focus ring around the pair |
| raw `<select>` styled by hand | `Select` | keyboard navigation, typeahead, popover styling, portal behaviour |
| `<div role="tooltip">` | `Tooltip` | positioning, delay, dismiss, escape handling |
| a styled `<span>` badge | `Badge` | variant system already themed |
| custom popover positioning | `Popover` / `DropdownMenu` | collision detection, focus trap, outside-click |

The full component list is in the docs index below — read it before deciding
nothing fits.

---

## 2. Documentation entry points

| What | URL |
| --- | --- |
| **Machine-readable index of the whole site** | `https://ui.shadcn.com/llms.txt` |
| One component | `https://ui.shadcn.com/docs/components/<name>` |
| Same component, a specific primitive family | `https://ui.shadcn.com/docs/components/base/<name>` |
| Skills for AI assistants | `https://ui.shadcn.com/docs/skills` |
| CLI | `https://ui.shadcn.com/docs/cli` |
| Theming (CSS variables, OKLCH, dark mode) | `https://ui.shadcn.com/docs/theming` |

`llms.txt` is the fastest way to answer "is there a component for this?" — it
lists every doc URL in one fetch, grouped as Form & Input, Layout & Navigation,
Overlays & Dialogs, Feedback & Status, Display & Media.

### The `/base/` segment is a primitive family, not a variant

A component page offers the same shadcn API over three different underlying
libraries — **Base UI**, **React Aria**, **Radix UI**. `/docs/components/base/*`
is the Base UI implementation. Which one a project uses is whatever was copied
into `components/ui/`; read the local file rather than assuming Radix.

---

## 3. The official skill and the MCP server

```bash
pnpm dlx skills add shadcn/ui
```

Activates when `components.json` is present, runs `shadcn info --json`, and puts
the project's real configuration — framework, Tailwind version, aliases, base
library, icon library, installed components — into context. Covers CLI
operations, theming, registry authoring, and the MCP server.

The **MCP server** lets an assistant browse, search and install components from
registries in natural language (Claude Code, Cursor, VS Code).

### CLI verbs worth knowing

`init`, `add`, and then the ones people forget:

```bash
npx shadcn@latest search <query>   # find a component across registries
npx shadcn@latest view <name>      # print a component's source without adding it
npx shadcn@latest docs <name>      # open its documentation
npx shadcn@latest diff <name>      # what changed upstream vs your copy
npx shadcn@latest info             # resolved project config (--json for machines)
npx shadcn@latest build            # build a custom registry
```

`diff` is the answer to "our copy has drifted from upstream" — a real question
in any repo that vendored components months ago.

---

## 4. Traps found in practice

- **`Select` refuses `''` as an item value.** An "any / none" option needs a
  sentinel (`const ANY = '__any__'`) mapped back to `null` at the boundary.
  Passing an empty string throws at runtime, not at build.
- **`InputGroupAddon` goes *after* the input in DOM order**, whatever side it
  appears on; `align` (`inline-start` | `inline-end` | `block-start` |
  `block-end`) does the positioning. Putting it first visually works and breaks
  the click-to-focus behaviour.
- **Tailwind's JIT only sees literal class names in source.** A class assembled
  at runtime — `` `bg-${group}-500` ``, or `base.replace('bg-', 'border-')` — is
  never generated, and the element silently falls back to whatever it inherited.
  Spell every class out, per utility.
- **Control heights disagree between primitives.** `Input`, `SelectTrigger` and
  an icon `Button` do not ship the same height, and a project token may override
  one of them. In a dense table row, pick one height and set it explicitly on
  all three, or nothing shares an edge.
- **`data-[state=…]`** is how the primitives expose open/checked/selected to
  CSS. Style those rather than mirroring state into React.

---

## 5. Where this matters most

Dense product UI — tables with inputs in them, wizard steps, admin editors — is
where hand-rolled controls accumulate fastest, because each one looks like a
small local decision. It is also where they hurt most: a row with three
different control heights and four spellings of "a field with a unit" reads as
misalignment long before anyone measures it.
