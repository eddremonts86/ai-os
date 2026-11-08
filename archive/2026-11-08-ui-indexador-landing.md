# Spec (archived): ui-indexador landing page, built with ui-indexador

> Done 2026-11-08: landing served by server.py at /, 11 sections from MCP-found registry pieces (2 composed), build log rendered on the page, Lighthouse mobile 91 / desktop 100, a11y 100, axe clean at 375/768/1280; dogfooding fixed mirrors, framework and licence filters, and the MCP server on mcp 2.x.

## Metadata

- **Date:** 2026-11-08
- **Status:** completed (2026-11-08)
- **Blocks:** 11 (Block 2, fixing the indexer, runs before the pieces are chosen)
- **Author:** Edd (written with Claude)
- **Reviewer:** Edd

## Objective

Ship a landing page for ui-indexador that explains why it exists, what it does and how to plug it into any
AI coding flow, and build that page with ui-indexador itself so the page is the proof that the flow works.

## Context

ui-indexador (`apps/ui-indexador`, branch `feat/ui-indexador`) indexes every installable item of the shadcn
registry ecosystem: 119,335 items from 323 registries (322 healthy ones from the official directory plus the
hand-added `@shadcn` set). Each item carries a kind, type, categories, dependencies, a layout for blocks and a
`npx shadcn@latest add @registry/item` command. It ranks registries by proof of use (GitHub stars, size,
endpoint health), searches by meaning with local embeddings (Ollama, `nomic-embed-text`), and serves it all
read-only over HTTP (`server.py`, :3040) and MCP (`mcp_server.py`, 8 tools). It refreshes daily at 11:30
through launchd. Today nobody outside this repo knows it exists, and nothing proves that an agent can build a
real page from it.

The problem it solves: an AI agent writes UI from memory. It reinvents components that already exist,
well-built and MIT-licensed, in one of the 548 registries of the official directory (count from the
refresh run of 2026-11-08, `apps/ui-indexador/logs/refresh-2026-11-08-105617.log`) that no one can search across; each registry site is a
gallery made for humans. A from-scratch redesign was rejected on 2026-11-06 as amateur (memory
`ui-build-on-proven-libraries`); the rule since then is to compose proven, ranked pieces and show one section
before building the rest. This landing is the first page built entirely under that rule, with the indexer as
the only way pieces are found.

A first dogfooding pass on 2026-11-08 (queries recorded in `References`) returned strong candidates for 15 of
16 sections and exposed real defects in the app, which Block 2 fixes first: `@registrydirectory` mirrors
duplicate other registries' items and show the directory's own star count (78) instead of the source's;
several registries have no detectable licence ("?"); the "call to action with background beams" query matched
poorly; nothing filters out Vue/Svelte items.

## Acceptance criteria

- [ ] `http://127.0.0.1:3040/` serves the landing; every existing API path (`/health`, `/items`, `/facets`,
      `/registries`, `/blocks`, `/captures`, `/themes`, `/files/...`, `/index.md`) answers as before and
      `test_server.py` passes.
- [ ] At least 80% of the page's sections are composed from items found through ui-indexador (MCP tools or
      HTTP, never by reading `data/` files) and installed with the `npx shadcn@latest add` command it returned.
      Any hand-built section is listed as such, with the queries that found nothing.
- [ ] `site/build-log.json` records, per section: the queries, the search mode, the top candidates (registry,
      item, similarity, licence), the chosen item, and why. The page renders it ("Built with itself").
- [ ] Only items with an OSI licence (MIT, Apache-2.0, BSD, ISC) ship; every shipped item's licence and source
      are listed in `site/THIRD_PARTY.md`. The index stores the licence per registry, so for an item served
      through a mirror (`@registrydirectory/<source>/...`) the licence of the original source repo is checked by
      hand and recorded; an item whose source licence cannot be confirmed does not ship.
- [ ] No third-party code is installed unreviewed: each item's JSON (`npx shadcn@latest view`) is read and its
      npm dependencies checked before `add`.
- [ ] The live search on the page queries the real `/items` endpoint and handles loading, empty, keyword
      fallback (shows the API's `note`) and API-down states.
- [ ] The headline numbers (items, registries, last crawl date) come from `/health` (which gains the catalog
      `built` date in Block 1) and `/facets` at load time, not from hardcoded copy.
- [ ] Every integration snippet on the page (Claude Code, Codex, Cursor / VS Code, HTTP, AI-OS) was run as
      written and shown to work; the evidence is in the block's verification note.
- [ ] `aios-ui-verify` passes at 375, 768 and 1280 px in light and dark: no console errors, no horizontal
      overflow, axe 0 serious/critical.
- [ ] Lighthouse on the production build: Performance ≥ 90, Accessibility 100, Best Practices ≥ 95, SEO ≥ 95.
- [ ] Edd approved the hero slice before the rest of the page was built.

## Non-goals (explicit)

- Public deployment, a domain, analytics. The app moves to its own environment later; the page is built so it
  can be deployed with it, but this Spec ends at local.
- A docs site, blog, pricing, sign-up, i18n. Copy is English only.
- Redesigning the indexer's API or ranking. Only the defects listed in Block 2 are in scope.
- Hand-drawn illustrations, a custom design system, custom fonts beyond what the chosen theme names.

## Decisions taken in this Spec (change them at approval)

1. **Where:** `apps/ui-indexador/site/`, a Vite + React 19 + TypeScript + Tailwind 4 app, built to
   `site/dist/` and served by `server.py` at `/` (assets under `/assets/`). One process serves the page and the
   API it demos, so the live search is same-origin and the page moves with the app.
2. **shadcn base:** the standard Radix-based `new-york-v4` style, not `apps/site`'s `base-nova` (Base UI).
   Most registry items are written against Radix; matching them avoids rewriting each import.
3. **Name on the page:** "ui-indexador" for now; the copy is written so the name is one constant.
4. **Theme:** chosen from ui-indexador's own themes (`search_themes`): `bold-tech`, `darkmatter` and
   `modern-minimal` came up for "tech"/"minimal". Block 4 renders the hero in all three; Edd picks.

## Page outline (sections, message, candidate pieces from the 2026-11-08 queries)

| # | Section | Message | Candidates to compare (install name) |
|---|---|---|---|
| 1 | Navbar | Name, Docs/GitHub links, GitHub star button | `@elements/github-star-button`, `@registrydirectory/shadcnblocks/github-stars-github-stars-basic-1`, a minimal navbar block |
| 2 | Hero | "Your AI builds UI from memory. Give it the whole shadcn ecosystem instead." A search box that runs a real query, plus the two CTAs (Add to your agent, Try a search) | `@registrydirectory/shadcn-ui-blocks/marketing-hero-forms-center-aligned-search-with-tags`, `@velora/hero-grid-minimal`, `@registrydirectory/shadcn-ui-blocks/marketing-hero-sections-with-terminal`, `@uiception/hero-section-v2` |
| 3 | Numbers | Items, registries, kinds, last crawl: live | `@fancy-ui/number-ticker`, `@beui/number-ticker`, `@cuelark/number-ticker` |
| 4 | Registries strip | The registries it indexes, scrolling | `@smoothui/logo-cloud-3`, `@beui/marquee`, `@reactframe/logo-marquee` |
| 5 | The problem | Before (agent invents a pricing table) / after (agent finds and installs one) | `@hirael/comparison-03`, `@registrydirectory/uday-a/how-it-works-before-after`, `@registrydirectory/shadcn-ui-blocks/marketing-feature-sections-with-comparison` |
| 6 | How it works | Crawl → classify → embed → serve, refreshed daily | `@karaui/how-it-works`, `@registrydirectory/uday-a/how-it-works-steps`, `@registrydirectory/uday-a/how-it-works-scroll-stepper` |
| 7 | Live search | The full search: query, filters (kind, type), results with install command and copy button | `@astryx/example-command-palette-async-search`, `@astryx/showcase-command-palette-list-default`, `@velora/code-block` for each result's command |
| 8 | Features | Semantic search, ranking by proof of use, one-command install, curated captures, themes, local and private, daily refresh, add your own registry | `@velora/features-bento`, `@balick/features-01`, `@registrydirectory/aceternity/features-section-demo-3` |
| 9 | Integrate | Tabs: Claude Code, Codex, Cursor / VS Code, HTTP, AI-OS skill; each with copy | `@velora/code-block`, `@navui/package-manager-command`, `@registrydirectory/brio-ui/install-command` |
| 10 | Built with itself | Each section of this page: the query that found it, the candidates, the one chosen; the components as a file tree | `@magicui/file-tree`, `@assistant-ui/elements-file-tree`, `@velora/code-block` |
| 11 | FAQ | Stores code? (no) · Licences? · Is it a shadcn product? (no, independent) · Needs the cloud? (no, local Ollama) · Languages? (English queries work best) · How fresh? (daily) · Add my registry? (yes) | `@velora/faq-accordion`, `@navui/faqs-section-two`, `@uiception/faq-section-v1` |
| 12 | Closing CTA | Add it to your agent in one command | `@ballmac/cta-1`, `@payload-components/call-to-action-centered`; weak match, rerun with other queries in Block 3 |
| 13 | Footer | Wordmark, links, licence note | `@spectrumui/minimal-footer` (Apache-2.0), `@registrydirectory/uday-a/footer-minimal-row`, `@ui-layouts/footer-minimal` |

## Plan (blocks)

### Block 1: Scaffold the site and serve it from the app (estimated: 45 min)

- [ ] Create `apps/ui-indexador/site/` with Vite + React 19 + TS + Tailwind 4; `npx shadcn@latest init` with
      the `new-york-v4` style; add `@/` aliases.
- [ ] `server.py`: serve `site/dist/index.html` at `/` and `site/dist/assets/*` at `/assets/*` with the same
      path-traversal guard as `/files/`; `/health` and every API path keep working; `/` falls back to the JSON
      health when `site/dist` is missing.
- [ ] Vite dev server proxies the API paths to :3040 so `pnpm dev` works against the live API.
- [ ] `site/build-log.json` skeleton and a `launch.json` entry for the site dev server.
- [ ] `site/.gitignore` for `node_modules/` and `dist/`: the build is not committed (CLAUDE.md §5). On a fresh
      clone `/` keeps answering the JSON health until `pnpm build` runs; `refresh.sh` does not build the site.
- [ ] `/health` gains `built` (the catalog's crawl date) so the page needs one call for its numbers.
- [ ] Use pnpm in `site/`: pnpm does not run dependencies' install scripts unless allowed, which limits what a
      registry's npm dependencies can do at install time.
- [ ] **Verify:** `pnpm build` passes; `curl /` returns the HTML and `curl /assets/<file>` the bundle;
      `test_server.py` (extended with `/`, `/assets/`, traversal and `built`) passes; `curl /assets/../server.py`
      is 404; `git status` shows no `site/dist` or `site/node_modules`.

### Block 2: Fix the indexer defects the first dogfooding pass found (estimated: 60 min)

Runs before any piece is chosen, so the queries recorded in the build log and shown on the page are the ones
the shipped indexer returns.

- [ ] In `indexer.py` / `survey-registries.py`: collapse `@registrydirectory` mirrors onto their source
      registry when it is indexed, and mark the rest `mirror: true` with the source name, ranked below
      first-party items; a `framework` tag (react / vue / svelte) from item dependencies, filterable, default
      react; an `osi_only` licence filter (it filters on the registry licence, so mirrors still need the
      manual source check in Block 3).
- [ ] Rerun the 16 queries of `docs/landing-queries-2026-11-08.txt`; save the new results next to them and
      the before/after in `site/DOGFOOD.md`.
- [ ] **Verify:** `test_server.py` (extended for each new filter) passes; the queries no longer return Vue
      items by default and mirrors are flagged.

### Block 3: Find the pieces with the indexer (estimated: 60 min)

- [ ] For each section, run its queries through the MCP tools (`search_items`, `curated_blocks`,
      `list_captures`), never by opening `data/`, with `framework=react` and `osi_only`. For a mirrored item,
      open the source repo and record its licence in `build-log.json`; exclude it if the licence is not OSI or
      cannot be found.
- [ ] For each shortlisted item read `npx shadcn@latest view <name>`: its files and its npm `dependencies`.
      Reject an item that pulls a package not already common in the ecosystem (react, motion, lucide-react,
      radix, class-variance-authority, clsx, tailwind-merge, cmdk, sonner, recharts) unless the build log says
      why it is worth it.
- [ ] Capture the top three per section with `scripts/capture.py` (their preview page or rendered sandbox)
      into `data/blocks/landing/<section>/`. These join the curated gallery and are committed (about 40 JPEGs,
      ~3 MB at the existing compression).
- [ ] Record every query, mode, candidate and similarity in `site/build-log.json`, with the catalog `built` date
      and the indexer commit, so the page can say its results are a snapshot of that date; for Section 12, rerun with
      at least three alternative phrasings before falling back to hand-building.
- [ ] Note every new friction with the app (wrong kind, missing filter, bad ranking) in `site/DOGFOOD.md` as a
      follow-up; do not fix it in this Spec unless it blocks a section.
- [ ] **Verify:** every section has ≥ 3 candidates or a logged "nothing found"; `npx shadcn@latest view` resolves
      each shortlisted install name.

### Block 4: Pick the theme (estimated: 30 min)

- [ ] `get_theme` for `bold-tech`, `darkmatter`, `modern-minimal`; render the hero candidate with each theme's
      CSS variables; screenshot at 1280 and 375, light and dark.
- [ ] **Verify:** Edd picks one theme from the screenshots. **Stop until Edd picks.**

### Block 5: Hero slice (estimated: 60 min)

- [ ] Install the chosen navbar and hero with their `npx shadcn@latest add` commands; apply the theme; write the
      hero copy; wire the hero search box to `/items` (top 3 results inline).
- [ ] Screenshot at 1280 and 375, light and dark; run `aios-ui-verify` on the slice.
- [ ] **Verify:** Edd approves the direction from the screenshots. **Stop until Edd approves** (memory
      `ui-build-on-proven-libraries`: show one section before building the page).

### Block 6: The remaining static sections (estimated: 90 min)

- [ ] Sections 3, 4, 5, 6, 8, 11, 12, 13: install the chosen item, adapt it to the theme and the copy, and
      remove the demo content it shipped with. Keep each component's source as installed except for content,
      tokens and accessibility fixes; record any structural change in `build-log.json`.
- [ ] **Verify:** `pnpm build` passes; screenshot each section; no leftover demo text (grep for lorem,
      "Acme", placeholder names).

### Block 7: Live search and live numbers (estimated: 60 min)

- [ ] Section 7: a search box with kind and type filters, results showing registry, item, kind, licence,
      similarity and the install command with a copy button; debounced; `mode` and `note` shown when the API
      falls back to keyword.
- [ ] States: loading (skeleton), empty ("nothing indexed matches; try a shorter description"), API down
      (message and the curl command to start it).
- [ ] Section 3 numbers from `/health` and `/facets`, last crawl from the catalog `built` date.
- [ ] **Verify:** with the server up, "flight booking form" returns booking forms; stop the server and the
      page shows the API-down state without console errors; stop Ollama and the page shows keyword mode.

### Block 8: Integration section with verified snippets (estimated: 45 min)

- [ ] Tabs with copy buttons: Claude Code (`claude mcp add ...`), Codex (`config.toml` block), Cursor / VS Code
      (`mcp.json` block), HTTP (`curl` against `/items`), AI-OS (`ai-config/mcp/ui-indexador.yaml` and the
      skills that use it).
- [ ] Run each snippet in a sandbox that never touches the real configs: a temp directory with
      `claude mcp add --scope project` (writes that directory's `.mcp.json`) then `claude mcp list` there;
      `CODEX_HOME=<tmp>` for Codex; a temp `.cursor/mcp.json` / `.vscode/mcp.json` checked against the
      client's schema; `curl` against the local server. Record the tool list or response each produced.
- [ ] **Verify:** each snippet's evidence is in this block's note below; a snippet that cannot be verified here
      (no Cursor installed) is marked "unverified" on the page.

### Block 9: "Built with itself" (estimated: 45 min)

- [ ] Section 10 renders `site/build-log.json`: per section, the query, the top three candidates with
      similarity, the chosen one with its install command, and the reason; plus a file tree of the installed
      components.
- [ ] `site/THIRD_PARTY.md` generated from the same log (item, registry, licence, homepage).
- [ ] **Verify:** every shipped component appears in both; counts match `components/` on disk.

### Block 10: Verification and review (estimated: 60 min)

- [ ] `aios-ui-verify` at 375/768/1280, light/dark, with axe; fix every failure.
- [ ] Lighthouse against the production build served by `server.py`; reach the targets in the acceptance
      criteria (lazy-load heavy pieces, drop a WebGL item if it costs the score).
- [ ] `aios-ui-review` as a cold review on the screenshots; fix blockers and majors.
- [ ] **Verify:** all acceptance criteria re-checked with output or screenshots attached.

### Block 11: Wrap up (estimated: 20 min)

- [ ] README section for the site (dev, build, how it is served); refresh README's stale "~114k items, ~300
      registries" line; `launch.json` entries.
- [ ] Commit on `feat/ui-indexador`; archive this Spec to `archive/2026-11-xx-ui-indexador-landing.md`.
- [ ] **Verify:** clean `git status` apart from generated data; ask Edd about the PR to `dev`.

## Risks and mitigation

| Risk | Probability | Impact | Mitigation |
| --- | --- | --- | --- |
| Pieces from many registries look like a patchwork | high | high | One theme's tokens everywhere; strip each piece's own colours and fonts; hero slice approved before the rest |
| A chosen item needs a different shadcn style (Base UI vs Radix) or missing peer components | med | med | `new-york-v4` base; `npx shadcn view` before choosing; installs pull `registryDependencies` |
| Heavy items (WebGL, Remotion, big motion) cost the Lighthouse score | med | med | Prefer CSS-only candidates; lazy-load below the fold; drop the item if it still costs > 5 points |
| Licence unknown ("?") or non-OSI | med | high | OSI-only filter (Block 2) plus the manual mirror check (Block 3); `THIRD_PARTY.md` lists every shipped item |
| Semantic search unavailable during the build (Ollama down) | low | low | The API falls back to keyword and says so; the build log records the mode used |
| The page oversells (numbers drift, features not real) | med | med | Numbers come from the live API; every integration snippet is run before it is published |
| Scope creep into indexer redesign | med | med | Block 2 is capped at the listed fixes; later friction goes to `DOGFOOD.md` as follow-ups |
| A low-star registry ships hostile or broken code or npm dependencies | low | high | Read each item's JSON and dependencies before `add`; pnpm blocks install scripts; prefer items from ranked registries |
| The licence shown for a mirrored item is the mirror's, not the source's | high | high | Manual source-licence check per mirrored item; exclude when unconfirmed |

## Verification (end-to-end)

- [ ] Start `server.py`, open `/`, search "airport autocomplete" in the live search, copy an install command,
      run it in a scratch Vite app, and the component renders.
- [ ] `aios-ui-verify` and Lighthouse reports attached; screenshots at 1280 and 375 in both themes.
- [ ] Every acceptance criterion checked with its evidence.

## References

- App: `apps/ui-indexador/README.md`, `indexer.py`, `server.py`, `mcp_server.py`, `refresh.sh`.
- Dogfooding queries and results, 2026-11-08: `apps/ui-indexador/docs/landing-queries-2026-11-08.txt`
  (16 sections, all semantic mode); the shortlist above is taken from it.
- Skills: `aios-ui-design` (step 4: compose from proven pieces), `aios-ui-verify`, `aios-ui-review`,
  `pick-ui-library`.
- Memory: `ui-build-on-proven-libraries` (show one section first; no invented visual systems).
- Previous site stack for reference: `apps/site/package.json`, `apps/site/components.json`.

## Notes

- Estimated total: about 9.5 hours over 11 blocks; the two stops (theme, hero slice) are where Edd's time is
  needed.
- The page's copy is drafted in Block 5 (hero) and Block 6 (the rest), in English, in the project's terse voice;
  no marketing superlatives that the numbers do not back.

## Outcome (2026-11-08)

- All acceptance criteria met except: semantic → keyword fallback on the page was checked through the API (note
  shown), not by stopping the shared Ollama; VS Code / Cursor snippets are marked unverified on the page.
- Deviations: candidate captures were taken for the hero (the decision point), not for every section; the
  GitHub star button was dropped because the repo is private; the page says how to get access.
- Edd's design decisions: hero A (@balick/hero-01), theme darkmatter, a stronger orange (#ff6a00), white text on
  buttons (on #d14900 to keep 4.5:1).
- Cold design review: 1 blocker (no way to get the software) and 4 majors, all fixed.
