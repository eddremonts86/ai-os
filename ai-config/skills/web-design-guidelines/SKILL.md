---
name: web-design-guidelines
description: Audit UI code against Vercel's public Web Interface Guidelines (interactions, forms, focus, mobile, performance, accessibility). Use when asked to review, audit, or check a UI/component/page against real production interface standards, not aesthetic taste.
---

# Web interface guidelines review

Checks code against Vercel's [Web Interface Guidelines](https://github.com/vercel-labs/web-interface-guidelines)
(MIT) — a maintained, framework-agnostic list of concrete interaction/accessibility/
performance rules (focus management, hit target sizes, hydration-safe inputs, optimistic
updates, `prefers-reduced-motion`, and similar). Distinct from `taste-skill` and
`refactoring-ui`: those are aesthetic direction and visual systems; this is production
interaction correctness — things a design review misses but a real user hits.

## Procedure

1. Fetch the current rules before every review — they're a living document, don't rely
   on a cached copy:
   `https://raw.githubusercontent.com/vercel-labs/web-interface-guidelines/main/command.md`
2. If the user didn't name files, ask which file(s) or pattern to review.
3. Check the named file(s) against every rule in the fetched document.
4. Report findings as `file:line — rule violated — one-line fix`, one per line. No prose
   preamble, no restating rules that pass.
5. If a rule doesn't apply to the code's stack (e.g. a React-specific rule on a
   framework-agnostic HTML page), skip it silently rather than flagging a non-issue.

## When NOT to use

Aesthetic decisions (color, type, spacing scale, motion feel) — that's `taste-skill`
(landing pages) or `refactoring-ui` (systems/hierarchy) or `emil-design-eng` (motion
craft). This skill is interaction/a11y/performance correctness only.
