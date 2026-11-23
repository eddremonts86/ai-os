# AI-OS field notes for ui-sdk

Written by AI-OS, not part of the upstream skill. Checked on `@ui-sdk/*` 0.1.0-beta.16 (2026-11-23) by building a
four-step stepper on a shadcn `base-nova` project and driving it in a real browser. A later version may fix any
of the gaps below: check the installed docs first.

## Before building: the search, and what "proven" means

Rule 27 ("Components before code") makes this step one. Record what you searched and found.

1. The project's own components: `ls` its `components/ui` and wrappers.
2. The shadcn registries: `shadcn view @shadcn/<name>` and `shadcn search @shadcn -q <term>` (a bare
   `shadcn search` fails when `components.json` has `registries: {}`). ui-indexador `search_items` finds items in
   every indexed registry.
3. A registry item counts as **proven** only when all of these hold: a permissive licence (a result with
   `mirror_of` or no licence does not count); its source reads cleanly with `shadcn view` and maps onto the
   project's tokens (no StyleX or CSS-in-JS, no `next/*`); and it meets the contract of the piece (for a
   stepper: arrow-key movement on one tab stop, unreachable steps gated, `aria-current`). Most stepper items in
   the registries had no arrow keys, no roving tab stop and no gating, so they failed the third test.

Only when no item passes, build from behaviors (the upstream "path 2").

## Decisions the upstream skill leaves open

- **Roles.** A slot that renders a native `<button>` (or an `<ol>`, `<li>`) needs no `role`: compiling with none
  raised no strict-mode warning. The upstream "role goes on the slot, never in `attrs`" rule is right; the
  rating example under "Compose Behaviors" and the `agents.md` examples use `attrs: { role }` and predate it.
- **Links or buttons.** Steps that change a page in place are buttons with `aria-current="step"`. Use `<a>`
  only when each step is its own URL.
- **Agent-operable flows and the project's Button.** `agent-ready.md` says a plain `<button>` is invisible to the
  agent bridge, and a shadcn `Button` (Base UI) was invisible in the snapshot too. Where an agent must press a
  button (Back, Continue, Send), use ui-sdk's own button part and style it with the project's tokens. Wrapping
  the project's `Button` through the `render` prop was not tried: test it before relying on it.
- **The agent test for a component.** A lone component has no interface of its own: the demo page that mounts it
  is the interface the `createAgent` test runs against.
- **`@layer ui-sdk;`** is needed only when `web.css` is imported. With behaviors only, nothing emits that layer.
- **Do not approve the package's bundled skill.** `pnpm add @ui-sdk/core` prints "Agent skills awaiting
  approval"; the package ships its own copy of this skill, with the upstream CDN text and the constant `allow`.
  Leave it unapproved so the vetted copy in `ai-config/skills/ui-sdk/` is the only one.

## Gaps and traps in the upstream docs

- `testing.md` lists `checkDirection` for every primitive, but it needs ArrowRight to move from the first tab
  stop. A stepper's stop is on the current step, so it cannot pass: write the right-to-left test by hand.
  Do not read `dist/` to find that out.
- Agent labels come from raw `textContent`, including text hidden only by CSS. Render conditional text such as
  ", completed" only when it is true, or every item gets it.
- A custom slot's items are not in the agent snapshot until the primitive declares
  `agent: { items: (api) => api.items() }` (`query({ within })` finds them either way).
- A custom method that returns normally is `ok: true`. Only a throw fails an agent step, so a method that
  refuses (an unreachable step) must throw.
- `outline-none` with `focus-visible:outline-2` draws no ring in Tailwind 4 (it sets the outline style to `none`):
  use `outline-solid` and look at the focus screenshot.
- A `mousedown` on a gated item still focuses it: guard `mousedown` as the example does.
- Programmatic `.focus()` on an unreachable roving item still lands; Enter and Space do not activate it.

## Worked example: a stepper

Nobody in `base-nova` ships one. Built from `definePrimitive`, `createChange` and `createRovingFocus`; 9 tests
(keyboard, focus, ARIA, right to left, server rendering, the demo page, the agent bridge) passed, and 15
deliberate mutations of the primitive were each caught. In a browser: one tab stop, ArrowLeft and ArrowRight
between reachable steps, Home and End, no wrap, `aria-current` on one element, axe clean in light and dark at
1280 and 375 px. Styling is token classes only (`h-control` is that project's control-height token; `cn` is its
class helper). At 375 px only the current step keeps its label; a "Step 3 of 4" summary would help sighted
users tell the circles apart, and 28 x 44 px targets are narrower than the project's 44 px rule.

`src/components/stepper-primitive.ts`:

```ts
import { createChange, createRovingFocus, definePrimitive, type ChangeDetails } from "@ui-sdk/core"

type StepperOptions = {
  steps?: string[]
  value?: string
  defaultValue?: string
  onValueChange?: (value: string, details: ChangeDetails<"item-press">) => void
}

const status = (state: { value: string; steps: string[] }, key: string) => {
  const at = state.steps.indexOf(key)
  const current = state.steps.indexOf(state.value)
  return at < current ? "complete" : at === current ? "current" : "upcoming"
}

// Steps up to the current one are reachable; the app moves forward through `value`.
const stepper = definePrimitive({
  name: "stepper",
  options: { steps: "list", value: "string", defaultValue: "string", onValueChange: "callback" },
  controlled: ["value"],
  state: (options: StepperOptions) => ({
    steps: options.steps ?? [],
    value: options.value ?? options.defaultValue ?? options.steps?.[0] ?? "",
    focused: null as string | null,
  }),
  sync: (options) => ({
    ...(options.steps && { steps: options.steps }),
    ...(options.value !== undefined && { value: options.value }),
  }),
  api: (context) => {
    const change = createChange(context)
    const reachable = (key: string) => status(context.store.get(), key) !== "upcoming"
    const roving = createRovingFocus(context, {
      slot: "step",
      key: "focused",
      orientation: () => "horizontal",
      remember: false,
      focusable: (step) => reachable(step.key),
      preferred: (step) => step.key === context.store.get().value,
      claims: (state, step) => step.key === state.value,
    })

    return {
      roving,
      reachable,
      items: () => context.store.get().steps.map((value) => ({ value, label: value })),
      goTo(value: string, event?: Event) {
        if (!reachable(value)) throw new Error(`"${value}" is not reachable until the steps before it are done.`)
        if (value !== context.store.get().value) change("value", value, { reason: "item-press", event })
      },
    }
  },
  slots: (slot) => ({
    root: slot({}),
    item: slot<{ value: string }>({
      props: { value: "string" },
      attrs: (state, part) => ({ "data-status": status(state, part.key) }),
    }),
    step: slot<{ value: string }, { status: string }>({
      props: { value: "string" },
      focus: "roving",
      state: (state, part) => ({ status: status(state, part.key) }),
      attrs: (state, part) => {
        const current = status(state, part.key)
        return {
          type: "button",
          tabindex: part.api.roving.tabIndex(state, part),
          "aria-current": current === "current" ? "step" : undefined,
          "aria-disabled": current === "upcoming" ? "true" : undefined,
          "data-status": current,
        }
      },
      press: ({ api, key }, event) => api.reachable(key) && api.goTo(key, event),
      on: {
        keydown: (event, { el, api }) => el && api.roving.keydown(event, el),
        mousedown: (event, { api, key }) => api.reachable(key) || event.preventDefault(),
      },
      bind: (el, part) => part.api.roving.bind(el, part),
    }),
  }),
  agent: { actions: ["goTo"], closed: true, items: (api) => api.items() },
})

export { stepper, type StepperOptions }
```

`src/components/stepper.tsx`:

```tsx
"use client"

import { createParts, type PartProps } from "@ui-sdk/react/primitive"
import { CheckIcon } from "lucide-react"
import { cn } from "cn"
import { stepper, type StepperOptions } from "./stepper-primitive"

const parts = createParts(stepper, { root: "ol", item: "li", step: "button" })

type StepperProps = Omit<StepperOptions, "steps"> &
  Omit<PartProps<"ol">, "defaultValue"> & { steps: { value: string; label: string }[] }

function Stepper({ steps, className, ...props }: StepperProps) {
  return (
    <parts.Root
      steps={steps.map((step) => step.value)}
      data-slot="stepper"
      className={cn("flex items-center gap-2", className)}
      {...props}
    >
      {steps.map((step, index) => (
        <parts.Item
          key={step.value}
          value={step.value}
          className="group/item flex items-center gap-2 not-last:flex-1 not-last:after:h-px not-last:after:min-w-3 not-last:after:flex-1 not-last:after:bg-border data-[status=complete]:after:bg-primary"
        >
          <parts.Step
            value={step.value}
            className="group/step -mx-1 flex h-control items-center gap-2 rounded-md px-1 text-sm font-medium text-muted-foreground transition-colors duration-fast ease-out focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-solid focus-visible:outline-ring data-[status=complete]:cursor-pointer data-[status=complete]:text-foreground data-[status=complete]:hover:text-primary data-[status=current]:font-semibold data-[status=current]:text-foreground data-[status=upcoming]:cursor-not-allowed"
          >
            {({ status }) => (
              <>
                <span
                  aria-hidden
                  className="grid size-7 shrink-0 place-items-center rounded-full border border-input text-xs group-data-[status=complete]/step:border-primary group-data-[status=complete]/step:text-primary group-data-[status=current]/step:border-primary group-data-[status=current]/step:bg-primary group-data-[status=current]/step:text-primary-foreground"
                >
                  {status === "complete" ? <CheckIcon className="size-4" /> : index + 1}
                </span>
                <span className="max-sm:group-not-data-[status=current]/step:sr-only">{step.label}</span>
                {status === "complete" && <span className="sr-only">, completed</span>}
              </>
            )}
          </parts.Step>
        </parts.Item>
      ))}
    </parts.Root>
  )
}

export { Stepper }
```
