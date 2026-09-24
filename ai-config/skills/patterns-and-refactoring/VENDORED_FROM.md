# Vendored from christianpasinrey/refactoring.guru-skill

Third-party skill, vendored into `ai-config/skills/` so `setup/install-mac.sh` step 7
propagates it to every CLI with no install-script change (flat skill, `SKILL.md` at top level).

| Field | Value |
|---|---|
| Upstream | https://github.com/christianpasinrey/refactoring.guru-skill |
| Author | Christian Pasín Rey |
| License | MIT (see `LICENSE-UPSTREAM.md`) |
| Plugin version | 1.1.0 |
| Commit | `af45cd3028fa33bcc29bc9b701ef1899f0102b4e` |
| Commit date | 2026-09-10 |
| Vendored | 2026-09-12 |
| Vendored subtree | upstream `skills/patterns-and-refactoring/` only |

## What was NOT vendored

- `.claude-plugin/` — marketplace manifests. AI-OS distributes via its own symlink flow.
- `install.sh` / `install.ps1` — upstream's per-machine installers; `setup/install-mac.sh` does this.
- `CLAUDE.md.snippet.md` — a "mandatory gate" block that invokes the skill before writing any
  non-trivial code. Deliberately not adopted: the AI-OS loop already has a Spec step, and
  ponytail already enforces the YAGNI gate on new code. Adding a third gate is ceremony.

## Local modifications

1. **`description` narrowed** (the only edit to `SKILL.md`). Upstream triggers on "before
   designing or writing any non-trivial code", which collides with ponytail on every task.
   Ours triggers on refactor, legacy, preparatory refactoring, and structural review — Path B
   and Path C — and states that Path A (new code) is only for a nameable force. The body,
   including Path A, is unchanged so it is still reachable when a force does exist.

## Why this one

Of ~200 skills in `ai-config/skills/`, none covered "smell → characterization tests →
smallest refactoring". `improve` and `coding-standards` mention smells in passing only.
The 22-smell and 66-technique catalogues plus per-stack idioms (`vue-typescript`,
`react-typescript`, `node-typescript` included) are the payload; `references/` load lazily.

## Refreshing from upstream

```bash
git clone --depth 1 https://github.com/christianpasinrey/refactoring.guru-skill /tmp/rg
diff -r /tmp/rg/skills/patterns-and-refactoring ai-config/skills/patterns-and-refactoring
```

Port changes by hand; re-apply the `description` edit and bump the table above.
