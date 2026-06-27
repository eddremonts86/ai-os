# Getting Started

> Setup paso a paso para devs que adoptan AI-OS por primera vez.

## Prerrequisitos

- **Mac (Apple Silicon o Intel)** o **Windows 10/11** con PowerShell.
- Conexión a internet.
- 30-60 minutos de tiempo (la mayoría es descarga de packages).
- Cuenta de GitHub con acceso al repo de AI-OS.

## Paso 1: Clonar el repo

```bash
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os
```

> **Windows:** `git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os`

## Paso 2: Ejecutar setup

### Mac
```bash
bash setup/install-mac.sh
```

### Windows (PowerShell como Admin)
```powershell
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
```

El script:
1. Instala Homebrew packages (Mac) o Chocolatey packages (Windows).
2. Instala Oh My Zsh + Powerlevel10k + plugins (Mac).
3. Crea symlinks de dotfiles (zsh, git, ssh).
4. Configura skills globales en 5 CLIs via symlinks.
5. Instala las 14 superpowers skills required.
6. Genera `~/.hermes/config.yaml` desde los YAMLs de MCP.
7. Configura Warp (Mac).
8. Configura Terminal.app (Mac).
9. Recarga zsh.

## Paso 3: Personalizar git (si usaste el template)

```bash
git config --global user.name "Tu Nombre"
git config --global user.email "tu@email.com"
```

## Paso 4: Verificar

```bash
bash setup/verify.sh
```

**Output esperado:**
```
[ai-os verify] ✅ AI-OS en /Users/edd/Projects/ai-os
[ai-os verify] ✅   .zshrc → /Users/edd/Projects/ai-os/dev-env/dotfiles/zsh/.zshrc
[ai-os verify] ✅   .p10k.zsh → ...
[ai-os verify] ✅   .gitignore_global → ...
[ai-os verify] ✅   ~/.claude/skills: 99 skills
[ai-os verify] ✅   ~/.codex/skills: 99 skills
[ai-os verify] ✅   ~/.gemini/skills: 99 skills
[ai-os verify] ✅   ~/.agents/skills: 99 skills
[ai-os verify] ✅   ~/.hermes/skills/imported: 99 skills
[ai-os verify] ✅ 14/14 superpowers skills OK
[ai-os verify] ✅ MCP servers configurados: 7
[ai-os verify] ✅ Oh My Zsh instalado
[ai-os verify] ✅ Powerlevel10k instalado
[ai-os verify] ✅ Warp con CaskaydiaCove Nerd Font
[ai-os verify] Pasados: 14
[ai-os verify] ✅ Fallados: 0
```

## Paso 5: Probar AI-OS

### En Hermes (recomendado)
```bash
hermes chat --skills ai-os-quickstart
```

### En cualquier CLI
La skill `ai-os-quickstart` se carga automáticamente desde:
- **Claude Code:** `/skill ai-os-quickstart` o auto-carga si está en `~/.claude/skills/`.
- **Codex / Gemini / Antigravity:** auto-carga desde `~/.codex/skills/`, `~/.gemini/skills/`, `~/.agents/skills/`.

## Próximos pasos

1. **Crear tu primera Spec:** `nano ~/Projects/ai-os/specs/current_spec.md` y seguir el template.
2. **Cargar contexto:** la skill `ai-os-quickstart` te guía paso a paso.
3. **Personalizar:** editar archivos en `ai-config/`, `dev-env/dotfiles/`, `context/` según tus preferencias.
4. **Sync al repo:** `git add . && git commit -m "personalize" && git push`.

## Troubleshooting

### "Permission denied" en brew install (Mac)
```bash
sudo chown -R $(whoami) /opt/homebrew
```

### "Execution Policy" en PowerShell (Windows)
```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass
```

### Skills no se cargan en Hermes
```bash
hermes gateway restart
# o desde CLI:
/reload-skills
```

### PyYAML no se instala (script generate-mcp-config.py)
```bash
pip3 install pyyaml --user
```

### Fonts no se ven en Warp/Terminal
1. Verificar instalación: `ls ~/Library/Fonts/ | grep -i nerd`
2. Reiniciar Warp/Terminal completamente.
3. Cambiar la font manualmente en Settings → Appearance → Font.

## Próximos pasos

- Leer [docs/cross-platform.md](cross-platform.md) si vas a usar Mac + Windows.
- Leer [docs/sharing.md](sharing.md) si querés contribuir al repo o compartir con otros devs.
- Leer [docs/architecture.md](architecture.md) para entender la organización interna.
