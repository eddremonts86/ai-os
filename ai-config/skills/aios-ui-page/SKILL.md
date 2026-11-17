---
name: aios-ui-page
description: Build a new standalone page, component or app screen with Hallmark - a dealt, named or custom theme, real material only, linted in a browser - then the AI-OS gate. Explicit invocation, /aios-ui-page <what to build> [theme <name> | custom | fast].
disable-model-invocation: true
---

# aios-ui-page

Hallmark's build, inside the AI-OS gate. For a page in a React/shadcn product that should compose proven
components, `/aios-ui-design` is the default; this command is for a page with its own look (a landing, a launch,
a site for a place or a person), or whenever the user asks for Hallmark or a theme.

The scripts run through the launcher, which adds the browser tier:
`H=$AI_OS_ROOT/ai-config/skills/aios-ui-verify/scripts/hallmark.sh`, then `$H theme ...`, `$H sloplint ...`,
`$H capture ...` wherever Hallmark says `node <skill-dir>/scripts/<name>.mjs`.

1. **Load the `hallmark` skill** and run its Flow with the user's words as the prompt. Its AI-OS limits apply.
   Arguments: `theme <name>` → Direction rule 1 (named theme); `custom` → rule 2 (`references/direction.md`);
   `fast` → `references/flow.md` § Fast mode. One element (button, card, nav...) is component scope; a screen
   someone works in (dashboard, settings) is app-screen scope (`flow.md`).
2. **Context first.** The folder's scope decides the brand (`ai-os scope which`): an AI-OS surface uses
   `context/global/06_brand.md`, a project with `DESIGN.md` uses it (Hallmark's pre-flight treats it as a locked
   system). A dealt theme only where neither exists, or the user asked for one. An existing design system is used 100%,
   no hardcoded or inline styles (`rules/always_do.md` rule 27).
3. **Material.** Hallmark asks once for material, audience, use and tone. Product screenshots:
   `$H capture` against the running app (local only). Photos: `/aios-ui-photos`. Generated comps (Together AI)
   only when the user asks for them in this run.
4. **Show the hero first.** Hallmark builds and reviews the hero before the page: send the user the hero
   screenshot (from its `.hallmark/shots`, or `/aios-ui-verify` on the hero) and continue once they approve the
   direction.
5. **Sweep, then the gate.** Hallmark's Step 7 (`$H sloplint <files> --render`, its judged gates and fresh-context
   finish review), then `/aios-ui-verify` (verify.py and `antislop.py`) and `/aios-ui-review` on the page.

Done means: sloplint 0 Floor FAIL, the verify verdict PASS (or its gaps stated), you looked at the 375 and 1280 px
shots, and the review has no blockers. Report the Picks block, those verdicts and the screenshot folder.
