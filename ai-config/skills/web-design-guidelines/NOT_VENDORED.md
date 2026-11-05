# Why this is original, not vendored

`vercel-labs/agent-skills` ships a skill with this same name and the same
fetch-then-review mechanism, but that repo has **no LICENSE file and no `license` field
in `package.json`** — checked 2026-09-26 via the GitHub API. Absent an explicit license,
copying its `SKILL.md` (even a short one) is not clearly authorized, so it was not
vendored.

The rules it fetches live in a *different*, separately-licensed repo:
https://github.com/vercel-labs/web-interface-guidelines (MIT, see its own `LICENSE`).
That content is fine to point at.

`SKILL.md` in this directory is original AI-OS text describing the same idea (fetch the
guidelines, review named files against them, report `file:line`) — not a copy of
`vercel-labs/agent-skills`'s wording. If that repo ever adds a license, it's worth
diffing against it directly:

```bash
gh api repos/vercel-labs/agent-skills/contents/skills/web-design-guidelines/SKILL.md --jq '.content' | base64 -d
```
