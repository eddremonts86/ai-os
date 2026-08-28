# Plan document contract

Human-readable companion to `_schema.json`, which is the machine-readable source of
truth. **Change both in the same commit** — one file exists so the generator, the
gate and the web reader cannot drift, and two copies of the truth defeats that.

Enforced by `ai-os plans check`. Applied by `ai-os plans format`. Written by the
`plan-authoring` skill.

---

## Why this exists

The corpus was authored by a template filler, and it showed. Measured on 2026-08-13,
across 552 plans:

| Defect | Extent |
| --- | --- |
| H2 sections byte-identical across every plan | **14 of 24** |
| `PLAN.md` identical in full | **552 of 552** — same stack, same ASCII diagram, same milestones, same risks |
| Problem statement containing only a country name | **163 (29%)** — `Russia`, `Serbia`, `USA` |
| Problem statement under 60 characters | 36 (6%) |
| Distinct tech stacks | **1** — which is why the web's Tech facet read `React 552 · TypeScript 552` |
| Documents rendering raw HTML as prose | 351 (64%) |
| Unfilled placeholders (`**[Usuario primario]**`) | 552 |
| Section headings in Spanish | SPEC and PLAN, all 552 |

None of that is a formatting problem. The documents were mostly empty, and the
structure hid it: every plan looked complete because every plan looked the same.

---

## The two couplings this contract breaks

**Metadata was regex-scraped out of prose.** The web index matched Spanish literals —
`## Problema Detectado`, `**Categoría primaria:**`, `**Fecha:**`, `**Fuente:**`,
`**Despliegue:**`. Renaming a heading emptied the facets, the dates and the source
links, and the build still passed. Metadata now lives in YAML frontmatter, so prose
wording and web data are independent.

**`country` was an accident.** The reader took "the first Title-Case line before
`**Fuente:**`". It worked because 163 plans had a bare country sitting where the
problem belonged — **82% of every country the web displayed came from that defect**.
Fixing the problem statement would have silently emptied the country facet. It is now
an explicit field.

---

## Frontmatter

Every document opens with it. Required: `id`, `slug`, `title`, `status`, `source`,
`category`, `date`. Optional: `tags`, `country`, `wtp`, `scores`, `tech`, `diagram`.

```yaml
---
id: "001"
slug: a-psychologist-needs-an-advertising-bot
title: A psychologist needs an advertising bot that adjusts her ads
status: draft
source:
  name: ProblemHunt
  url: "https://problemhunt.pro/en/marketing/f9domkol61-..."
category: marketing
date: "2026-07-20"
tags: [Marketing, Productivity]
country: Russia
wtp:
  raw: "$100-300/month"
  currency: $
  min: 100
  max: 300
  period: month
scores:
  money: 8
  learn: 7
tech: [React, Node.js API (TanStack Start)]
---
```

Absent beats invented. No `wtp` means the poster never named a price — that is signal.
No `tech` means nobody has chosen a stack for this problem yet; it must **never** be
the old global default, which is what made the facet useless.

`DESIGN.md` is the exception: it already carries an authored design-token block
(`source: "Linear"`, nested `typography.heading.fontFamily`). That block is preserved
verbatim and never reinterpreted as schema frontmatter.

---

## Status lifecycle

```
draft → enriched → humanized → web-ready
```

| Status | Means | Set by |
| --- | --- | --- |
| `draft` | Metadata real, prose is only the captured problem | `ai-os plans format` |
| `enriched` | Every varying section has real per-plan content | agent, via `plan-authoring` |
| `humanized` | Prose passed the `humanizer` skill | agent |
| `web-ready` | Passed every gate rule | **only** `ai-os plans check` |

One step at a time, no skipping. `web-ready` written by hand is a lie the web then
repeats: the plan renders as finished when it is not.

---

## Sections

`_schema.json#documents` lists required and optional headings per file, plus
`varyingSections` — the ones that must differ between plans. A varying section
repeated across more than 2% of the corpus is template filler and the gate rejects it.

`DESIGN.md` declares no varying sections on purpose. Each plan references one of 14
design systems, so its `### Typography` / `### Spacing` subsections repeat by design.
That is content, not filler, and the formatter leaves it alone.

---

## Gate rules

Ten rules, each recording the defect it exists to catch so nobody relaxes one without
knowing what it was holding back. `error` blocks `web-ready`; `warn` does not.

| Rule | Sev | Catches |
| --- | --- | --- |
| `frontmatter-present` | error | Legacy shape, or missing required fields |
| `no-placeholder-text` | error | `**[Usuario primario]**` and friends |
| `no-template-clone` | error | A varying section identical across >2% of plans |
| `problem-substantive` | error | Under 120 chars, or just a country name |
| `no-html-in-prose` | error | Entities, tags, comments |
| `no-zero-width` | error | Invisible codepoints that break wrapping and search |
| `english-headings` | error | Missing or non-schema section headings |
| `no-bare-long-url` | warn | Bare URL over 100 chars |
| `heading-depth` | warn | A skipped heading level |
| `tech-not-default` | warn | The old global stack copied in |

---

## The flow

| Stage | Runs | Writes | Notes |
| --- | --- | --- | --- |
| Capture | `tools/problemhunt-scraper` | frontmatter + captured problem, `status: draft` | Deterministic, no LLM, offline |
| Format | `ai-os plans format --write` | migrates legacy plans to the shape above | Dry run by default; never invents prose |
| Enrich | agent, `plan-authoring` skill | the varying sections | Judgement, not regex |
| Humanize | agent, `humanizer` skill | the same prose, de-slopped | After content, never before |
| Illustrate | agent, `diagram-design` skill | an SVG + `diagram:` | Only when a diagram informs |
| Gate | `ai-os plans check` | nothing | The only thing that may certify `web-ready` |

Enrichment is deliberately not a script. A regex can restructure a document; it
cannot tell whether an MVP scope addresses the stated problem. Splitting the flow this
way also keeps capture cheap and offline, and makes enrichment resumable — 552 plans
do not fit in one context window.

---

## Known gaps

Recorded here rather than left for someone to rediscover.

- **Prose is still Spanish in places.** `TASKS.md` checklists and some footers are
  Spanish. The formatter renames headings, which is mechanical, but does not translate
  content — that changes meaning and belongs to enrichment.
- **The gate does not detect Spanish prose.** `english-headings` checks headings only.
  A rule for body language would need care to avoid flagging quoted source text, which
  is legitimately in the poster's own language.
- **`tech` is absent on every migrated plan** by design, so `tech-not-default` passes
  vacuously until enrichment fills it. The web's Tech facet stays empty until then,
  which is honest: there was never a real stack to show.
