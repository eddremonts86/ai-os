---
name: open-design-integration
description: Integration with open-design daemon (127.0.0.1:7456) for DESIGN.md + design tokens + 5 visual schools + ProblemHunt flow. Applies when working with auto-generated design systems, design audits, or the Scraper→SPEC.md→DESIGN.md→PLAN.md→TASKS.md flow.
license: Internal
---

# Open-Design Integration

Open-design is a local daemon (Next.js + REST API) that helps generate consistent design systems for projects. It runs at `127.0.0.1:7456` by default and exposes a REST API to create projects with predefined skills + design systems.

## Setup

```bash
# Start container (part of root docker-compose)
docker compose up -d open-design

# Verify
curl http://127.0.0.1:7456/api/health
# {"status":"ok"}

# Web UI
open http://127.0.0.1:7456
```

## Required environment variables

```bash
# .env
OD_PORT=7456
OD_API_TOKEN=***   # openssl rand -hex 32
OD_BIND_HOST=0.0.0.0
```

The container fails fast if `OD_API_TOKEN` is missing:
```
ERROR: OD_API_TOKEN required
```

## REST API

Base: `http://host.docker.internal:7456` (from containers) or `http://127.0.0.1:7456` (from host).

**Auth:** header `Authorization: Bearer *** on all requests except `/api/health`.

### Endpoints

```bash
# Health (no auth)
GET /api/health
# → {"status":"ok"}

# List skills (31 built-in)
GET /api/skills
# → [{id: "design-md", name: "Design.md Generator", ...}, ...]

# Specific skill
GET /api/skills/design-md
# → {id, name, description, params_schema, ...}

# List built-in design systems
GET /api/design-systems
# → [{id: "vercel", name: "Vercel Design System", ...}, {id: "airbnb", ...}, ...]

# Specific design system
GET /api/design-systems/vercel
# → {id, name, colors, typography, components, ...}

# List existing projects
GET /api/projects
# → [{uuid, name, skillId, designSystemId, createdAt, ...}]

# Create project
POST /api/projects
Content-Type: application/json
Authorization: Bearer ***

{
  "name": "My SaaS",
  "skillId": "design-md",
  "designSystemId": "vercel",
  "params": {
    "description": "Dashboard for project management",
    "audience": "developers and PMs"
  }
}
# → {uuid, name, ...}
# Generates: docs/projects/my-saas/DESIGN.md, tokens.css, plan suggestions

# Provider health
GET /api/providers
# → [{id: "ollama", status: "ok"}, {id: "opencode", status: "ok"}, ...]
```

## Built-in skills (31)

| ID | Name | Use |
|---|---|---|
| `design-md` | Design.md Generator | Generates DESIGN.md from prompt + design system |
| `brand-guidelines` | Brand Guidelines | Generates brand book (logo usage, colors, typography, voice) |
| `web-prototype` | Web Prototype | Navigable HTML/CSS/JS prototype |
| `dashboard` | Dashboard Layout | Admin dashboard with sidebar + charts + tables |
| `landing-page` | Landing Page | Marketing site with hero + features + CTA |
| `e-commerce` | E-commerce | Product grid + cart + checkout flow |
| `blog` | Blog Layout | Article list + single post + sidebar |
| `docs-site` | Documentation | Docs site with sidebar nav + search + TOC |
| `mobile-app` | Mobile App | iOS/Android mockup with safe areas |
| `email-template` | Email Template | Responsive HTML email |
| ... | ... | (21 more) |

## Built-in design systems

| ID | Type | Personality |
|---|---|---|
| `vercel` | Modern minimal | Clean SaaS, monochrome + accent |
| `linear` | Tech utility | Dense dashboard, dark mode |
| `airbnb` | Editorial warm | Consumer warm, hospitality |
| `stripe` | Editorial modern | Fintech, gradient accents |
| `github` | Tech utility | Dev tool, sparse + functional |
| `notion` | Modern minimal | Productivity, soft + friendly |
| `figma` | Design tool | White-label, customizable |

## 5 visual schools (auto-detection)

Open-design detects the appropriate visual school based on project keywords:

### 1. editorial-monocle
**Keywords:** editorial, magazine, premium, luxury, lifestyle, fashion, art
**Characteristics:**
- Serif display (Pangram, Klim, ABC Dinamo)
- Generous whitespace
- Editorial photography
- Subtle, restrained accent

### 2. modern-minimal
**Keywords:** SaaS, productivity, B2B, platform, tool, dashboard, clean
**Characteristics:**
- Clean sans-serif (Inter, Geist, Satoshi)
- Minimal color palette (5-7 colors)
- Grid-based layouts
- Subtle shadows + borders

### 3. warm-soft
**Keywords:** consumer, friendly, social, community, wellness, kids, family
**Characteristics:**
- Rounded corners (16-24px)
- Warm tones (peach, cream, terracotta)
- Friendly typefaces (Recoleta, Fraunces, ABC Diatype)
- Soft shadows + gradients

### 4. tech-utility
**Keywords:** dashboard, dev tool, analytics, monitoring, infra, platform
**Characteristics:**
- Mono accents (JetBrains Mono, Berkeley Mono)
- Dense data display
- Functional layouts
- High information density

### 5. brutalist-experimental
**Keywords:** experimental, art, design, portfolio, agency, creative, bold
**Characteristics:**
- Unconventional layouts
- Heavy type weights
- High contrast (black/white + 1 accent)
- Asymmetric grids

## ProblemHunt flow

To generate complete projects from scraped problems:

```
Scraper (problemhunt-scraper.cjs)
   ↓
SPEC.md (problem + solution + metrics)
   ↓
DESIGN.md (generated by open-design /api/projects with skillId=design-md)
   ↓
PLAN.md (phases + milestones + dependencies)
   ↓
TASKS.md (atomic tasks with estimates)
```

### End-to-end example

```bash
# 1. Project spec
cat > /tmp/project-spec.md <<EOF
# ProblemHunt #400
Moving with furniture is a weeks-long headache...

## Target users
Renters moving between cities

## Core feature
Real-time booking with verified movers
EOF

# 2. Create project in open-design
PROJECT_UUID=$(curl -X POST http://127.0.0.1:7456/api/projects \
  -H "Authorization: Bearer *** \
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

# 3. Wait for generation (async, ~30s)
sleep 30

# 4. Get DESIGN.md
curl "http://127.0.0.1:7456/api/projects/${PROJECT_UUID}/design" \
  -H "Authorization: Bearer *** \
  | jq -r '.design_md' > DESIGN.md

# 5. Generate CSS tokens
npx @google/design.md export --format css-tailwind DESIGN.md > tokens.css

# 6. Generate tasks
curl "http://127.0.0.1:7456/api/projects/${PROJECT_UUID}/tasks" \
  -H "Authorization: Bearer *** \
  | jq -r '.tasks_md' > TASKS.md
```

## DESIGN.md — Google Labs format

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

Official CLI to work with DESIGN.md:

```bash
# Lint (validate against schema)
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

## Integration with Tailwind

```js
// tailwind.config.js (generated)
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

## Provider configuration

Open-design uses a provider to generate content (LLM). Default: opencode spawn.

```bash
# Configure provider
pnpm od:provider ollama       # uses local ollama
pnpm od:provider opencode     # uses opencode-ai spawn
```

The open-design container needs access to the opencode binary (already included in Dockerfile via `npm install -g opencode-ai`).

## Common errors

1. ❌ Forgetting `OD_API_TOKEN` → container fails fast with error message.
2. ❌ Using `localhost` from container → use `host.docker.internal`.
3. ❌ Calling `POST /api/projects` without Bearer token → 401.
4. ❌ DESIGN.md without frontmatter → cannot parse; `lint` fails.
5. ❌ Tokens with hex (#fff) instead of OKLCH → export fails; use OKLCH.
6. ❌ `npx @google/design.md` without connection → install offline cache or use API directly.
7. ❌ Open-design does not detect visual school → vague prompt, no keywords included.
8. ❌ Built-in design system doesn't fit project → create custom.

## Verification

```bash
# Open-design health
curl -fsS http://127.0.0.1:7456/api/health

# Skill detection
curl -fsS http://127.0.0.1:7456/api/skills | jq '. | length'
# → 31

# Design system count
curl -fsS http://127.0.0.1:7456/api/design-systems | jq '. | length'

# List projects
curl -fsS http://127.0.0.1:7456/api/projects -H "Authorization: Bearer *** | jq

# Lint DESIGN.md locally
npx @google/design.md lint DESIGN.md

# Export tokens
npx @google/design.md export --format css-tailwind DESIGN.md > /tmp/tokens.css
grep "primary" /tmp/tokens.css  # should list --primary
```

## Related skills

- `containers-architecture` — open-design container setup
- `iaworkspace-patterns` — overview
- `frontend-design` (anthropics) — design without open-design
- `taste-skill` / `impeccable` — general design taste