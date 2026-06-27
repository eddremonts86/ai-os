---
name: pnpm-docker-deploy
description: Fix crítico para pnpm v11 que bloquea build scripts (ERR_PNPM_IGNORED_BUILDS) en Docker con --frozen-lockfile. Aplica a cualquier proyecto pnpm que use paquetes con native bindings (esbuild, sharp, onnxruntime-node, etc.) y se construya en Docker.
license: Internal
---

# pnpm + Docker Deploy

## El problema

pnpm v11+ bloquea build scripts de dependencias por defecto (security feature). En Docker con `--frozen-lockfile`, los scripts de paquetes nativos como `esbuild`, `sharp`, `onnxruntime-node`, `@parcel/watcher` no corren → binarios nativos faltantes → app falla al iniciar.

## Síntoma

```bash
$ docker build --target prod -t mi-app .
# ... build OK ...
$ docker run mi-app
Error: Cannot find module '/app/node_modules/esbuild/bin/esbuild'
# o
Error: Could not load sharp binding
# o
Error: dlopen(...onnxruntime_node.node...)
```

`pnpm install` en local funciona porque interactivo permite aprobar builds. `--frozen-lockfile` no.

## El fix (4 partes)

### 1. `package.json` — declarar allowed builds

```json
{
  "pnpm": {
    "onlyBuiltDependencies": [
      "@clerk/shared",
      "@parcel/watcher",
      "@percy/core",
      "esbuild",
      "onnxruntime-node",
      "protobufjs",
      "sharp",
      "unrs-resolver"
    ]
  }
}
```

### 2. `.npmrc` — habilitar pre/post scripts

```ini
enable-pre-post-scripts=true
```

Belt-and-suspenders: por si `.npmrc` no se respeta en algún contexto.

### 3. `pnpm-lock.yaml` — lockfile settings mandan

pnpm v11 con `--frozen-lockfile` lee los approvals **del lockfile**, no del `.npmrc`. El lockfile debe contener:

```yaml
settings:
  onlyBuiltDependencies:
    - "@clerk/shared"
    - "@parcel/watcher"
    # ... resto
```

Cómo regenerar el lockfile con estos settings:

```bash
# Local
pnpm install

# Verificar
grep -A 20 "^settings:" pnpm-lock.yaml | grep onlyBuiltDependencies
```

### 4. `Dockerfile` — copiar `.npmrc` al contexto

```dockerfile
FROM node:22-bookworm-slim AS base
WORKDIR /app

# CRÍTICO: copiar .npmrc junto con package.json + lockfile
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install --frozen-lockfile

# ... resto del build
```

## Dockerfile multi-stage pattern (recomendado)

```dockerfile
# ─── BASE: instala deps (incluye devDeps para build) ───
FROM node:22-bookworm-slim AS base
WORKDIR /app
RUN corepack enable
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN pnpm install --frozen-lockfile

# ─── BUILDER: compila la app ───
FROM base AS builder
WORKDIR /app
COPY tsconfig.json ./
COPY src ./src
COPY drizzle ./drizzle
COPY scripts ./scripts
RUN pnpm build

# ─── PROD: solo runtime deps (NO re-install) ───
FROM node:22-bookworm-slim AS prod
WORKDIR /app
RUN corepack enable
COPY package.json pnpm-lock.yaml ./
COPY --from=base /app/node_modules ./node_modules
RUN pnpm prune --prod

COPY --from=builder /app/dist ./dist
COPY drizzle ./drizzle
COPY scripts ./scripts

ENV NODE_ENV=production
EXPOSE 3000
CMD ["node", "dist/server.js"]
```

**Reglas clave:**
- `--from=base /app/node_modules` copia node_modules YA con scripts ejecutados.
- `pnpm prune --prod` remueve devDeps.
- **NO** hacer `pnpm install` en stage prod (re-descarga sin ejecutar scripts).

## packageManager pin

```json
{
  "packageManager": "pnpm@11.1.0"
}
```

Para parity con corepack en server (devs y CI usan la misma versión).

## Listado completo de paquetes que suelen necesitar build

```json
"onlyBuiltDependencies": [
  "@clerk/shared",
  "@parcel/watcher",
  "@percy/core",
  "@tailwindcss/oxide",
  "better-sqlite3",
  "chromadb-default-embed",
  "esbuild",
  "isolated-vm",
  "lmdb",
  "msgpackr-extract",
  "node-rdkafka",
  "onnxruntime-node",
  "playwright",
  "protobufjs",
  "puppeteer",
  "sharp",
  "sqlite3",
  "unrs-resolver"
]
```

Verificar con:
```bash
pnpm install 2>&1 | grep "Ignored build scripts"
# Output ejemplo:
# │ esbuild   OK to build
# │ sharp     OK to build
# Después de aprobar, salen de la lista.
```

## Para aprobar interactivamente (dev local)

```bash
pnpm approve-builds    # abre TTY interactivo
# o
pnpm install           # te pregunta si querés aprobar
```

## Verificación

```bash
# 1. Build local (debe pasar sin errores de missing bindings)
docker build --target prod -t test-app .
docker run --rm test-app node -e "require('sharp')"  # OK si no throw

# 2. Verificar que scripts corrieron
docker run --rm test-app ls node_modules/esbuild/bin/
# Debe listar 'esbuild' (binario nativo)

# 3. Verificar lockfile settings
grep -B 1 -A 15 "^settings:" pnpm-lock.yaml
```

## Errores comunes

1. ❌ Olvidar copiar `.npmrc` al Dockerfile → fall-back a defaults (sin build scripts).
2. ❌ `pnpm install --frozen-lockfile` en stage prod sin haber ejecutado scripts antes → binaries faltantes.
3. ❌ Agregar paquete a `onlyBuiltDependencies` pero NO regenerar lockfile → inconsistente.
4. ❌ Olvidar `enable-pre-post-scripts=true` en `.npmrc` → pre/post install scripts ignorados.
5. ❌ Hacer `pnpm install` (sin `--frozen-lockfile`) en CI/prod → drift entre lockfile y deps instaladas.
6. ❌ No incluir el paquete nuevo en `onlyBuiltDependencies` al añadir dependencia → silent break en build.

## Pre-commit check

```bash
# .husky/pre-commit
! grep -E '"(esbuild|sharp|onnx-runtime-node|@parcel/watcher)"' package.json && \
  ! grep -E '"(esbuild|sharp|onnx-runtime-node|@parcel/watcher)"' pnpm-lock.yaml
# (warning si solo en package.json sin onlyBuiltDependencies)
```

## Referencia

- [pnpm onlyBuiltDependencies](https://pnpm.io/package_json#pnpmonlybuiltdependencies)
- [pnpm settings](https://pnpm.io/settings)
- [pnpm ERR_PNPM_IGNORED_BUILDS](https://github.com/pnpm/pnpm/issues/7254)
- Skill relacionada: `prod-deploy-verification` (check #1 lockfile, #3 Dockerfile)
- Skill relacionada: `tanstack-start-coolify-deploy` (patrón completo)