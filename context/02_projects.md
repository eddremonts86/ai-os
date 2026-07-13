# 02 — Projects

Inventory of active and archived projects. **All projects live under `/Users/edd/Projects/`.** Two scopes: `eddremonts86/` (personal) and `ei-schilling/` (work).

> Discovered by analyzing `/Users/edd/Projects/` on 2026-06-28 via `ls -la`, `find -type f`, `stat -f '%Sm'`, and inspecting `package.json` for stack hints. Counts and dates verified.

## Root layout

```
/Users/edd/Projects/
├── ai-os/                          ← AI Operating System (this framework)
├── eddremonts86/                    ← Personal scope
└── ei-schilling/                    ← Work scope
```

The mapping is:

- `eddremonts86/` corresponds to **personal identity** (GitHub: eddremonts86@gmail.com).
- `ei-schilling/` corresponds to **work identity** (GitHub: ei@schilling.dk).

## Work — Schilling (employment)

All under `~/Projects/ei-schilling/`.

| Project                    | Path                                              | Stack (from package.json)                                                                                   | Status               | Files            | Last modified          | Notes                                                                                              |
| -------------------------- | ------------------------------------------------- | ----------------------------------------------------------------------------------------------------------- | -------------------- | ---------------- | ---------------------- | -------------------------------------------------------------------------------------------------- |
| **wave-template**          | `~/Projects/ei-schilling/wave-template/`          | Vite + React 19 + TanStack Router + TanStack Query + shadcn/ui + Tailwind v4 + Convex + Netlify + Decap CMS | **Active (primary)** | (large repo)     | Jun 26 13:08           | The Wave template. Headless CMS + Convex backend + Netlify deploy. Has README, package.json, .git. |
| **kontrakt-manager**       | `~/Projects/ei-schilling/kontrakt-manager/`       | PHP/Drupal                                                                                                  | **Active**           | 63 files in root | Jun 30 (PR #10 merged) | Contract management. Confirmed active 2026-07-02 via git log (PR merged 2026-06-30).               |
| **wave-tech-radar**        | `~/Projects/ei-schilling/wave-tech-radar/`        | (smaller repo)                                                                                              | candidate            | 20 files in root | Jun 26 13:08           | Tech radar companion to wave-template. Smaller.                                                    |
| **ia-royalty-validations** | `~/Projects/ei-schilling/ia-royalty-validations/` | (medium repo)                                                                                               | candidate            | 35 files in root | Jun 26 13:08           | AI royalty validations. Work project.                                                              |

To determine which of `wave-tech-radar` / `ia-royalty-validations` is actively used vs archived, check git log activity or ask Edd (kontrakt-manager already confirmed Active, 2026-07-02).

## Personal — `eddremonts86/`

All under `~/Projects/eddremonts86/`. **Mostly legacy (pre-2024).**

### Active

| Project                           | Path                                                    | Stack                                                 | Status     | Files  | Last modified                                                   | Notes                                                                                                                                                                                              |
| --------------------------------- | ------------------------------------------------------- | ----------------------------------------------------- | ---------- | ------ | --------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **anySolutions**                  | `~/Projects/eddremonts86/anySolutions/`                 | Vue 3 + Node + npm (Loyal_Solutions per package.json) | **Active** | 56,866 | Jun 27 19:01                                                    | Last modified Jun 27 — clearly active. Vue/Node project.                                                                                                                                           |
| **iaWorkSpace**                   | `~/Projects/eddremonts86/iaWorkSpace/`                  | (workspace-security-tools)                            | **Active** | 3,302  | Jun 25 (last commit)                                            | Meta-repo orchestrating multiple apps. Matches `01_business_or_work.md`. Kept active despite an older mtime because it's a low-churn orchestration repo, not because it's unused.                  |
| **hermes-agent**                  | `~/Projects/eddremonts86/hermes-agent/`                 | Python 3.11 + Hermes (Nous Research)                  | **Active** | 4,981  | (source repo, not `~/.hermes` which is the CLI config/data dir) | Reference/contribution repo for the Hermes CLI this AI-OS supports (see `hermes-mcp-pattern` skill). Matches `01_business_or_work.md`; previously mislabeled Legacy here from a stale-mtime crawl. |
| **SKILLS-RESEARCH-2026-06-27.md** | `~/Projects/eddremonts86/SKILLS-RESEARCH-2026-06-27.md` | (markdown document)                                   | Active     | 1 file | Jun 27 19:37                                                    | Research document Edd created on Jun 27. 118 candidate skills → 20 recommendations.                                                                                                                |

### Legacy / archived candidates

These are personal projects from before 2024. All have last-modified Jun 26 12:xx (which is a bulk-import timestamp, not real activity). They are **archived** unless Edd says otherwise.

If any of these turns out to be active (e.g. someone else works on it, or it has unmerged changes), move it back to the "Active" section.

| Project                                    | Path                                                              | Stack (inferred)                       | Files   | Notes                                                            |
| ------------------------------------------ | ----------------------------------------------------------------- | -------------------------------------- | ------- | ---------------------------------------------------------------- |
| **Drupal7-ModulesAndTemplates**            | `~/Projects/eddremonts86/Drupal7-ModulesAndTemplates/`            | Drupal 7 + PHP                         | 2,295   | Drupal 7 modules. Legacy.                                        |
| **Drupal8-ModulesAndTemplates**            | `~/Projects/eddremonts86/Drupal8-ModulesAndTemplates/`            | Drupal 8 + PHP                         | 2,781   | Drupal 8 modules. Legacy.                                        |
| **Drupal8-ProjectManager**                 | `~/Projects/eddremonts86/Drupal8-ProjectManager/`                 | Drupal 8 + PHP + Composer              | 44      | Drupal 8 project manager module. Legacy.                         |
| **ObtoberCMS-and-Laravel5**                | `~/Projects/eddremonts86/ObtoberCMS-and-Laravel5/`                | October CMS + Laravel 5 + PHP          | 2,753   | October CMS + Laravel 5. Legacy.                                 |
| **obtover-cms-portfolio**                  | `~/Projects/eddremonts86/obtover-cms-portfolio/`                  | (PHP)                                  | 2,623   | October CMS portfolio. Legacy.                                   |
| **CubaProjects**                           | `~/Projects/eddremonts86/CubaProjects/`                           | (mixed)                                | 106,661 | Large legacy project (CubaProjects). Worth checking what it is.  |
| **bash-automaticGenerators**               | `~/Projects/eddremonts86/bash-automaticGenerators/`               | (bash)                                 | 51      | Bash script generators. Legacy.                                  |
| **budget-app**                             | `~/Projects/eddremonts86/budget-app/`                             | (mixed)                                | 928     | Budget app. Legacy.                                              |
| **builderhunt**                            | `~/Projects/eddremonts86/builderhunt/`                            | (mixed)                                | 102     | Builder hunt project. Legacy.                                    |
| **chucknorris**                            | `~/Projects/eddremonts86/chucknorris/`                            | (mixed)                                | 92      | Chuck Norris API project. Legacy.                                |
| **cloudinaryDemo**                         | `~/Projects/eddremonts86/cloudinaryDemo/`                         | (cloud)                                | 39      | Cloudinary demo. Legacy.                                         |
| **coolify-test**                           | `~/Projects/eddremonts86/coolify-test/`                           | (coolify)                              | 31      | Coolify test deployment. Legacy.                                 |
| **countdown-timer**                        | `~/Projects/eddremonts86/countdown-timer/`                        | (mixed)                                | 33      | Countdown timer. Legacy.                                         |
| **create-hermes-workspace**                | `~/Projects/eddremonts86/create-hermes-workspace/`                | (node)                                 | 142     | Hermes workspace creator (uncompiled?). Legacy.                  |
| **create-hermes-workspace-pkg**            | `~/Projects/eddremonts86/create-hermes-workspace-pkg/`            | (@edd_remonts/create-hermes-workspace) | 34      | Compiled npm package version of create-hermes-workspace. Legacy. |
| **Dashboard-**                             | `~/Projects/eddremonts86/Dashboard-/`                             | (mixed)                                | 95      | Dashboard project (name truncated). Legacy.                      |
| **damvad**                                 | `~/Projects/eddremonts86/damvad/`                                 | (mixed)                                | 88      | Damvad project. Legacy.                                          |
| **dc-multiverse**                          | `~/Projects/eddremonts86/dc-multiverse/`                          | (zunzun)                               | 173     | DC multiverse. Legacy.                                           |
| **desingSistem**                           | `~/Projects/eddremonts86/desingSistem/`                           | (mixed)                                | 55      | Design system project. Legacy.                                   |
| **docker-lando-services**                  | `~/Projects/eddremonts86/docker-lando-services/`                  | (mixed)                                | 44      | Docker/Lando services. Legacy.                                   |
| **Dope-Template**                          | `~/Projects/eddremonts86/Dope-Template/`                          | (mixed)                                | 49      | Dope template. Legacy.                                           |
| **edd-app-template**                       | `~/Projects/eddremonts86/edd-app-template/`                       | (mixed)                                | 1,007   | Edd's app template. Legacy.                                      |
| **edd-app-vite**                           | `~/Projects/eddremonts86/edd-app-vite/`                           | (edd-app-vite)                         | 110     | Edd's Vite app. Legacy.                                          |
| **edd-remonts-dashboard**                  | `~/Projects/eddremonts86/edd-remonts-dashboard/`                  | (edd-remonts-dashboard)                | 1,024   | Edd's dashboard. Legacy.                                         |
| **eddremonts**                             | `~/Projects/eddremonts86/eddremonts/`                             | (mixed)                                | 375     | Eddremonts project (root files only). Legacy.                    |
| **firstReactProject**                      | `~/Projects/eddremonts86/firstReactProject/`                      | (templatebase)                         | 42      | First React project. Legacy.                                     |
| **geoLocal**                               | `~/Projects/eddremonts86/geoLocal/`                               | (geo-dashboard)                        | 265     | Geo-localization project. Legacy.                                |
| **gifted-perlman-h57dz3**                  | `~/Projects/eddremonts86/gifted-perlman-h57dz3/`                  | (lexical-rich-text-example)            | 73      | Lexical editor playground. Legacy.                               |
| **HackerNews**                             | `~/Projects/eddremonts86/HackerNews/`                             | Nuxt (nuxt-app)                        | 176     | Hacker News clone with Nuxt. Legacy.                             |
| **HBO-loginPages**                         | `~/Projects/eddremonts86/HBO-loginPages/`                         | (mixed)                                | 69      | HBO login pages. Legacy.                                         |
| **hermes-flow-smoke-test**                 | `~/Projects/eddremonts86/hermes-flow-smoke-test/`                 | (hermes-flow-smoke-test)               | 1,001   | Hermes flow smoke test. Legacy.                                  |
| **hermes-workspace-internal**              | `~/Projects/eddremonts86/hermes-workspace-internal/`              | (mixed)                                | 620     | Hermes workspace internal. Legacy.                               |
| **hermes-workspace-tour**                  | `~/Projects/eddremonts86/hermes-workspace-tour/`                  | (hermes-workspace-tour)                | 158     | Hermes workspace tour. Legacy.                                   |
| **hola-eduardo**                           | `~/Projects/eddremonts86/hola-eduardo/`                           | (hola-eduardo)                         | 740     | Hola Eduardo project. Legacy.                                    |
| **invoiceCalc**                            | `~/Projects/eddremonts86/invoiceCalc/`                            | (invoice-calculator)                   | 76      | Invoice calculator. Legacy.                                      |
| **js-oddsCalculator**                      | `~/Projects/eddremonts86/js-oddsCalculator/`                      | (mixed)                                | 39      | JS odds calculator. Legacy.                                      |
| **letter_pilot**                           | `~/Projects/eddremonts86/letter_pilot/`                           | (letterpilot)                          | 61      | Letter pilot. Legacy.                                            |
| **mdxViewer**                              | `~/Projects/eddremonts86/mdxViewer/`                              | (mdxviewer)                            | 418     | MDX viewer. Legacy.                                              |
| **musicFilter**                            | `~/Projects/eddremonts86/musicFilter/`                            | (musicfilter)                          | 108     | Music filter. Legacy.                                            |
| **MyXpaces**                               | `~/Projects/eddremonts86/MyXpaces/`                               | (mixed)                                | 29      | MyXpaces project. Legacy.                                        |
| **next-clerck**                            | `~/Projects/eddremonts86/next-clerck/`                            | (clerk_example)                        | 73      | Next.js + Clerk example. Legacy.                                 |
| **npmPakage**                              | `~/Projects/eddremonts86/npmPakage/`                              | (schilling-widgets-system)             | 9,186   | schilling-widgets-system npm package. Legacy.                    |
| **nuxt-3-zunzun**                          | `~/Projects/eddremonts86/nuxt-3-zunzun/`                          | (?)                                    | 42      | Nuxt 3 zunzun. Legacy.                                           |
| **PHP-cookiesBar**                         | `~/Projects/eddremonts86/PHP-cookiesBar/`                         | (PHP)                                  | 120     | Cookies bar in PHP. Legacy.                                      |
| **pokemon-index**                          | `~/Projects/eddremonts86/pokemon-index/`                          | (pokemon-index)                        | 96      | Pokémon index. Legacy.                                           |
| **porfolio**                               | `~/Projects/eddremonts86/porfolio/`                               | (vite-project)                         | 457     | Portfolio (vite). Legacy.                                        |
| **portfolio**                              | `~/Projects/eddremonts86/portfolio/`                              | (portfolio)                            | 103     | Portfolio. Legacy.                                               |
| **project-proposal**                       | `~/Projects/eddremonts86/project-proposal/`                       | (schilling-new)                        | 257     | Project proposal (schilling-new). Legacy.                        |
| **PWAs-wedding**                           | `~/Projects/eddremonts86/PWAs-wedding/`                           | (mixed)                                | 182     | Wedding PWA. Legacy.                                             |
| **react-landing-page**                     | `~/Projects/eddremonts86/react-landing-page/`                     | (test)                                 | 51      | React landing page (test). Legacy.                               |
| **react-query-plus-axios**                 | `~/Projects/eddremonts86/react-query-plus-axios/`                 | (react-query-example)                  | 53      | React Query + Axios example. Legacy.                             |
| **react-table-reusable**                   | `~/Projects/eddremonts86/react-table-reusable/`                   | (react-table)                          | 58      | Reusable React table. Legacy.                                    |
| **register_example**                       | `~/Projects/eddremonts86/register_example/`                       | (interactive-table-mvp)                | 161     | Register example (interactive-table-mvp). Legacy.                |
| **sass-template**                          | `~/Projects/eddremonts86/sass-template/`                          | (sass-edd-template-monorepo)           | 762     | SASS template. Legacy.                                           |
| **schilling-widgets-demo-1**               | `~/Projects/eddremonts86/schilling-widgets-demo-1/`               | (schilling-widgets-demo)               | 52      | Schilling widgets demo. Legacy.                                  |
| **select-date-infinite**                   | `~/Projects/eddremonts86/select-date-infinite/`                   | (my-v0-project)                        | 181     | Select date infinite (v0 project). Legacy.                       |
| **SnapShots**                              | `~/Projects/eddremonts86/SnapShots/`                              | (snapshot)                             | 215     | Snapshots tool. Legacy.                                          |
| **supersonic-calculator**                  | `~/Projects/eddremonts86/supersonic-calculator/`                  | (supersonic-calculator)                | 1,004   | Supersonic calculator. Legacy.                                   |
| **tanstack-base-project**                  | `~/Projects/eddremonts86/tanstack-base-project/`                  | (my-badget)                            | 101     | TanStack base project (my-badget). Legacy.                       |
| **tanstack-template**                      | `~/Projects/eddremonts86/tanstack-template/`                      | (tanstack-template)                    | 920     | TanStack template. Legacy.                                       |
| **template-myWedding**                     | `~/Projects/eddremonts86/template-myWedding/`                     | (mixed)                                | 164     | Wedding template. Legacy.                                        |
| **Templates-404Page**                      | `~/Projects/eddremonts86/Templates-404Page/`                      | (mixed)                                | 36      | 404 page templates. Legacy.                                      |
| **Templete-HTML-CSS-PHP**                  | `~/Projects/eddremonts86/Templete-HTML-CSS-PHP/`                  | HTML + CSS + PHP                       | 176     | HTML/CSS/PHP templates. Legacy.                                  |
| **To-Do**                                  | `~/Projects/eddremonts86/To-Do/`                                  | (clerk-todo)                           | 86      | Clerk-powered todo. Legacy.                                      |
| **voice-prompt-cleaner**                   | `~/Projects/eddremonts86/voice-prompt-cleaner/`                   | (voice-prompt-cleaner)                 | 91      | Voice prompt cleaner. Legacy.                                    |
| **vue-AWSIntegration**                     | `~/Projects/eddremonts86/vue-AWSIntegration/`                     | (MterialD)                             | 62      | Vue + AWS integration. Legacy.                                   |
| **vue-Carrusel**                           | `~/Projects/eddremonts86/vue-Carrusel/`                           | (carrusell)                            | 71      | Vue carousel. Legacy.                                            |
| **vue-Memes**                              | `~/Projects/eddremonts86/vue-Memes/`                              | (memes-graphic-visualisation)          | 62      | Vue memes generator. Legacy.                                     |
| **vue-monosolutiosapps**                   | `~/Projects/eddremonts86/vue-monosolutiosapps/`                   | (vue_plus_vuetify)                     | 57      | Vue + Vuetify monorepo. Legacy.                                  |
| **vue-NordsenseApp**                       | `~/Projects/eddremonts86/vue-NordsenseApp/`                       | (unitest)                              | 51      | Vue Nordsense app. Legacy.                                       |
| **WindowsTerminal-ConfigurationGenerator** | `~/Projects/eddremonts86/WindowsTerminal-ConfigurationGenerator/` | (terminal_ettings_generator)           | 69      | Windows Terminal config generator. Legacy.                       |
| **xpaces-nuxt-version**                    | `~/Projects/eddremonts86/xpaces-nuxt-version/`                    | (nuxt-app)                             | 161     | Xpaces Nuxt version. Legacy.                                     |
| **youtube-code-challenges**                | `~/Projects/eddremonts86/youtube-code-challenges/`                | (react-test-cases)                     | 74      | YouTube code challenges (React). Legacy.                         |

### Top-level files in `eddremonts86/`

| File                            | Notes                                                                                                                                                           |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `SKILLS-RESEARCH-2026-06-27.md` | Active. Research document Edd created on Jun 27 with the analysis of 118 candidate skills, narrowed to 20 recommendations. Reference for future skill curation. |

## Conventions (CORRECTED)

- **All projects MUST live under `/Users/edd/Projects/`** (not `~/code/personal/` or `~/code/work/`).
- **`eddremonts86/` = personal scope** (GitHub: eddremonts86@gmail.com).
- **`ei-schilling/` = work scope** (GitHub: ei@schilling.dk).
- New project creation:
  1. `cd ~/Projects/<scope>/`
  2. `git clone <repo> <name>/` or `mkdir <name>/ && git init`
  3. Add row to this file (in the appropriate section).
- Project deletion (carefully): see `rules/ask_before_doing.md`. The legacy projects above are candidates for archival but **NOT deleted yet** because that decision requires confirmation.

## Notes

The `~/code/personal/` and `~/code/work/` directories mentioned in earlier AI-OS drafts do NOT exist or are empty (`/Users/edd/code/personal/` and `/Users/edd/code/work/` are empty placeholder dirs from earlier setup, last modified Jun 26 11:26 with 64 bytes each). All work happens in `/Users/edd/Projects/`.

The git `includeIf` config in `~/.gitconfig` was already updated to the actual paths (`gitdir:/Users/edd/Projects/ei-schilling/` → `~/.gitconfig-work`). Verified 2026-07-02; no action needed.

## How to keep this updated

After creating or archiving a project:

1. Add a row to the appropriate section.
2. Mark `Status` as `Active`, `Archived`, or `candidate`.
3. Update `Files` count via `find <path> -type f | wc -l`.
4. Update `Last modified` via `stat -f '%Sm' <path>`.
5. Get `Stack` from `cat <path>/package.json | python3 -c 'import json,sys; print(json.load(sys.stdin)["name"])'`.
