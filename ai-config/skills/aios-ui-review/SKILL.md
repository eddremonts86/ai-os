---
name: aios-ui-review
description: Independent, read-only review of a screen or flow by a fresh agent that never saw the build. Runs the runtime gate for evidence, then reports blockers and majors with screenshot or file:line proof. Explicit invocation, /aios-ui-review <url or files> [brief].
disable-model-invocation: true
---

# aios-ui-review

A cold read of a UI. The agent that built it reviews it with everything it knows; this review does not.

## Steps

1. **Evidence.** Run `/aios-ui-verify` with `--slices 6` on the pages in scope unless it already ran on this exact code this session.
   If there is no subagent tool in this harness, stop and say so: a review in the same context is not a review.
2. **Brief.** Write the brief to a file (the user's request, verbatim, plus the audience and the page's job).
   The reviewer needs the brief, never your conversation or your opinion of the work.
3. **One fresh reviewer:** the `ui-reviewer` agent (`ai-config/agents/ui-reviewer.md`, which holds the checks and
   the report format), given only the brief file, the changed files or routes, the repo path and the screenshot
   folder. Without that agent, spawn one fresh read-only subagent with the agent file's body as its prompt. For an
   accessibility-critical flow, also run the `a11y-auditor` agent on the same URL.
4. **Check each finding yourself** against the screenshot or the code before relaying it. Drop what you cannot confirm and
   say it was dropped. Reviewers with no context flag decisions taken elsewhere; search the repo's docs first.
5. **Report** blockers and majors, ranked, with evidence. Fix nothing here: this skill is read-only.

**Scored mode.** When there is a bar to reach (references to match, a 3D scene, a video, "until it is a 9"),
score instead of listing blockers: one number per dimension from at least two fresh critics, median, calibrated
by the user's own estimate, numbers labelled measured or eyeballed. Rubrics, critic prompts and calibration:
`references/scored-critics.md`.

Scope: one screen or flow. Every route of a whole app is `saas-review`. To fix what the review found, `/aios-ui-improve`.
