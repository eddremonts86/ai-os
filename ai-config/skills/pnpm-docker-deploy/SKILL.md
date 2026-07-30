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

## Gotcha: scraper / worker Dockerfiles need `--prod=false` (the opposite of the prod stage)

A scraper or worker container runs scripts that import devDependencies:
`dotenv`, `@playwright/test`, `eslint`, `tsx`, code generators, etc.
**The prod stage** of a multi-stage Dockerfile does `pnpm prune --prod`
to strip devDeps and shrink the image — but the scraper can't function
with only runtime deps, so the first run dies with:

```
Error: Cannot find package 'dotenv'
Error: Cannot find module '@playwright/test'
```

The fix is to **make the scraper its own stage** with `--prod=false`
explicitly:

```dockerfile
# ─── Scraper stage (separate from web app) ────────────────────────────────
FROM node:22-bookworm-slim AS scraper

WORKDIR /app
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml .npmrc ./
RUN pnpm install --frozen-lockfile --prod=false   # ← keep devDeps!

COPY tsconfig.json ./
COPY src/shared/lib ./src/shared/lib
COPY scripts/scraping ./scripts/scraping

CMD ["tsx", "scripts/scraping/runner.ts", "--source", "all"]
```

The web app's `prod` stage keeps `pnpm prune --prod`; the scraper stage
uses `--prod=false`. Same image, different stages, different dep sets.

If the scraper is in its own repo with its own `Dockerfile.scraper`,
just use:

```dockerfile
RUN pnpm install --frozen-lockfile --ignore-scripts --prod=false
```

`--ignore-scripts` is safe for scrapers too as long as Playwright
browsers come from the base image (`mcr.microsoft.com/playwright:*`)
rather than from a postinstall hook.

## Gotcha: `CI=true` is required to avoid `ERR_PNPM_ABORTED_REMOVE_MODULES_DIR_NO_TTY`

pnpm v10+ refuses to delete/replace `node_modules` non-interactively in
some flows (notably when the deps graph changes and pnpm wants to purge
the old `node_modules` and re-install). In a Docker layer cache miss
(e.g. when you bump a transitive dep), this fails the build with:

```
ERR_PNPM_ABORTED_REMOVE_MODULES_DIR_NO_TTY  Could not remove node_modules
directory automatically (no TTY). Run pnpm with --force or set CI=true.
```

Add `CI=true` to the `FROM base` stage so it propagates to every
subsequent stage:

```dockerfile
FROM node:22-bookworm-slim AS base
ENV CI=true                                # ← pnpm can purge non-interactively
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
```

This is the standard fix; it's also the reason GitHub Actions works
out of the box (Actions sets `CI=true` by default) but a plain
`docker build` on a developer laptop does not.

## Common errors

1. ❌ Forgetting to copy `.npmrc` to the Dockerfile → falls back to defaults (no build scripts).
2. ❌ `pnpm install --frozen-lockfile` in the prod stage without having executed scripts earlier → missing binaries.
3. ❌ Adding a package to `onlyBuiltDependencies` but NOT regenerating the lockfile → inconsistent.
4. ❌ Forgetting `enable-pre-post-scripts=true` in `.npmrc` → pre/post install scripts ignored.
5. ❌ Running `pnpm install` (without `--frozen-lockfile`) in CI/prod → drift between lockfile and installed deps.
6. ❌ Not including the new package in `onlyBuiltDependencies` when adding a dependency → silent break in build.
7. ❌ Building a scraper / worker image with the same `pnpm prune --prod` step as the web app → missing `dotenv`, `@playwright/test`, etc. → "Cannot find package" at first run. Use `--prod=false` in the scraper stage instead.
8. ❌ Building a Docker image with a `node_modules` cache miss and no `CI=true` set → `ERR_PNPM_ABORTED_REMOVE_MODULES_DIR_NO_TTY`. Add `ENV CI=true` to the base stage.

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