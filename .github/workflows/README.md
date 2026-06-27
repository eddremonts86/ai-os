# GitHub Actions CI

> Tres workflows que validan que `install-{mac,linux,windows}` y `verify-*` funcionan en dry-run mode.

## Workflows

| Workflow | OS | Triggers | Tiempo estimado |
|---|---|---|---|
| `test-mac.yml` | `macos-latest` (GitHub runner) | PR + push a main | 3-5 min |
| `test-linux.yml` | `ubuntu-latest` (GitHub runner) | PR + push a main | 2-3 min |
| `test-windows.yml` | `windows-latest` (GitHub runner) | PR + push a main | 5-8 min |

## Qué testean

Los workflows ejecutan `install-{mac,windows}.sh/ps1` con `DRY_RUN=1`. Esto:

1. **NO** instala packages reales (Brew, Chocolatey, npm, pip).
2. **NO** modifica el sistema del runner.
3. **SÍ** valida que el script corre sin errores de sintaxis.
4. **SÍ** valida estructura AI-OS, Brewfile, MCP YAMLs, frontmatter de skills.
5. **SÍ** simula symlinks en un HOME temporal.

## Qué NO testean (requiere test manual)

- Instalación real de packages (tarda 10-15 min, puede fallar por rate limits).
- Interactividad (p10k wizard, prompts de Windows).
- Configuración real del OS (Warp defaults, Terminal.app).
- Conexión a servicios externos (GitHub API para gh CLI, etc.).

## Cómo correr local

Simular lo que hace CI en tu máquina:

```bash
# Mac
DRY_RUN=1 bash setup/install-mac.sh

# Linux (cambia $HOME a algo escribible)
DRY_RUN=1 bash setup/install-mac.sh

# Windows (PowerShell)
$env:DRY_RUN = "1"
powershell -File .\setup\install-windows.ps1
```

## Cuándo se rompe

Si un workflow falla en CI:

1. Ver el log completo en GitHub Actions.
2. Identificar qué check falló (estructura, Brewfile, MCP, frontmatter, etc.).
3. Si es un error legítimo → fix y push.
4. Si es un falso positivo (ej: yq no instalado en runner) → agregar step de install.

## Limitaciones de runners

- **macOS runner:** tiene Xcode CLI tools, brew, git preinstalados. NO tiene Warp, p10k, ni Oh My Zsh.
- **Linux runner:** tiene apt-get, snap, git, python preinstalados.
- **Windows runner:** tiene PowerShell Core, git, choco preinstalados.

Si un check requiere tools específicas (Warp, Powerlevel10k), el verify.sh marca `warn` (no fail) en dry-run. Solo errores de sintaxis/lógica son `err` (fail).

## Triggers

```yaml
on:
  pull_request:
    branches: [main]
  push:
    branches: [main]
```

- **PRs a main:** corre antes de mergear.
- **Push a main:** corre después de mergear.

Para correr manual: Actions tab → "Test macOS" / "Test Linux" / "Test Windows" → Run workflow.

## Costos

GitHub Actions:
- **macOS runner:** 10x más caro que Linux (~$0.08/min).
- **Linux runner:** gratis para repos públicos, gratis hasta 2000 min/mes para privados.
- **Windows runner:** 2x más caro que Linux.

Setup actual: 3 workflows × ~5 min promedio × 10 min timeout = ~30 min por PR.

**Para repo privado:** ~$0.50 por PR con macOS, ~$0.05 con Linux/Windows.

## Próximas mejoras

- [ ] Agregar test de `install-mac.sh` real (con brew bundle) en un job separado (15 min timeout).
- [ ] Cachear `node_modules` y Python deps.
- [ ] Agregar badge de status al README.
- [ ] Matrix strategy: probar en macos-13, macos-14, ubuntu-22.04, ubuntu-24.04, windows-2022, windows-2025.
