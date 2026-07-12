# AI-OS — Resumen en español (navegación rápida)

**MDX completo**: `docs/ai-os-overview.mdx` (32 KB, 15 secciones).
Este archivo es el índice rápido.

## qué es AI-OS

el sistema operativo local que corre agentes (Hermes / Claude Code / Codex / etc.)
en tu Mac. **no es un agente** — es la **infraestructura** sobre la que corren:

- estructura de carpetas (`AGENTS.md`, `context/`, `specs/`, `verifiers/`, `rules/`,
  `skills/`, `workflows/`, `outputs/`, `archive/`)
- **stack de memoria persistente** (FalkorDB + Ollama + codebase-memory-mcp + grepai)
- **CLI `ai-os memory`** para gestionar el stack
- **CLI `ai-os loop`** para orquestrar loops reutilizables
- **10MCPs** registrados en `~/.hermes/config.yaml`
- skills cargables por cualquier agente

## cómo se instala

```bash
cd /Users/edd/Projects/ai-os
bash setup/install-mac.sh   # idempotente
bash setup/verify.sh        # 38 checks, debe decir "AI-OS is correctly installed. 🎉"
exec zsh                   # nueva terminal para que el alias `ai-os` se cargue
```

el script:

1. instala brew packages (docker, ollama, uv)
2. arranca FalkorDB en docker
3. arranca `ollama serve` en background (puerto 11500)
4. pulla el modelo `nomic-embed-text` (274 MB)
5. descarga `codebase-memory-mcp` v0.8.1 y `grepai` v0.35.0 a `~/.local/bin/`
6. genera `~/.hermes/config.yaml` con 10MCPs (7 existentes + 3 memory)
7. crea alias `ai-os` en `~/.zshrc`

## servicios del stack de memoria

| servicio | puerto | qué hace |
|---|---|---|
| FalkorDB | `3300` (web) + `6390` (redis) | grafo de entidades (decisiones, proyectos) |
| Ollama | `11500` | embeddings `nomic-embed-text` (768d) |
| codebase-memory-mcp | `9749` (web) | AST del código (funciones, calls, imports) |
| grepai | n/a (CLI) | semantic code search local |

todos los puertos están en rangos reservados: `3000-3999` (web), `6300-6900`
(db), `11000-11999` (AI).

## comandos principales

### memory
```bash
ai-os memory status          # health de los 4 servicios + node counts
ai-os memory browse          # abre FalkorDB Web UI
ai-os memory visualize       # abre FalkorDB + cbm UI
ai-os memory reindex <path>   # indexa AST de un repo
ai-os memory search "<q>"    # tier 1 grepai → tier 2 cbm (fallback)
ai-os memory query "<q>"      # grepai-only
ai-os memory sync-sessions 90 # ingiere sesiones de Hermes a FalkorDB
ai-os memory start / stop / logs
```

### loops
```bash
ai-os loop ls                # lista loops registrados
ai-os loop add <dir>         # registra (requiere TASK.md + LOOP_INSTRUCTIONS.md)
ai-os loop status <id>       # archivos, level, last activity
ai-os loop show <id>         # cat PROGRESS.md del loop
ai-os loop show PROGRESS.md  # cross-loop log
ai-os loop pause <id>        # desactiva scheduling
ai-os loop rm <id>           # marca como removed (no borra el dir)
ai-os loop run <id>          # abre Terminal + print del run prompt
```

### MCPs
```bash
python3 ~/Projects/ai-os/setup/generate-mcp-config.py \
  ~/Projects/ai-os/ai-config/mcp \
  ~/.hermes/config.yaml
# regenera el config desde los YAMLs en ai-config/mcp/
```

## estructura de un loop (4 archivos)

```
my-loop/
├── TASK.md              # el goal
├── LOOP_INSTRUCTIONS.md  # cómo claude debe correr el loop
├── PROGRESS.md          # memoria cross-runs
└── outputs/             # dónde claude escribe
```

templates en `workflows/loop_template.md` (copia-pega).

## 6 niveles de blast-radius (rules/loop_safety.md)

| nivel | qué hace |
|---|---|
| 1 | read only |
| 2 | escribe solo a `outputs/` |
| 3 | edits en sandbox |
| 4 | prepara external actions pero no las envía |
| 5 | requiere human approval |
| 6 | automated low-risk |

**regla**: máximo nivel 3 por default. promotion requiere 5+ runs exitosas
en el nivel previo, registrado en `PROGRESS.md`.

## skills disponibles

- **`ai-os-memory`** — gestiona el stack de memoria
- **`ai-os-loop`** — crea y registra loops
- core AI-OS: `using-superpowers`, `brainstorming`, `writing-plans`,
  `executing-plans`, `verification-before-completion`, `code-review-and-quality`,
  `finishing-a-development-branch`
- workflows: `daily_start`, `project_start`, `coding`, `research`, `content_creation`

cargar en Hermes: `hermes chat --skills ai-os-memory,ai-os-loop`

## el método Spec → Verifier → Environment

1. lee `CLAUDE.md` + context/
2. si no hay Spec → `workflows/project_start.md` (produce uno)
3. ejecuta en bloques de ≤30 min
4. entre bloques → corre `verifiers/critic_prompt.md`
5. archiva los Specs terminados en `archive/YYYY-MM-DD-<slug>.md`

## troubleshooting rápido

| problema | fix |
|---|---|
| `ai-os: command not found` | `source ~/.zshrc` o `exec zsh` |
| FalkorDB not running | `docker compose -f ~/Projects/ai-os/memory/falkordb/docker-compose.yml up -d` |
| Ollama not running | `OLLAMA_HOST=127.0.0.1:11500 /opt/homebrew/opt/ollama/bin/ollama serve &` |
| MCP not in config | regenerar con `generate-mcp-config.py` |
| `search_code: project not found` | bug conocido del binary v0.8.1 — usar `list_projects` o reindex |
| loop_state corrupto | `rm -rf ~/Projects/ai-os/memory/loop_state` y re-registrar |

## archivos clave (paths absolutos)

- **fuente de verdad**: `/Users/edd/Projects/ai-os/`
- **CLI memory**: `~/.local/bin/ai-os` (symlink a `~/Projects/ai-os/memory/ai-os-memory.sh`)
- **CLI loop**: `~/.local/bin/ai-os-loop`
- **Hermes config**: `~/.hermes/config.yaml` (regenerable)
- **Documento completo**: `~/Projects/ai-os/docs/ai-os-overview.mdx`
- **FalkorDB web UI**: `http://localhost:3300`
- **codebase-memory-mcp web UI**: `http://localhost:9749`
- **Ollama API**: `http://localhost:11500`

## quickstart 90 segundos

```bash
bash ~/Projects/ai-os/setup/install-mac.sh
bash ~/Projects/ai-os/setup/verify.sh
exec zsh
ai-os memory status
ai-os memory reindex /Users/edd/Projects
ai-os memory search "where is the Spec+Verifier loop" /Users/edd/Projects
ai-os memory visualize
mkdir -p ~/my-loop/outputs
# llenar TASK.md y LOOP_INSTRUCTIONS.md (template en workflows/loop_template.md)
ai-os loop add ~/my-loop
hermes chat --skills ai-os-memory,ai-os-loop
```

eso es todo. tienes el Spec→Verifier→Environment loop, el stack de
memoria persistente, y el CLI de loops. todo en tu Mac. todo
vendor-neutral.
