---
name: hermes-mcp-pattern
description: Patrones oficiales para desarrollar en hermes-agent — tools, MCP servers (manifest v1), plugins, skills (frontmatter completo con metadata.hermes), testing hermético con scripts/run_tests.sh. Aplica al contribuir al repo NousResearch/hermes-agent o al desarrollar MCP servers/plugins propios.
license: MIT
---

# Hermes Agent — Development Patterns

Repo: `/Users/edd/.hermes/hermes-agent/` (clonado, versión 0.17.0). Mantenedor: Nous Research. Esta skill refleja lo que el código real hace, no idealizaciones.

## Estructura del repo

```
hermes-agent/
├── run_agent.py
├── model_tools.py
├── toolsets.py
├── agent/
│   ├── prompt_builder.py
│   ├── memory/
│   ├── routing/
│   └── compression/
├── hermes_cli/
│   ├── commands.py        # Slash command registry
│   ├── config.py          # DEFAULT_CONFIG + env vars
│   └── main.py            # Entry point argparse
├── tools/                 # Un archivo por tool
│   ├── registry.py        # Auto-discovery por AST
│   └── <tool_name>.py
├── gateway/
│   └── platforms/         # Telegram, Discord, etc.
├── cron/
├── plugins/
│   ├── <plugin>/          # paquete Python
│   └── plugin_utils.py    # lazy_singleton, SingletonSlot
├── skills/                # Bundled (categorizadas)
│   └── <category>/<skill>/SKILL.md
├── optional-skills/       # Oficiales no bundled
├── optional-mcps/         # Catálogo MCP (manifest v1)
├── tests/                 # conftest.py hermético
├── website/               # Docusaurus
└── ui-tui/                # Vitest + React 19
```

## Tools — Registry pattern (AST auto-discover)

Hermes **descubre tools automáticamente** buscando `registry.register(...)` en top-level de archivos en `tools/*.py`. NO hay import list manual.

**Patrón por archivo `tools/my_tool.py`:**

```python
import json
import logging
from tools.registry import registry

logger = logging.getLogger(__name__)


def check_my_tool_requirements() -> bool:
    """TTL-cache 30s. Probe de deps externas. False → tool oculto."""
    return bool(...)  # env vars, bins en PATH, daemons


def my_tool_impl(param: str, task_id: str | None = None) -> str:
    """Handler. DEBE retornar JSON string."""
    try:
        return json.dumps({"result": f"processed {param}"})
    except Exception as e:
        return json.dumps({"error": str(e)})


MY_TOOL_SCHEMA = {
    "name": "my_tool",
    "description": "Specific description — LLM reads this to decide when to call.",
    "parameters": {
        "type": "object",
        "properties": {
            "param": {"type": "string", "description": "..."},
        },
        "required": ["param"],
    },
}

registry.register(
    name="my_tool",
    toolset="my_category",
    schema=MY_TOOL_SCHEMA,
    handler=lambda args, **kw: my_tool_impl(
        param=args.get("param", ""), task_id=kw.get("task_id")
    ),
    check_fn=check_my_tool_requirements,
    requires_env=["MY_API_KEY"],   # solo si aplica
    is_async=False,                 # True si handler es async
    description="Tooltip del tool",
    emoji="🔧",
)
```

**Reglas duras:**
- Handler retorna SIEMPRE `json.dumps(...)`. Nunca dict, nunca raise.
- Errores como `{"error": "..."}` en el JSON.
- Handler signature: `(args: dict, **kwargs)`. `task_id` viene en `**kwargs` para state per-session.
- `check_fn` es callable 0-arg → bool. TTL 30s, thread-safe, swallow exceptions → False. `invalidate_check_fn_cache()` para forzar invalidación tras cambios de config.
- Si `check_fn` retorna False → tool excluido silenciosamente.
- Async tools: `is_async=True`. Registry bridgea transparente. NO usar `asyncio.run` dentro.
- NO usar `__init__.py`, `registry.py`, o `mcp_tool.py` como archivos de tool.

**Toolset membership en `toolsets.py`:**
- `_HERMES_CORE_TOOLS` = bundle default-on para todas las plataformas.
- Standalone toolsets: `{name: {description, tools, includes}}`.
- Plugins que reemplazan built-ins: `registry.register(override=True)` (opt-in explícito).

## Skills — Frontmatter completo

Skills viven en `skills/<category>/<skill-name>/SKILL.md` (bundled) o `optional-skills/<category>/<skill-name>/SKILL.md` (oficiales no incluidas por default). Categorías-multiskill usan `skills/<category>/DESCRIPTION.md` como índice.

**Frontmatter YAML entre `---`:**

```yaml
---
name: my-skill-name              # kebab-case, IGUAL al directorio
description: "When to use this — be specific, drives auto-loading."
version: 1.0.0                  # semver X.Y.Z
author: "Jane Doe (jane-doe)"   # humano primero, o "Hermes Agent (adapted from ...)"
license: MIT
platforms: [linux, macos, windows]   # omitir = todos
metadata:
  hermes:
    tags: [process, debugging]
    related_skills: [other-skill]
    requires_toolsets: ["web"]      # activation condicional
    requires_tools: ["browser_navigate"]
    fallback_for_toolsets: ["safe"]  # se carga si los requires no están
    fallback_for_tools: ["browser_navigate"]
    config: {}                       # config opcional
    blueprint:                       # automation blueprint
      schedule: "every 1h"
      deliver: telegram
      prompt: "..."
      no_agent: false
required_environment_variables:      # top-level, opcional
  - name: MY_API_KEY
    prompt: "API Key for ..."
    help: "Get it from https://..."
    required_for: "Authentication to ..."
---
```

**Estructura recomendada del cuerpo:**
1. `# Skill Title`
2. `## When to Use` (trigger conditions específicas)
3. `## Quick Reference` (tabla)
4. `## Procedure` (pasos numerados)
5. `## Pitfalls` (errores comunes)
6. `## Verification` (cómo confirmar que funcionó)

**Recursos extra:**
- `references/<topic>.md` — markdown de soporte (cargado on-demand)
- `templates/<name>.md` — plantillas para output
- `scripts/<helper>.py` — helpers python (shebang `#!/usr/bin/env python3`)

## MCP Servers — manifest v1 (opcional-mcps)

Catálogo MCP en `optional-mcps/<nombre>/manifest.yaml`. Presencia en este directorio = aprobación Nous (merge por PR). `manifest_version: 1` al inicio obligatorio.

**Schema:**

```yaml
manifest_version: 1

name: my-mcp-server
description: "..."
source: https://github.com/upstream/repo

# Transport
transport:
  type: http              # o stdio
  url: https://api.example.com/mcp
  # o:
  # type: stdio
  # command: npx
  # args: ["-y", "my-mcp"]
  # (en stdio: ${INSTALL_DIR} se sustituye install-time)

# Auth
auth:
  type: api_key           # o oauth, o none
  env:
    - name: MY_API_KEY
      prompt: "Enter your API key"
      default: ""
      required: true
      secret: true
  # o auth.type: oauth (sigue el flow OAuth del provider)

# Install (opcional)
install:
  type: git
  url: https://github.com/upstream/repo
  ref: <commit-sha>        # PIN EXACTO — NO branches/tags mutables
  bootstrap:
    - npm install
    - npm run build

# Tools
tools:
  default_enabled:
    - search_docs
    - read_file
  # omitir default_enabled = checklist completo pre-marcado al instalar

# Post-install (texto libre)
post_install: |
  Restart Hermes after install.
```

**Reglas críticas:**
- **Pin exacto de git ref** obligatorio (`ref: <sha>`). NO branches, NO tags flotantes.
- Tags son mutable refs → siempre SHA completo.
- `default_enabled` opcional. Si la superficie es amplia, dejar unset y curar después.

## Plugins

Estructura por plugin: `plugins/<plugin-name>/` (paquete Python con `__init__.py`). Subcarpetas típicas: `dashboard/`.

**Dashboard plugin requiere:**
- `plugins/<name>/dashboard/manifest.json` — `{name, label, description, icon, version, tab: {path, position}, entry, css, api}`
- `plugins/<name>/dashboard/plugin_api.py` — FastAPI `APIRouter()` en `/api/plugins/<name>/`
- `plugins/<name>/dashboard/dist/index.js` + `dist/style.css` — bundle pre-built
- Auth: session token middleware del dashboard core

**Helpers obligatorios en `plugins/plugin_utils.py`:**
- `lazy_singleton` — thread-safe lazy singleton
- `SingletonSlot` — evitar race TOCTOU

**Tipos de plugins:**
- `plugins/memory/<provider>/` — backends de memoria (honcho, mem0, openviking, supermemory)
- `plugins/cron_providers/`
- `plugins/model-providers/`
- `plugins/context_engine/`
- `plugins/image_gen/`, `plugins/video_gen/`
- `plugins/platforms/` (Telegram, Discord, etc.)
- `plugins/observability/`
- `plugins/security-guidance/`

Regla: PR que añade nuevo directorio `plugins/memory/<x>/` se cierra; el provider debe ser repo propio primero.

## Testing — Patrón hermético

**Runner canónico (NO pytest directo):**

```bash
scripts/run_tests.sh                    # toda la suite
scripts/run_tests.sh tests/tools/       # un directorio
scripts/run_tests.sh tests/tools/test_x.py    # un archivo
scripts/run_tests.sh -v --tb=long       # verbose
```

Internamente ejecuta `scripts/run_tests_parallel.py`: **un subprocess `python -m pytest <file>` por archivo** (aislamiento entre archivos sin xdist). Garantiza `TZ=UTC`, `LANG=C.UTF-8`, `PYTHONHASHSEED=0`.

**`pyproject.toml`:**
- pytest 9.0.2 + pytest-asyncio 1.3.0
- `testpaths = ["tests"]`
- `markers = ["integration: ...", "real_concurrent_gate: ..."]`
- `addopts = "-m 'not integration'"` (integration excluido por default)

**`tests/conftest.py` — invariantes herméticas:**
- Unset de env vars con sufijo credencial (`_API_KEY`, `_TOKEN`, `_SECRET`, `_PASSWORD`, `_CREDENTIALS`, `_ACCESS_KEY`, `_OAUTH_TOKEN`, `_WEBHOOK_SECRET`...) + nombres explícitos AWS/ANTHROPIC.
- `HERMES_HOME` redirigido a tmpdir por-test.
- `PYTHONHASHSEED=0`.
- **Nunca** redirigir `HOME` (rompe subprocess en CI).

**Layout:**
```
tests/
├── conftest.py
├── fixtures/         # datos (plugins/, etc.)
├── fakes/            # stubs (fake_ha_server.py, etc.)
├── agent/
├── cli/
├── skills/
├── tools/
├── gateway/
├── plugins/
├── integration/      # excluido por default
├── e2e/
├── ci/
└── stress/
```

Naming: `test_*.py`. Bugfix tests con issue number: `test_delegate_cascade_49148.py`.

**Linters:**
- ruff==0.15.10 con `select = ["PLW1514"]` (preview enabled)
- ty==0.0.21 (Astral type-checker)
- `per-file-ignores = {tests/** = ["PLW1514"]}`

**Vitest para TS:**
- `ui-tui/` con `npm test` = `vitest run`

**Windows portabilidad:**
- `scripts/check-windows-footguns.py` — lint pre-push

## Slash commands

`hermes_cli/commands.py` → `COMMAND_REGISTRY` (lista de `CommandDef`). Todos los consumers (help, autocomplete, Telegram menu, Discord mapping) derivan del registry automáticamente.

```python
COMMAND_REGISTRY.append(CommandDef(
    name="mycommand",
    description="What it does",
    usage="/mycommand [args]",
    handler="my_module:handle_mycommand",
))
```

Handler en `cli.py → process_command()`. Gateway handler en `gateway/run.py` si aplica.

## Docs (Docusaurus 3.9.2 + i18n)

Stack: Docusaurus 3.9.2 + `@docusaurus/preset-classic` + `@docusaurus/theme-mermaid` + `@easyops-cn/docusaurus-search-local`. Node ≥20. React 19.

**i18n:** locales `en` (default) + `zh-Hans` en `website/i18n/zh-Hans/`.

**Frontmatter por página:**
```yaml
---
sidebar_position: 1
title: "My Page Title"
description: "SEO + preview text."
sidebar_label: "Short label"  # opcional
hide_title: false              # opcional
hide_table_of_contents: false # opcional
---
```

**Sidebar en `website/sidebars.ts`** (declarativo, no autogenerado):
```ts
{
  type: 'category',
  label: 'Getting Started',
  collapsed: false,
  items: ['getting-started/quickstart', 'getting-started/installation'],
}
```

**Categorías con `_category_.json`** para autogenerar índice:
```json
{"label": "Getting Started", "position": 1, "link": {"type": "generated-index", "description": "..."}, "collapsible": true, "collapsed": false}
```

Secciones: `getting-started/` (pos 1), `guides/` (pos 2), `developer-guide/` (pos 3), `reference/` (pos 4).

Auto-generados:
- `reference/skills-catalog.md` (de `website/scripts/generate-skill-docs.py`)
- `reference/optional-skills-catalog.md`
- `reference/automation-blueprints-catalog.mdx` (de `extract-automation-blueprints.py`)

## Setup local

```bash
# Auto-setup (detecta Termux vs desktop)
./setup-hermes.sh

# Manual
uv venv venv --python 3.11
export VIRTUAL_ENV="$(pwd)/venv"
uv pip install -e ".[all,dev]"
npm install   # para browser tools

# Config
mkdir -p ~/.hermes/{cron,sessions,logs,memories,skills}
cp cli-config.yaml.example ~/.hermes/config.yaml
touch ~/.hermes/.env

# Verificar
hermes doctor
hermes chat -q "Hello"
hermes model         # picker interactivo
hermes setup         # wizard
```

Python: 3.11+ (`requires-python = ">=3.11,<3.14"`). Cap <3.14 por wheels Rust.

**Perfiles multi-instancia:** `~/.hermes/profiles/<name>/` con skills/plugins/cron/memories aislados. Usar `get_hermes_home()` de `hermes_constants` en code paths; `display_hermes_home()` para mensajes user-facing. **Nunca hardcodear `~/.hermes`.**

## Git / CI / Releases

**Commits: Conventional Commits estricto.**

Formato: `<type>(<scope>): <description>`. Types: `fix`, `feat`, `docs`, `test`, `refactor`, `chore`. Scopes comunes: `cli`, `gateway`, `tools`, `skills`, `agent`, `install`, `whatsapp`, `security`.

Ejemplos reales:
- `fix(cli): prevent crash in save_config_value when model is a string`
- `feat(gateway): add WhatsApp multi-user session isolation`

**Branches:** prefijo por tipo — `fix/description`, `feat/description`. Crear con `git checkout -b fix/description` antes de tests.

**PR template** (`.github/PULL_REQUEST_TEMPLATE.md`): secciones `What does this PR do?`, `Related Issue`, `How to test`. **Un cambio lógico por PR** (no mezclar fix + refactor + feat).

**Regla pin exacto:** Git URLs → SHA completo. GitHub Actions → `uses: owner/action@<sha>  # vX.Y.Z` con comentario de versión. Tags son mutable refs.

**Prioridades de contribución (orden):** bug fixes → cross-platform → security → performance/robustness → new skills → new tools → docs.

**CI workflows** (orquestador `ci.yml` con `detect-changes` + sub-workflows):
- `tests.yml` — pytest paralelo (slice_count=8)
- `lint.yml` — ruff + ty (advisory + bloqueante PLW1514)
- `typecheck.yml` — TS matrix ui-tui/web/apps
- `docker-lint.yml`, `docker.yml`, `deploy-site.yml`
- `docs-site-checks.yml`
- `osv-scanner.yml`, `supply-chain-audit.yml`
- `skills-index.yml` + `skills-index-freshness.yml`
- `uv-lockfile-check.yml`, `history-check.yml`, `contributor-check.yml`
- `upload_to_pypi.yml`

Concurrency groups con `cancel-in-progress: true`.

**Releases:** `scripts/release.py`. Versionado semver en `pyproject.toml` (`version = "0.17.0"`). Bump version + `uv lock` coordinados.

## Convenciones de código

| Aspecto | Convención |
|---|---|
| Python style | Ruff (PLW1514 + preview), line length default |
| Type hints | Obligatorios en funciones públicas |
| Logger | `logger = logging.getLogger(__name__)` per module, nunca `print()` |
| Paths | `get_hermes_home()` de `hermes_constants`, nunca `~/.hermes` |
| Async | `is_async=True` en registry, NO `asyncio.run` interno |
| Errors | `{"error": "..."}` en JSON, nunca raise desde handler |
| Plugin singletons | `lazy_singleton` / `SingletonSlot` (thread-safe) |
| Frontmatter `name:` | kebab-case, IGUAL al directorio |
| Conventional Commits | `<type>(<scope>): <description>` |
| Git deps | SHA completo, no branches/tags |

## Invariantes críticas

1. **Prompt caching** — no cambiar contexto/tools/system prompt mid-conversation.
2. **Message alternation** — nunca dos assistant o dos user consecutivos.
3. **Tool output** — siempre JSON string (success/error).
4. **Config** — valores en `config.yaml`, secrets en `.env`.
5. **Tool registry** — auto-discover por AST, no import manual.
6. **`check_fn`** — TTL 30s, swallow exceptions, retornar False oculta tool.
7. **MCP manifest** — pin exacto de git refs (SHA, no tag).
8. **Tests** — `scripts/run_tests.sh`, no pytest directo. Conftest unset credentials.
9. **Perfiles** — `get_hermes_home()` para paths, nunca hardcoded.
10. **i18n** — Docs en `en` + `zh-Hans`. Variantes `*.es.md`, `*.zh-CN.md` para READMEs.

## Recursos del repo

- `CONTRIBUTING.md` — proceso de contribución
- `SECURITY.md` — reportar vulnerabilidades
- `website/docs/developer-guide/` — guías autorales (adding-tools, adding-skills, build-a-hermes-plugin)
- `scripts/run_tests.sh` — testing canónico
- `scripts/release.py` — release tooling
- `scripts/check-windows-footguns.py` — portabilidad Windows