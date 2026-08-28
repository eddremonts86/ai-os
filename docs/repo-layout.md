# Repository layout: the framework/product split

> Decision record for how this repository is organised, why, and what must not be "tidied".
> Written 2026-08-18, when the reorganisation finished. Read this before moving anything at
> the repo root — several entries look like clutter and are load-bearing.

## The rule

**Everything above `apps/` is the operating system. Everything from `apps/` down is what the
operating system produced.**

That single sentence decides every placement question. When adding a file or directory, ask:

- Would this exist if AI-OS had never built a product? → framework, top level.
- Does it only exist because the plans corpus / the site / the explorer exists? → under `apps/`.

The split matters because the two halves have different lifecycles. The framework is
hand-written, small, and replicated to other machines by `setup/install-mac.sh`. The products
are large (`apps/` is 211 MB against `ai-config/`'s 15 MB), mostly machine-written, and
deployed. Mixing them made the root unreadable and made "is this mine or is this generated?"
unanswerable at a glance.

## Layout

```
ai-os/
├── CLAUDE.md                   # master instructions
├── AGENTS.md                   # SYMLINK → CLAUDE.md. Do not delete. See "Traps".
├── Dockerfile{,.plans-explorer,.submission-api}   # deploy descriptors. Root by necessity.
├── ai-os                       # the CLI entry point
│
│   # ── the framework ────────────────────────────────────────────────
├── context/                    # persistent identity (profile, prefs, projects, tools)
├── rules/                      # hard rules (always/ask/never)
├── specs/                      # the one active Spec
├── verifiers/                  # quality gates
├── workflows/                  # recurring processes
├── skills/                     # the skill template + README (see "Traps")
├── prompts/                    # original Karpathy prompts
├── ai-config/                  # skills, MCP, commands — source of truth, symlinked to CLIs
├── dev-env/                    # dotfiles, Brewfile, env-config
├── setup/                      # install + verify scripts
├── docs/                       # this file and its siblings
├── memory/                     # loop registry + graph state
├── archive/                    # completed Specs
├── outputs/                    # the FRAMEWORK's artifacts: research, audits, diagrams
├── vendor/                     # third-party vendored skills (193 MB, read-only)
│
│   # ── the products ─────────────────────────────────────────────────
└── apps/
    ├── site/                   # the AI-OS landing (ai-os.eduardoinerarte.dk)
    ├── plans-explorer/         # the plans SPA (plans.eduardoinerarte.dk)
    ├── submission-api/         # the submissions write path
    ├── create-ai-os/           # published npm package @edd_remonts/create-ai-os
    └── data/                   # the plans product
        ├── projects/           #   the corpus: 466 machine-written plan dirs
        ├── tools/              #   the machinery
        │   ├── problemhunt-scraper/   # capture
        │   ├── plan-format/           # the contract, the gate, the formatter
        │   ├── plans-pipeline/        # the daily loop
        │   └── lib/                   # shared id allocation
        ├── skills/             #   skills that document this product's machinery
        ├── progress/           #   the enrichment loop's 4-file set + per-agent logs
        └── outputs/            #   the PRODUCT's run artifacts (ignored, machine-local)
```

## Traps: things that look like clutter and are not

### `AGENTS.md` is a symlink to `CLAUDE.md`

```
lrwxr-xr-x  AGENTS.md -> CLAUDE.md
```

Byte-identical by construction. It is not duplication — it is how CLIs that look for
`AGENTS.md` (Codex, Antigravity) find the instructions that Claude Code finds in `CLAUDE.md`.
Deleting it, or replacing it with a real file, breaks those clients **silently**: they simply
start with no instructions and behave like a stock model.

### The `Dockerfile*` trio stays at the root

They are deploy descriptors for the repository, not for a directory. Coolify addresses them by
absolute path (`dockerfile_location=/Dockerfile`, `base_directory=/`), and each app's build
context is the repo root because the explorer's indexer reads `apps/data/projects/` at build
time. Moving them into their apps would mean **editing live production configuration to land a
directory rename** — the rename is not worth a deploy outage. See
[`setup/deploy/README.md`](../setup/deploy/README.md).

### `outputs/` exists in two places, on purpose

| Path                 | Holds                                              | Written by                                |
| -------------------- | -------------------------------------------------- | ----------------------------------------- |
| `outputs/`           | research reports, audits, generated diagrams       | a human asking for research               |
| `apps/data/outputs/` | enrichment reports, slice manifests, pipeline logs | `apps/data/tools/plans-pipeline/daily.sh` |

Both are gitignored with a tracked `.gitkeep`. This is not an accident to be consolidated: the
first is framework output, the second is product output, and they are ignored separately so
either can start being tracked without dragging the other along.

### Root `skills/` keeps only two files

`README.md` and `skill_template.md`. `prompts/setup/02-master-prompt.md` and
`prompts/skill-creation/04-convert-to-skill.md` both point at the template, and
`CLAUDE.md` §17 documents this as the workspace-skill location. Global skills live in
`ai-config/skills/`; nothing auto-scans root `skills/`, which is why a product skill could
live there unnoticed for weeks.

### Paths are resolved by marker, never by counting `..`

`apps/data/tools/plan-format/lib/plan.mjs` walks up until it finds `CLAUDE.md`:

```js
function findRoot(from) {
  let d = from;
  while (d !== dirname(d)) {
    if (existsSync(join(d, 'CLAUDE.md'))) return d;
    d = dirname(d);
  }
  throw new Error(`cannot locate the AI-OS root above ${from}`);
}
```

This exists **because** of this reorganisation. Every `../..` hop count in the tooling broke
the moment a directory moved, and the failures were silent (an empty glob reads as "zero plans"
and every downstream check passes). Anything new that needs the repo root must use the marker.

### An explicit `AI_OS_ROOT` beats the marker, and the container has no marker

The marker walk is the rule inside the repository. It is not sufficient everywhere, and the
exception cost a deploy:

`Dockerfile.plans-explorer` copies **only** `apps/data/projects/` and `apps/plans-explorer/`.
There is no `CLAUDE.md` in that tree, so converting `build-index.mjs` from hop counting to the
marker walk made the image stop building with `cannot locate the AI-OS root above
/repo/apps/plans-explorer/app/scripts`. The local `npm run build` passed the whole time — a green
local build says nothing about an image whose context is a subset of the repo.

So the precedence is: **`process.env.AI_OS_ROOT` wins; the marker walk is the fallback; throw if
neither works.** Every entry point honours that now — `plan.mjs`, `build-index.mjs`,
`test-parser.mjs`, `select-slice.mjs`, the scraper and `scrape-cron.sh`. The Dockerfile sets
`ENV AI_OS_ROOT=/repo` rather than copying an instructions file into a web image to satisfy a
search.

`plan.mjs` was the one that ignored the variable, and the consequence was worse than a wrong
path: a regression test that set `AI_OS_ROOT` to a temp fixture ran against the **real** corpus
instead, and passed while proving nothing. If a tool cannot be pointed at a fixture corpus, its
tests are not testing it.

### Two copies of a normalisation will drift, and the drift is invisible

`ai-os plans format` must reach a fixed point in one pass, and it has failed that twice for the
same reason. The clone tally fingerprints a normalised section body; `isFiller` tests a body that
has been through `rewriteBody`. When the two apply different normalisations, pass 1 finds no
clones and pass 2 finds them all.

The metadata block is why it bites hardest: before it is lifted into frontmatter each plan's
Problem section is unique, because the source URL differs. After it is lifted, they are identical.
A tally that runs before the strip cannot see the clones the strip creates.

There is now one `normaliseForClone` shared by both, and a test that runs the real command twice
over a temp corpus and requires the second run to report zero changes. That test was watched to
fail with the fix reverted — a regression test nobody has seen fail is not evidence.

### Provenance comes from the host, because the label does not survive

`source.name` was wrong for 189 published plans (`manual`, with a `problemhunt.pro` URL) and for
five whole sources, which all claimed to be ProblemHunt. Two rules came out of fixing it:

- The prose label is **not** durable. `stripMetadataBlock` removes it on the migrating run, so a
  formatted plan has only its URL left as evidence of origin. Derive from the host.
- The display label belongs to the data. The plan page hardcoded "View on ProblemHunt" beside a
  link that pointed at reddit.com for 220 of 419 plans.

## Ledger: what moved on 2026-08-18, and why

| From                                             | To                                       | Why                                                                                                                                             |
| ------------------------------------------------ | ---------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `packages/create-ai-os/`                         | `apps/create-ai-os/`                     | a published npm package is a product by definition. `repository.directory` in its `package.json` updated to match                               |
| `skills/problemhunt-pipeline/`                   | `apps/data/skills/problemhunt-pipeline/` | documents the scraper; it was product machinery sitting in the framework's skill dir                                                            |
| `TASK.md`, `LOOP_INSTRUCTIONS.md`, `PROGRESS.md` | `apps/data/progress/`                    | the enrichment loop's 4-file set. It enriches the corpus; it is not framework machinery. Joins the per-agent `PROGRESS.*.md` logs moved earlier |
| `outputs/enrich/`, `outputs/plans-pipeline/`     | `apps/data/outputs/`                     | run artifacts of the plans product. `daily.sh`'s `SLICE_MANIFEST`/`LOG_DIR` and `cron-prompt.md` updated                                        |

Earlier stages of the same reorganisation: `site/` → `apps/site/`, `plans-explorer/` →
`apps/plans-explorer/`, `projects/` → `apps/data/projects/`, `tools/` → `apps/data/tools/`,
`PROGRESS.*.md` → `apps/data/progress/`.

### Deleted

| What                      | Why                                                                                                                                                                                                                                                              |
| ------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `scripts/enrich_slice.py` | dead. Worker for a manual enrichment attempt: pointed at `REPO/projects` and `PROGRESS.5.md` (both moved) and operated on ids 445-552, **none of which remain** in the corpus. Not executable. It was the only file in `scripts/`, so the directory went with it |
| `IDEA.md`                 | an 18-byte stub reading "AI source of true"                                                                                                                                                                                                                      |

### Parked outside the repo (untracked, so not recoverable from git)

| What         | Note                                                                                                                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `_agent5/`   | 268 KB of Python scratch from the aborted batch-3 enrichment. Gitignored via `_agent*/`, so invisible to git                                                        |
| `plans-api/` | 13 MB containing **only `node_modules`**. Its source lives on the unmerged `feat/plans-api` branch. When that branch lands, the source belongs at `apps/plans-api/` |

## Work that is deliberately not here yet

Three branches predated the reorganisation and held finished work at the old paths. A plain
merge would have resurrected `projects/` and `tools/` at the root, so each was resolved by hand
on 2026-08-18. Recorded because "why is this still a branch?" is otherwise unanswerable:

| Branch                         | Disposition                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| ------------------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `feat/plans-cron`              | **absorbed.** Its `scrape-cron.sh` was ported to `apps/data/tools/plans-pipeline/`, because the launchd plist already pointed at the new path and the file existed nowhere. Its README rewrite was *not* taken — dev's version is later and documents the 4 h cadence and the real Hermes job id                                                                                                                                                                                                                                                                                                                                                                      |
| `chore/cron-corpus-2026-08-17` | **partially taken.** The scraper's modular `sources/` refactor and its HN/IndieHackers fixes landed. Its 1,014 draft plans and its `state.json` did not: importing the cursor would have marked them seen and stopped future scrapes from finding them. **The re-scrape only partly worked.** It ran on 2026-08-18 and brought 810 captures, but comparing by source url shows **360 of the branch's captures are still absent from main** — 288 Hacker News, 42 BetaList, 30 ProductHunt. HN's Algolia feed returns only recent items and those ids have aged out, so those do not come back from a scrape. They have to be ported off the branch or they go with it |
| `feat/plans-api`               | **deferred, branch intact.** A Fastify read-only API over the corpus, built for builderhunt to consume. Nothing consumes it yet. When it lands it belongs at `apps/plans-api/`, and the zero-dependency shape of `apps/submission-api/` is worth reconsidering against it first                                                                                                                                                                                                                                                                                                                                                                                       |

The general rule these follow: a branch older than a layout change is ported, not merged. Take
its content, re-apply the current paths, and re-verify by running the thing — the scraper port
is why `--dry-run` is now actually dry.

## When you add something new

- A new deployed product → `apps/<name>/`, and its Dockerfile at the root as
  `Dockerfile.<name>` with `base_directory=/`.
- A new skill: globally useful → `ai-config/skills/`; documents one product's machinery →
  `apps/<product>/skills/`; workspace-specific to another repo → that repo's `.agents/skills/`.
- A generated artifact → the matching `outputs/`, and confirm it is ignored with
  `git check-ignore -v <path>` **before** committing. `apps/data/outputs/` alone is 3.7 MB.
- Anything that needs the repo root → resolve it by walking up to `CLAUDE.md`.
