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
3. **One fresh subagent**, read-only, given only: the brief file, the changed files or routes, the repo path, the
   screenshot folder. Ask it for the checks below and the report format in `verifiers/fresh_reviewer_prompt.md`
   (first line "Blockers: N, Majors: M", each finding with severity, location, evidence, change).

   Checks, in this order:
   - Does it do what the brief asks, for that audience, in that mode (persuade / operate / read / experience)?
   - Look at every screenshot: broken layout, truncation, contrast, odd empty space, dark mode that was forgotten.
   - Hierarchy, spacing and type against `refactoring-ui`; interface correctness against `web-design-guidelines`.
   - The generic traits `frontend-design` lists as AI defaults, only where the brief did not choose them.
   - States the happy path hides: empty, error, loading, long text, one item, many items.
4. **Check each finding yourself** against the screenshot or the code before relaying it. Drop what you cannot confirm and
   say it was dropped. Reviewers with no context flag decisions taken elsewhere; search the repo's docs first.
5. **Report** blockers and majors, ranked, with evidence. Fix nothing here: this skill is read-only.

Scope: one screen or flow. Every route of a whole app is `saas-review`. To fix what the review found, `/aios-ui-improve`.
