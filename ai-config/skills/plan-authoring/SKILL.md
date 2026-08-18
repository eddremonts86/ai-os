---
name: plan-authoring
description: Author and enrich AI-OS plan documents so they are web-ready. Use when asked to write, enrich, humanize or illustrate the SPEC/PRODUCT/PLAN/DESIGN/TASKS files under projects/, when a plan's status is draft or enriched, when `ai-os plans check` reports failures, or when a scraped problem needs turning into a real product plan. Enforces the contract in projects/_schema.json — YAML frontmatter, English headings, no template filler, no invented facts.
license: MIT
metadata:
  version: "1.0"
---

# Plan authoring

Turn a captured problem into a plan a reader would trust, one plan at a time.

The corpus this exists for had 14 of 24 sections byte-identical across all 552 plans,
one shared tech stack, and 29% of problem statements containing nothing but a country
name. The gate now catches that. Your job is to make it pass **without inventing
facts** — a plan that reads as authored but asserts things the source never said is
worse than an honest gap.

---

## 0. Setup — never skip

```bash
cat projects/_schema.json          # the contract: fields, sections, gate rules
ai-os plans check --id <id>        # what this specific plan fails, and why
```

The schema is the source of truth for structure. Do not invent a section, rename one,
or add a frontmatter field that is not in it. If the schema is wrong, change the
schema and say so — do not work around it silently.

---

## 1. Status is a promise, not a label

| Status | Means | Who sets it |
|---|---|---|
| `draft` | Metadata real, prose is only the captured problem | `ai-os plans format` |
| `enriched` | Every varying section has real per-plan content | you |
| `humanized` | Prose passed the humanizer skill | you |
| `web-ready` | Passed every gate rule | **only** `ai-os plans check` |

Advance one step at a time. Never write `web-ready` by hand: if you set it and the
gate disagrees, you have made the status field a lie, and the web shows the plan as
finished when it is not.

---

## 2. What may be inferred, and what may not

The source is a scraped forum or ProblemHunt post. It is thin on purpose.

**Ground every claim in it.** You may:

- Restate the problem in clear prose, keeping the poster's specifics — their role,
  their constraint, the number they quoted.
- Name target users the post actually implies.
- Scope an MVP that addresses *the stated problem*, not an adjacent bigger one.
- Choose a tech stack **for this problem** and justify it in one line.
- List risks that follow from what is written.

**You may not:**

- Invent a market size, a competitor, a price point or a metric the post did not state.
- Give every plan the same stack. That is the exact defect this replaces: one stack
  across 552 plans made the web's Tech facet filter nothing.
- Fill a section you have nothing real for. Leave the `<!-- TODO -->` marker and say
  so in your report. An honest gap is reviewable; filler is not.
- Translate the poster's words into marketing. If they said "I'm losing 20-30% of
  bookings", that number is the asset — do not soften it into "significant losses".

When the post is too thin for a section, that is a finding about the source, not a
prompt to write around it.

---

## 3. Order of work

Content, then voice, then pictures. Humanizing empty prose produces fluent emptiness.

1. **Enrich** — write the varying sections named in `_schema.json#documents`. Keep
   frontmatter facts and prose consistent: if `country: Nigeria`, the prose must not
   say Kenya.
2. **Humanize** — load the `humanizer` skill and run it over what you wrote. It
   catches the tells: inflated symbolism, rule-of-three padding, vague attribution,
   "significant"/"robust"/"leverage", negative parallelism.
3. **Illustrate** — only when a diagram carries information prose cannot. Load
   `diagram-design` and follow its taste gate. Write the SVG next to the plan and
   record it as `diagram:` in frontmatter.

   **Most plans do not earn a diagram.** The corpus previously shipped one identical
   ASCII box in all 552, which carried zero information precisely because it never
   varied. A diagram of three generic boxes is that same mistake with better
   typography. If the architecture is "client → API → database", write the sentence.

---

## 4. Verify before reporting

```bash
ai-os plans check --id <id> --verbose
```

Report what the gate says, not what you intended. If a rule still fails, say which
and why. If you left a TODO, name the section and what the source lacked.

Then, if the plan is part of the web corpus:

```bash
cd apps/plans-explorer/app && npm run index && npm run test:parser
```

The indexer's invariants catch entities, markup and zero-width characters that
survived — the same defects that once put raw `&#39;` on 178 plan cards.

---

## 5. Working through many plans

At corpus scale this is a batch, not a task. Use the `ai-os-loop` convention
(`TASK.md`, `LOOP_INSTRUCTIONS.md`, `PROGRESS.md`, `outputs/`) so it survives across
sessions and nothing is enriched twice:

```bash
ai-os plans check --json | jq -r '.plans[] | select(.status=="draft") | .id'
```

Work in ranked order — `projects/TOP_PROJECTS.md` first. A plan nobody will read is
the wrong place to spend a context window.

Record per plan in `PROGRESS.md`: id, status reached, sections left as TODO, and the
reason. That list is the honest inventory of what the corpus still lacks.

---

## 6. Anti-patterns

- Setting `status: web-ready` without running the gate.
- Writing the same MVP scope for two plans because both are "a marketplace".
- Reaching for `diagram-design` on every plan.
- Humanizing before there is content.
- Editing `projects/TOP_PROJECTS.md` to make a plan look better ranked — that file is
  cron-owned input, not an output.
- Inventing a `wtp` value. Absent means the poster never named a price, which is
  itself signal.
