---
name: open-design-integration
description: Integración con open-design daemon (127.0.0.1:7456) para DESIGN.md + design tokens + 5 escuelas visuales + flujo ProblemHunt. Aplica al trabajar con design systems auto-generados, design audits, o el flujo Scraper→SPEC.md→DESIGN.md→PLAN.md→TASKS.md.
license: Internal
---

# Open-Design Integration

Open-design es un daemon local (Next.js + REST API) que ayuda a generar design systems consistentes para proyectos. Corre en `127.0.0.1:7456` por default y expone una API REST para crear proyectos con skills + design systems predefinidos.

## Setup

```bash
# Levantar container (parte de docker-compose raíz)
docker compose up -d open-design

# Verificar
curl http://127.0.0.1:7456/api/health
# {"status":"ok"}

# Web UI
open http://127.0.0.1:7456
```

## Variables de entorno requeridas

```bash
# .env
OD_PORT=7456
OD_API_TOKEN=***   # openssl rand -hex 32
OD_BIND_HOST=0.0.0.0
```

El container falla fast si falta `OD_API_TOKEN`:
```
ERROR: OD_API_TOKEN required
```

## API REST

Base: `http://host.docker.internal:7456` (desde containers) o `http://127.0.0.1:7456` (desde host).

**Auth:** header `Authorization: Bearer ${OD_API_TOKEN}` en todas las requests excepto `/api/health`.

### Endpoints

```bash
# Health (sin auth)
GET /api/health
# → {"status":"ok"}

# Listar skills (31 built-in)
GET /api/skills
# → [{id: "design-md", name: "Design.md Generator", ...}, ...]

# Skill específico
GET /api/skills/design-md
# → {id, name, description, params_schema, ...}

# Listar design systems built-in
GET /api/design-systems
# → [{id: "vercel", name: "Vercel Design System", ...}, {id: "airbnb", ...}, ...]

# Design system específico
GET /api/design-systems/vercel
# → {id, name, colors, typography, components, ...}

# Listar proyectos existentes
GET /api/projects
# → [{uuid, name, skillId, designSystemId, createdAt, ...}]

# Crear proyecto
POST /api/projects
Content-Type: application/json
Authorization: Bearer ${OD_API_TOKEN}

{
  "name": "Mi SaaS",
  "skillId": "design-md",
  "designSystemId": "vercel",
  "params": {
    "description": "Dashboard para gestión de proyectos",
    "audience": "developers and PMs"
  }
}
# → {uuid, name, ...}
# Genera: docs/projects/mi-saas/DESIGN.md, tokens.css, plan suggestions

# Health de providers
GET /api/providers
# → [{id: "ollama", status: "ok"}, {id: "opencode", status: "ok"}, ...]
```

## Skills built-in (31)

| ID | Nombre | Uso |
|---|---|---|
| `design-md` | Design.md Generator | Genera DESIGN.md desde prompt + design system |
| `brand-guidelines` | Brand Guidelines | Genera brand book (logo usage, colors, typography, voice) |
| `web-prototype` | Web Prototype | HTML/CSS/JS prototype navegable |
| `dashboard` | Dashboard Layout | Admin dashboard con sidebar + charts + tables |
| `landing-page` | Landing Page | Marketing site con hero + features + CTA |
| `e-commerce` | E-commerce | Product grid + cart + checkout flow |
| `blog` | Blog Layout | Article list + single post + sidebar |
| `docs-site` | Documentation | Docs site con sidebar nav + search + TOC |
| `mobile-app` | Mobile App | iOS/Android mockup con safe areas |
| `email-template` | Email Template | HTML email responsive |
| ... | ... | (21 más) |

## Design systems built-in

| ID | Tipo | Personalidad |
|---|---|---|
| `vercel` | Modern minimal | SaaS clean, monochrome + accent |
| `linear` | Tech utility | Dashboard denso, dark mode |
| `airbnb` | Editorial warm | Consumer warm, hospitality |
| `stripe` | Editorial modern | Fintech, gradient accents |
| `github` | Tech utility | Dev tool, sparse + functional |
| `notion` | Modern minimal | Productivity, soft + friendly |
| `figma` | Design tool | White-label, customizable |

## 5 escuelas visuales (auto-detección)

Open-design detecta la escuela visual apropiada según keywords del proyecto:

### 1. editorial-monocle
**Keywords:** editorial, magazine, premium, luxury, lifestyle, fashion, art
**Características:**
- Serif display (Pangram, Klim, ABC Dinamo)
- Generous whitespace
- Editorial photography
- Subtle, restrained accent

### 2. modern-minimal
**Keywords:** SaaS, productivity, B2B, platform, tool, dashboard, clean
**Características:**
- Sans-serif clean (Inter, Geist, Satoshi)
- Minimal color palette (5-7 colors)
- Grid-based layouts
- Subtle shadows + borders

### 3. warm-soft
**Keywords:** consumer, friendly, social, community, wellness, kids, family
**Características:**
- Rounded corners (16-24px)
- Warm tones (peach, cream, terracotta)
- Friendly typefaces (Recoleta, Fraunces, ABC Diatype)
- Soft shadows + gradients

### 4. tech-utility
**Keywords:** dashboard, dev tool, analytics, monitoring, infra, platform
**Características:**
- Mono accents (JetBrains Mono, Berkeley Mono)
- Dense data display
- Functional layouts
- High information density

### 5. brutalist-experimental
**Keywords:** experimental, art, design, portfolio, agency, creative, bold
**Características:**
- Unconventional layouts
- Heavy type weights
- High contrast (black/white + 1 accent)
- Asymmetric grids

## Flujo ProblemHunt

Para generar proyectos completos desde problemas scrapeados:

```
Scraper (problemhunt-scraper.cjs)
   ↓
SPEC.md (problema + solución + métricas)
   ↓
DESIGN.md (generado por open-design /api/projects con skillId=design-md)
   ↓
PLAN.md (fases + milestones + dependencies)
   ↓
TASKS.md (tasks atómicas con estimates)
```

### Ejemplo end-to-end

```bash
# 1. Spec del proyecto
cat > /tmp/project-spec.md <<EOF
# ProblemHunt #400
Moving with furniture is a weeks-long headache...

## Target users
Renters moving between cities

## Core feature
Real-time booking with verified movers
EOF

# 2. Crear proyecto en open-design
PROJECT_UUID=$(curl -X POST http://127.0.0.1:7456/api/projects \
  -H "Authorization: Bearer ${OD_API_TOKEN}" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "moving-app",
    "skillId": "design-md",
    "designSystemId": "vercel",
    "params": {
      "description": "Moving service booking app",
      "audience": "renters and movers"
    }
  }' | jq -r '.uuid')

# 3. Esperar generación (async, ~30s)
sleep 30

# 4. Obtener DESIGN.md
curl "http://127.0.0.1:7456/api/projects/${PROJECT_UUID}/design" \
  -H "Authorization: Bearer ${OD_API_TOKEN}" \
  | jq -r '.design_md' > DESIGN.md

# 5. Generar CSS tokens
npx @google/design.md export --format css-tailwind DESIGN.md > tokens.css

# 6. Generar tasks
curl "http://127.0.0.1:7456/api/projects/${PROJECT_UUID}/tasks" \
  -H "Authorization: Bearer ${OD_API_TOKEN}" \
  | jq -r '.tasks_md' > TASKS.md
```

## DESIGN.md — formato Google Labs

```markdown
---
name: My App
description: Dashboard for project management
visual_school: modern-minimal
---

# My App Design System

## Colors

### Primary
- Brand-500: hsl(220 80% 50%)  -- buttons, links, focus
- Brand-600: hsl(220 80% 45%)  -- hover
- Brand-700: hsl(220 80% 40%)  -- active

### Surface
- Background: hsl(0 0% 100%)
- Surface-1: hsl(0 0% 98%)
- Surface-2: hsl(0 0% 96%)
- Border: hsl(0 0% 90%)

### Text
- Text-high: hsl(0 0% 10%)
- Text-mid: hsl(0 0% 40%)
- Text-low: hsl(0 0% 60%)

## Typography

### Display
- Font: Inter Tight
- Weight: 700
- Size: clamp(2rem, 4vw, 3.5rem)
- Line-height: 1.1

### Body
- Font: Inter
- Weight: 400
- Size: 1rem (16px)
- Line-height: 1.5

### Mono
- Font: JetBrains Mono
- Weight: 400
- Size: 0.875rem

## Spacing

Base: 4px
- xs: 4px
- sm: 8px
- md: 16px
- lg: 24px
- xl: 32px
- 2xl: 48px
- 3xl: 64px

## Components

### Button
- Height: 40px
- Padding: 0 16px
- Border-radius: 8px
- Font-weight: 500
- Variants: primary, secondary, ghost, destructive

### Input
- Height: 40px
- Padding: 0 12px
- Border: 1px solid Border
- Border-radius: 8px
- Focus: ring 2px Brand-500

### Card
- Padding: 16px
- Border: 1px solid Border
- Border-radius: 12px
- Shadow: 0 1px 2px hsl(0 0% 0% / 5%)
```

## npx @google/design.md

CLI oficial para trabajar con DESIGN.md:

```bash
# Lint (validar contra schema)
npx @google/design.md lint DESIGN.md

# Export to CSS custom properties
npx @google/design.md export --format css-tailwind DESIGN.md > tokens.css

# Export to Tailwind config
npx @google/design.md export --format tailwind-config DESIGN.md > tailwind.config.js

# Export to CSS variables (raw)
npx @google/design.md export --format css-vars DESIGN.md > tokens.css

# Lint all
find /workspace/repo/docs/projects -name "DESIGN.md" -exec \
  npx @google/design.md lint {} \;
```

## Integración con Tailwind

```js
// tailwind.config.js (generado)
const tokens = require('./tokens.json');

module.exports = {
  theme: {
    extend: {
      colors: {
        brand: tokens.colors.brand,
        surface: tokens.colors.surface,
        text: tokens.colors.text,
      },
      fontFamily: {
        display: tokens.typography.display.font,
        body: tokens.typography.body.font,
        mono: tokens.typography.mono.font,
      },
      spacing: tokens.spacing,
    },
  },
};
```

## Configuración de provider

Open-design usa un provider para generar el contenido (LLM). Default: opencode spawn.

```bash
# Configurar provider
pnpm od:provider ollama       # usa ollama local
pnpm od:provider opencode     # usa opencode-ai spawn
```

Container open-design necesita acceso al binario opencode (ya viene en Dockerfile via `npm install -g opencode-ai`).

## Errores comunes

1. ❌ Olvidar `OD_API_TOKEN` → container falla fast con error message.
2. ❌ Usar `localhost` desde container → usar `host.docker.internal`.
3. ❌ Llamar `POST /api/projects` sin Bearer token → 401.
4. ❌ DESIGN.md sin frontmatter → no se puede parsear; `lint` falla.
5. ❌ Tokens con hex (#fff) en lugar de OKLCH → export falla; usar OKLCH.
6. ❌ `npx @google/design.md` sin conexión → instalar offline cache o usar API directa.
7. ❌ Open-design no detecta escuela visual → prompt vago, no incluye keywords.
8. ❌ Design system built-in no encaja con proyecto → crear custom.

## Verificación

```bash
# Open-design health
curl -fsS http://127.0.0.1:7456/api/health

# Skill detection
curl -fsS http://127.0.0.1:7456/api/skills | jq '. | length'
# → 31

# Design system count
curl -fsS http://127.0.0.1:7456/api/design-systems | jq '. | length'

# Listar proyectos
curl -fsS http://127.0.0.1:7456/api/projects -H "Authorization: Bearer ${OD_API_TOKEN}" | jq

# Lint DESIGN.md local
npx @google/design.md lint DESIGN.md

# Export tokens
npx @google/design.md export --format css-tailwind DESIGN.md > /tmp/tokens.css
grep "primary" /tmp/tokens.css  # debe listar --primary
```

## Skills relacionadas

- `containers-architecture` — setup de open-design container
- `iaworkspace-patterns` — overview
- `frontend-design` (anthropics) — diseño sin open-design
- `taste-skill` / `impeccable` — design taste general