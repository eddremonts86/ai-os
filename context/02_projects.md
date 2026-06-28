# 02 — Projects

Inventory of active and archived projects. **Keep it updated** when starting new work.

Discovered by analyzing `/Users/edd/Projects` on 2026-06-28. There are 3 top-level project directories (`ai-os`, `eddremonts86`, `ei-schilling`). The directories below are real, with counts and last-modified dates verified via `stat` and `find`. Stack hints come from `package.json` / `composer.json` / directory name.

## Schilling (employment)

Work projects. All under `~/Projects/ei-schilling/`.

| Project | Path | Stack | Status | Last modified | Notes |
|---|---|---|---|---|---|
| **wave-template** | `~/Projects/ei-schilling/wave-template/` | Vite + React 19 + TanStack Router + TanStack Query + shadcn/ui + Tailwind v4 + Convex + Netlify + Decap CMS | Active (primary) | Jun 26 13:08 | The Wave template. Headless CMS + Convex backend + Netlify deploy. Has README, .git, package.json. |
| **kontrakt-manager** | `~/projects/ei-schilling/kontrakt-manager/` | (large repo, 63 files) | Archived candidate | Jun 26 13:08 | Inferred from name: contract management. Needs verification before declaring archived. |
| **wave-tech-radar** | `~/projects/ei-schilling/wave-tech-radar/` | (medium repo, 20 files) | Active candidate | Jun 26 13:08 | Tech radar companion to wave-template. Smaller, may be auxiliary. |
| **ia-royalty-validations** | `~/projects/ei-schilling/ia-royalty-validations/` | (medium repo, 35 files) | Active | Jun 26 13:08 | AI royalty validations. Work project. |

## Personal — Edd's own repos

Under `~/projects/eddremonts86/`.

### ai-os (the framework)

| Project | Path | Stack | Status | Last modified | Notes |
|---|---|---|---|---|---|
| **ai-os** | `~/projects/ai-os/` | Markdown + bash + Python + PowerShell + YAML | Active (this repo) | Jun 27 23:49 | The AI Operating System framework. 13 commits, 1363 files (102 skills, 7 MCP servers, 5 workflows, 3 verifiers, 3 rules, 3 CI workflows, setup for Mac + Windows + Linux). Private repo on GitHub. |

### Personal archive (mostly Drupal/PHP, pre-2024 work)

These are old personal projects under `~/projects/eddremonts86/`. They are **inactive / archived**: no recent commits, no recent modifications, no package.json (or legacy stack). They live here for historical reference, not for active development.

| Project | Path | Stack (inferred) | Status | Files | Notes |
|---|---|---|---|---|---|
| **Drupal7-ModulesAndTemplates** | `~/projects/eddremonts86/Drupal7-ModulesAndTemplates/` | Drupal 7 + PHP | Archived | 2,295 | Drupal 7 custom modules and templates. Legacy. |
| **Drupal8-ModulesAndTemplates** | `~/projects/eddremonts86/Drupal8-ModulesAndTemplates/` | Drupal 8 + PHP | archived | 2,781 | Drupal 8 modules and templates. Legacy. |
| **Drupal8-ProjectManager** | `~/projects/eddremonts86/Drupal8-ProjectManager/` | Drupal 8 + PHP + Composer | archived | 44 | Drupal 8 project manager module. Has composer.json. Legacy. |
| **ObtoberCMS-and-Laravel5** | `~/projects/eddremonts86/ObtoberCMS-and-Laravel5/` | October CMS + Laravel 5 + PHP | archived | 2,753 | October CMS + Laravel 5 learning projects. Legacy. |
| **CubaProjects** | `~/projects/eddremonts86/CubaProjects/` | (106,661 files — large repo) | archived | 106,661 | Large legacy project. Worth investigating what it is before deleting. |
| **Dashboard-** | `~/projects/eddremonts86/Dashboard-/` | (95 files) | archived | 95 | Dashboard project. Name is incomplete. |
| **Dope-Template** | `~/projects/eddremonts86/Dope-Template/` | (49 files) | archived | 49 | Template project. |
| **HBO-loginPages** | `~/projects/eddremonts86/HBO-loginPages/` | (69 files) | archived | 69 | HBO login pages — likely a clone/learning project. |
| **HackerNews** | `~/projects/eddremonts86/HackerNews/` | Node.js + npm | archived | 176 | Hacker News clone. Node project. |
| **MyXpaces** | `~/projects/eddremonts86/MyXpaces/` | (29 files) | archived | 29 | Small legacy project. |
| **PHP-cookiesBar** | `~/projects/eddremonts86/PHP-cookiesBar/` | PHP | archived | 120 | Cookies bar implementation in PHP. |
| **PWAs-wedding** | `~/projects/eddremonts86/PWAs-wedding/` | (182 files) | archived | 182 | Wedding PWA project. |
| **SnapShots** | `~/projects/eddremonts86/SnapShots/` | Node.js | archived | 215 | Snapshots tool. |
| **Templates-404Page** | `~/projects/eddremonts86/Templates-404Page/` | (36 files) | archived | 36 | 404 page templates. |
| **Templete-HTML-CSS-PHP** | `~/projects/eddremonts86/Templete-HTML-CSS-PHP/` | HTML + CSS + PHP | archived | 176 | HTML/CSS/PHP templates. |

### Top-level files in eddremonts86/

| File | Notes |
|---|---|
| `SKILLS-RESEARCH-2026-06-27.md` | A research document Edd created on Jun 27 with the analysis of 118 candidate skills, narrowed to 20 recommendations. Reference for future skill curation. |

## Personal — Other locations

There are also projects under `~/code/personal/` (mentioned in the original `02_projects.md` draft) and `~/code/work/` (for Schilling). The current analysis only covered `/Users/edd/Projects/` (top-level). If Edd wants those included, run analysis on `~/code/personal/` and `~/code/work/`.

## How to update this file

When you start a new project:

1. **Create the directory** under `~/Projects/<work-or-personal>/<name>/`.
2. **Add a row** to the appropriate section above.
3. **Set status** to `Active` if working on it, `Archived` if not.
4. **Update `Last modified`** column when working on it (verify via `stat`).

When you archive a project:

1. Move it to `~/Projects/<scope>/_archive/` (create `_archive/` if needed).
2. Update the row's `Status` to `Archived`.
3. Update the `Last modified` to the archive date.

When you delete a project (be careful — git history matters):

1. Confirm with the user (see `rules/ask_before_doing.md`).
2. `git remote -v` to confirm no remote exists.
3. `rm -rf` the directory.
4. Remove the row from this file.

## Notes for future analysis

This file was populated by analyzing `/Users/edd/Projects/` with `ls -la`, `find -type d`, `find -type f`, `stat`, and inspecting `package.json` / `composer.json` for stack hints. If you need fresh data, re-run:

```bash
cd ~/Projects
for d in $(find . -maxdepth 1 -type d ! -name '.*'); do
  echo "=== $d ==="
  cd "$d"
  echo "  Git: $(test -d .git && echo YES || echo NO)"
  echo "  Last: $(stat -f '%Sm' . | head -c 19)"
  echo "  Pkg: $(test -f package.json && cat package.json | python3 -c 'import json,sys; d=json.load(sys.stdin); print(d.get("name","?"))' || echo NO)"
  echo "  Remote: $(git remote get-url origin 2>/dev/null || echo none)"
done
```
