---
name: aios-ui-audit
description: Read-only anti-slop and craft audit of an existing page or app - Hallmark's audit plus sloplint in a real browser at four widths - every finding with gate, file:line and fix. Never edits. Explicit invocation, /aios-ui-audit <path or url>.
disable-model-invocation: true
---

# aios-ui-audit

Reports only; nothing in the project changes. `V=$AI_OS_ROOT/ai-config/skills/aios-ui-verify/scripts`.

1. **Lint.** `~/.ai-os/venv/bin/python $V/antislop.py <source dirs or files> --render [--url <served route> ...]
   --shots ui-audit --json` (the Hallmark-only gates are already out; screenshots go to `ui-audit/`, never into
   the project). For a framework app, serve it first and pass every route with `--url`.
2. **Judge.** Load the `hallmark` skill with `audit <target>`: `references/redesign.md` and
   `references/flow.md` § The sweep, for a page Hallmark did not build. Walk the judged gates in
   `references/gates.md` § 5 on the screenshots. Do not apply any fix.
3. **Report**, grouped by tier: Floor (must fix), Reflex (fix or keep with a reason), Finish (craft). Each with
   gate, `file:line` or screenshot, what is wrong and the fix. Confirm or dismiss every lint finding with one
   line; a finding that is a Hallmark taste rule the project does not share is dismissed, not hidden.

Then name the next step: targeted fixes → `/aios-ui-improve`; a new look → `/aios-ui-redesign`.
