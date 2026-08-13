# DESIGN.md — AI-OS Plans Explorer

## Visual direction

Mismo lenguaje editorial que `site/index.html`:
- Fondo `#0b0d12`, surface `#11141b`, line `#1f2530`.
- Accent primario `#7c5cff` (violeta), secundario `#3ddc97` (verde) para "learn" score.
- Tipografía: `Inter` para UI, `JetBrains Mono` para code/metadata. Ambos como Google Fonts (mismo `site/`).
- Radii: 8px en cards, 12px en modals, 999px en score badges.
- Espaciado en escala 4/8/12/16/24/32/48.

## Tokens (importar de `site/index.html`)

```css
:root {
  --bg: #0b0d12;
  --surface: #11141b;
  --surface-2: #161a23;
  --line: #1f2530;
  --text: #e8ebf2;
  --text-dim: #9aa3b2;
  --accent: #7c5cff;
  --accent-2: #3ddc97;
  --warn: #f5a524;
  --danger: #ef4444;
  --radius-sm: 6px;
  --radius-md: 8px;
  --radius-lg: 12px;
  --shadow-1: 0 1px 2px rgba(0,0,0,.3);
  --shadow-2: 0 8px 24px rgba(0,0,0,.4);
  --font-ui: 'Inter', system-ui, -apple-system, sans-serif;
  --font-mono: 'JetBrains Mono', ui-monospace, monospace;
}
```

## Layout

- **IndexView**: header fijo (logo + search + "rankings" link + "about"), sidebar izquierda 240px (facetas), grid de cards 12-col responsive. Cards = `1fr` en mobile, `repeat(auto-fill, minmax(280px, 1fr))` en ≥768px.
- **PlanView**: header fijo + layout 2-col — main 720px (md renderizado), sidebar 280px (metadata + scores sticky). En mobile colapsa a tabs.
- **RankingsView**: header + 3 columnas top-5, cada item = score grande + título + hook de 2 líneas + link.

## Componentes clave

- **`ScoreBadge`**: pill con número 1-10 + label (money 💰 / learn 🧠 / fun 🎮). Color del pill según score: ≥8 verde, 6-7 amarillo, <6 gris.
- **`PlanCard`**: title (Inter 16/600), problem (text-dim 14/400, 2 líneas con ellipsis), chips (categoría + 2 tags + tech si hay), footer con **3 score badges** + **wtp pill** ("$100–300/month" verde o "negotiable" gris) + **country flag emoji** + icono link-out a ProblemHunt.
- **`FacetPanel`**: collapsible por grupo (Categories, Tags, Tech, Country), cada faceta = count + checkbox, multi-select. Sección aparte: **Income range slider** (0–$5000 MRR) con histograma de distribución.
- **`DocTabs`**: 3 tabs `SPEC / PRODUCT / PLAN`, indicator animado con `<Transition>`.
- **`MarkdownReader`**: prose styles — h1/h2/h3 con hierarchy clara, tables con zebra striping, code blocks con hljs theme `atom-one-dark`.
- **`WtpBadge`**: pill que recibe `{raw, currency, mrrMid}` y se pinta según buckets (≥$500/mo verde, $100–500 amarillo, <$100 gris, "negotiable" ghost).

## Datos visibles en cada vista

### Card (IndexView)
```
[category chip] [tag1] [tag2] [+1]                          [💰 8] [🧠 7] [🎮 6]
Title — short hook line text here that truncates...
🇷🇺 Russia    React + TypeScript    $100–300/month
```

### Sidebar (PlanView)
```
Title
[category chips]
[tag chips]
Country: 🇷🇺 Russia
Tech: React + TypeScript, Node.js, SQLite
Income: $100–300/month · mid $200/mo
Date: 2026-07-20
Source: ↗ View on ProblemHunt
Scores: 💰 8 (money) · 🧠 7 (learn) · 🎮 6 (fun)
```

## Estados

- **Empty (sin resultados)**: ilustración svg pequeña + "No plans match these filters" + botón "clear filters".
- **Loading**: skeleton card shimmer.
- **404**: "Plan not found" + link al índice.

## Motion

- Transición de tabs: 200ms ease-out.
- Hover en card: lift 2px + shadow-2.
- Filtrado: fade out 120ms + fade in 180ms en cards que quedan.
- Score badges: pulse sutil al cambiar (300ms).
