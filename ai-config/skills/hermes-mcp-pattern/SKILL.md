---
name: hermes-mcp-pattern
description: Official patterns for developing in hermes-agent — tools, MCP servers (manifest v1), plugins, skills (full frontmatter with metadata.hermes), hermetic testing with scripts/run_tests.sh. Applies when contributing to the NousResearch/hermes-agent repo or developing own MCP servers/plugins.
license: MIT
---

# Hermes Agent — Development Patterns

Repo: `/Users/edd/.hermes/hermes-agent/` (cloned, version 0.17.0). Maintainer: Nous Research. This skill reflects what the actual code does, not idealizations.

## Repo structure

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
├── tools/                 # One file per tool
│   ├── registry.py        # Auto-discovery via AST
│   └── <tool_name>.py
├── gateway/
│   └── platforms/         # Telegram, Discord, etc.
├── cron/
├── plugins/
│   ├── <plugin>/          # Python package
│   └── plugin_utils.py    # lazy_singleton, SingletonSlot
├── skills/                # Bundled (categorized)
│   └── <category>/<skill>/SKILL.md
├── optional-skills/       # Official, not bundled
├── optional-mcps/         # MCP catalog (manifest v1)
├── tests/                 # hermetic conftest.py
├── website/               # Docusaurus
└── ui-tui/                # Vitest + React 19
```

## Tools — Registry pattern (AST auto-discover)

Hermes **discovers tools automatically** by searching for `registry.register(...)` at top-level of files in `tools/*.py`. There is NO manual import list.

**Pattern per file `tools/my_tool.py`:**

```python
import json
import logging
from tools.registry import registry

logger = logging.getLogger(__name__)


def check_my_tool_requirements() -> bool:
    """30s TTL-cache. Probe for external deps. False → tool hidden."""
    return bool(...)  # env vars, bins in PATH, daemons


def my_tool_impl(param: str, task_id: str | None = None) -> str:
    """Handler. MUST return JSON string."""
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
    requires_env=["MY_API_KEY"],   # only if applicable
    is_async=False,                 # True if handler is async
    description="Tooltip for the tool",
    emoji="🔧",
)
```

**Hard rules:**
- Handler ALWAYS returns `json.dumps(...)`. Never dict, never raise.
- Errors as `{"error": "..."}` in the JSON.
- Handler signature: `(args: dict, **kwargs)`. `task_id` comes in `**kwargs` for per-session state.
- `check_fn` is a 0-arg callable → bool. TTL 30s, thread-safe, swallows exceptions → False. `invalidate_check_fn_cache()` to force invalidation after config changes.
- If `check_fn` returns False → tool excluded silently.
- Async tools: `is_async=True`. Registry bridges transparently. Do NOT use `asyncio.run` inside.
- Do NOT use `__init__.py`, `registry.py`, or `mcp_tool.py` as tool files.

**Toolset membership in `toolsets.py`:**
- `_HERMES_CORE_TOOLS` = default-on bundle for all platforms.
- Standalone toolsets: `{name: {description, tools, includes}}`.
- Plugins that replace built-ins: `registry.register(override=True)` (explicit opt-in).

## Skills — Complete frontmatter

Skills live in `skills/<category>/<skill-name>/SKILL.md` (bundled) or `optional-skills/<category>/<skill-name>/SKILL.md` (official, not included by default). Multi-skill categories use `skills/<category>/DESCRIPTION.md` as index.

**YAML frontmatter between `---`:**

```yaml
---
name: my-skill-name              # kebab-case, EQUAL to directory
description: "When to use this — be specific, drives auto-loading."
version: 1.0.0                  # semver X.Y.Z
author: "Jane Doe (jane-doe)"   # human first, or "Hermes Agent (adapted from ...)"
license: MIT
platforms: [linux, macos, windows]   # omit = all
metadata:
  hermes:
    tags: [process, debugging]
    related_skills: [other-skill]
    requires_toolsets: ["web"]      # conditional activation
    requires_tools: ["browser_navigate"]
    fallback_for_toolsets: ["safe"]  # loaded if requires are missing
    fallback_for_tools: ["browser_navigate"]
    config: {}                       # optional config
    blueprint:                       # automation blueprint
      schedule: "every 1h"
      deliver: telegram
      prompt: "..."
      no_agent: false
required_environment_variables:      # top-level, optional
  - name: MY_API_KEY
    prompt: "API Key for ..."
    help: "Get it from https://..."
    required_for: "Authentication to ..."
---
```

**Recommended body structure:**
1. `# Skill Title`
2. `## When to Use` (specific trigger conditions)
3. `## Quick Reference` (table)
4. `## Procedure` (numbered steps)
5. `## Pitfalls` (common mistakes)
6. `## Verification` (how to confirm it worked)

**Extra resources:**
- `references/<topic>.md` — support markdown (loaded on-demand)
- `templates/<name>.md` — output templates
- `scripts/<helper>.py` — Python helpers (shebang `#!/usr/bin/env python3`)

## MCP Servers — manifest v1 (optional-mcps)

MCP catalog in `optional-mcps/<name>/manifest.yaml`. Presence in this directory = Nous approval (merge via PR). `manifest_version: 1` at the start required.

**Schema:**

```yaml
manifest_version: 1

name: my-mcp-server
description: "..."
source: https://github.com/upstream/repo

# Transport
transport:
  type: http              # or stdio
  url: https://api.example.com/mcp
  # or:
  # type: stdio
  # command: npx
  # args: ["-y", "my-mcp"]
  # (in stdio: ${INSTALL_DIR} is substituted at install time)

# Auth
auth:
  type: api_key           # or oauth, or none
  env:
    - name: MY_API_KEY
      prompt: "Enter your API key"
      default: ""
      required: true
      secret: true
  # or auth.type: oauth (follows the provider's OAuth flow)

# Install (optional)
install:
  type: git
  url: https://github.com/upstream/repo
  ref: <commit-sha>        # EXACT PIN — NO mutable branches/tags
  bootstrap:
    - npm install
    - npm run build

# Tools
tools:
  default_enabled:
    - search_docs
    - read_file
  # omit default_enabled = full checklist pre-checked at install

# Post-install (free text)
post_install: |
  Restart Hermes after install.
```

**Critical rules:**
- **Exact git ref pin** required (`ref: <sha>`). NO branches, NO floating tags.
- Tags are mutable refs → always full SHA.
- `default_enabled` optional. If the surface is wide, leave unset and curate later.

## Plugins

Structure per plugin: `plugins/<plugin-name>/` (Python package with `__init__.py`). Typical subfolders: `dashboard/`.

**Dashboard plugin requires:**
- `plugins/<name>/dashboard/manifest.json` — `{name, label, description, icon, version, tab: {path, position}, entry, css, api}`
- `plugins/<name>/dashboard/plugin_api.py` — FastAPI `APIRouter()` at `/api/plugins/<name>/`
- `plugins/<name>/dashboard/dist/index.js` + `dist/style.css` — pre-built bundle
- Auth: session token middleware from dashboard core

**Required helpers in `plugins/plugin_utils.py`:**
- `lazy_singleton` — thread-safe lazy singleton
- `SingletonSlot` — avoid TOCTOU race

**Plugin types:**
- `plugins/memory/<provider>/` — memory backends (honcho, mem0, openviking, supermemory)
- `plugins/cron_providers/`
- `plugins/model-providers/`
- `plugins/context_engine/`
- `plugins/image_gen/`, `plugins/video_gen/`
- `plugins/platforms/` (Telegram, Discord, etc.)
- `plugins/observability/`
- `plugins/security-guidance/`

Rule: PRs adding a new directory `plugins/memory/<x>/` are closed; the provider must be its own repo first.

## Testing — Hermetic pattern

**Canonical runner (NOT pytest directly):**

```bash
scripts/run_tests.sh                    # full suite
scripts/run_tests.sh tests/tools/       # one directory
scripts/run_tests.sh tests/tools/test_x.py    # one file
scripts/run_tests.sh -v --tb=long       # verbose
```

Internally runs `scripts/run_tests_parallel.py`: **one `python -m pytest <file>` subprocess per file** (isolation between files without xdist). Guarantees `TZ=UTC`, `LANG=C.UTF-8`, `PYTHONHASHSEED=0`.

**`pyproject.toml`:**
- pytest 9.0.2 + pytest-asyncio 1.3.0
- `testpaths = ["tests"]`
- `markers = ["integration: ...", "real_concurrent_gate: ..."]`
- `addopts = "-m 'not integration'"` (integration excluded by default)

**`tests/conftest.py` — hermetic invariants:**
- Unset env vars with credential suffix (`_API_KEY`, `_TOKEN`, `_SECRET`, `_PASSWORD`, `_CREDENTIALS`, `_ACCESS_KEY`, `_OAUTH_TOKEN`, `_WEBHOOK_SECRET`...) + explicit AWS/ANTHROPIC names.
- `HERMES_HOME` redirected to tmpdir per-test.
- `PYTHONHASHSEED=0`.
- **Never** redirect `HOME` (breaks subprocess in CI).

**Layout:**
```
tests/
├── conftest.py
├── fixtures/         # data (plugins/, etc.)
├── fakes/            # stubs (fake_ha_server.py, etc.)
├── agent/
├── cli/
├── skills/
├── tools/
├── gateway/
├── plugins/
├── integration/      # excluded by default
├── e2e/
├── ci/
└── stress/
```

Naming: `test_*.py`. Bugfix tests with issue number: `test_delegate_cascade_49148.py`.

**Linters:**
- ruff==0.15.10 with `select = ["PLW1514"]` (preview enabled)
- ty==0.0.21 (Astral type-checker)
- `per-file-ignores = {tests/** = ["PLW1514"]}`

**Vitest for TS:**
- `ui-tui/` with `npm test` = `vitest run`

**Windows portability:**
- `scripts/check-windows-footguns.py` — pre-push lint

## Slash commands

`hermes_cli/commands.py` → `COMMAND_REGISTRY` (list of `CommandDef`). All consumers (help, autocomplete, Telegram menu, Discord mapping) derive from the registry automatically.

```python
COMMAND_REGISTRY.append(CommandDef(
    name="mycommand",
    description="What it does",
    usage="/mycommand [args]",
    handler="my_module:handle_mycommand",
))
```

Handler in `cli.py → process_command()`. Gateway handler in `gateway/run.py` if applicable.

## Docs (Docusaurus 3.9.2 + i18n)

Stack: Docusaurus 3.9.2 + `@docusaurus/preset-classic` + `@docusaurus/theme-mermaid` + `@easyops-cn/docusaurus-search-local`. Node ≥20. React 19.

**i18n:** locales `en` (default) + `zh-Hans` in `website/i18n/zh-Hans/`.

**Frontmatter per page:**
```yaml
---
sidebar_position: 1
title: "My Page Title"
description: "SEO + preview text."
sidebar_label: "Short label"  # optional
hide_title: false              # optional
hide_table_of_contents: false # optional
---
```

**Sidebar in `website/sidebars.ts`** (declarative, not autogenerated):
```ts
{
  type: 'category',
  label: 'Getting Started',
  collapsed: false,
  items: ['getting-started/quickstart', 'getting-started/installation'],
}
```

**Categories with `_category_.json`** to autogenerate index:
```json
{"label": "Getting Started", "position": 1, "link": {"type": "generated-index", "description": "..."}, "collapsible": true, "collapsed": false}
```

Sections: `getting-started/` (pos 1), `guides/` (pos 2), `developer-guide/` (pos 3), `reference/` (pos 4).

Auto-generated:
- `reference/skills-catalog.md` (from `website/scripts/generate-skill-docs.py`)
- `reference/optional-skills-catalog.md`
- `reference/automation-blueprints-catalog.mdx` (from `extract-automation-blueprints.py`)

## Local setup

```bash
# Auto-setup (detects Termux vs desktop)
./setup-hermes.sh

# Manual
uv venv venv --python 3.11
export VIRTUAL_ENV="$(pwd)/venv"
uv pip install -e ".[all,dev]"
npm install   # for browser tools

# Config
mkdir -p ~/.hermes/{cron,sessions,logs,memories,skills}
cp cli-config.yaml.example ~/.hermes/config.yaml
touch ~/.hermes/.env

# Verify
hermes doctor
hermes chat -q "Hello"
hermes model         # interactive picker
hermes setup         # wizard
```

Python: 3.11+ (`requires-python = ">=3.11,<3.14"`). Cap <3.14 due to Rust wheels.

**Multi-instance profiles:** `~/.hermes/profiles/<name>/` with isolated skills/plugins/cron/memories. Use `get_hermes_home()` from `hermes_constants` in code paths; `display_hermes_home()` for user-facing messages. **Never hardcode `~/.hermes`.**

## Git / CI / Releases

**Commits: strict Conventional Commits.**

Format: `<type>(<scope>): <description>`. Types: `fix`, `feat`, `docs`, `test`, `refactor`, `chore`. Common scopes: `cli`, `gateway`, `tools`, `skills`, `agent`, `install`, `whatsapp`, `security`.

Real examples:
- `fix(cli): prevent crash in save_config_value when model is a string`
- `feat(gateway): add WhatsApp multi-user session isolation`

**Branches:** prefix by type — `fix/description`, `feat/description`. Create with `git checkout -b fix/description` before tests.

**PR template** (`.github/PULL_REQUEST_TEMPLATE.md`): sections `What does this PR do?`, `Related Issue`, `How to test`. **One logical change per PR** (don't mix fix + refactor + feat).

**Exact pin rule:** Git URLs → full SHA. GitHub Actions → `uses: owner/action@<sha>  # vX.Y.Z` with version comment. Tags are mutable refs.

**Contribution priorities (order):** bug fixes → cross-platform → security → performance/robustness → new skills → new tools → docs.

**CI workflows** (orchestrator `ci.yml` with `detect-changes` + sub-workflows):
- `tests.yml` — parallel pytest (slice_count=8)
- `lint.yml` — ruff + ty (advisory + blocking PLW1514)
- `typecheck.yml` — TS matrix ui-tui/web/apps
- `docker-lint.yml`, `docker.yml`, `deploy-site.yml`
- `docs-site-checks.yml`
- `osv-scanner.yml`, `supply-chain-audit.yml`
- `skills-index.yml` + `skills-index-freshness.yml`
- `uv-lockfile-check.yml`, `history-check.yml`, `contributor-check.yml`
- `upload_to_pypi.yml`

Concurrency groups with `cancel-in-progress: true`.

**Releases:** `scripts/release.py`. Semver versioning in `pyproject.toml` (`version = "0.17.0"`). Bump version + `uv lock` coordinated.

## Code conventions

| Aspect | Convention |
|---|---|
| Python style | Ruff (PLW1514 + preview), default line length |
| Type hints | Required on public functions |
| Logger | `logger = logging.getLogger(__name__)` per module, never `print()` |
| Paths | `get_hermes_home()` from `hermes_constants`, never `~/.hermes` |
| Async | `is_async=True` in registry, NO `asyncio.run` internal |
| Errors | `{"error": "..."}` in JSON, never raise from handler |
| Plugin singletons | `lazy_singleton` / `SingletonSlot` (thread-safe) |
| Frontmatter `name:` | kebab-case, EQUAL to directory |
| Conventional Commits | `<type>(<scope>): <description>` |
| Git deps | Full SHA, no branches/tags |

## Critical invariants

1. **Prompt caching** — don't change context/tools/system prompt mid-conversation.
2. **Message alternation** — never two consecutive assistant or two user messages.
3. **Tool output** — always JSON string (success/error).
4. **Config** — values in `config.yaml`, secrets in `.env`.
5. **Tool registry** — auto-discover via AST, no manual import.
6. **`check_fn`** — TTL 30s, swallow exceptions, returning False hides the tool.
7. **MCP manifest** — exact git ref pin (SHA, not tag).
8. **Tests** — `scripts/run_tests.sh`, not pytest directly. Conftest unsets credentials.
9. **Profiles** — `get_hermes_home()` for paths, never hardcoded.
10. **i18n** — Docs in `en` + `zh-Hans`. Variants `*.es.md`, `*.zh-CN.md` for READMEs.

## Repo resources

- `CONTRIBUTING.md` — contribution process
- `SECURITY.md` — report vulnerabilities
- `website/docs/developer-guide/` — authorial guides (adding-tools, adding-skills, build-a-hermes-plugin)
- `scripts/run_tests.sh` — canonical testing
- `scripts/release.py` — release tooling
- `scripts/check-windows-footguns.py` — Windows portability