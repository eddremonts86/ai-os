# vendor/shimeles — shimeles/skills references (on-demand, not global)

Vendored 2026-09-02 from https://github.com/michaelshimeles/skills (462 stars, 26 commits).

This directory does **not** get symlinked to `~/.claude/skills` by `setup/install-mac.sh` — it is a reference library for on-demand use. Global propagation would duplicate `using-git-worktrees` and overwrite `AGENTS.md`.

| Upstream skill | Status in ai-os | How to use |
|---|---|---|
| `new-feature` (worktree) | **not installed** — duplicates `using-git-worktrees` (14 superpowers, `ai-config/manifest.yaml:68`) | keep using `/using-git-worktrees` + `workflows/project_start.md` |
| `code-structure` | **installed** as `ai-config/skills/service-layer/SKILL.md` (adapted, English) | `~/.claude/skills/service-layer` — use when 2+ flows duplicate ops |
| `evidence-driven-testing` | **not global** — heavy (python3+ffmpeg/libx264/ass, X11 `DISPLAY`/`wf-recorder`, mac Screen Recording) | `python3 vendor/shimeles/evidence-driven-testing/scripts/evidence.py doctor` if you need video proof; otherwise use `webapp-testing`/`browser-qa` |
| `before-and-after` | **on-demand CLI** — `@vercel/before-and-after` 0.0.4 via `pnpm add -g` (PolyForm Shield 1.0.0, not MIT) | `before-and-after <before> <after> --markdown` or `npx @vercel/before-and-after` — no vendored skill |
| `greploop` / `greploop-apps` | **not global** — requires Greptile 5/5 + `gh` auth (MIT, `greptileai/skills`) | copy to `ai-config/skills/greploop/` only if repo has Greptile; see `https://github.com/greptileai/skills` |

Also see `AGENTS.md` workflow (isolate→build→prove→ship) in upstream — do **not** copy to repo root; ai-os uses `CLAUDE.md` + `AGENTS.md -> CLAUDE.md` bridge (`docs/repo-layout.md:69`) + `intent/`→`spec`→`plan` loop.

To add a new shimeles skill as global: copy its folder to `ai-config/skills/<name>/` and let `setup/install-mac.sh:7` propagate it — but check `ls ai-config/skills` for name collision and `setup/verify.sh:102` for count drift first.
