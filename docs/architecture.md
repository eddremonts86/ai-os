# Architecture

> how AI-OS is organized internally and why.

## Design principles

1. **Single source of truth.** Skills live in `ai-config/skills/` and are symlinked to 5 CLIs. No duplication.
2. **declarative > imperative.** MCP servers are defined in YAML, not hardcoded in `~/.hermes/config.yaml`. The config is generated from the YAMLs.
3. **idempotent.** The setup script runs multiple times without breaking anything (kills old symlinks, recreates, does not fail).
4. **cross-platform best-effort.** Mac and Windows work, with documented differences. Mac is the premium experience.
5. **AI-OS as orchestrator, not as dictator.** AI-OS gives structure and skills, but does not impose a single workflow. Each dev adapts.

## Layers

```
┌─────────────────────────────────────────────────────────────────┐
│  Layer 0: AI-OS (Karpathy method)                                │
│  - CLAUDE.md, context/, rules/, workflows/, specs/, verifiers/   │
│  - 99 global skills (5 CLIs via symlinks)                       │
│  - 14 superpowers skills (REQUIRED)                             │
│  - 7 declarative MCP servers                                    │
│  - Prompt: ai-os-quickstart                                      │
└─────────────────────────────────────────────────────────────────┘
                              ▲
                              │ (symlinks)
┌─────────────────────────────────────────────────────────────────┐
│  Layer 1: AI CLIs                                                │
│  - Claude Code, Codex, Gemini CLI, Antigravity, Hermes Agent    │
│  - Each one loads skills from ~/.{claude,codex,gemini,...}/skills/│
└─────────────────────────────────────────────────────────────────┘
                              ▲
                              │ (symlinks)
┌─────────────────────────────────────────────────────────────────┐
│  Layer 2: OS & Shell                                            │
│  - Mac: zsh + Oh My Zsh + Powerlevel10k + Warp                  │
│  - Windows: PowerShell + Windows Terminal + Wezterm             │
│  - Terminal, fonts, dotfiles (git, ssh, etc.)                  │
└─────────────────────────────────────────────────────────────────┘
                              ▲
                              │ (install-mac.sh)
┌─────────────────────────────────────────────────────────────────┐
│  Layer 3: System                                                │
│  - Homebrew (Mac) / Chocolatey (Windows)                        │
│  - Node, Python, Git, Docker, etc.                             │
│  - Fonts (Nerd Fonts)                                          │
└─────────────────────────────────────────────────────────────────┘
```

## Key design decisions

### Why symlinks and not copy?

**Pro symlinks:**
- Single source of truth (one change propagates to 5 CLIs).
- Lower total size.
- Easy to sync with git (you only modify the source of truth).

**Con symlinks:**
- On Windows they require admin or Developer Mode.
- Harder to debug (is it a real file or a symlink?).
- If you delete the source, you break 5 destinations at once.

**Decision:** symlinks for skills (clear win, they're read-only). Files for configs that are modified per-CLI (rare).

### Why YAML for MCP and not JSON?

- YAML is more readable for humans.
- Native comments (`# comment`).
- `yq` reads/writes well.
- If you prefer JSON, there are converters.

### Why dotfiles in the repo and not in `~/`?

- Versioned in git = backup + history.
- Multiple Macs = automatic sync.
- Reviewable in PRs.

**Trade-off:** very personal dotfiles are NOT in the public repo. Solution: `.gitconfig.template` with placeholders, each dev copies and personalizes.

### Why global skills in `~/.claude/skills/` and not in `~/Projects/ai-os/ai-config/skills/`?

- **Compatibility:** 5 CLIs expect skills in `~/.{claude,codex,gemini,agents}/skills/`. Changing the path requires modifying the CLIs.
- **Source of truth:** AI-OS keeps the canonical copy in `ai-config/skills/` and symlinks to 5 destinations.
- **Single user assumption:** the `~/` path is unique per user. If you have multi-user, you need to change.

### Why not Nix/Home Manager?

- **Learning curve:** Nix is complex, requires learning a new language.
- **Overhead:** for 1-2 Macs, Brewfile + scripts is enough.
- **Flexibility:** dotfiles in bash scripts are easier to personalize than `.nix` declarative.

**When to migrate to Nix:** if AI-OS grows to 5+ devs with diverse setups, Nix is worth it. For now, overkill.

## Skills: lifecycle

```
1. author writes SKILL.md in ai-config/skills/<name>/
2. Commit + push
3. install-mac.sh / install-windows.ps1 run on Mac/Windows
4. Symlinks are created in 5 CLIs
5. Skill auto-loads based on description (frontmatter)
6. When it changes, re-run setup (or symlink manually)
7. When it's deprecated, move to ai-config/skills/.deprecated/ (with timestamp)
```

## Skills: how they're invoked

Each CLI has its own mechanism:

| CLI | Invocation mechanism |
|---|---|
| Claude Code | `/skill <name>` or auto-load by description |
| Codex | Auto-load by frontmatter, no explicit command |
| Gemini CLI | Auto-load by frontmatter |
| Antigravity | Auto-load by frontmatter |
| Hermes | `--skills <name>` or auto-load from `imported:`, or `/skill <name>` |

The `description:` in the frontmatter is the trigger. If it says "Use when X", the CLI loads the skill when it detects X.

## MCP servers: lifecycle

```
1. Author writes YAML in ai-config/mcp/<name>.yaml
2. install-mac.sh runs generate-mcp-config.py
3. Script reads YAMLs, generates ~/.hermes/config.yaml
4. Hermes reloads config, connects MCPs
5. When it changes, re-run setup (or edit manually)
```

## Architectural roadmap

- **v0.x:** single-user, single-source-of-truth, symlinks.
- **v1.0:** stable, CI validation.
- **v1.x:** multi-Mac sync via git (already works).
- **v2.0:** multi-user with config layers (personal / team / public).
- **v2.x:** optionally Nix for more complex setups.

## Known limitations

- **Windows symlinks** require admin or Dev Mode.
- **Brewfile** only applies to Mac (Windows uses Chocolatey).
- **Oh My Zsh + p10k** only on Mac. Windows has the equivalent with Oh-My-Posh or Starship but is not automated.
- **CLI-specific skills** (eg: `imported:foo` only in Hermes) are not handled automatically. If you need different skills per CLI, use the `ai-config/clis/` directory.

## Success metrics

AI-OS is successful if:

- ✅ Complete setup on a new Mac in < 30 min.
- ✅ Complete setup on Windows in < 60 min.
- ✅ Zero secrets in the repo (verifiable with `git log -p | grep -iE "secret|api[_-]?key|password"`).
- ✅ All skills invokable from 5 CLIs.
- ✅ 14/14 superpowers skills verified in `bash setup/verify.sh`.

## References

- **Karpathy method:** [CLAUDE.md "Method" section](../../CLAUDE.md)
- **Setup scripts:** [setup/](../setup/)
- **Skills:** [ai-config/skills/](../ai-config/skills/)
- **MCP servers:** [ai-config/mcp/](../ai-config/mcp/)
- **Cross-platform:** [cross-platform.md](cross-platform.md)
- **Sharing:** [sharing.md](sharing.md)
