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

Serve the app first (a dev server or `vite preview`); pass every route you changed. Options: `--widths`,
`--schemes`, `--axe <path to axe.min.js>`, `--wait <ms>`, `--slices <n>` (n consecutive screen-sized shots; the
full-page one of a long page is too small to read). Exit 0 pass, 1 fail, 2 could not run.

It checks, per page × width × scheme: console errors and uncaught exceptions, failed or 4xx/5xx requests,
horizontal overflow, and accessibility through axe-core (serious/critical fail; moderate/minor are listed).
It only reports a CSS animation that keeps running under `prefers-reduced-motion`; that never fails.

axe-core is taken from the nearest `node_modules/axe-core` or `--axe`. Without it the verdict says
**a11y NOT CHECKED**; say so in your report, never call that a full pass.

## What to do with the result

1. **FAIL:** fix the cause, not the symptom, and rerun. Two rounds at most; then report what is left.
2. **PASS:** open at least the 375 px and the 1280 px first-screen shots (`-fold`, or `-s1`…) with the Read tool and say what you see
   (layout, truncation, empty or odd areas). The script cannot judge looks; you have to.
3. Report: the verdict line, the screenshot folder, and anything not checked.

## Limits

Mechanics only. It does not know whether the design is good, whether copy is right, or what happens after a click.
For those, `/aios-ui-review`. Interaction flows still need `webapp-testing`.
