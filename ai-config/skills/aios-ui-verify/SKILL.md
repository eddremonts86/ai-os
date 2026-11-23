---
name: aios-ui-verify
description: Runtime gate for UI work. Opens pages at 375, 768 and 1280 px in light and dark, saves screenshots, and fails on console errors, failed requests, horizontal overflow or serious accessibility violations. Explicit invocation, /aios-ui-verify <url or file...>.
disable-model-invocation: true
---

# aios-ui-verify

The step that makes "done" mean something. UI is not finished until this passes and you have looked at it.

## Run

```bash
~/.ai-os/venv/bin/python <this skill's dir>/scripts/verify.py <url-or-file> [...] --out ui-verify
```

Serve the app first, preferably the production build (`vite preview`): a dev server adds overlays (devtools
buttons, HMR) that show up in screenshots and are not defects. Pass every route you changed. Options: `--widths`,
`--schemes`, `--axe <path to axe.min.js>`, `--wait <ms>`, `--slices <n>` (n consecutive screen-sized shots; the
full-page one of a long page is too small to read). Exit 0 pass, 1 fail, 2 could not run.

It checks, per page × width × scheme: console errors and uncaught exceptions, failed or 4xx/5xx requests,
horizontal overflow, and accessibility through axe-core (serious/critical fail; moderate/minor are listed).
It only reports a CSS animation that keeps running under `prefers-reduced-motion`; that never fails.

axe-core is taken from the nearest `node_modules/axe-core` or `--axe`. Without it the verdict says
**a11y NOT CHECKED**; say so in your report, never call that a full pass.

## Anti-slop check (static; advisory, except the design-system gate)

```bash
~/.ai-os/venv/bin/python <this skill's dir>/scripts/antislop.py <src dir or files> [--genre modern-minimal] [--json]
~/.ai-os/venv/bin/python <this skill's dir>/scripts/antislop.py <files> --render [--url <served route> ...] --shots ui-verify/antislop
```

Hallmark's sloplint (`ai-config/skills/hallmark`, vendored) over the source (`.html .css .jsx .tsx .vue .svelte
.astro`, Tailwind class strings included): `transition: all`, animated width/height, motion with no reduced-motion
fallback, SVGs without a name or `aria-hidden`, colour literals outside the token block, tracked-capital labels,
middle-dot meta strings, invented metrics and the other tells. The Hallmark-only gates (its CSS stamp, a project's own
`:root`/`.dark` token definitions, focus styled through Tailwind's `focus-visible:`) are taken out. Needs Node.
Static, it writes nothing. `--render` adds the browser tier (layout, contrast, fold and overflow at 375 to 1920 px) through
`scripts/hallmark.sh`, which installs puppeteer-core from a committed lockfile into `~/.ai-os/hallmark`; its screenshots go to
`--shots`, never into the project. Run it with verify.py on what you touched and treat each Floor FAIL as a finding to confirm or dismiss
in the report; it never changes the verify verdict. Exit 0 none, 1 Floor FAIL, 2 could not run.

**Design-system gate (`ds`, `rules/always_do.md` rule 27).** Where the project has a design system (`DESIGN.md`,
`components.json`, a Tailwind config, `.ai-os/brand-tokens.md`, or a CSS token block), antislop.py also fails every inline
`style` (one that only sets `--vars` is fine), colour literal and Tailwind arbitrary colour or length outside the token
block. These are not advisory: fix them with the system's tokens and components, or, for a value no token
expresses, add the token. `ds-allow: <reason>` on the line or the one above is the only exception, and the report lists each.

## Compare against a reference

```bash
~/.ai-os/venv/bin/python <this skill's dir>/scripts/compare.py --out compare.png ref1.png shot1.png [ref2 shot2 ...]
```

One image per pair (reference left, render right, letterboxed, never stretched) and a **measured** color check per
pair: mean and worst-region saturation and brightness delta, render minus reference. A negative saturation delta
means the render is greyer than the reference. Capture the render at the reference's viewport and aspect first
(`verify.py --widths <reference width>`). Used by `/aios-ui-design` "Match references", `/aios-ui-3d` and
`/aios-ui-video`; the numbers feed `aios-ui-review`'s scored mode.

## What to do with the result

1. **FAIL:** fix the cause, not the symptom, and rerun. Two rounds at most; then report what is left.
2. **PASS:** open at least the 375 px and the 1280 px first-screen shots (`-fold`, or `-s1`…) with the Read tool and say what you see
   (layout, truncation, empty or odd areas). The script cannot judge looks; you have to.
3. Report: the verdict line, the screenshot folder, and anything not checked.

## Limits

Mechanics only. It does not know whether the design is good, whether copy is right, or what happens after a click.
For those, `/aios-ui-review`. Interaction flows still need `webapp-testing`. It checks the page as loaded: a screen
with states (running, waiting for approval, error, success) needs an axe pass per state, written by the caller;
wait for fade-ins to finish first, or a half-transparent row reports a false contrast failure.
