# 02 — Projects

Inventory of active and archived projects. **All projects live under the projects directory** — the directory that contains this repo, i.e. `$(dirname "$AI_OS_ROOT")`, written `<projects>/` below. Scopes: `eddremonts86/actives/` and `eddremonts86/inHold/` (personal) and `AppExternas/` (external, including `AppExternas/ei-schilling/` for work).

> **Last verified:** paths re-checked 2026-11-05 on the current Mac (`ls`); the per-project Files / Last-modified / Status columns are still the 2026-06-28 snapshot and were not re-inventoried. Projects not listed here (e.g. `actives/plansmith`, `actives/HunterReady`, `actives/novelaudio`) postdate it.

> Originally discovered by analyzing the projects directory on 2026-06-28 via `ls -la`, `find -type f`, `stat -f '%Sm'`, and inspecting `package.json` for stack hints. Counts and dates verified.

## Root layout

```
<projects>/
├── ai-os/                          ← AI Operating System (this framework)
├── eddremonts86/
│   ├── actives/                    ← Personal, in active development
│   └── inHold/                     ← Personal, paused / legacy
└── AppExternas/                    ← External projects
    └── ei-schilling/               ← Work scope
```

The mapping is:

- `eddremonts86/` corresponds to **personal identity** (GitHub: eddremonts86@gmail.com).
- `AppExternas/ei-schilling/` corresponds to **work identity** (GitHub: ei@schilling.dk).

## Work — Schilling (employment)

All under `<projects>/AppExternas/ei-schilling/`.

| Project                    | Path                                              | Stack (from package.json)                                                                                   | Status               | Files            | Last modified          | Notes                                                                                              |
| -------------------------- | ------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------------- | ---------------- | ---------------------- | -------------------------------------------------------------------------------------------------- |
| **wave-template**          | `<projects>/AppExternas/ei-schilling/wave-template/`          | Vite + React 19 + TanStack Router + TanStack Query + shadcn/ui + Tailwind v4 + Convex + Netlify + Decap CMS | **Active (primary)** | (large repo)     | Jun 26 13:08           | The Wave template. Headless CMS + Convex backend + Netlify deploy. Has README, package.json, .git. |
| **kontrakt-manager**       | `<projects>/AppExternas/ei-schilling/kontrakt-manager/`       | PHP/Drupal                                                                                                  | **Active**           | 63 files in root | Jun 30 (PR #10 merged) | Contract management. Confirmed active 2026-07-02 via git log (PR merged 2026-06-30).               |
| **wave-tech-radar**        | `<projects>/AppExternas/ei-schilling/wave-tech-radar/`        | (smaller repo)                                                                                              | candidate            | 20 files in root | Jun 26 13:08           | Tech radar companion to wave-template. Smaller.                                                    |
| **ia-royalty-validations** | `<projects>/AppExternas/ei-schilling/ia-royalty-validations/` | (medium repo)                                                                                               | candidate            | 35 files in root | Jun 26 13:08           | AI royalty validations. Work project.                                                              |

To determine which of `wave-tech-radar` / `ia-royalty-validations` is actively used vs archived, check git log activity or ask Edd (kontrakt-manager already confirmed Active, 2026-07-02).

## Personal — `eddremonts86/`

All under `<projects>/eddremonts86/` (`actives/` or `inHold/`). **Mostly legacy (pre-2024).**

### Active

| Project                           | Path                                                    | Stack                                                 | Status     | Files  | Last modified                                                   | Notes                                                                                                                                                                                              |
| --------------------------------- | ------------------------------------------------------- | ----------------------------------------------------- | ---------- | ------ | --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **anySolutions**                  | `<projects>/eddremonts86/inHold/anySolutions/`                 | Vue 3 + Node + npm (Loyal_Solutions per package.json) | **Active** | 56,866 | Jun 27 19:01                                                    | Last modified Jun 27 — clearly active. Vue/Node project.                                                                                                                                           |
| **iaWorkSpace**                   | `<projects>/eddremonts86/inHold/iaWorkSpace/`                  | (workspace-security-tools)                            | **Active** | 3,302  | Jun 25 (last commit)                                            | Meta-repo orchestrating multiple apps. Matches `01_business_or_work.md`. Kept active despite an older mtime because it's a low-churn orchestration repo, not because it's unused.                  |
| **hermes-agent**                  | `<projects>/eddremonts86/inHold/hermes-agent/`                 | Python 3.11 + Hermes (Nous Research)                  | **Active** | 4,981  | (source repo, not `~/.hermes` which is the CLI config/data dir) | Reference/contribution repo for the Hermes CLI this AI-OS supports (see `hermes-mcp-pattern` skill). Matches `01_business_or_work.md`; previously mislabeled Legacy here from a stale-mtime crawl. |
| **SKILLS-RESEARCH-2026-06-27.md** | `<projects>/eddremonts86/inHold/SKILLS-RESEARCH-2026-06-27.md` | (markdown document)                                   | Active     | 1 file | Jun 27 19:37                                                    | Research document Edd created on Jun 27. 118 candidate skills → 20 recommendations.                                                                                                                |

### Legacy / archived candidates

These are personal projects from before 2024. All have last-modified Jun 26 12:xx (which is a bulk-import timestamp, not real activity). They are **archived** unless Edd says otherwise.

If any of these turns out to be active (e.g. someone else works on it, or it has unmerged changes), move it back to the "Active" section.

| Project                                    | Path                                                              | Stack (inferred)                       | Files   | Notes                                                            |
| ------------------------------------------ | ----------------------------------------------------------------- | -------------------------------------- | ------- | ---------------------------------------------------------------- |
| **Drupal7-ModulesAndTemplates**            | `<projects>/eddremonts86/inHold/Drupal7-ModulesAndTemplates/`            | Drupal 7 + PHP                         | 2,295   | Drupal 7 modules. Legacy.                                        |
| **Drupal8-ModulesAndTemplates**            | `<projects>/eddremonts86/inHold/Drupal8-ModulesAndTemplates/`            | Drupal 8 + PHP                         | 2,781   | Drupal 8 modules. Legacy.                                        |
| **Drupal8-ProjectManager**                 | `<projects>/eddremonts86/inHold/Drupal8-ProjectManager/`                 | Drupal 8 + PHP + Composer              | 44      | Drupal 8 project manager module. Legacy.                         |
| **ObtoberCMS-and-Laravel5**                | `<projects>/eddremonts86/inHold/ObtoberCMS-and-Laravel5/`                | October CMS + Laravel 5 + PHP          | 2,753   | October CMS + Laravel 5. Legacy.                                 |
| **obtover-cms-portfolio**                  | `<projects>/eddremonts86/inHold/obtover-cms-portfolio/`                  | (PHP)                                  | 2,623   | October CMS portfolio. Legacy.                                   |
| **CubaProjects**                           | `<projects>/eddremonts86/inHold/CubaProjects/`                           | (mixed)                                | 106,661 | Large legacy project (CubaProjects). Worth checking what it is.  |
| **bash-automaticGenerators**               | `<projects>/eddremonts86/inHold/bash-automaticGenerators/`               | (bash)                                 | 51      | Bash script generators. Legacy.                                  |
| **budget-app**                             | `<projects>/eddremonts86/actives/budget-app/`                             | (mixed)                                | 928     | Budget app. Legacy.                                              |
| **builderhunt**                            | `<projects>/eddremonts86/actives/builderhunt/`                            | TanStack Start + Drizzle + Postgres    | 102     | **THE REFERENCE APP.** Closest to production Edd has. Copy its patterns rather than inventing a second architecture — see the note below the table. |
| **chucknorris**                            | `<projects>/eddremonts86/inHold/chucknorris/`                            | (mixed)                                | 92      | Chuck Norris API project. Legacy.                                |
| **cloudinaryDemo**                         | `<projects>/eddremonts86/inHold/cloudinaryDemo/`                         | (cloud)                                | 39      | Cloudinary demo. Legacy.                                         |
| **coolify-test**                           | `<projects>/eddremonts86/inHold/coolify-test/`                           | (coolify)                              | 31      | Coolify test deployment. Legacy.                                 |
| **countdown-timer**                        | `<projects>/eddremonts86/inHold/countdown-timer/`                        | (mixed)                                | 33      | Countdown timer. Legacy.                                         |
| **create-hermes-workspace**                | `<projects>/eddremonts86/inHold/create-hermes-workspace/`                | (node)                                 | 142     | Hermes workspace creator (uncompiled?). Legacy.                  |
| **create-hermes-workspace-pkg**            | `<projects>/eddremonts86/inHold/create-hermes-workspace-pkg/`            | (@edd_remonts/create-hermes-workspace) | 34      | Compiled npm package version of create-hermes-workspace. Legacy. |
| **Dashboard-**                             | `<projects>/eddremonts86/inHold/Dashboard-/`                             | (mixed)                                | 95      | Dashboard project (name truncated). Legacy.                      |
| **damvad**                                 | `<projects>/eddremonts86/inHold/damvad/`                                 | (mixed)                                | 88      | Damvad project. Legacy.                                          |
| **dc-multiverse**                          | `<projects>/eddremonts86/inHold/dc-multiverse/`                          | (zunzun)                               | 173     | DC multiverse. Legacy.                                           |
| **desingSistem**                           | `<projects>/eddremonts86/inHold/desingSistem/`                           | (mixed)                                | 55      | Design system project. Legacy.                                   |
| **docker-lando-services**                  | `<projects>/eddremonts86/inHold/docker-lando-services/`                  | (mixed)                                | 44      | Docker/Lando services. Legacy.                                   |
| **Dope-Template**                          | `<projects>/eddremonts86/inHold/Dope-Template/`                          | (mixed)                                | 49      | Dope template. Legacy.                                           |
| **edd-app-template**                       | `<projects>/eddremonts86/actives/edd-app-template/`                       | (mixed)                                | 1,007   | Edd's app template. Legacy.                                      |
| **edd-app-vite**                           | `<projects>/eddremonts86/actives/edd-app-vite/`                           | (edd-app-vite)                         | 110     | Edd's Vite app. Legacy.                                          |
| **edd-remonts-dashboard**                  | `<projects>/eddremonts86/actives/edd-remonts-dashboard/`                  | (edd-remonts-dashboard)                | 1,024   | Edd's dashboard. Legacy.                                         |
| **eddremonts**                             | `<projects>/eddremonts86/actives/eddremonts/`                             | (mixed)                                | 375     | Eddremonts project (root files only). Legacy.                    |
| **firstReactProject**                      | `<projects>/eddremonts86/inHold/firstReactProject/`                      | (templatebase)                         | 42      | First React project. Legacy.                                     |
| **geoLocal**                               | `<projects>/eddremonts86/actives/geoLocal/`                               | (geo-dashboard)                        | 265     | Geo-localization project. Legacy.                                |
| **gifted-perlman-h57dz3**                  | `<projects>/eddremonts86/inHold/gifted-perlman-h57dz3/`                  | (lexical-rich-text-example)            | 73      | Lexical editor playground. Legacy.                               |
| **HackerNews**                             | `<projects>/eddremonts86/inHold/HackerNews/`                             | Nuxt (nuxt-app)                        | 176     | Hacker News clone with Nuxt. Legacy.                             |
| **HBO-loginPages**                         | `<projects>/eddremonts86/inHold/HBO-loginPages/`                         | (mixed)                                | 69      | HBO login pages. Legacy.                                         |
| **hermes-flow-smoke-test**                 | `<projects>/eddremonts86/inHold/hermes-flow-smoke-test/`                 | (hermes-flow-smoke-test)               | 1,001   | Hermes flow smoke test. Legacy.                                  |
| **hermes-workspace-internal**              | `<projects>/eddremonts86/inHold/hermes-workspace-internal/`              | (mixed)                                | 620     | Hermes workspace internal. Legacy.                               |
| **hermes-workspace-tour**                  | `<projects>/eddremonts86/inHold/hermes-workspace-tour/`                  | (hermes-workspace-tour)                | 158     | Hermes workspace tour. Legacy.                                   |
| **hola-eduardo**                           | `<projects>/eddremonts86/inHold/hola-eduardo/`                           | (hola-eduardo)                         | 740     | Hola Eduardo project. Legacy.                                    |
| **invoiceCalc**                            | `<projects>/eddremonts86/inHold/invoiceCalc/`                            | (invoice-calculator)                   | 76      | Invoice calculator. Legacy.                                      |
| **js-oddsCalculator**                      | `<projects>/eddremonts86/inHold/js-oddsCalculator/`                      | (mixed)                                | 39      | JS odds calculator. Legacy.                                      |
| **letter_pilot**                           | `<projects>/eddremonts86/inHold/letter_pilot/`                           | (letterpilot)                          | 61      | Letter pilot. Legacy.                                            |
| **mdxViewer**                              | `<projects>/eddremonts86/actives/mdxViewer/`                              | (mdxviewer)                            | 418     | MDX viewer. Legacy.                                              |
| **musicFilter**                            | `<projects>/eddremonts86/inHold/musicFilter/`                            | (musicfilter)                          | 108     | Music filter. Legacy.                                            |
| **MyXpaces**                               | `<projects>/eddremonts86/inHold/MyXpaces/`                               | (mixed)                                | 29      | MyXpaces project. Legacy.                                        |
| **next-clerck**                            | `<projects>/eddremonts86/inHold/next-clerck/`                            | (clerk_example)                        | 73      | Next.js + Clerk example. Legacy.                                 |
| **npmPakage**                              | `<projects>/eddremonts86/inHold/npmPakage/`                              | (schilling-widgets-system)             | 9,186   | schilling-widgets-system npm package. Legacy.                    |
| **nuxt-3-zunzun**                          | `<projects>/eddremonts86/inHold/nuxt-3-zunzun/`                          | (?)                                    | 42      | Nuxt 3 zunzun. Legacy.                                           |
| **PHP-cookiesBar**                         | `<projects>/eddremonts86/inHold/PHP-cookiesBar/`                         | (PHP)                                  | 120     | Cookies bar in PHP. Legacy.                                      |
| **pokemon-index**                          | `<projects>/eddremonts86/inHold/pokemon-index/`                          | (pokemon-index)                        | 96      | Pokémon index. Legacy.                                           |
| **porfolio**                               | `<projects>/eddremonts86/inHold/porfolio/`                               | (vite-project)                         | 457     | Portfolio (vite). Legacy.                                        |
| **portfolio**                              | `<projects>/eddremonts86/inHold/portfolio/`                              | (portfolio)                            | 103     | Portfolio. Legacy.                                               |
| **project-proposal**                       | `<projects>/eddremonts86/inHold/project-proposal/`                       | (schilling-new)                        | 257     | Project proposal (schilling-new). Legacy.                        |
| **PWAs-wedding**                           | `<projects>/eddremonts86/inHold/PWAs-wedding/`                           | (mixed)                                | 182     | Wedding PWA. Legacy.                                             |
| **react-landing-page**                     | `<projects>/eddremonts86/inHold/react-landing-page/`                     | (test)                                 | 51      | React landing page (test). Legacy.                               |
| **react-query-plus-axios**                 | `<projects>/eddremonts86/inHold/react-query-plus-axios/`                 | (react-query-example)                  | 53      | React Query + Axios example. Legacy.                             |
| **react-table-reusable**                   | `<projects>/eddremonts86/inHold/react-table-reusable/`                   | (react-table)                          | 58      | Reusable React table. Legacy.                                    |
| **register_example**                       | `<projects>/eddremonts86/inHold/register_example/`                       | (interactive-table-mvp)                | 161     | Register example (interactive-table-mvp). Legacy.                |
| **sass-template**                          | `<projects>/eddremonts86/inHold/sass-template/`                          | (sass-edd-template-monorepo)           | 762     | SASS template. Legacy.                                           |
| **schilling-widgets-demo-1**               | `<projects>/eddremonts86/inHold/schilling-widgets-demo-1/`               | (schilling-widgets-demo)               | 52      | Schilling widgets demo. Legacy.                                  |
| **select-date-infinite**                   | `<projects>/eddremonts86/inHold/select-date-infinite/`                   | (my-v0-project)                        | 181     | Select date infinite (v0 project). Legacy.                       |
| **SnapShots**                              | `<projects>/eddremonts86/inHold/SnapShots/`                              | (snapshot)                             | 215     | Snapshots tool. Legacy.                                          |
| **supersonic-calculator**                  | `<projects>/eddremonts86/inHold/supersonic-calculator/`                  | (supersonic-calculator)                | 1,004   | Supersonic calculator. Legacy.                                   |
| **tanstack-base-project**                  | `<projects>/eddremonts86/inHold/tanstack-base-project/`                  | (my-badget)                            | 101     | TanStack base project (my-badget). Legacy.                       |
| **tanstack-template**                      | `<projects>/eddremonts86/inHold/tanstack-template/`                      | (tanstack-template)                    | 920     | TanStack template. Legacy.                                       |
| **template-myWedding**                     | `<projects>/eddremonts86/inHold/template-myWedding/`                     | (mixed)                                | 164     | Wedding template. Legacy.                                        |
| **Templates-404Page**                      | `<projects>/eddremonts86/inHold/Templates-404Page/`                      | (mixed)                                | 36      | 404 page templates. Legacy.                                      |
| **Templete-HTML-CSS-PHP**                  | `<projects>/eddremonts86/inHold/Templete-HTML-CSS-PHP/`                  | HTML + CSS + PHP                       | 176     | HTML/CSS/PHP templates. Legacy.                                  |
| **To-Do**                                  | `<projects>/eddremonts86/inHold/To-Do/`                                  | (clerk-todo)                           | 86      | Clerk-powered todo. Legacy.                                      |
| **voice-prompt-cleaner**                   | `<projects>/eddremonts86/inHold/voice-prompt-cleaner/`                   | (voice-prompt-cleaner)                 | 91      | Voice prompt cleaner. Legacy.                                    |
| **vue-AWSIntegration**                     | `<projects>/eddremonts86/inHold/vue-AWSIntegration/`                     | (MterialD)                             | 62      | Vue + AWS integration. Legacy.                                   |
| **vue-Carrusel**                           | `<projects>/eddremonts86/inHold/vue-Carrusel/`                           | (carrusell)                            | 71      | Vue carousel. Legacy.                                            |
| **vue-Memes**                              | `<projects>/eddremonts86/inHold/vue-Memes/`                              | (memes-graphic-visualisation)          | 62      | Vue memes generator. Legacy.                                     |
| **vue-monosolutiosapps**                   | `<projects>/eddremonts86/inHold/vue-monosolutiosapps/`                   | (vue_plus_vuetify)                     | 57      | Vue + Vuetify monorepo. Legacy.                                  |
| **vue-NordsenseApp**                       | `<projects>/eddremonts86/inHold/vue-NordsenseApp/`                       | (unitest)                              | 51      | Vue Nordsense app. Legacy.                                       |
| **WindowsTerminal-ConfigurationGenerator** | `<projects>/eddremonts86/inHold/WindowsTerminal-ConfigurationGenerator/` | (terminal_ettings_generator)           | 69      | Windows Terminal config generator. Legacy.                       |
| **xpaces-nuxt-version**                    | `<projects>/eddremonts86/inHold/xpaces-nuxt-version/`                    | (nuxt-app)                             | 161     | Xpaces Nuxt version. Legacy.                                     |
| **youtube-code-challenges**                | `<projects>/eddremonts86/inHold/youtube-code-challenges/`                | (react-test-cases)                     | 74      | YouTube code challenges (React). Legacy.                         |

### Top-level files in `eddremonts86/`

| File                            | Notes                                                                                                                                                           |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SKILLS-RESEARCH-2026-06-27.md` | Active. Research document Edd created on Jun 27 with the analysis of 118 candidate skills, narrowed to 20 recommendations. Reference for future skill curation. |

## Conventions (CORRECTED)

- **All projects MUST live under `<projects>/`** (the directory containing `ai-os/`) (not `~/code/personal/` or `~/code/work/`).
- **`eddremonts86/{actives,inHold}/` = personal scope** (GitHub: eddremonts86@gmail.com).
- **`AppExternas/ei-schilling/` = work scope** (GitHub: ei@schilling.dk).
- New project creation:
  1. `cd "$(dirname "$AI_OS_ROOT")/<scope>/"`
  2. `git clone <repo> <name>/` or `mkdir <name>/ && git init`
  3. Add row to this file (in the appropriate section).
- Project deletion (carefully): see `rules/ask_before_doing.md`. The legacy projects above are candidates for archival but **NOT deleted yet** because that decision requires confirmation.

## Notes

The `~/code/personal/` and `~/code/work/` directories mentioned in earlier AI-OS drafts do NOT exist or are empty (they were empty placeholder dirs on the previous Mac). All work happens in `<projects>/`.

The git `includeIf` config in `~/.gitconfig` was already updated to the actual paths (`gitdir:<projects>/ei-schilling/` → `~/.gitconfig-work`) on the previous Mac, verified 2026-07-02. On the current Mac (checked 2026-11-05) `~/.gitconfig` has no `includeIf`, so work repos under `AppExternas/ei-schilling/` use the global identity until one is added.

## How to keep this updated

After creating or archiving a project:

1. Add a row to the appropriate section.
2. Mark `Status` as `Active`, `Archived`, or `candidate`.
3. Update `Files` count via `find <path> -type f | wc -l`.
4. Update `Last modified` via `stat -f '%Sm' <path>`.
5. Get `Stack` from `cat <path>/package.json | python3 -c 'import json,sys; print(json.load(sys.stdin)["name"])'`.

## The reference app — read this before designing anything

**`<projects>/eddremonts86/actives/builderhunt/` is the closest-to-production app in this workspace**
(Edd's instruction, 2026-08-14). When a new project needs a decision that builderhunt has already
made, copy it instead of inventing a second answer. What it settles, with the file that settles it:

| Decision | Where |
| --- | --- |
| Branch model: `master` = production and deploys on green, `dev` integrates, work on `feat/fix/chore` merged by PR | `CLAUDE.md` § Deploys |
| The local quality gate, mirrored from CI, run by a pre-push hook on **every** branch | `scripts/ci/local-quality.sh`, `.githooks/pre-push` |
| CI triggers: `pull_request` + push to `[master, dev]`, `paths-ignore` prose | `.github/workflows/quality.yml` |
| Coolify deploy on `workflow_run` after Quality goes green, then verify from outside | `.github/workflows/deploy.yml` |
| Database: Drizzle + Postgres, forward-only migrations, an idempotent deploy orchestrator | `scripts/deploy/orchestrate.mjs`, `docs/operations/deploy-runbook.md` |
| Runtime DB roles created **without** passwords by migration, provisioned after `drizzle-kit migrate` | `drizzle/0002_database_roles.sql`, `docs/operations/database-roles.md` |
| Review required on the paths where a mistake is invisible in a diff | `.github/CODEOWNERS` |
| Dev server invoked as `./node_modules/.bin/vite` rather than through pnpm | `.claude/launch.json` (the `//` key records why) |

**It is not "Convex".** A roadmap that says "matching the existing house stack (Convex)" is wrong
about this workspace: the house stack is Drizzle + Postgres on Coolify. Check before believing a
roadmap's claim about what already exists.

Its `docs/operations/` is the deepest operational writing here — 50+ runbooks covering deploys, DB
restore drills, role timeouts, Stripe, load testing and incident response. When a new project needs
a runbook, start from the builderhunt one with the same name.
