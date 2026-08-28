# TASKS.md — AI-OS Plans Explorer

> Bloques de <=30 min cada uno. Verificación runtime entre bloques.

## Bloque 1 — Bootstrap Vite + Vue (M2)

- [ ] Crear `plans-explorer/app/` con `npm create vite@latest . -- --template vue-ts` (desde dentro del dir).
- [ ] Instalar deps: `vue-router markdown-it highlight.js fuse.js`.
- [ ] Configurar `vite.config.ts` con alias `@/` → `src/`, `base: './'` (asset paths relativos, permite deploy bajo cualquier subpath).
- [ ] Crear `src/styles/tokens.css` con los valores de `DESIGN.md`.
- [ ] Crear `src/router.ts` con 4 rutas lazy-loaded (`/`, `/plans/:id`, `/rankings`, `/about`).
- [ ] Crear 3 vistas vacías con placeholder "WIP".
- [ ] **Verify:** `npm run dev` levanta en :3020, navegas entre 4 rutas sin error en consola.

## Bloque 2 — Indexer build-time (M1)

- [ ] Escribir `app/scripts/build-index.mjs`: walk a `../data/projects/*/` (relativo al script), filtra dirs que tengan `SPEC.md`.
- [ ] Parser `parseSpec(planDir)` → extrae `title`, `category`, `tags`, `date`, `country`.
- [ ] Parser `parsePlan(planDir)` → extrae `tech[]` con regex sobre `**Frontend:**`, `**Backend:**`, `**DB:**`.
- [ ] Parser `parseWtp(problemText)` → extrae `willingnessToPay {raw, currency, min, max, period, mrrMid}`. Tabla de normalización: `per month → /1`, `per year → /12`, `per project → keep as one-shot`, `per deal → keep as one-shot`. Si no parsea → `null`.
- [ ] Parser `parseRankings(topProjectsPath)` → 3 listas `{money, learn, fun}` top-N.
- [ ] Merge scores por `id` en cada plan.
- [ ] Reconstruir `sourceUrl` = `https://problemhunt.pro/en/{primaryCategory}/{slug}`.
- [ ] Escribir `app/public/data/plans.json` (metadata completa, sin md) y `app/public/data/documents/<id>.json` (md crudo por doc).
- [ ] **Tests de regresión** (`app/scripts/test-parser.mjs`): 5 planes reales como fixtures:
  - `001` → category `marketing`, country `Russia`, wtp `null` (texto: "I don't know how much it might cost").
  - `016` → category `validated`, wtp `null`.
  - `236` → tech `[React, TypeScript, Node.js, SQLite]`, no wtp visible en H1.
  - `419` → category `health`, country USA.
  - `441` → category `ai`, wtp `$9/month`, mrrMid=9.
- [ ] Añadir `npm run index` (solo indexer) y `npm run build` (indexer + vite build, vía `prebuild` script).
- [ ] Crear `plans-explorer/refresh-data.sh` que ejecuta `npm run build` desde `app/`.
- [ ] **Verify:** `npm run index` exit 0; `plans.json` tiene 525 entries; spot-check que wtp del feed aparece parseado para los 20 planes con `Willing to pay $X–Y/month` en el título.

## Bloque 3 — IndexView + búsqueda (M3)

- [ ] Componente `PlanCard.vue` con props `{plan, scores}`: title, hook, chips (cat + 2 tags + tech), `WtpBadge`, `country flag` emoji, 3 `ScoreBadge`, link-out icon.
- [ ] Componente `ScoreBadge.vue` con prop `{kind, score}`.
- [ ] Componente `WtpBadge.vue` con prop `{wtp}` → buckets de color.
- [ ] Componente `FacetPanel.vue` con multi-select: Categories, Tags, Tech, Country.
- [ ] Componente `IncomeRangeSlider.vue`: doble handle 0–$5000 MRR.
- [ ] Search input en header (top, fixed), debounce 150ms.
- [ ] `src/lib/search.ts`: Fuse.js config (keys: title, problem, tags, tech, category), facet filters aplicados antes de Fuse.
- [ ] Sort dropdown: money desc / learn desc / fun desc / mrrMid desc / date desc / title asc.
- [ ] Empty state + skeleton loaders.
- [ ] **Verify:** filtro `category=ai` reduce grid; search `shopify` muestra plan 222; slider MRR=$100–500 oculta planes con wtp `null` o fuera de rango; sort por money pone 216/419/222 arriba.

## Bloque 4 — PlanView + lector md (M4)

- [ ] Componente `MarkdownReader.vue` con `markdown-it` + hljs (theme atom-one-dark), prose styles.
- [ ] Componente `DocTabs.vue` con transición de indicator.
- [ ] Sidebar metadata: title, categoría(s), tags, tech, country, **wtp + mrrMid**, date, **link out a ProblemHunt (sourceUrl)**, scores.
- [ ] Fetch lazy de `documents/<id>.json` solo al entrar a PlanView.
- [ ] 404 si `:id` no existe.
- [ ] **Verify:** navegar `/plans/236` muestra SPEC renderizado con tabla GFM; tabs cambian a PRODUCT / PLAN; sidebar muestra score 8 (fun) y tech `React + TypeScript`. Navegar `/plans/001` muestra sidebar con country `🇷🇺 Russia` y wtp "negotiable" (gris).

## Bloque 5 — RankingsView (M5)

- [ ] 3 columnas (money / learn / fun) con top-5.
- [ ] Cada item: score grande, título, hook (1-2 líneas), link al plan.
- [ ] Destacar visualmente cuando un plan aparece en varios rankings (badge "appears in 2 rankings").
- [ ] **Verify:** top-5 de money coincide con `TOP_PROJECTS.md` líneas 9-23 (216, 419, 222, 441, 423).

## Bloque 6 — Polish + verify (M6)

- [ ] Responsive: probar en 375px / 768px / 1280px / 1920px.
- [ ] Lighthouse perf ≥95 en `/` y `/plans/:id`.
- [ ] Build size <200KB JS gzipped (medir con `npm run build && du -sh app/dist/assets`).
- [ ] `plans-explorer/README.md` con: qué es, cómo correrlo (`cd app && npm install && npm run dev`), cómo rebuildear el index (`./refresh-data.sh`), estructura del corpus.
- [ ] Browser smoke test: cold load → search → filter → open plan → switch tab → click ranking link → vuelve al plan correcto.
- [ ] **Verify final:** screenshot del browser muestra el mismo aesthetic que `site/index.html`; `npm run build` exit 0; `app/dist/` se sirve con `npx serve app/dist` y abre el cold flow sin errores de consola.

## Done criteria

- ✅ Los 525 planes son accesibles vía UI.
- ✅ Top-5 money/learn/fun coincide con `TOP_PROJECTS.md` (no drift).
- ✅ Build estático, sin backend, deployable al lado de `site/`.
- ✅ Bundle <200KB gzipped, Lighthouse perf ≥95.
- ✅ `plans-explorer/` top-level, hermano de `site/`, sin acoplamiento entre ambos.
