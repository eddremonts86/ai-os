---
name: fix-ui-ux
description: Combo workflow that drives Impeccable end to end to find and fix every UI/UX defect in an existing product — context + audit + critique, then targeted repairs (harden, layout, typeset, clarify, adapt, onboard, optimize), then polish and document. Use when asked to "/fix-ui-ux", "fix all the UI/UX problems", "review and repair the interface", "arregla la UI", or when an app needs a full interface remediation pass rather than a single design task. For shipped products, not greenfield design.
argument-hint: 'Optional: a path, route, or component to scope the pass (defaults to the whole app)'
user-invocable: true
---

# /fix-ui-ux — full Impeccable remediation pass

Drives the [Impeccable](https://impeccable.style/docs/) skill through an ordered chain so that,
by the end, UI/UX defects are found, fixed and verified. This is a **repair** workflow for an
existing product, not a design-from-scratch workflow.

Scope: `$input` if given (a path, route or component), otherwise the whole app.

---

## Non-negotiables

1. **Every Impeccable verb is invoked as `/impeccable <verb>`**, one at a time. Never invent verbs.
   The 23 invocable verbs, per Impeccable's own `scripts/command-metadata.json`, are:

   ```
   adapt animate audit bolder clarify colorize craft critique delight distill document
   extract harden init layout live onboard optimize overdrive polish quieter shape typeset
   ```

   `brand`, `product`, `codex` and `interaction-design` exist under `reference/` but are **internal
   references, not commands** — read them, never invoke them. If you are unsure a verb exists, read
   `command-metadata.json` rather than guessing; it also carries each verb's `argumentHint`.

2. **Impeccable's own setup contract applies to every invocation** and must not be short-circuited:
   - Run its context script once per session. **Resolve its path, do not hardcode one.** Impeccable's
     SKILL.md refers to `.claude/skills/impeccable/scripts/context.mjs`, which is correct only when it
     is vendored into the project; when installed as a plugin it lives under
     `~/.claude/plugins/cache/impeccable/impeccable/<version>/skills/impeccable/scripts/`. Locate the
     real `SKILL.md` for `impeccable` first and run the script relative to it.
   - If the script reports `NO_PRODUCT_MD`, follow `reference/init.md` before anything else.
   - Read `reference/<verb>.md` for each verb you invoke. Non-optional; it defines the flow.
   - Read the register reference: `reference/product.md` for app UI / dashboards / tools,
     `reference/brand.md` for marketing / landing / portfolio.
3. **Do not break the app.** After each phase that writes code, run the project's own verification
   and fix what you broke before moving on. Discover it, don't assume it:
   - `package.json` scripts named `check:isReady`, `lint`, `typecheck`, `build`, `test:e2e`
   - a `CLAUDE.md` / `AGENTS.md` "verification" or "quality gate" section
   If a phase's output cannot pass the gate, revert that phase and report it rather than shipping it.
4. **One commit per phase**, conventional-commit style, describing what changed and why. Never one
   giant commit at the end: a bad phase must be revertible on its own.
5. **Report, don't silently skip.** If a phase finds nothing, say so. If a phase is skipped, say why.

---

## Phase 0 — Ground truth (no writes)

1. Run Impeccable's context script. If it reports `NO_PRODUCT_MD`, run `/impeccable init` first and
   let it produce `PRODUCT.md`. Everything downstream reads worse without it.
2. Determine the **register** and state it out loud:
   - app UI, admin, dashboard, internal tool → `product` register
   - marketing, landing page, campaign, portfolio → `brand` register
   Most `/fix-ui-ux` invocations are `product`. Getting this wrong produces landing-page advice for
   a dashboard, which is the most common failure mode of design tooling.
3. Read the project's existing design system: tokens, theme, one representative component. Note the
   conventions you must respect (spacing scale, radius scale, semantic colour tokens, icon family,
   i18n mechanism). **Existing conventions win over Impeccable's defaults**; Impeccable says so too.
4. Record the baseline: does the gate pass *before* you touch anything? If it already fails, say so
   now — otherwise you will be blamed for pre-existing failures.

Output of this phase: a short paragraph stating register, stack, gate command, and baseline state.

---

## Phase 1 — Diagnose before repairing

Run both, in this order, and **do not fix anything yet**:

1. `/impeccable audit` — five-dimension technical check, severities P0 to P3.
2. `/impeccable critique` — design review with scoring, persona tests, automated detection.

Then **consolidate into one findings list**, deduplicated, each item tagged with:
- severity (P0 blocker → P3 nice-to-have)
- which repair verb owns it (see the map in Phase 2)
- whether fixing it is mechanical or needs a human decision

Present that list to the user before writing code. This is the one checkpoint that matters: it is
cheap to re-scope here and expensive to re-scope after eight phases of edits.

---

## Phase 2 — Targeted repairs, severity first

Work P0 → P3. For each finding, invoke the verb that owns it. **Only invoke a verb when a finding
maps to it** — running all of them unconditionally produces churn, not quality.

| Finding | Verb |
| --- | --- |
| Missing error / empty / loading states, unhandled edge cases, destructive actions without confirmation | `/impeccable harden` |
| Broken spacing, rhythm, alignment, visual hierarchy, cramped or floating layout | `/impeccable layout` |
| Generic, inconsistent or accidental typography; scale with no contrast; line length | `/impeccable typeset` |
| Confusing labels, button copy, error messages, helper text | `/impeccable clarify` |
| Breaks on mobile / small screens; fixed widths; touch targets; `100vh` bugs | `/impeccable adapt` |
| No first-run experience; blank screens with no guidance | `/impeccable onboard` |
| Slow interactions, layout thrash, oversized bundles, jank | `/impeccable optimize` |
| Too much noise, redundant UI, competing emphasis | `/impeccable distill` |

After **each** verb: re-run the project gate, fix regressions, commit.

### Verbs deliberately excluded from the automatic chain

Do not run these as part of `/fix-ui-ux`. Say why if the user expects them:

- `bolder`, `quieter`, `colorize`, `delight`, `animate`, `overdrive` — these change **aesthetic
  direction**, they do not fix defects. `bolder` and `quieter` are literally opposites; running both
  is incoherent, and `overdrive` (shaders, physics, 60fps effects) is actively wrong for an admin
  tool. Offer them as a follow-up the user chooses, one at a time.
- `craft`, `shape` — create new surfaces; out of scope for a repair pass.
- `extract` — refactors into a design system. Structural change, needs its own review cycle.
- `live` — interactive browser iteration; requires a human at the keyboard.

If the diagnosis in Phase 1 says the interface is *bland* rather than *broken*, report that and
recommend `bolder` / `colorize` / `delight` explicitly. Do not silently apply them.

---

## Phase 3 — Finish and lock it in

1. `/impeccable polish` — the meticulous final pass. Run it last, once the structural repairs are in.
2. `/impeccable document` — produces `DESIGN.md` capturing the visual system, so the next agent or
   developer does not re-litigate the same decisions.
3. Final full verification: the project gate, plus a real runtime check. Open the app and look at it
   (browser screenshot / preview tooling) in **both light and dark mode** and at a mobile viewport.
   A gate that passes while the UI is visibly broken is not verification.

---

## Reporting

Close with a report, not a victory lap:

- **Fixed**, grouped by severity, each with the file touched and the commit.
- **Found but not fixed**, with the reason (needs a product decision, out of scope, would break X).
- **Verification**: exact commands run and their real results. If something still fails, say so
  plainly with the output.
- **Recommended next**: the aesthetic verbs, if the diagnosis pointed that way.

## Anti-patterns for this workflow

- Running every Impeccable verb because they exist. The chain is selective by design.
- Fixing P3 polish while a P0 blocker is open.
- One mega-commit that cannot be bisected.
- Claiming a phase is done without running the gate.
- Applying Impeccable's generic defaults over the project's committed conventions (its own setup
  step 3 tells you not to).
- Treating a dashboard as a landing page because the `brand` register was loaded by mistake.
