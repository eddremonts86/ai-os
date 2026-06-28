---
name: pnpm-docker-deploy
description: Critical fix for pnpm v11 that blocks build scripts (ERR_PNPM_IGNORED_BUILDS) in Docker with --frozen-lockfile. Applies to any pnpm project that uses packages with native bindings (esbuild, sharp, onnxruntime-node, etc.) and builds in Docker.
license: Internal
---

# pnpm + Docker Deploy

## The problem

pnpm v11+ blocks dependency build scripts by default (security feature). In Docker with `--frozen-lockfile`, scripts of native packages such as `esbuild`, `sharp`, `onnxruntime-node`, `@parcel/watcher` do not run → missing native binaries → app fails to start.

## Symptom

```bash
$ docker build --target prod -t my-app .
# ... build OK ...
$ docker run my-app
Error: Cannot find module '/app/node_modules/esbuild/bin/esbuild'
# or
Error: Could not load sharp binding
# or
Error: dlopen(...onnxruntime_node.node...)
```

`pnpm install` locally works because interactive mode lets you approve builds. `--frozen-lockfile` does not.

## The fix (4 parts)

### 1. `package.json` — declare allowed builds

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

### 2. `.npmrc` — enable pre/post scripts

```ini
enable-pre-post-scripts=true
```

Belt-and-suspenders: in case `.npmrc` is not respected in some context.

### 3. `pnpm-lock.yaml` — lockfile settings win

pnpm v11 with `--frozen-lockfile` reads the approvals **from the lockfile**, not from `.npmrc`. The lockfile must contain:

```yaml
settings:
  onlyBuiltDependencies:
    - "@clerk/shared"
    - "@parcel/watcher"
    # ... rest
```

How to regenerate the lockfile with these settings:

```bash
# Local
pnpm install

# Verify
grep -A 20 "^settings:" pnpm-lock.yaml | grep onlyBuiltDependencies
```

### 4. `Dockerfile` — copy `.npmrc` into the context

```dockerfile
FROM node:22-bookworm-slim AS base
WORKDIR /app

# CRITICAL: copy .npmrc along with package.json + lockfile
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN corepack enable && corepack prepare pnpm@latest --activate
RUN pnpm install --frozen-lockfile

# ... rest of the build
```

## Multi-stage Dockerfile pattern (recommended)

```dockerfile
# ─── BASE: install deps (includes devDeps for build) ───
FROM node:22-bookworm-slim AS base
WORKDIR /app
RUN corepack enable
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN pnpm install --frozen-lockfile

# ─── BUILDER: compile the app ───
FROM base AS builder
WORKDIR /app
COPY tsconfig.json ./
COPY src ./src
COPY drizzle ./drizzle
COPY scripts ./scripts
RUN pnpm build

# ─── PROD: runtime deps only (NO re-install) ───
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

**Key rules:**
- `--from=base /app/node_modules` copies node_modules WITH scripts already executed.
- `pnpm prune --prod` removes devDeps.
- **DO NOT** run `pnpm install` in the prod stage (re-downloads without executing scripts).

## packageManager pin

```json
{
  "packageManager": "pnpm@11.1.0"
}
```

For parity with corepack on the server (devs and CI use the same version).

## Full list of packages that usually need build

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

Verify with:
```bash
pnpm install 2>&1 | grep "Ignored build scripts"
# Example output:
# │ esbuild   OK to build
# │ sharp     OK to build
# After approval, they leave the list.
```

## To approve interactively (local dev)

```bash
pnpm approve-builds    # opens interactive TTY
# or
pnpm install           # asks if you want to approve
```

## Verification

```bash
# 1. Local build (must pass without missing binding errors)
docker build --target prod -t test-app .
docker run --rm test-app node -e "require('sharp')"  # OK if it does not throw

# 2. Verify that scripts ran
docker run --rm test-app ls node_modules/esbuild/bin/
# Must list 'esbuild' (native binary)

# 3. Verify lockfile settings
grep -B 1 -A 15 "^settings:" pnpm-lock.yaml
```

## Common errors

1. ❌ Forgetting to copy `.npmrc` to the Dockerfile → falls back to defaults (no build scripts).
2. ❌ `pnpm install --frozen-lockfile` in the prod stage without having executed scripts earlier → missing binaries.
3. ❌ Adding a package to `onlyBuiltDependencies` but NOT regenerating the lockfile → inconsistent.
4. ❌ Forgetting `enable-pre-post-scripts=true` in `.npmrc` → pre/post install scripts ignored.
5. ❌ Running `pnpm install` (without `--frozen-lockfile`) in CI/prod → drift between lockfile and installed deps.
6. ❌ Not including the new package in `onlyBuiltDependencies` when adding a dependency → silent break in build.

## Pre-commit check

```bash
# .husky/pre-commit
! grep -E '"(esbuild|sharp|onnx-runtime-node|@parcel/watcher)"' package.json && \
  ! grep -E '"(esbuild|sharp|onnx-runtime-node|@parcel/watcher)"' pnpm-lock.yaml
# (warning if only in package.json without onlyBuiltDependencies)
```

## Reference

- [pnpm onlyBuiltDependencies](https://pnpm.io/package_json#pnpmonlybuiltdependencies)
- [pnpm settings](https://pnpm.io/settings)
- [pnpm ERR_PNPM_IGNORED_BUILDS](https://github.com/pnpm/pnpm/issues/7254)
- Related skill: `prod-deploy-verification` (check #1 lockfile, #3 Dockerfile)
- Related skill: `tanstack-start-coolify-deploy` (full pattern)