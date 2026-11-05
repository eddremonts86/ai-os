# 02 — Projects

Inventory of Edd's projects, for agents that need to find one fast. All projects live under the
projects directory — the one that contains this repo, `$(dirname "$AI_OS_ROOT")`, written
`<projects>/` below.

> **Last verified:** 2026-11-05, re-derived from disk (git log, remotes, package.json, README /
> CLAUDE.md). Refresh with:
> `find <projects> -mindepth 2 -maxdepth 4 -name .git -type d`, then per repo
> `git -C <repo> log -1 --format=%cs` and `git -C <repo> remote get-url origin`.

## Layout and identity

```
<projects>/
├── ai-os/                      ← this framework
├── eddremonts86/actives/       ← personal, in development   (GitHub identity: eddremonts86)
├── eddremonts86/inHold/        ← personal, parked / legacy
└── AppExternas/                ← external work
    └── ei-employer/           ← Employer (employer)       (GitHub identity: work@example.com)
```

`~/.gitconfig` on this Mac has no `includeIf` (checked 2026-11-05), so repos under
`AppExternas/ei-employer/` use the global identity until one is added.

"Skills" below = project-local `.agents/skills/` (count of entries). Those skills are **not** in
the global AI-OS set; read them when working in that repo.

## Active — `<projects>/eddremonts86/actives/`

| Project | Purpose | Stack | Last commit | Remote / URL |
| --- | --- | --- | --- | --- |
| **builderhunt** | Finds active builders: aggregates public dev activity from 12 sources, scored for recency. **The reference app** (see below) | TanStack Start, React 19, Drizzle + Postgres, better-auth, Stripe | 2026-10-16 | eddremonts86/builderhunt · builderhunt.dev |
| HunterReady | CV optimizer: any CV → verifiably ATS-safe PDF, tuned to a job description | TanStack Start, Drizzle + Postgres, better-auth, Stripe | 2026-09-23 | eddremonts86/hunterready · hunterready.dev |
| plansmith | The plans product: scraper, corpus, daily pipeline, explorer SPA, read API, submissions API. Split out of ai-os 2026-09-25 | Node (Fastify API), Vue + Vite explorer; 3 Dockerfiles. Skills: 2 | 2026-09-26 | eddremonts86/plansmith · plans.eduardoinerarte.dk |
| novelaudio | Light novels translated to Spanish and narrated, with a web reader | Python pipeline (runs on the Windows/WSL2 PC), TanStack Start `web/`, Audiobookshelf | 2026-10-28 | eddremonts86/novelaudio · novelaudio.eduardoinerarte.dk |
| NovelAudioMac | Native macOS client for the NovelAudio library (`/api/v1`) | SwiftUI (Swift Package) | 2026-10-28 | — (no remote) |
| edd-remonts-dashboard | Edd's personal profile / portfolio site for clients and employers (README is still the template's) | TanStack Start, Drizzle + Postgres, Clerk/better-auth | 2026-11-02 | eddremonts86/edd-remonts-dashboard · profile.eduardoinerarte.dk |
| edd-app-template | Production SaaS starter (auth, AI, RBAC, i18n); derived apps clone it | TanStack Start, Drizzle + Postgres, Clerk/better-auth, Stripe. Skills: 2 | 2026-09-23 | eddremonts86/edd-app-template · edd-starter.eduardoinerarte.dk |
| edd-app-vite | SPA-only sibling of edd-app-template (no SSR, no DB); `npx @edd_remonts/create-edd-app-vite` | Vite, React 19, TanStack Router, Clerk | 2026-06-25 | eddremonts86/edd-app-vite |
| ai-schadcn-chat | npm lib `@edd_remonts/ai-schadcn-chat`: configurable AI chat panel for React (Anthropic/OpenAI-compatible) | React, Vite, Tailwind 3 | 2026-09-23 | eddremonts86/ai-schadcn-chat · demo ai-chat.eduardoinerarte.dk |
| enForma | Local-first gym/calisthenics tracker PWA, encrypted local profiles | Vite, React 19, TanStack Router/Query, Zustand | 2026-09-06 | eddremonts86/enForma · enforma.eduardoinerarte.dk |
| geoLocal | Location-based listings platform for Denmark | TanStack Start, Drizzle + PostGIS, MapLibre, Playwright scraper | 2026-09-23 | eddremonts86/geoLocal · geo.eduardoinerarte.dk |
| budget-app | Budget app on the TanStack SaaS template (multi-scope budgets, AI) | TanStack Start, Drizzle + Postgres, Clerk/better-auth | 2026-09-23 | eddremonts86/budget-app |
| mdxViewer | Self-hosted workspace for a folder of Markdown/MDX docs: browse, search, edit, reorganize | Vite + React 19, Express 5 | 2026-09-04 | eddremonts86/mdxViewer |
| Hetzner | Local replica of production infra (one Hetzner box `conductor-01` running Coolify) to reproduce cloud problems | Docker Compose, Coolify | 2026-09-23 | eddremonts86/Hetzner |
| eddremonts | Personal portfolio (`edd-portfolio/`) + knowledge base folder; Netlify wrapper | Vite + React. Skills: 9 | 2026-06-25 | eddremonts86/eddremonts |

Also in `actives/`: `DEV-STATUS.md` (local dev-server ports and the shared `actives-postgres`
container, 2026-09-19 — its ai-os `apps/` plans rows predate the plansmith split) and `data/`
(audio files, not a repo). Production deploys run on Coolify (Hetzner) at `*.eduardoinerarte.dk`.

### The reference app — builderhunt

Edd's instruction (2026-08-14): when a new project needs a decision builderhunt already made,
copy it instead of inventing a second answer.

| Decision | Where |
| --- | --- |
| `master` = production (deploys on green), `dev` integrates, `feat/fix/chore` merged by PR | `CLAUDE.md` § Deploys |
| Local quality gate mirrored from CI, pre-push hook on every branch | `scripts/ci/local-quality.sh`, `.githooks/pre-push` |
| CI: `pull_request` + push to `[master, dev]`, `paths-ignore` prose | `.github/workflows/quality.yml` |
| Coolify deploy on `workflow_run` after Quality is green, then verify from outside | `.github/workflows/deploy.yml` |
| Drizzle + Postgres, forward-only migrations, idempotent deploy orchestrator | `scripts/deploy/orchestrate.mjs`, `docs/operations/deploy-runbook.md` |
| Runtime DB roles created without passwords by migration, provisioned after migrate | `drizzle/0002_database_roles.sql`, `docs/operations/database-roles.md` |
| Review required where a mistake is invisible in a diff | `.github/CODEOWNERS` |
| Dev server run as `./node_modules/.bin/vite`, not via pnpm | `.claude/launch.json` |

The house stack is **Drizzle + Postgres on Coolify, not Convex** — distrust any roadmap that says
otherwise. `docs/operations/` (50+ runbooks: deploys, restore drills, Stripe, load tests,
incidents) is the place to start any new runbook.

## In hold — `<projects>/eddremonts86/inHold/`

Parked. Remote is `eddremonts86/<same name>` unless noted. Many show **2026-06-25** as last
commit — a bulk commit, not real activity. Notable ones first:

| Project | Purpose | Stack | Last commit | Notes |
| --- | --- | --- | --- | --- |
| iaWorkSpace | Multi-root VS Code workspace grouping the **Employer ERP** projects (frontend, backend, tools, docs) + security audit tools | pnpm workspace, Docker. Skills: 13 | 2026-06-25 | Employer-related despite living under personal scope |
| hermes-agent | Source of the Hermes agent CLI that AI-OS supports (not `~/.hermes`) | Python | 2026-06-10 | — |
| anySolutions | Vue app (`Loyal_Solutions`) | Vue + Vuetify | 2026-06-27 | — |
| create-hermes-workspace(-pkg) | Bootstrap a Hermes workspace; `-pkg` = npm `@edd_remonts/create-hermes-workspace` | Node, Docker | 2026-06-06 / 06-25 | `hermes-workspace-tour` (static tour, skills: 2), `hermes-workspace-internal`, `hermes-flow-smoke-test` (skills: 2) are siblings |
| supersonic-calculator | App on the TanStack SaaS template | TanStack Start. Skills: 2 | 2026-06-05 | — |
| tanstack-template / tanstack-base-project | Earlier TanStack templates | TanStack | 2026-06-25 | superseded by edd-app-template |
| sass-template | Next.js + Strapi monorepo template | Next, Strapi, Clerk, Postgres | 2025-11-15 | — |
| npmPakage | `employer-widgets-system` UI library | React, shadcn, TanStack Query | 2025-07-11 | Employer-related; `employer-widgets-demo-1` is its demo (2025-07-04) |
| project-proposal | `employer-new` proposal app | React | 2024-08-26 | — |
| voice-prompt-cleaner | Refines voice-dictated prompts into clean structured ones | Node, Docker | 2026-06-25 | — |
| hola-eduardo | Welcome page | Docker | 2026-06-25 | — |
| coolify-test | Coolify deployment test | Docker | 2026-05-04 | — |
| Drupal8-ModulesAndTemplates / Drupal8-ProjectManager | Drupal 8 modules / project-manager module | Drupal 8, PHP. Skills: 1 each | 2026-06-25 | — |
| Drupal7-ModulesAndTemplates, ObtoberCMS-and-Laravel5, obtover-cms-portfolio, PHP-cookiesBar, Templete-HTML-CSS-PHP | Legacy PHP / CMS work | PHP | 2026-06-25 | — |

Other parked repos (legacy demos and experiments, mostly Vue/React/Nuxt; last commit in
brackets): CubaProjects, Dashboard-, Dope-Template, HBO-loginPages, MyXpaces, PWAs-wedding,
Templates-404Page, bash-automaticGenerators, chucknorris, countdown-timer, desingSistem,
docker-lando-services, firstReactProject, gifted-perlman-h57dz3 (Lexical), js-oddsCalculator,
nuxt-3-zunzun, select-date-infinite [all 2026-06-25 bulk]; template-myWedding [2026-02-27];
porfolio [2025-09-16]; register_example [2025-09-05]; next-clerck [2025-03-17];
react-table-reusable [2024-07-08]; xpaces-nuxt-version, HackerNews [2024-06]; youtube-code-challenges,
react-query-plus-axios [2024-05]; react-landing-page, invoiceCalc [2024-04]; portfolio, To-Do
[2024-03]; letter_pilot [2023-12]; pokemon-index [2022-04]; cloudinaryDemo, vue-NordsenseApp
[2022-03]; damvad [2022-02]; dc-multiverse [2021-11]; musicFilter [2020-08]; vue-Carrusel,
vue-monosolutiosapps, WindowsTerminal-ConfigurationGenerator [2020-06]; SnapShots [2020-02];
vue-Memes [2019-11]; vue-AWSIntegration [2019-01].

Non-repo items: `SKILLS-RESEARCH-2026-06-27.md` (118 candidate skills → 20 recommendations),
`builderhunt-tracking-exports/`, `plans/`. Archival candidates — **do not delete** without
confirmation (`rules/ask_before_doing.md`).

## External / client — `<projects>/AppExternas/`

### Employer (`AppExternas/ei-employer/`) — Edd's employer

Employer makes an ERP for publishers; "Wave" is its web UI line (wave1).

| Project | Purpose | Stack | Last commit | Remote / URL |
| --- | --- | --- | --- | --- |
| **wave-template** | "Wave Starter": production React template with the Wave look & feel; features port to/from wave1 | Vite, React 19, TanStack Router, Tailwind 4, Playwright; Bitbucket Pipelines. Skills: 31 | 2026-06-11 | ei-employer/wave-template |
| kontrakt-manager | Editorial contract lifecycle for publishing houses (ref. client Aarhus Universitetsforlag); built on wave-template | Vite, React 19, TanStack Router, Tailwind 4, Playwright. Skills: 31 | 2026-06-30 | ei-employer/kontrakt-manager |
| wave-tech-radar | Tech Radar visualisation | Vite, React 19, Tailwind 4, three.js | 2026-08-23 | ei-employer/wave-tech-radar |
| ia-royalty-validations | Validates royalty statement files against Employer ERP settlement rules | FastAPI + SQLAlchemy backend, Vite + React frontend, Docker. Skills: 1 | 2026-03-24 | ei-employer/ia-royalty-validations |

Related Employer work outside this folder: `inHold/iaWorkSpace`, `inHold/npmPakage`,
`inHold/employer-widgets-demo-1`.

### Others

| Project | Purpose | Stack | Last commit | Remote / URL |
| --- | --- | --- | --- | --- |
| open-higgsfield | Third-party open-source alternative to Higgsfield AI (image/video generation, 38 models) | Next 16, React 19 | 2026-09-17 | wide-trace/open-higgsfield · openhiggsfield.ai |
| openGym | Not a repo: a `docker-compose.yml`, saved image tarball, data/media dirs | Docker | — | — |

## AI-OS itself

| Project | Purpose | Stack | Last commit | Remote / URL |
| --- | --- | --- | --- | --- |
| ai-os | This framework: context, rules, skills, setup scripts; `apps/site` (landing) and `apps/create-ai-os` (npm `@edd_remonts/create-ai-os`) | Markdown, shell, Python, Docker | 2026-11-05 | eddremonts86/ai-os · ai-os.eduardoinerarte.dk |

## Keeping this current

- New project: create it under the right scope (`eddremonts86/actives`, `inHold`, or
  `AppExternas/<client>`), then add a row here.
- Moving a project between `actives/` and `inHold/` changes its path: update the row.
- Re-derive, don't guess: last commit and remote from git, stack from the manifest, purpose from
  README / CLAUDE.md. Mark unknowns `—`.
