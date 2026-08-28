# PLAN.md — AI-OS Plans Explorer

## Tech Stack Propuesta

- **Build tool:** Vite 5 (SPA, `vite build` produce `app/dist/` estático)
- **Framework:** Vue 3 + Composition API + `<script setup lang="ts">` (skill `antfu-vue`)
- **Router:** vue-router 4 con lazy chunks por ruta
- **Markdown:** `markdown-it` (GFM tables, autolinks) + `highlight.js` para code blocks
- **Search/Filters:** cliente puro (Fuse.js para fuzzy full-text, arrays nativos para facetas)
- **Styling:** CSS variables + un único `app/src/styles/app.css`, sin Tailwind (mantener footprint pequeño; los tokens vienen de `site/index.html`)
- **Indexer:** script Node `.mjs` en `app/scripts/build-index.mjs` ejecutado pre-`vite build`
- **Despliegue:** mismo target que `site/` (Coolify / estático). Salida final en `app/dist/`.

## Arquitectura

```
~/Projects/ai-os/
├── site/                                  ← landing estática (existente)
├── plans-explorer/                        ← NUEVO, top-level, hermano de site/
│   ├── SPEC.md
│   ├── PRODUCT.md
│   ├── PLAN.md                            ← este archivo
│   ├── DESIGN.md
│   ├── TASKS.md
│   ├── README.md
│   ├── refresh-data.sh                    ← wrapper: indexer + build + (opcional) deploy
│   └── app/
│       ├── package.json
│       ├── vite.config.ts
│       ├── tsconfig.json
│       ├── index.html
│       ├── scripts/
│       │   ├── build-index.mjs
│       │   └── test-parser.mjs
│       ├── public/
│       │   └── data/
│       │       ├── plans.json             ← generado
│       │       ├── rankings.json          ← generado
│       │       └── documents/<id>.json    ← generado, lazy
│       └── src/
│           ├── main.ts
│           ├── App.vue
│           ├── router.ts
│           ├── styles/
│           │   ├── tokens.css
│           │   └── app.css
│           ├── data/
│           │   └── load.ts
│           ├── lib/
│           │   ├── search.ts
│           │   └── md.ts
│           ├── components/
│           │   ├── PlanCard.vue
│           │   ├── FacetPanel.vue
│           │   ├── IncomeRangeSlider.vue
│           │   ├── ScoreBadge.vue
│           │   ├── WtpBadge.vue
│           │   ├── DocTabs.vue
│           │   └── MarkdownReader.vue
│           └── views/
│               ├── IndexView.vue
│               ├── PlanView.vue
│               └── RankingsView.vue
└── data/projects/                              ← corpus (intacto, solo lectura)
    ├── 001-.../
    ├── 002-.../
    └── TOP_PROJECTS.md
```

**Relación con `site/`:**

- `plans-explorer/` es **independiente** de `site/`. No comparte build, no se copia dentro de `site/`, no se enlaza desde `site/index.html` en MVP (se puede añadir un link opcional más adelante).
- Comparten solo el **vocabulario de tokens** (`tokens.css` es una copia fiel del CSS de `site/index.html`).
- Deploy: misma plataforma estática que `site/`, ruta/dominio a decidir en deploy phase (subpath `/plans/` o subdominio `plans.ai-os.eduardoinerarte.dk`).

### Data flow

1. `app/scripts/build-index.mjs` corre pre-`vite build` (vía `prebuild` npm script):
   - `walk('../projects')` (relativo a `app/`) → lista dirs `NNN-slug/` que tengan `SPEC.md`.
   - Para cada plan, parsea en paralelo `SPEC.md` + `PRODUCT.md` + `PLAN.md`.
   - Extrae (regex + heurísticas):
     - `id` = primeros 3 chars del nombre del dir.
     - `slug` = resto del nombre.
     - `title` = H1 sin prefijo `# SPEC.md — `.
     - `category` = match `\*\*Categoría primaria:\*\*\s*(\w+)` o fallback `other`.
     - `categories[]` = dedup de `category` + tokens de `tags[]` que matcheen la lista de 34 categorías de ProblemHunt.
     - `tags[]` = match `\*\*Tags:\*\*\s*(.+)` y split por coma.
     - `country` = regex multilinea sobre SPEC.md ("Country: Russia" o línea suelta antes de "Fuente:").
     - `tech[]` = parsea `PLAN.md` con regex sobre `\*\*Frontend:\*\*\s*(.+)` etc., split por `+` y trim.
     - `willingnessToPay` = regex compuesta sobre el problema:
       - `(?:willing to pay|paga|pagar[a-z]*|budget)\s*[:\$]?\s*([€$£]\s?\d[\d,–\- ]*)(?:\s*(per|\/|a)\s*(month|year|project|deal|week))?`
       - devuelve `{raw, currency, min, max, period, mrrMid}` con normalización: `per month → /1`, `per year → /12`, `per project/deal → /12` (heurística), si no parsea → `null`.
     - `date` = match `\*\*Fecha:\*\*\s*(\d{4}-\d{2}-\d{2})`.
     - `sourceUrl` = reconstruir `https://problemhunt.pro/en/{primaryCategory}/{slug}`.
   - Parsea `../data/projects/TOP_PROJECTS.md` → `rankings.json` con `{money: [{id, score, hook}], learn: [...], fun: [...]}`.
   - Enriquecer cada plan con `scores: {money, learn, fun}` (o `null`).
2. Escribe `app/public/data/plans.json` (metadata completa, sin md) + `app/public/data/documents/<id>.json` (md crudo por doc, lazy).
3. `vite build` produce `app/dist/` listo para static host.

### Routing

- `/` → IndexView (grid 455 cards + filtros)
- `/plans/:id` → PlanView (tabs SPEC / PRODUCT / PLAN + sidebar metadata)
- `/rankings` → RankingsView (3 columnas top-5)
- `/about` → link al repo, stack, ranking source

## Milestones

1. **M0 — Spec aprobado**: SPEC + PRODUCT + PLAN + DESIGN + TASKS firmados.
2. **M1 — Indexer funcional**: `app/scripts/build-index.mjs` produce `plans.json` + `rankings.json` validados contra los 525 planes existentes (5 fixtures).
3. **M2 — Skeleton SPA**: Vite + Vue + router + 3 vistas vacías + tokens.css aplicados (mismo dark theme que `site/`).
4. **M3 — IndexView con búsqueda**: cards + Fuse.js + facetas categoría/tags/tech/country + slider income range + sort por score.
5. **M4 — PlanView con lector md**: DocTabs + MarkdownReader + sidebar de metadatos + score badges + WtpBadge.
6. **M5 — RankingsView**: 3 columnas top-5 con link al plan.
7. **M6 — Polish + verify**: empty states, 404, mobile responsive, Lighthouse 95+ perf.

## Riesgos

- **Parsers frágiles**: frontmatter puede estar vacío, tags en línea o como heading. Mitigación: regex tolerante + tests con 5 planes reales como fixtures (001, 016, 236, 419, 441).
- **`willingnessToPay` multiformato**: aparece como `$100–300/month`, `$15-30 per month`, `£50–100`, `Budget $500–700`, `negotiable`, o texto libre ("Everything is negotiable"). Mitigación: regex progresiva + tabla de normalización → `mrrMid` (USD/mes) con `null` si no parsea.
- **Bundle size del md parser**: `markdown-it` + `highlight.js` ≈ 80KB gzipped; aceptable. Lazy-load solo en `PlanView`.
- **Consistencia con site/**: si Edd refactoriza `site/index.html` los tokens quedan desincronizados. Mitigación: documentar en `DESIGN.md` qué valores se importan.
- **`TOP_PROJECTS.md` cambia de formato**: el parser es regex sobre bullets. Mitigación: tests sobre el archivo real (formato estable desde 2026-08-08).
- **No scrapear ProblemHunt en build**: evitamos dependencia de red en CI. `sourceUrl` se reconstruye del slug local.
- **Stale data**: el `plans.json` se regenera solo al hacer `npm run build` o `npm run index`. Hay que acordarse de rebuildear después de que el cron de `problemhunt-scraper` actualice `TOP_PROJECTS.md` o se añadan planes. Mitigación: `plans-explorer/refresh-data.sh` que corre indexer + build, listo para hookearse al cron.
