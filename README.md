# AI-OS

> AI Operating System local — método Karpathy (Spec + Verifier + Entorno) + setup reproducible del dev env para Mac y Windows.

**¿Qué es?** Tu sistema de trabajo con IA versionado: contexto persistente, skills globales, MCP servers, dotfiles, scripts de setup. Una Mac nueva = `git clone + bash setup/install-mac.sh` = 5 min y tenés todo funcionando.

**¿Para quién?** Devs que usan múltiples CLIs (Claude Code, Codex, Gemini CLI, Antigravity, Hermes Agent) y quieren un setup consistente entre Macs.

## Quickstart

### En una Mac nueva

```bash
# 1. Clonar el repo (cambiá la URL si lo movés)
git clone https://github.com/eddremonts86/ai-os ~/Projects/ai-os
cd ~/Projects/ai-os

# 2. Instalar todo
bash setup/install-mac.sh

# 3. Verificar
bash setup/verify.sh
```

### En Windows nativo

```powershell
# 1. Abrir PowerShell como Admin
# 2. Clonar
git clone https://github.com/eddremonts86/ai-os $HOME\Projects\ai-os
cd $HOME\Projects\ai-os

# 3. Instalar
powershell -ExecutionPolicy Bypass -File .\setup\install-windows.ps1

# 4. Verificar
powershell -ExecutionPolicy Bypass -File .\setup\verify-windows.ps1
```

## Estructura

```
ai-os/
├── CLAUDE.md                    # Instrucciones maestras (AI-OS)
├── context/                     # Contexto persistente (perfil, prefs, etc.)
├── rules/                       # Reglas duras (always/ask/never)
├── specs/                       # Specs de tareas
├── verifiers/                   # Quality gates
├── skills/                      # Skills locales
├── workflows/                   # Procesos recurrentes
├── archive/                     # Specs completadas
├── outputs/                     # Artefactos generados
├── promps/                      # Prompts Karpathy originales
│
├── ai-config/                   # ⚙️ Config replicable del AI
│   ├── skills/                  #   99 skills source of truth
│   ├── mcp/                     #   7 MCP servers declarativos
│   ├── clis/                    #   Config específica por CLI
│   └── commands/                #   Snippets copy-paste
│
├── dev-env/                     # 🔧 Setup replicable del dev env
│   ├── dotfiles/                #   Source of truth configs personales
│   ├── packages/                #   Brewfile, npm-globals, pip-packages
│   └── fonts/                   #   Nerd Fonts
│
├── setup/                       # 🚀 Scripts de instalación
│   ├── install-mac.sh           #   1-comando: setup completo en Mac
│   ├── install-windows.ps1      #   1-comando: setup completo en Windows
│   ├── verify.sh                #   Verificar setup en Mac
│   ├── verify-windows.ps1       #   Verificar setup en Windows
│   └── generate-mcp-config.py   #   Genera ~/.hermes/config.yaml
│
└── docs/                        # 📚 Documentación
    ├── README.md                 #   (este archivo)
    ├── getting-started.md        #   Onboarding para nuevos users
    ├── cross-platform.md         #   Mac vs Windows: qué funciona dónde
    ├── sharing.md                #   Cómo contribuir y compartir
    └── architecture.md           #   Cómo está organizado
```

## Comandos frecuentes

```bash
# Arrancar sesión con AI-OS
hermes chat --skills ai-os-quickstart

# O desde cualquier CLI:
# Claude Code: /skill ai-os-quickstart
# Codex / Gemini: la skill se carga automática de ~/.codex/skills/ o ~/.gemini/skills/

# Verificar estado del AI-OS
bash setup/verify.sh

# Listar skills instaladas
hermes skills list | grep "imported"

# Crear nueva Spec
$EDITOR ~/Projects/ai-os/specs/current_spec.md

# Archivar Spec completada
mv ~/Projects/ai-os/specs/current_spec.md ~/Projects/ai-os/archive/$(date +%Y-%m-%d)-slug.md
```

## Links

- **Setup details:** [docs/getting-started.md](docs/getting-started.md)
- **Cross-platform:** [docs/cross-platform.md](docs/cross-platform.md)
- **Sharing/Contributing:** [docs/sharing.md](docs/sharing.md)
- **Architecture:** [docs/architecture.md](docs/architecture.md)
- **AI-OS method:** [CLAUDE.md](CLAUDE.md)
- **Required superpowers:** [CLAUDE.md sección 16](CLAUDE.md#16-️-requisito-superpowers-skills-obligatorio)

## Estado

- 99 skills globales (14 superpowers required + 84 community/custom + ai-os-karpathy + ai-os-quickstart)
- 7 MCP servers declarativos
- Setup verificado en Mac
- Setup documentado para Windows

## License

Internal.
