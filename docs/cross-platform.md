# Cross-platform: Mac vs Windows

> AI-OS funciona en ambas plataformas, pero con diferencias importantes.

## Tabla comparativa

| Feature | Mac (nativo) | Windows (PowerShell) | Notas |
|---|---|---|---|
| **AI-OS core (CLAUDE.md, workflows, rules)** | ✅ | ✅ | Idéntico |
| **Skills globales (99)** | ✅ | ✅ | Symlinks funcionan igual |
| **MCP servers (7)** | ✅ | ✅ | stdio funciona en ambos |
| **Oh My Zsh + Powerlevel10k** | ✅ | ❌ | Solo Unix. Windows usa PowerShell. |
| **Warp terminal** | ✅ | ✅ (versión Windows) | Warp tiene build para Windows. |
| **Terminal.app (nativo)** | ✅ | ❌ | Solo Mac. Windows usa Windows Terminal. |
| **Homebrew** | ✅ | ❌ | Mac only. Windows usa Chocolatey. |
| **Brewfile** | ✅ | ❌ (usar `choco` equivalent en Windows) | Windows tiene su propio install script. |
| **Symlinks (zshrc, ssh config)** | ✅ | ⚠️ parcial | Windows tiene `New-Item -ItemType SymbolicLink` pero con caveats (necesita admin o Dev Mode). |
| **Hermes Agent CLI** | ✅ | ✅ | Hermes corre en ambos. |
| **Claude Code CLI** | ✅ | ✅ | Funciona en ambos. |
| **Codex CLI** | ✅ | ✅ | Funciona en ambos. |
| **Gemini CLI** | ✅ | ✅ | Funciona en ambos. |
| **Antigravity / Copilot** | ⚠️ (Warp build) | ✅ (VSCode fork nativo) | Antigravity es VSCode fork. |
| **yq** | ✅ (brew) | ✅ (choco) | Para el verify script. |
| **git** | ✅ (Xcode CLI tools o brew) | ✅ (Git for Windows o choco) | Ambos. |
| **SSH agent** | ✅ (1Password/GPG) | ⚠️ (Pageant o built-in OpenSSH) | Diferentes. |
| **Terminal multiplexers (tmux)** | ✅ | ❌ (usar Windows Terminal tabs) | Solo Unix. |

## Mac: setup completo

```bash
bash setup/install-mac.sh
```

Incluye:
- Homebrew packages (Brewfile)
- Oh My Zsh + Powerlevel10k
- 99 skills globales (5 CLIs)
- 14 superpowers skills
- 7 MCP servers
- Warp config
- Terminal.app config (theme Pro, shell zsh)

## Windows: setup limitado

```powershell
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1
```

Incluye:
- Chocolatey packages (git, node, python, gh, fzf, etc.)
- PowerShell custom profile
- 99 skills globales (5 CLIs)
- 14 superpowers skills
- 7 MCP servers
- (NO incluye shell tipo Oh My Zsh — usa PowerShell nativo)

**Limitaciones en Windows:**
- Sin p10k/Oh My Zsh → usar **Oh-My-Posh** o **Starship** para tener prompt similar.
- Sin `ln -s` nativo → usar `New-Item -ItemType SymbolicLink` (con permisos admin).
- Sin zsh → PowerShell + `pwsh` (PowerShell Core).
- Brewfile no aplica → usar `choco` packages en su lugar.
- Algunos MCP servers que usan `uvx` requieren Python + uv instalados manualmente.

## Symlinks en Windows: caveats

Windows 10/11 soporta symlinks pero:
- **Requieren admin privileges** o **Developer Mode** activado (Settings → Update & Security → For Developers).
- Si no tenés admin, los symlinks fallan y el script copia los archivos (no los symlinkea). Esto significa que **futuras ediciones en AI-OS no se propagan** a tu `~/.gitconfig`, etc. Solución: usar `mklink /D` (junction) o activar Developer Mode.

## Fonts (Nerd Fonts)

| Plataforma | Instalación |
|---|---|
| Mac | `brew install --cask font-caskaydia-cove-nerd-font` |
| Windows | Descargar desde https://www.nerdfonts.com/ e instalar manualmente (doble click en .ttf) |
| Windows (choco) | `choco install nerd-fonts-caskaydia-cove` |

## Path conventions

| Path | Mac | Windows |
|---|---|---|
| Home | `~/` | `%USERPROFILE%\` o `$HOME\` |
| Config shell | `~/.zshrc` | `$PROFILE` (PowerShell) |
| SSH config | `~/.ssh/config` | `%USERPROFILE%\.ssh\config` |
| Hermes config | `~/.hermes/config.yaml` | `%USERPROFILE%\.hermes\config.yaml` |
| Skills globales | `~/.claude/skills/` | `%USERPROFILE%\.claude\skills\` |

## Testing cross-platform

Si querés verificar que AI-OS funciona en Windows desde Mac:
1. Levantar Windows VM (Parallels, VirtualBox, WSL2).
2. Clonar el repo dentro de la VM.
3. Ejecutar `setup/install-windows.ps1` desde PowerShell Admin.
4. Correr `setup/verify-windows.ps1`.

## Recomendación

- **Si tu setup primario es Mac:** usa AI-OS Mac. La experiencia es mejor (zsh, p10k, Warp).
- **Si necesitás Windows para algo específico (ej: testing IE/Edge legacy, .NET, SQL Server):** setup mínimo. Usa PowerShell con Oh-My-Posh o Starship como equivalente de p10k.
- **Si tu setup primario es Windows:** considera WSL2 (Windows Subsystem for Linux) para tener 90% de AI-OS Mac. Mucho más alineado que PowerShell nativo.
