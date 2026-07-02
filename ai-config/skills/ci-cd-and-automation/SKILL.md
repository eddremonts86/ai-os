---
name: ci-cd-and-automation
description: CI/CD pipeline with non-skippable quality gates (lint→type→unit→build→integration→e2e→security→bundle), per-PR preview deployments, feature flags, staged rollouts. Applies to any project with GitHub Actions and a need for safe deploys.
license: Internal
---

# CI/CD & Automation

## Philosophy

- **Non-skippable quality gate** — all checks must pass before merging to `main`.
- **Faster is Safer** — pipelines < 10 min, small batches, frequent releases.
- **Shift Left** — security, performance, accessibility from PR time, not post-merge.
- **Failures feed back to the agent** — error → fix → re-push, not "rebuild without thinking".

## Pipeline (8 stages)

```
PR opened/updated
   ↓
[1] Lint (eslint, prettier, cspell)
   ↓ pass
[2] Typecheck (tsc --noEmit)
   ↓ pass
[3] Unit tests (vitest, jest)
   ↓ pass
[4] Build (vite build, next build)
   ↓ pass
[5] Integration tests (with DB service)
   ↓ pass
[6] E2E tests (playwright)
   ↓ pass
[7] Security audit (pnpm audit, gitleaks, codeql)
   ↓ pass
[8] Bundle size check (size-limit, bundlesize)
   ↓ pass
   ↓
Merge allowed → Auto-deploy preview
   ↓
Merge to main → Auto-deploy staging
   ↓
Manual approval → Deploy prod (canary → full)
```

## Canonical GitHub Actions workflow

```yaml
# .github/workflows/ci.yml
name: CI

on:
  pull_request:
    branches: [main]
  push:
    branches: [main]

concurrency:
  group: ${{ github.workflow }}-${{ github.ref }}
  cancel-in-progress: true

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm lint
      - run: pnpm format:check

  typecheck:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm typecheck

  unit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm test -- --coverage
      - uses: actions/upload-artifact@v4
        with:
          name: coverage
          path: coverage/

  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm build
      - uses: actions/upload-artifact@v4
        with:
          name: dist
          path: dist/

  integration:
    runs-on: ubuntu-latest
    services:
      postgres:
        image: postgres:16-alpine
        env:
          POSTGRES_PASSWORD: postgres
        ports:
          - 5432:5432
        options: >-
          --health-cmd pg_isready
          --health-interval 10s
          --health-timeout 5s
          --health-retries 5
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm db:migrate
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/test
      - run: pnpm test:integration
        env:
          DATABASE_URL: postgresql://postgres:postgres@localhost:5432/test

  e2e:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm exec playwright install --with-deps chromium
      - run: pnpm build
      - run: pnpm test:e2e

  security:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm audit --prod --audit-level=high
      - uses: github/codeql-action/analyze@v3
        with:
          languages: typescript
      - name: Gitleaks
        uses: gitleaks/gitleaks-action@v2
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

  bundle-size:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm build
      - run: pnpm size-limit

  # Optional: preview deploy per PR
  preview-deploy:
    if: github.event_name == 'pull_request'
    needs: [lint, typecheck, unit, build, integration, e2e, security, bundle-size]
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm build
      - name: Deploy preview
        run: vercel deploy --token=${{ secrets.VERCEL_TOKEN }}
      - name: Comment PR
        uses: marocchino/sticky-pull-request-comment@v2
        with:
          message: |
            🚀 Preview deployed: ${{ steps.deploy.outputs.url }}
```

## Cache optimization

```yaml
- uses: actions/setup-node@v4
  with:
    node-version: '22'
    cache: 'pnpm'  # automatic if pnpm-lock.yaml is present

# Additional cache for node_modules across runs
- name: Cache node_modules
  uses: actions/cache@v4
  with:
    path: |
      node_modules
      **/node_modules
    key: ${{ runner.os }}-node-${{ hashFiles('**/pnpm-lock.yaml') }}
    restore-keys: |
      ${{ runner.os }}-node-
```

## Branch protection rules

```yaml
# Settings → Branches → Branch protection rules → main
- ✅ Require a pull request before merging
- ✅ Require approvals: 1 (2 for prod-critical)
- ✅ Dismiss stale pull request approvals when new commits are pushed
- ✅ Require status checks to pass before merging
  - lint, typecheck, unit, build, integration, e2e, security, bundle-size
- ✅ Require conversation resolution before merging
- ✅ Require signed commits (optional)
- ✅ Require linear history (rebase, no merge commits)
- ❌ Allow force pushes: NO
- ❌ Allow deletions: NO
```

## Per-PR preview deployments

```yaml
# .github/workflows/preview.yml
name: Preview Deploy
on:
  pull_request:
    types: [opened, synchronize, reopened]

jobs:
  preview:
    runs-on: ubuntu-latest
    permissions:
      pull-requests: write
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'pnpm'
      - run: pnpm install --frozen-lockfile
      - run: pnpm build
      - name: Deploy to Vercel
        id: deploy
        run: vercel deploy --token=${{ secrets.VERCEL_TOKEN }}
      - name: Comment PR
        uses: marocchino/sticky-pull-request-comment@v2
        with:
          message: |
            Preview: ${{ steps.deploy.outputs.url }}
            Auto-updates on every push.
            Removed when PR closed.
```

## Feature flags in CI

```yaml
# Test with flag ON
- name: Test with feature flag
  env:
    FF_NEW_DASHBOARD: 'true'
  run: pnpm test:e2e --grep "new dashboard"

# Test with flag OFF
- name: Test without feature flag
  env:
    FF_NEW_DASHBOARD: 'false'
  run: pnpm test:e2e --grep "old dashboard"
```

## Staged rollouts

```yaml
# .github/workflows/deploy-prod.yml
name: Deploy Production
on:
  workflow_dispatch:
    inputs:
      stage:
        description: 'Deployment stage'
        required: true
        type: choice
        options: [canary-5, gradual-25, gradual-50, full-100, rollback]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Deploy ${{ inputs.stage }}
        env:
          VERCEL_TOKEN: ${{ secrets.VERCEL_TOKEN }}
        run: |
          case "${{ inputs.stage }}" in
            canary-5)    vercel --target canary && vercel alias set canary.vercel.app prod.app.com --token=$VERCEL_TOKEN ;;
            gradual-25)  vercel --target production && vercel alias set prod-v2.vercel.app prod.app.com --token=$VERCEL_TOKEN ;;
            gradual-50)  ...
            full-100)    ...
            rollback)    vercel rollback --token=$VERCEL_TOKEN ;;
          esac
      - name: Notify Slack
        uses: slackapi/slack-github-action@v1
        with:
          payload: |
            {"text": "Production deployed: ${{ inputs.stage }} by @${{ github.actor }}"}
        env:
          SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK }}
```

## Size limit config

```json
// .size-limit.json
[
  {
    "name": "main bundle",
    "path": "dist/index.js",
    "limit": "200 KB",
    "gzip": true
  },
  {
    "name": "vendor chunk",
    "path": "dist/vendor.js",
    "limit": "500 KB",
    "gzip": true
  },
  {
    "name": "CSS",
    "path": "dist/styles.css",
    "limit": "50 KB",
    "gzip": true
  }
]
```

```json
// package.json
{
  "scripts": {
    "size": "size-limit",
    "size:why": "size-limit --why"
  }
}
```

## Pipeline < 10 min

How to keep it fast:
- **Cache pnpm + node_modules** (saves 1-2 min)
- **Parallel jobs** (lint and typecheck can run simultaneously)
- **Path filters** (don't run e2e if only docs changed)
- **Matrix strategy** for cross-OS tests (optional)
- **Self-hosted runners** for large projects
- **Skip optional jobs** with an `if:` condition

```yaml
# Skip e2e if only docs changed
e2e:
  if: |
    contains(github.event.pull_request.changes.*.files.*.filename, '.ts') ||
    contains(github.event.pull_request.changes.*.files.*.filename, '.tsx')
```

## Slack notifications

```yaml
- name: Notify success
  if: success()
  uses: slackapi/slack-github-action@v1
  with:
    payload: |
      {
        "text": "✅ CI passed for ${{ github.head_ref }}",
        "blocks": [
          {
            "type": "section",
            "text": {
              "type": "mrkdwn",
              "text": "✅ *${{ github.head_ref }}* passed all checks\n<${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}|View run>"
            }
          }
        ]
      }
  env:
    SLACK_WEBHOOK_URL: ${{ secrets.SLACK_WEBHOOK }}

- name: Notify failure
  if: failure()
  uses: slackapi/slack-github-action@v1
  with:
    payload: |
      {"text": "❌ CI failed for ${{ github.head_ref }} by @${{ github.actor }}\n<${{ github.server_url }}/${{ github.repository }}/actions/runs/${{ github.run_id }}|View logs>"}
```

## Common errors

1. ❌ Pipeline > 15 min → devs skip checks.
2. ❌ No cache → 2-3 min extra per run.
3. ❌ Flaky tests → false negatives, devs lose confidence.
4. ❌ No branch protection → anyone merges directly.
5. ❌ Secrets in logs → leak.
6. ❌ No retry on network steps → false failures.
7. ❌ Jobs without an `if:` condition → run unnecessarily.
8. ❌ Missing version pinning (`@v4` instead of a SHA) → breaks when the action updates.
9. ❌ No timeout on jobs → a hung job runs forever.
10. ❌ Matrix without a parallelism limit → exhausts GitHub runners.

## Resources

- [GitHub Actions docs](https://docs.github.com/en/actions)
- [Size limit](https://github.com/ai/size-limit)
- [Vercel CLI](https://vercel.com/docs/cli)
- [Gitleaks](https://github.com/gitleaks/gitleaks)
- Related skill: `shipping-and-launch` (what to do after CI)
- Related skill: `prod-deploy-verification` (pre-deploy checks)
- Related skill: `code-review-and-quality` (workspace)
