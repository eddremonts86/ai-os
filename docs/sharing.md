# Sharing & Contributing

> Cómo contribuir al AI-OS y compartir con otros devs.

## Para usar AI-OS sin contribuir

1. Fork el repo (botón en GitHub).
2. Clonar tu fork.
3. Correr `setup/install-mac.sh` (o Windows).
4. **Personalizar** los archivos en `ai-config/`, `dev-env/`, `context/` según tus preferencias.
5. Commitear a tu fork (no al repo original).

## Para contribuir al repo original (PR)

1. Fork + clonar.
2. Crear branch: `git checkout -b feat/mi-cambio`.
3. Hacer cambios.
4. **Conventional Commits** (ya en `dev-env/dotfiles/git/.gitconfig.template`):
   - `feat:` nueva feature
   - `fix:` bugfix
   - `docs:` solo docs
   - `chore:` maintenance
   - `refactor:` refactor sin cambio funcional
   - `test:` tests
5. Push + PR.
6. Describir: qué cambia, por qué, cómo testear.

### Qué SÍ贡献uir

- **Skills nuevas** (`~/.claude/skills/<name>/SKILL.md`) que sean reutilizables.
- **Skills de workspace** (project-specific, no van en `~/.claude/skills/`).
- **Workflows** nuevos en `~/Projects/ai-os/workflows/`.
- **Verifiers** nuevos.
- **Brewfile** packages (si son útiles para devs en general).
- **Dotfiles** (solo si son genéricos, no personales).
- **MCP servers** adicionales en `ai-config/mcp/`.
- **Fixes** a bugs en scripts de setup.
- **Docs** mejoras.

### Qué NO contribuir (específico del usuario)

- **Secrets** (API keys, tokens, passwords).
- **Git identity** (user.name, user.email).
- **SSH keys privadas**.
- **Paths absolutos** hardcoded.
- **Aliases muy personales** sin documentación de qué hacen.
- **Config de apps con info personal** (GPG keys, email signatures).

## Convenciones

### Frontmatter de skills

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

## Distribución de skills

### Skills globales (todos los devs las tienen)

Path: `ai-config/skills/<name>/SKILL.md`

Se distribuyen via symlinks a 5 CLIs:
- `~/.claude/skills/<name>/`
- `~/.codex/skills/<name>/`
- `~/.gemini/skills/<name>/`
- `~/.agents/skills/<name>/`
- `~/.hermes/skills/imported/<name>/`

El `setup/install-mac.sh` lo hace automáticamente.

### Skills de workspace (específicas del proyecto)

Path: `<project>/.agents/skills/<name>/SKILL.md`

**No** se distribuyen a otros CLIs automáticamente. Son workspace-scoped.

Si tu skill es workspace-specific pero querés compartirla → promoverla a global (mover a `ai-config/skills/`).

## Versionado

AI-OS sigue **Semantic Versioning**:

- **MAJOR:** breaking changes en el setup, estructura, o skills core.
- **MINOR:** nuevas skills, workflows, o features backward-compatible.
- **PATCH:** bugfixes, doc fixes, mejoras menores.

Current version: 0.1.0 (en desarrollo inicial).

## Releases

```bash
# Tag release
git tag -a v0.2.0 -m "Add ai-os-quickstart skill"
git push origin v0.2.0

# GitHub release (manual)
gh release create v0.2.0 --title "v0.2.0: ai-os-quickstart" --notes "..."
```

## Canales

- **GitHub:** [github.com/eddremonts86/ai-os](https://github.com/eddremonts86/ai-os)
- **Issues:** para bugs y feature requests.
- **Discussions:** para preguntas y compartir experiencias.

## Roles

Por ahora, el repo es personal de Edd. Si crece:

- **Maintainer:** Edd (decisiones finales).
- **Contributors:** cualquiera con PR mergeado.
- **Users:** cualquiera que adopte AI-OS.

## Roadmap (tentative)

- [ ] v0.2.0: ai-os-quickstart skill (DONE)
- [ ] v0.3.0: Setup script + Brewfile + MCP config generativa (DONE)
- [ ] v0.4.0: Windows PowerShell install (DONE)
- [ ] v0.5.0: More skills (TBD based on demand)
- [ ] v1.0.0: Stable API for skills + workflows
- [ ] v1.1.0: WSL2 support as primary Windows workflow
- [ ] v1.2.0: GitHub Actions CI for setup scripts
- [ ] v2.0.0: Multi-tenant / team support (config layers)
