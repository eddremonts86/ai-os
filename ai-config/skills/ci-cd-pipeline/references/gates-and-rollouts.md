# Gates, Previews and Rollouts

Material that sits around the pipeline itself: which gates to run, how `main` is protected, and how code reaches production. Apply the main skill's rules on top (parity gates, `timeout-minutes`, job-level skips, deploy verification).

## Gate order

Cheapest and most likely to fail first, so an expensive suite never runs to report a lint error:

1. Lint + format check
2. Typecheck (`tsc --noEmit`)
3. Unit tests (with coverage threshold)
4. Build
5. Integration tests (DB as a `services:` container with a health check)
6. E2E tests
7. Security: `pnpm audit --prod --audit-level=high`, secret scan (gitleaks), CodeQL
8. Bundle size (`size-limit`)

Steps 1-2 can share one job; 3-8 run as parallel jobs. Then: PR → preview deploy, merge → staging, manual approval → production.

## Branch protection on the deploy branch

- Require a PR; 1 approval (2 for prod-critical repos); dismiss stale approvals on new commits.
- Require the gate jobs above as status checks, and conversation resolution.
- Linear history; no force pushes; no deletions.
- Pin third-party actions to a commit SHA, not a moving tag like `@v4`.

## Per-PR preview deployments

```yaml
on:
  pull_request:
    types: [opened, synchronize, reopened]
jobs:
  preview:
    runs-on: ubuntu-latest
    timeout-minutes: 15
    permissions: { pull-requests: write }
    steps:
      - uses: actions/checkout@v4
      # ... install + build
      - id: deploy
        run: echo "url=$(vercel deploy --token=${{ secrets.VERCEL_TOKEN }})" >> "$GITHUB_OUTPUT"
      - uses: marocchino/sticky-pull-request-comment@v2
        with:
          message: "Preview: ${{ steps.deploy.outputs.url }}"
```

The deploy step needs an `id` and must write its URL to `$GITHUB_OUTPUT`, or the comment links to nothing. Tear previews down on PR close.

## Feature flags

Run the affected E2E specs with the flag both on and off, so the old path does not rot while the new one is dark:

```yaml
- run: pnpm test:e2e --grep "dashboard"
  env: { FF_NEW_DASHBOARD: "true" }
- run: pnpm test:e2e --grep "dashboard"
  env: { FF_NEW_DASHBOARD: "false" }
```

## Staged production rollout

A `workflow_dispatch` workflow with a `choice` input (`canary-5`, `gradual-25`, `gradual-50`, `full-100`, `rollback`) maps each stage to the platform's traffic-split or alias command. Verify health and a real page at every stage before advancing, keep `rollback` as a first-class option, and notify the team channel with the stage and actor.

## Bundle size budget

```json
// .size-limit.json
[
  { "name": "main bundle", "path": "dist/index.js", "limit": "200 KB", "gzip": true },
  { "name": "CSS", "path": "dist/styles.css", "limit": "50 KB", "gzip": true }
]
```

`size-limit --why` explains a regression. Raise a budget in the same PR that justifies it, never silently.
