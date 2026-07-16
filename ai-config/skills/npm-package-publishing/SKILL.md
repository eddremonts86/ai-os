---
name: npm-package-publishing
description: Edd's established convention for publishing npm packages (bootstrap CLIs and libraries) — always under the @edd_remonts scope, plus package.json shape, bin script style, and the ask-before-publish rule. Applies whenever creating a new npm package or preparing one to be published.
license: Internal
---

# npm Package Publishing Convention

Derived from two prior published packages: `@edd_remonts/create-hermes-workspace`
(`~/Projects/eddremonts86/create-hermes-workspace-pkg/`) and
`schilling-widgets-system` (`~/Projects/eddremonts86/npmPakage/`). Use this
pattern instead of inventing a new one.

## Naming

**Always publish under the `@edd_remonts` scope.** Every package — CLI or
library — is `@edd_remonts/<name>`. A single scope keeps everything under one
npm namespace, avoids top-level name squatting, and makes ownership obvious.
Do not publish new unscoped packages.

- **Bootstrap/scaffold CLI** ("run one command to set something up"):
  `@edd_remonts/create-<thing>` — keep the `create-*` prefix so `npx create-*`
  still reads naturally.
- **Library** (importable code, e.g. a component library):
  `@edd_remonts/<descriptive-name>` — e.g. `@edd_remonts/ai-schadcn-chat`.

Scoped packages default to **private** on npm, so `publishConfig.access` MUST be
`"public"` (see the package.json shape below) or the first `npm publish` fails
with `402 Payment Required`.

Migrating an existing unscoped package (e.g. `ai-schadcn-chat` →
`@edd_remonts/ai-schadcn-chat`): npm can't rename in place — change the
`name` field, publish the scoped package fresh, then `npm deprecate` the old
unscoped name with a message pointing at the new one. Update the display/brand
name, repo, domain, and localStorage keys only if the task calls for it — the
scope change is about the npm package identity, not the project's branding.

Default author identity: `Eduardo Inerarte <eddremonts86@gmail.com>` for
personal/open-source packages (matches the `eddremonts86` GitHub identity in
`context/02_projects.md`).

## package.json shape (bootstrap CLI)

```json
{
  "name": "@edd_remonts/create-<thing>",
  "version": "0.1.0",
  "description": "...",
  "type": "module",
  "bin": { "create-<thing>": "bin/create-<thing>.js" },
  "files": ["bin/", "README.md", "LICENSE"],
  "scripts": { "test": "node --test 'test/**/*.test.js'" },
  "engines": { "node": ">=18" },
  "repository": { "type": "git", "url": "git+https://github.com/<owner>/<repo>.git" },
  "bugs": { "url": "https://github.com/<owner>/<repo>/issues" },
  "homepage": "https://github.com/<owner>/<repo>#readme",
  "keywords": ["..."],
  "author": "Eduardo Inerarte <eddremonts86@gmail.com>",
  "license": "MIT",
  "publishConfig": { "registry": "https://registry.npmjs.org/", "access": "public" }
}
```

Key points:
- `files` is restrictive — ship only the CLI shim (`bin/`, docs, license), never
  the whole source repo, even when the package.json lives inside a large
  monorepo-style repo.
- Plain npmjs.org public registry, not GitHub Packages or a private registry,
  unless a task explicitly says otherwise.
- MIT license, matching the `LICENSE` file convention already used across
  Edd's public repos.

## bin script style (Node, ESM)

Mirror `create-hermes-workspace.js`'s shape for any new bootstrap CLI:

1. Shebang `#!/usr/bin/env node`, `"type": "module"`, read own `package.json`
   via `fileURLToPath(new URL('.', import.meta.url))` to avoid a hardcoded
   version/repo URL.
2. Handle `--help`/`-h` and `--version`/`-V` before anything else.
3. Validate the Node version (`engines.node`) and fail fast with a clear message.
4. Validate/resolve the target directory; refuse to overwrite a non-empty one.
5. Do the actual work (clone / delegate to existing scripts) via `spawnSync`
   with `stdio: ['ignore', 'inherit', 'inherit']` so the user sees real-time
   output and real exit codes propagate.
6. Provide a fake/no-network test mode via an env var (e.g. `CHW_FAKE_GIT`,
   `AIOS_FAKE_GIT`) so `node --test` never touches the real network or mutates
   the real machine.
7. Print a short "next steps" success panel at the end — no silent success.

## Publishing is gated — do not run `npm publish` without being asked

`rules/ask_before_doing.md` already lists "Publishing a package (npm publish,
PyPI, brew tap)" as an action requiring explicit confirmation — this skill
does not change that. Prepare `package.json`, the bin script, and the README
fully, then stop and ask before running `npm publish` (or any `npm version`
bump that would be followed by one).

## Related

- `env-config-and-secrets` — audit for leaked secrets before any repo goes
  public or any package gets published.
- `rules/ask_before_doing.md` — the gating rule for the actual publish step.
