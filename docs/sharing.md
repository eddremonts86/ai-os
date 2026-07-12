# Sharing & Contributing

> how to contribute to AI-OS and share with other devs.

## To use AI-OS without contributing

1. Fork the repo (button on GitHub).
2. Clone your fork.
3. Run `setup/install-mac.sh` (or Windows).
4. **Personalize** the files in `ai-config/`, `dev-env/`, `context/` according to your preferences.
5. Commit to your fork (not to the original repo).

## To contribute to the original repo (PR)

1. Fork + clone.
2. Create branch: `git checkout -b feat/my-change`.
3. Make changes.
4. **Conventional Commits** (already in `dev-env/dotfiles/git/.gitconfig.template`):
   - `feat:` new feature
   - `fix:` bug fix
   - `docs:` docs only
   - `chore:` maintenance
   - `refactor:` refactor without functional change
   - `test:` tests
5. Push + PR.
6. Describe: what changes, why, how to test.

### What TO contribute

- **New skills** (`~/.claude/skills/<name>/SKILL.md`) that are reusable.
- **Workspace skills** (project-specific, not in `~/.claude/skills/`).
- **New workflows** in `<AI_OS_ROOT>/workflows/`.
- **New verifiers**.
- **Brewfile** packages (if useful for devs in general).
- **Dotfiles** (only if generic, not personal).
- **Additional MCP servers** in `ai-config/mcp/`.
- **Fixes** to bugs in setup scripts.
- **Docs** improvements.

### What NOT to contribute (user-specific)

- **secrets** (API keys, tokens, passwords).
- **Git identity** (user.name, user.email).
- **SSH private keys**.
- **Hardcoded absolute paths**.
- **Very personal aliases** without documentation of what they do.
- **App config with personal info** (GPG keys, email signatures).

## Conventions

### Frontmatter of skills

```yaml
---
name: kebab-case-name
description: "When to use this skill. Be specific — drives auto-loading by CLI agents."
license: MIT|Internal|Apache-2.0
metadata:
  hermes:
    tags: [tag1, tag2]
    related_skills: [other-skill]
---
```

### Naming

- **Skills:** kebab-case (`react-patterns`, `wave-template-conventions`).
- **Workflows:** kebab-case (`daily_start.md`, `project_start.md`).
- **Scripts:** snake_case (`install-mac.sh`, `verify.sh`).

### Conventional Commits

```
feat(skills): add aws-deploy pattern
fix(install-mac.sh): handle missing yq
docs(cross-platform): add WSL2 setup notes
chore: bump superpowers version
```

## Skill distribution

### Global skills (all devs have them)

Path: `ai-config/skills/<name>/SKILL.md`

Distributed via symlinks to the core CLIs:

- `~/.claude/skills/<name>/`
- `~/.codex/skills/<name>/`
- `~/.gemini/skills/<name>/`
- `~/.agents/skills/<name>/`

Hermes reads `~/.agents/skills/` natively via `skills.external_dirs` in
`~/.hermes/config.yaml` — no separate symlinked copy.

`setup/install-mac.sh` does this automatically.

### Workspace skills (project-specific)

Path: `<project>/.agents/skills/<name>/SKILL.md`

**NOT** automatically distributed to other CLIs. Workspace-scoped.

If your skill is workspace-specific but you want to share it → promote it to global (move to `ai-config/skills/`).

## Versioning

AI-OS follows **Semantic Versioning**:

- **MAJOR:** breaking changes in setup, structure, or core skills.
- **MINOR:** new skills, workflows, or backward-compatible features.
- **PATCH:** bug fixes, doc fixes, minor improvements.

Current version: 0.1.0 (in initial development).

## Releases

```bash
# Tag release
git tag -a v0.2.0 -m "Add ai-os-quickstart skill"
git push origin v0.2.0

# GitHub release (manual)
gh release create v0.2.0 --title "v0.2.0: ai-os-quickstart" --notes "..."
```

## Channels

- **GitHub:** [github.com/eddremonts86/ai-os](https://github.com/eddremonts86/ai-os)
- **Issues:** for bugs and feature requests.
- **Discussions:** for questions and sharing experiences.

## Roles

For now, the repo is Edd's personal. If it grows:

- **Maintainer:** Edd (final decisions).
- **Contributors:** anyone with a merged PR.
- **Users:** anyone who adopts AI-OS.

## Roadmap (tentative)

- [ ] v0.2.0: ai-os-quickstart skill (DONE)
- [ ] v0.3.0: Setup script + Brewfile + MCP config generation (DONE)
- [ ] v0.4.0: Windows PowerShell install (DONE)
- [ ] v0.5.0: More skills (TBD based on demand)
- [ ] v1.0.0: Stable API for skills + workflows
- [ ] v1.1.0: WSL2 support as primary Windows workflow
- [ ] v1.2.0: GitHub Actions CI for setup scripts
- [ ] v2.0.0: Multi-tenant / team support (config layers)
