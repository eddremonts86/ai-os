# SPEC.md — AI-OS Plans Explorer

## Problema Detectado

El repo AI-OS contiene **525 planes de productos** en `~/Projects/ai-os/apps/data/projects/`, cada uno con hasta 5 documentos (`SPEC.md`, `PRODUCT.md`, `PLAN.md`, `DESIGN.md`, `TASKS.md`) y un ranking auto-generado en `TOP_PROJECTS.md` con tres ejes (money / learn / fun). Hoy no hay forma rápida de:

- Buscar por **tema, keyword, tecnología, mercado o revenue previsto**.
- Leer un plan en formato renderizado (md/mdx) sin abrir el repo.
- Comparar planes lado a lado con sus scores.
- Filtrar por los top-5 de cada ranking.

Necesitamos una **mini-app web estática** hermano de `site/` que exponga todos los planes como contenido navegable y buscable, con el mismo lenguaje visual que `site/index.html`.

**Fuente:** auto-detectado (backlog AI-OS)
**Categoría primaria:** dev
**Tags:** Developer,Productivity,AI
**Fecha:** 2026-08-12

---

## Objetivo Principal

Construir una SPA estática en `~/Projects/ai-os/plans-explorer/app/` que:

1. **Indexe** los 525 planes en build-time → `plans.json` con metadatos extraídos:
   - `id` (001-525), `slug`, `title` (H1 de SPEC.md).
   - `category` (primaria) + `categories[]` (todas, dedup de las 34 que expone ProblemHunt).
   - `tags[]` (de PRODUCT.md / SPEC.md).
   - `problem` (texto del H1).
   - `country` (regex sobre SPEC.md "Country: Russia" o línea suelta).
   - `tech[]` (de PLAN.md, regex sobre `**Frontend:**` / `**Backend:**` / `**DB:**`).
   - `willingnessToPay` `{raw, currency, min, max, period, mrrMid}` (regex sobre problema + sección 4 del feed).
   - `date` (ISO de SPEC.md).
   - `sourceUrl` (`https://problemhunt.pro/en/{category}/{slug}`).
   - `scores {money, learn, fun}` (de `TOP_PROJECTS.md` o `null`).
2. **Renderice** md/mdx de cada plan (`SPEC.md`, `PRODUCT.md`, `PLAN.md`) en el navegador con un lector (markdown + GFM tables).
3. **Busque y filtre** en cliente:
   - Full-text Fuse.js sobre `title + problem + tags + tech`.
   - Facetas: `categories[]`, `tags[]`, `tech[]`, `country`, `hasWtp` (boolean).
   - Rango slider: `willingnessToPay.mrrMid`.
   - Sort por score (money/learn/fun desc), date desc, title asc.
4. **Muestre rankings** top-5 money / learn / fun (parseando `TOP_PROJECTS.md`).
5. **Mantenga el aesthetic** de `site/index.html` (dark editorial, tipografía cuidada, mismo `data-theme="void"`).
6. **Cards con datos clave**: title, hook de 1 línea, chips de categoría+tags+tech, **income previsto pill** ("$100–300/month" o "negotiable"), **country flag emoji** si hay, **3 score badges**, **link al original ProblemHunt**.

---

## Usuarios Objetivo

1. **[Primario — Edd]** — cuando tenga que decidir "¿qué construyo hoy?" abre la app, filtra por top-money, lee 2-3 SPECs y elige.
2. **[Secundario — revisor / stakeholder]** — visita `/plans/<id>` para leer un plan específico sin clonar el repo.

## Alcance MVP

- ✅ Indexer build-time (`app/scripts/build-index.mjs`): escanea `../data/projects/*/SPEC.md`, extrae los metadatos listados arriba + parsea `../data/projects/TOP_PROJECTS.md`. Escribe `app/public/data/plans.json` + `app/public/data/rankings.json`.
- ✅ Validador de extracción: el indexer corre tests de regresión sobre 5 planes reales (001, 016, 236, 419, 441).
- ✅ SPA Vite + Vue 3 (Composition API) con client-side routing (`vue-router` 4).
- ✅ Vista `/` (índice): grid de cards con filtro (search box + facetas categoría/tags/tech/country + slider income range + sort por score).
- ✅ Vista `/plans/:id` (detalle): tabs `SPEC / PRODUCT / PLAN`, lector md con GFM (incluyendo tablas), sidebar con metadatos + scores + link-out a ProblemHunt.
- ✅ Vista `/rankings` (opcional en MVP): top-5 de cada eje con link al plan.
- ✅ Styling: tokens compartidos con `site/index.html` (color palette, typography stack, radii).
- ⛔ NO incluye: edición, comentarios, auth, server-side indexing dinámico (todo es build-time).
- ⛔ NO incluye: ejecutar tests / CI (es estático).

## Design Direction

Ver `DESIGN.md` para tokens específicos del proyecto.

## Constraints

- **Build-time, no runtime crawling**: la app se buildea una vez con datos frescos; un script de refresh rebuildea cuando cambia `data/projects/`.
- **Sin backend**: 100% estático, deployable igual que `site/`.
- **Bundle pequeño**: <200KB JS gzipped, lazy-load del lector md solo en la ruta detalle.
- **Misma paleta que `site/`**: dark `#0b0d12` base, accents `#7c5cff` / `#3ddc97`, type stack `Inter` + `JetBrains Mono`.
- **i18n**: copy en inglés, comentarios en código en inglés.
- **Tolerancia a metadatos faltantes**: si un plan no tiene country / tech / wtp, esos campos quedan `null` y la UI los oculta, no rompe.
- **No scraping agresivo**: el indexer NO hace scraping del feed cada build — solo lee los `.md` locales. `sourceUrl` se reconstruye desde el `slug` de la carpeta (`https://problemhunt.pro/en/{category}/{slug}`).
