# Architecture

> Cómo está organizado AI-OS internamente y por qué.

## Principios de diseño

1. **Single source of truth.** Las skills viven en `ai-config/skills/` y se symlinkean a los 5 CLIs. No hay duplicación.
2. **Declarativo > imperativo.** MCP servers se definen en YAML, no se hardcodean en `~/.hermes/config.yaml`. La config se genera desde los YAMLs.
3. **Idempotente.** El setup script corre múltiples veces sin romper nada (mata symlinks viejos, recrea, no falla).
4. **Cross-platform best-effort.** Mac y Windows funcionan, con diferencias documentadas. Mac es la experiencia premium.
5. **AI-OS como orquestador, no como dictador.** El AI-OS da estructura y skills, pero no impone un workflow único. Cada dev adapta.

## Capas

```
┌─────────────────────────────────────────────────────────────────┐
│  Layer 0: AI-OS (Karpathy method)                                │
│  - CLAUDE.md, context/, rules/, workflows/, specs/, verifiers/   │
│  - 99 skills globales (5 CLIs via symlinks)                     │
│  - 14 superpowers skills (REQUIRED)                             │
│  - 7 MCP servers declarativos                                   │
│  - Prompt: ai-os-quickstart                                     │
└─────────────────────────────────────────────────────────────────┘
                              ▲
                              │ (symlinks)
┌─────────────────────────────────────────────────────────────────┐
│  Layer 1: AI CLIs                                                │
│  - Claude Code, Codex, Gemini CLI, Antigravity, Hermes Agent    │
│  - Cada uno carga skills desde ~/.{claude,codex,gemini,...}/skills/│
└─────────────────────────────────────────────────────────────────┘
                              ▲
                              │ (symlinks)
┌─────────────────────────────────────────────────────────────────┐
│  Layer 2: OS & Shell                                            │
│  - Mac: zsh + Oh My Zsh + Powerlevel10k + Warp                  │
│  - Windows: PowerShell + Windows Terminal + WezTerm             │
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

## Decisiones de diseño clave

### ¿Por qué symlinks y no copiar?

**Pro symlinks:**
- Single source of truth (un cambio se propaga a 5 CLIs).
- Tamaño total bajo.
- Fácil de sincronizar con git (solo modificas source of truth).

**Contra symlinks:**
- En Windows requieren admin o Developer Mode.
- Debugging más difícil (¿es el archivo real o un symlink?).
- Si borras el source, rompes 5 destinos a la vez.

**Decisión:** symlinks para skills (claro win, son read-only). Files para configs que se modifican per-CLI (raro).

### ¿Por qué YAML para MCP y no JSON?

- YAML es más legible para humanos.
- Comentarios nativos (`# comment`).
- `yq` lee/escribe bien.
- Si preferís JSON, hay convertidores.

### ¿Por qué dotfiles en repo y no en `~/`?

- Versionado en git = backup + history.
- Múltiples Macs = sync automático.
- Reviewable en PRs.

**Trade-off:** dotfiles muy personales no van en el repo público. Solución: `.gitconfig.template` con placeholders, cada dev copia y personaliza.

### ¿Por qué skills globales en `~/.claude/skills/` y no en `~/Projects/ai-os/ai-config/skills/`?

- **Compatibilidad:** los 5 CLIs esperan skills en `~/.{claude,codex,gemini,agents}/skills/`. Cambiar el path requiere modificar los CLIs.
- **Source of truth:** el AI-OS mantiene la copia canónica en `ai-config/skills/` y symlinkea a los 5 destinos.
- **Single user assumption:** el path `~/` es único por usuario. Si tenés multi-user, hay que cambiar.

### ¿Por qué no Nix/Home Manager?

- **Curva de aprendizaje:** Nix es complejo, requiere aprender un nuevo lenguaje.
- **Overhead:** para 1-2 Macs, Brewfile + scripts es suficiente.
- **Flexibilidad:** dotfiles en scripts bash son más fáciles de personalizar que un `.nix` declarativo.

**Cuándo migrar a Nix:** si AI-OS crece a 5+ devs con setups diversos, Nix vale la pena. Por ahora, overkill.

## Skills: lifecycle

```
1. Author escribe SKILL.md en ai-config/skills/<name>/
2. Commit + push
3. install-mac.sh / install-windows.ps1 corren en Mac/Windows
4. Symlinks se crean en 5 CLIs
5. Skill se auto-carga según description (frontmatter)
6. Cuando cambia, se re-corre setup (o symlink manual)
7. Cuando se depreca, mover a ai-config/skills/.deprecated/ (con timestamp)
```

## Skills: cómo se invocan

Cada CLI tiene su mecanismo:

| CLI | Mecanismo de invocación |
|---|---|
| Claude Code | `/skill <name>` o auto-load por description |
| Codex | Auto-load por frontmatter, sin comando explícito |
| Gemini CLI | Auto-load por frontmatter |
| Antigravity | Auto-load por frontmatter |
| Hermes | `--skills <name>` o auto-load desde `imported:`, o `/skill <name>` |

El `description:` del frontmatter es el trigger. Si dice "Use when X", el CLI carga la skill cuando detecta X.

## MCP servers: lifecycle

```
1. Author escribe YAML en ai-config/mcp/<name>.yaml
2. install-mac.sh corre generate-mcp-config.py
3. Script lee YAMLs, genera ~/.hermes/config.yaml
4. Hermes recarga config, conecta MCPs
5. Cuando cambia, re-correr setup (o editar manualmente)
```

## Roadmap arquitectónico

- **v0.x:** Single-user, single-source-of-truth, symlinks.
- **v1.0:** Stable, validación con CI.
- **v1.x:** Multi-Mac sync via git (ya funciona).
- **v2.0:** Multi-user con config layers (personal / team / public).
- **v2.x:** Opcionalmente Nix para setups más complejos.

## Limitaciones conocidas

- **Windows symlinks** requieren admin o Dev Mode.
- **Brewfile** solo aplica a Mac (Windows usa Chocolatey).
- **Oh My Zsh + p10k** solo en Mac. Windows tiene equivalente con Oh-My-Posh o Starship pero no está automatizado.
- **Skills específicas por CLI** (ej: `imported:foo` solo en Hermes) no se manejan automáticamente. Si necesitás skills diferentes por CLI, usar el directorio `ai-config/clis/`.

## Métricas de éxito

AI-OS es exitoso si:
- ✅ Setup completo en Mac nueva en < 30 min.
- ✅ Setup completo en Windows en < 60 min.
- ✅ Cero secrets en el repo (verificable con `git log -p | grep -iE "secret|api[_-]?key|password"`).
- ✅ Todas las skills invocables desde los 5 CLIs.
- ✅ 14/14 superpowers skills verificadas en `bash setup/verify.sh`.

## Referencias

- **Karpathy method:** [CLAUDE.md sección "Método"](../../CLAUDE.md)
- **Setup scripts:** [setup/](../setup/)
- **Skills:** [ai-config/skills/](../ai-config/skills/)
- **MCP servers:** [ai-config/mcp/](../ai-config/mcp/)
- **Cross-platform:** [cross-platform.md](cross-platform.md)
- **Sharing:** [sharing.md](sharing.md)
