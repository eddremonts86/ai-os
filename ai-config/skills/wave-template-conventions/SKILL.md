---
name: wave-template-conventions
description: Convenciones oficiales del template Wave (Schilling) — Vite + React 19 + TanStack Router/Query/Table + shadcn/Radix + Tailwind v4 + FormContainer+IData[] + Playwright + MSW + Percy + Sentry. Aplica al trabajar en /Users/edd/Projects/ei-schilling/wave-template/ y forks (kontrakt-manager, ia-royalty-validations, etc.).
license: Internal
---

# Wave Template Conventions

Repo: `/Users/edd/Projects/ei-schilling/wave-template/`. Mantenedor: Schilling. Documentación oficial: `web-docs/` (Docusaurus). Esta skill refleja el código real, no idealizaciones.

## Stack obligatorio

| Capa | Tecnología |
|---|---|
| Build | Vite 5 (NO Webpack/Next.js) |
| Runtime | React 19 |
| Lenguaje | TypeScript strict + `tsconfig.app/node/spec.json` separados |
| Routing | TanStack Router file-based (`@tanstack/router-plugin` genera `routeTree.gen.ts`) |
| Data | TanStack Query (NO SWR, NO Redux Query) |
| Tables | TanStack Table 8.21 + TanStack Virtual 3.13 |
| Forms | **FormContainer + IData[]** (NO react-hook-form directo en features) |
| Validación | Zod + `@hookform/resolvers` (en components/globals/form/validations/) |
| UI kit | shadcn/Radix en `components/ui/` |
| Estilos | Tailwind v4 + SCSS para tokens globales |
| State | Zustand (en `services/store/`) |
| API client | `swagger-typescript-api` 13.2.13 (--axios) |
| i18n | Backend-driven + custom (NO i18next/react-intl) |
| Testing | Playwright 1.55 (E2E + unit + componente, NO jest/vitest) |
| Mocks | MSW (siempre activo en dev vía `VITE_ENABLE_MSW`) + JSON server legacy |
| Visual regressions | Percy |
| Profiling | React Scan |
| Monitoring | Sentry (init con doble guard DSN+production) |
| Package manager | pnpm 9.0.0+ |

## Estructura del proyecto

```
wave-template/
├── appConfig.ts              # config central (NO src/)
├── index.html
├── package.json              # name: "wave-template", version sync
├── pnpm-lock.yaml
├── vite.config.ts            # translationPlugin, webDocsPlugin, cspPlugin, react(), TanStackRouterVite(), tsconfigPaths()
├── tsconfig.{app,node,spec}.json
├── playwright.config.ts      # + playwright.percy.config.ts
├── .cspell.config.yaml
├── .gitattributes            # LF en todo, CRLF solo .bat/.cmd/.ps1
├── src/
│   ├── main.tsx              # StrictMode + Sentry.ErrorBoundary + ThemeProvider + QueryClientProvider + RouterProvider + MSW init
│   ├── routes/               # file-based (TanStack Router)
│   ├── layouts/              # BaseLayout, DefaultLayout, EntitiesLayout, InitLayout, PublicLayout, WizardLayout
│   ├── pages/                # entry pages
│   ├── features/
│   │   ├── globals/          # framework compartido: auth, auth-ws, sideBar, topBar, breadcrumb, search, dynamicFilters, filters, language, theme, common, table, actionBar, documents
│   │   └── products/         # feature CRUD de referencia
│   ├── components/
│   │   ├── ui/               # shadcn/Radix (excluidos del linter)
│   │   ├── globals/          # FormContainer, FormItemContainer, tablas, navegación, html (SafeHtml)
│   │   ├── common/           # ErrorBoundary, utils
│   │   └── containers/       # contenedores de página
│   ├── services/
│   │   ├── api/              # axiosClient, sentryInterceptor, schilling-api/, template-api/
│   │   ├── msw/              # browser.ts, handlers.ts (barrel), handlers/<feature>.handlers.ts, data/, factories/, utils/
│   │   ├── locales/          # i18n (auto-generado), translations/, countryConfigData.ts (SINGLE SOURCE OF TRUTH)
│   │   ├── sentry/           # index.ts (Sentry.init con doble guard)
│   │   ├── providers/        # ThemeProvider, NetworkProvider
│   │   ├── store/            # Zustand
│   │   ├── types/
│   │   ├── hooks/
│   │   ├── utils/            # logger (logInfo/logWarn/logError/logDebug)
│   │   ├── jServer/          # legacy JSON server
│   │   ├── const/, lib/
│   ├── assets/
│   │   ├── icons/
│   │   └── styles/           # config/, globals/ (primitives.scss + tokens-light/dark.scss autogenerados)
│   └── tests/
│       ├── config/           # testConfig.ts + playwrightConstants.ts (SINGLE SOURCE OF TRUTH)
│       ├── e2e/, unit/
│       ├── fixtures/, utils/, types/
├── web-docs/                 # documentación oficial Docusaurus
└── public/
```

## Componentes

**Path alias `@/` → `./src/` (obligatorio para imports absolutos).**

**Tres niveles de componentes:**
1. `src/components/ui/` — primitivos atómicos (shadcn/Radix). Excluidos del linter.
2. `src/components/globals/` — abstracciones framework: `FormContainer`, `FormItemContainer`, tablas (`actions, container, content, filters, structure, tables`), navegación, `SafeHtml`.
3. `src/features/<feature>/components/` — UI específica de dominio.

**Patrón shadcn/Radix:**
- Componentes polimórficos con `Slot` (Radix `asChild`)
- Variantes con `cva` (class-variance-authority)
- `forwardRef` + `ButtonHTMLAttributes`
- Types separados en `Component.types.ts` o `ComponentProps.ts`

**JSX props (reglas eslint react/jsx-*):**
- Una prop por línea cuando hay 3+
- Orden alfabético (callbacks/children al final)
- Cierre alineado con apertura
- Self-closing si no hay children
- 2-space indent
- `className` con una clase por línea cuando hay 3+ (`className-formatting.mdx`)

**Prohibiciones explícitas:**
- ❌ `dangerouslySetInnerHTML` **FUERA de `SafeHtml.tsx`**. ESLint `no-restricted-syntax` lo bloquea con override solo en `SafeHtml`. Todo lo demás pasa por DOMPurIFY.
- ❌ `console.*` en feature code. Usar `logInfo/logWarn/logError/logDebug` de `@/services/utils/logger`.
- ❌ `any` (usar interfaces, discriminated unions, generics).
- ❌ React Hook Form directo en features (siempre `FormContainer + IData[]`).
- ❌ `options` en selects (usar `items`).

## Forms (FormContainer + IData[] — patrón no negociable)

```tsx
// src/features/products/const/products.const.ts
import type { IData } from '@/components/globals/form/types';

export const PRODUCT_FORM_DATA: IData[] = [
  {
    type: InputsTypes.text,
    name: 'name',
    label: 'Product Name',
    required: true,
    placeholder: 'Enter name',
  },
  {
    type: InputsTypes.select,
    name: 'category',
    label: 'Category',
    items: CATEGORY_OPTIONS,  // SIEMPRE 'items', nunca 'options'
    required: true,
  },
  {
    type: InputsTypes.dateRange,
    name: 'availability',
    label: 'Available',
  },
];

// src/features/products/hooks/useProducts.tsx
export function useProducts() {
  const { form, handleSubmit, isDirty } = useForms({
    defaultValues: getDefaultValues(PRODUCT_FORM_DATA),
    schema: productsSchema,  // Zod
  });
  
  const { data, isLoading } = useQuery({ queryKey: ['products'], queryFn: api.products.getAll });
  const updateMutation = useUpdateProduct();
  
  return { form, handleSubmit, isLoading, products: data, update: updateMutation };
}

// src/features/products/view/Products.tsx
export function ProductsView() {
  const { form, handleSubmit, products, isLoading } = useProducts();
  return (
    <FormContainer data={PRODUCT_FORM_DATA} form={form} onSubmit={handleSubmit}>
      {/* renderizado automático por FormContainer */}
    </FormContainer>
  );
}
```

**`InputsTypes` enum (whitelist completa):**
- Básicos: `text, number, password, email, checkbox, radio, select, textarea, date, dateRange, toggle, label, separator, file, combobox`
- Específicos: `roleManager, contactMethodTable, selectPlusImage`
- Compuestos: `checkboxPlusDate, checkboxPlusSelect, dateSelect, radioGroup`

**Hooks de form:**
- `useForms` — estado + deepEqual change detection
- `useInputsFields` — mapea `IData[]` → componentes
- `useTrackUnsavedChanges` — beforeunload guard
- `useDisableSaveButton`

**Estructura de feature:**
```
feature/
├── const/feature.const.ts          # IData[] array
├── hooks/useFeature.tsx            # useForms + useQueryMutationsInterface
├── types/feature.types.ts
├── view/Feature.tsx                # FormContainer
└── index.ts
```

**Convenciones:**
- `data-test-id="input-<name>"` en inputs.
- `FormItemContainer` = label + required indicator (*) + description + error message.
- Validaciones Zod centralizadas en `components/globals/form/validations/`.

## API / Swagger

**Generación de tipos desde OpenAPI:**

```bash
pnpm run generate:types         # master
pnpm run generate:types:test    # test env
pnpm run generate:types:demo    # demo
pnpm run generate:types:dynamic # dynamic
pnpm run generate:mocks         # Faker para MSW
```

**Cliente en `src/services/api/clients/schilling-api/Api.ts`** (generado, NO editar, excluido de ESLint + prettier).

**Axios instances separadas:**
- `axiosClient` — producción, con Sentry interceptor
- `axiosClientTest` — test env
- `axiosClientFakeApi` — json-server mock (NO instrumentado con Sentry)

**Auth headers per-request vía interceptor:**
- `X-Schilling-Token`
- `X-Schilling-language`
- **NO** en module load (evitar token stale)

**Headers default:**
```
Content-Type: application/json; charset=utf-8
Accept: application/json;enums=expand
```

**MSW handlers** en `src/services/msw/handlers/<feature>.handlers.ts`, auto-registrados en `handlers.ts` barrel. MSW siempre activo en dev (`VITE_ENABLE_MSW=true`).

**URLs en `appConfig.ts`:** `API_URL`, `API_URL_FAKE_API`, `API_URL_TEST`, `BASE_URL`, `APP_URL`, `SCHILLING_APP_REDIRECT_EXTERNAL/INTERNAL`.

## Estilos (Tailwind v4 + SCSS tokens)

**Tailwind v4** (4.2.4) + PostCSS + `@tailwindcss/postcss`. `darkMode: ['class']`.

**SCSS globals en `src/assets/styles/`:**
- `globals.scss` genera CSS vars en `:root` desde `tokens.json` (Figma tokens via `scripts/extract-figma-tokens.js`)
- `primitives.scss` + `tokens-light.scss` + `tokens-dark.scss` (auto-generados, en `.prettierignore`)
- Scripts: `tokens:extract`, `tokens:generate`, `tokens:sync`

**Naming convention (Tailwind theme):**
El nombre de clase ES el nombre de la variable:
- `bg-surface-background-page` → `var(--surface-background-page)`
- `text-text-high` → `var(--text-high)`
- `border-border-*` → `var(--border-*)`
- `text-h1`, `text-h2`, etc.

**Namespaces de color:** `surface, text, border, icon, status, brand, aux, chart`.

**Spacing tokens:** `button, search-input, field-horizontal-gap, field-vertical-gap, page-padding` (`h-button, w-button, gap-field-horizontal`).

**Width tokens:** `field-label, field-f1..f6` (`max-w-field-f3 = max-w-[var(--field-width-f3)]`).

**Border radius:** derivado de `--radius` (xl/lg/md/sm).

**Plugins:** `tailwindcss-animate` + `@tailwindcss/typography` + `.scrollbar-hide`.

**Class composition:** `clsx` + `tailwind-merge` (`twMerge`).

**Prettier:** `prettier-plugin-tailwindcss` ordena clases automáticamente.

**Dark mode:** vía class `.dark` sobre `:root` (`next-themes` + ThemeProvider custom).

## Tablas (TanStack Table 8.21 + Virtual)

**Estructura en `src/components/globals/table/`:**
```
components/
├── actions/        # row actions, bulk actions
├── container/      # wrapper
├── content/        # cells, rows
├── filters/        # column filters
├── loading/        # skeletons
├── structure/      # header, footer
└── tables/         # specific table compositions
```

**Hooks:**
- `useTable` — encapsula `useReactTable` con state completo
- `useHierarchicalTable` — tablas jerárquicas genéricas (`IHierarchicalItem` requiere solo `Id: string`)

**State gestionado:** `rowSelection, sorting, expanded, columnFilters, columnVisibility, pagination`.

**`TUHeader` interface:**
```ts
interface TUHeader {
  id: string;
  name: string;
  accessorKey: string;
  type: TUColumnTypes;
  size?: number;
  enableSorting?: boolean;
  enableColumnFilter?: boolean;
  meta?: Record<string, unknown>;
}
```

**`TUColumnTypes`:** `default, date, link, externalLink, badge, select, expander, actions, sortable`.

**Field mapping builder:** `builder.sortable/text/date/etc.`.

**Grouping config:** `groupingConfig.primaryField` + `defaultExpanded`.

**Virtualización:** `TanStack Virtual` 3.13 + `react-window` 2.2 para datasets grandes.

**Exportaciones agrupadas** en `components/globals/table/index.ts`.

## Testing (Playwright 1.55 — único framework)

**`playwright.config.ts`:**
- `testDir: ./src/tests`, `testMatch: **/*.spec.ts`
- `fullyParallel: true`
- `workers: 12 local / 4 CI`
- `retries` per-project
- `reporter: list + html + json + junit`

**Proyectos:**
- `MSW-Chrome` — retries 2, `--disable-web-security`
- `API-Chrome` — retries 3
- `Safari` — WebKit
- `MCP Chrome` — solo si `USE_MCP=true`

**`src/tests/config/playwrightConstants.ts`** — SINGLE SOURCE OF TRUTH para timeouts/URLs.

**WebServer condicional:** `dev:msw` si `USE_MSW`, `dev` normal si `USE_API`, `undefined` si no.

**Trace/screenshot/video:**
- `trace: on-first-retry`
- `screenshot: only-on-failure`
- `video: retain-on-failure`
- `ignoreHTTPSErrors: true`
- `locale: en-US`
- `storageState: undefined` (sin estado compartido)

**Scripts:**
```bash
pnpm test              # pnpm run test:app (all)
pnpm test:ui           # UI mode
pnpm test:fast         # Chrome
pnpm test:parallel     # 8 workers
pnpm test:unit         # src/tests/unit
pnpm test:e2e          # src/tests/e2e
pnpm test:app:msw      # MSW mode
pnpm test:app:api      # API mode
pnpm test:ci           # sharded
pnpm test:mcp          # Playwright MCP
pnpm test:percy        # Percy con playwright.percy.config.ts
```

**Patrón de test:**
```ts
import { test, expect } from '@playwright/test';

test('user can create product', async ({ page }) => {
  await page.goto('/products');
  await page.getByTestId('input-name').fill('New Product');
  await page.getByTestId('input-category').click();
  await page.getByRole('option', { name: 'Electronics' }).click();
  await page.getByRole('button', { name: 'Save' }).click();
  await expect(page).toHaveURL(/\/products\/[a-f0-9-]+/);
});
```

## Setup local

```bash
# Requisitos
node >= 22.x
pnpm >= 9.0.0
git

# Setup
pnpm install                       # postinstall: .vscode/post-install.cjs
pnpm dev                           # vite --port 3000 (predev: regenera SCSS desde tokens)
pnpm dev:msw                       # cross-env VITE_ENABLE_MSW=true vite --port 3000
pnpm dev:sentry                    # vite --port 3000 --mode production
pnpm dev:share                     # ngrok http 3000

# Build
pnpm build                         # tsc -b && vite build (prebuild: SCSS tokens + translations)
pnpm preview

# Quality gate
pnpm run check:isReady             # lint + format + tests + build + clean

# Lint/format
pnpm run lint                      # prettier -w + eslint --fix
pnpm run check:format
pnpm run check:spell               # cspell

# i18n
pnpm run translate:auto / translate:da / translate:en / translate:no / translate:sv
pnpm run translate:analyze
pnpm run translate:scan-hardcoded
pnpm run translate:fix-hardcoded

# Scaffolding
pnpm run create:home-overview <name> <Icon>    # scaffoldea feature copiando products/

# Legacy
pnpm run fake:api                  # json-server en :3001
pnpm run sync:report               # drift report vs wave1
```

**Variables VITE_ (en `.env`):**

| Variable | Default | Notas |
|---|---|---|
| `VITE_BASE_PATH` | `/schweb` | base path configurable |
| `VITE_APP_URL` | `http://localhost:3000` | |
| `VITE_API_URL` | | prod API |
| `VITE_API_SERVER` | | tunnel mode si vacío |
| `VITE_API_SERVER_TEST` | | test env |
| `VITE_API_SERVER_FAKE_API` | | legacy json-server |
| `VITE_CONFIG_THEME` | `system` | `light/dark/system` |
| `VITE_CONFIG_DEF_COMPANY` | `4` | |
| `VITE_CONFIG_DEF_LANGUAGE` | `en` | |
| `VITE_CONFIG_MODE` | `development` | gate Sentry |
| `VITE_SENTRY_DSN` | | solo producción |
| `VITE_SCHILLING_APP_REDIRECT_EXTERNAL` | | |
| `VITE_SCHILLING_APP_REDIRECT_INTERNAL` | | |
| `VITE_FEATURE_NEW_ACTION_BAR` | | feature flag |
| `VITE_ENABLE_MSW` | | toggle MSW |

**Tunnel mode:** si `VITE_API_SERVER` vacío, vite proxy `/ws` → `VITE_API_SERVER_TEST` (bypass CORS para ngrok).

**Vite config:**
- `publicDir: public`, `assetsDir build: schweb-assets`, `chunkSizeWarningLimit: 800`
- Manual chunks: `pdf-libs, charts, icons, markdown, dompurify, sentry, react-vendor, router-libs, tanstack-query/table, radix, forms, i18n, date, lodash, axios`
- Build target: `['es2020', 'safari15']`

## Naming conventions

**Archivos:**

| Tipo | Convención | Ejemplo |
|---|---|---|
| Componente | PascalCase.tsx | `Button.tsx`, `FormContainer.tsx` |
| Tipos separados | Component.types.ts | `Button.types.ts` |
| Hooks | useCamelCase.tsx | `useForms.tsx`, `useTable.ts` |
| Utils | camelCase.ts | `getCountryConfig.ts` |
| Constantes/datos | camelCase.const.ts | `countryConfigData.ts`, `sideBarItems.tsx` |
| Tests | *.spec.ts | `product.spec.ts` |
| Auto-generados (NO editar) | | `routeTree.gen.ts`, `Api.ts`, `swagger.json`, `translation.ts`, `i18n.ts`, `primitives.scss`, `tokens-*.scss` |

Magic prefixes: `use*` (hooks), `get*` (selectores).

**Variables:**

| Tipo | Convención | Ejemplo |
|---|---|---|
| Variables/funciones | camelCase | `userName`, `handleSubmit` |
| Constantes module-level | UPPER_SNAKE_CASE | `MAX_PAGE_SIZE` |
| Types/interfaces/enums | PascalCase | `User`, `FormState` |
| Interfaces | I prefix | `IData`, `IHierarchicalItem`, `IGroupingConfig` |
| Generics | T prefix | `TFieldValues`, `TData` |
| Props interface | ComponentNameProps o en Component.types.ts | `ButtonProps` |
| Booleanas | is/has/can/should prefix | `isLoading`, `hasAnyChange`, `canSubmit`, `isDirty` |

**Props destructuring con type readonly:**
```ts
function FormContainer({ ... }: Readonly<FormContainerProps>) { ... }
```

**Exports:**

- **Named exports preferidos** (`export const Button`, `export function useTable`).
- `index.ts` barrels por carpeta.
- **Default export** solo en entry points de páginas.
- `export type { ... }` cuando aplica.
- Wildcard imports deshabilitados (eslint `no-duplicate-imports`).
- Imports ordenados vía `@ianvs/prettier-plugin-sort-imports`:
  ```
  react, next, third-party, blank,
  @/types, @/services/types, @/config, @/lib, @/hooks,
  @/components/ui, @/components, @/registry, @/styles, @/app, blank,
  relativos
  ```

## Git workflow

**Husky 9 hooks en `.husky/`:** `commit-msg, pre-commit, pre-push, prepare-commit-msg`.
**Actualmente desactivados** (exit 0) — comentario: "Wave Starter: ticket enforcement removed (standalone product)".

**Commitlint:** `@commitlint/config-conventional` (Conventional Commits).

**lint-staged en package.json:**
- `prettier --write` en todo
- `cspell` + `eslint --fix --report-unused-disable-directives --max-warnings 5` en `*.ts/tsx/jsx`

**Branch naming:** `SCH-<ticket>-<description>` (legacy), o `feature/<name>` para standalone.

**PR template:** no documentado en repo (no existe `.github/PULL_REQUEST_TEMPLATE.md`).

**CI:** solo `security.yml` en `.github/workflows/`. `bitbucket-pipelines.yml` legacy presente pero no usado en standalone.

**AI agent workflow:** documentado en `.github/AI_AGENT_WORKFLOW.md` y `PLAYWRIGHT-AGENTS.md`. Wave skills locales en `.agents/skills/wave/` (form-building, tables, forms, API, permissions, translations, UI, testing, wizard, state).

## Auto-generados (NO editar)

`routeTree.gen.ts`, `Api.ts`, `swagger.json`, `translation.ts`, `ITranslation.ts`, `i18n.ts`, `primitives.scss`, `tokens-light/dark.scss`.

## Referencias clave

- `web-docs/01-getting-started/` — setup, project overview
- `web-docs/02-tools-and-config/` — vite, ts, eslint, prettier, husky, folder-structure
- `web-docs/03-libraries/` — guías por librería
- `web-docs/04-ui-components/` — patrones de componentes
- `web-docs/05-features/` — features cross-cutting (i18n, theme, indexed-db, figma)
- `web-docs/06-best-practices/` — naming, estructura, className, jsx
- `web-docs/07-architecture/` — decisions (react-query, playwright parallel, form-pattern)
- `web-docs/08-testing/` — testing completo
- `web-docs/09-troubleshooting/` — blank-page, etc.