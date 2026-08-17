---
name: saas-expensive-ui
description: Make a SaaS interface read as expensive — deliberate, calm, trustworthy — instead of generic AI-generated slop. Use when asked to "make this look expensive/premium/high-end", "why does my app look cheap or AI-generated", "remove the AI slop", "make the UI feel like a paid product", or before designing or reviewing any product surface where perceived quality matters. Supplies the 10 quality pillars, the slop catalog, hierarchy/color/typography rules, and an anti-slop prompting contract. Pairs with `saas-ui-audit` for scoring an existing app and `/saas-review` for a whole-app pass.
---

# Expensive-looking SaaS

A product does not read as expensive because of gradients, shadows, animation or cards.
It reads as expensive when every decision signals that someone thought about it, tested it,
and cared about the outcome.

**The one rule:**

> Do not design screens. Design the clearest, fastest path to the result the customer paid for.

## The 10 pillars of perceived quality

| # | Pillar | The user should be able to say |
| --- | --- | --- |
| 1 | Clarity | "I know where I am, what happened, and what to do next." |
| 2 | Hierarchy | "I can tell what is primary, secondary and merely informative." |
| 3 | Visual restraint | "Few colours, few styles, few things competing for me." |
| 4 | Consistency | "I learned this rule once and it holds everywhere." |
| 5 | Speed | "It answered immediately; I never wondered if it worked." |
| 6 | Progress | "I can see how far I am toward the outcome I bought." |
| 7 | Trust | "The data has context, the states are honest, risky actions are safe." |
| 8 | Identity | "This has its own voice and system — it is not a template." |
| 9 | Onboarding | "I reached real value before I lost interest." |
| 10 | Commercial coherence | "The promise on the landing page continued inside the product." |

## Intentional vs improvised

**Intentional** — one dominant goal per screen; the primary action is recognisable in under two
seconds; density matches the work being done; data carries context, units, period and state;
components share visual and interaction rules; loading/empty/error/success/permission states are
designed; the product does not try to impress in every square centimetre.

**Improvised** — every section looks equally important; several "primary" buttons in one view; each
module invents its own radius, shadow and spacing; the same number appears in a card, a chart and a
table with no new reading; metrics whose meaning must be guessed; promotional copy inside
operational tasks; effects compensating for weak information architecture.

## Before you touch styles

Answer these five per screen. If you cannot, you are not ready to design it:

1. What job did the user come here to do?
2. What is the single primary decision or action?
3. What information do they need to act with confidence?
4. What can stay hidden until it is needed?
5. What observable result proves the screen did its job?

## Hierarchy: order of tools

Use them in this order, and stop as soon as the hierarchy is legible:

**position → space → type size → type weight → contrast → colour → container → shadow/motion**

Never start at shadow and colour. **A strong hierarchy still works in greyscale** — that is the test.

Recommended structure of a product screen:

1. View identity (title, and period/context when relevant)
2. Primary action — exactly one dominant
3. State or summary that lets the user orient and decide
4. The work itself (table, form, editor, flow, analysis)
5. Secondary actions (filter, export, share, configure)
6. Progressive detail — advanced information hidden until requested

## Colour: contained and semantic

Minimum viable system: **neutrals** (backgrounds, surfaces, borders, text) + **one brand colour**
(primary action, selection, deliberate emphasis) + **success / warning / error / info**.

- Colour communicates brand, interaction or state. Nothing else.
- Never the error colour for promotions.
- Never colour as the only carrier of state.
- Same colour = same meaning, product-wide, including chart categories.
- Distinguish `selected`, `active`, `focused` and `disabled` from each other.
- Dark mode is not quality by itself.

**Palette test:** greyscale the screenshot → is the hierarchy still readable? → restore colour →
does each colour add meaning, or only stimulus?

## Typography as infrastructure

One primary family; a second only with a documented job. A small reusable size scale — no new size
invented to solve one case. Weights assigned by function, not taste. Tabular numerals in tables and
in any KPI meant to be compared. Predictable label/value alignment. No giant headlines inside
operational flows. No light grey text for information the user actually needs.

Documented levels: page title · section title · component title · body · field label · metadata/help
· emphasised value.

## Consistency: build a language, not a pile of screens

Must be identical product-wide: location and style of primary actions, action names, icon meanings,
filter design, panel open/close behaviour, table behaviour, confirmations, error messages, keyboard
shortcuts, domain terminology, date/currency/percentage/timezone formatting, and loading/empty/
permission states.

Token surfaces to define: colour, spacing, radius, border, shadow, typography, icon sizes, motion
durations, max widths, breakpoints, z-index layers.

**Before creating a new component,** answer: does one already cover 80% of this? Is this a stable
variant or a temporary exception? How does it behave in loading, empty, error and disabled? What
accessibility rule must it meet? Who owns it?

## Restraint rule

> If removing an effect leaves the product equally understandable or better, the effect was not doing
> useful work.

## Reference files

Read the one that matches the task; do not read them all up front.

- `references/slop-catalog.md` — the concrete patterns that make a UI read as AI-generated, and what
  to do instead. Read this before any "remove the slop" pass.
- `references/ai-prompting-contract.md` — how to brief an AI (or yourself) so the output is not
  generic: required context, explicit blocklist, and the design-reasoning the answer must include.
- `references/reference-boards.md` — the screenshot workflow: gather references per flow, decompose
  patterns, extract rules instead of pixels, then test against real data.
- `references/provenance.md` — where these ideas come from and which parts are inference. Read before
  attributing any of this to a named author.

## Related skills

- `saas-ui-audit` — score an existing product against a 21-criterion matrix, per screen.
- `app-route-inventory` — enumerate and walk every route before auditing anything.
- `saas-data-trust` · `saas-perceived-speed` · `saas-onboarding-activation` ·
  `saas-landing-continuity` — the four deep areas, each with its own rules.
- `/saas-review` — the full app pass that chains all of the above.
- `impeccable` / `fix-ui-ux` — complementary implementation-level repair chain. This skill supplies
  the *judgement*; those supply the *repair verbs*.

## What not to do

- Redesign the whole product before measuring one flow.
- Copy another SaaS's aesthetic wholesale.
- Confuse minimalism with hiding necessary information.
- Add a library to paper over each inconsistency.
- Make every element look interactive.
- Substitute animation for architecture.
- Optimise a commercial metric at the cost of trust.
- Personalise before the base experience is coherent.
- Accept the first version because it "looks modern".
