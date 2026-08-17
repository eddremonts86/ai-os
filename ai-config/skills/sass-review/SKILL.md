---
name: sass-review
description: Alias for `saas-review` — the whole-app SaaS design review (route inventory, audit, prioritised findings, batched fixes). Exists because "SaaS" is routinely typed "sass"; it has no behaviour of its own. Use when someone types "/sass-review". For anything about the Sass/SCSS stylesheet language, this is the wrong skill — say so instead of running a design review.
argument-hint: 'Optional: repo path, base URL, or a route/flow to scope the pass'
user-invocable: true
---

# /sass-review → /saas-review

Typo alias. Load and follow `saas-review` (`ai-config/skills/saas-review/SKILL.md`) with the same
`$input`, and mention once that the canonical command is `/saas-review`.

**Disambiguation:** if the request is actually about Sass/SCSS — mixins, nesting, `@use`, compiling
stylesheets, migrating off `@import` — this alias does not apply. Say so and handle the Sass question
instead of starting a design review.
