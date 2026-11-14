#!/usr/bin/env python3
"""Propagate AI-OS's MCP server definitions into native IDE/CLI configs.

setup/generate-mcp-config.py already does this for Hermes (~/.hermes/config.yaml).
This script does the same for the other AI clients that read their OWN config
format instead: VS Code (Copilot Chat), Codex CLI, Claude Code, and Gemini CLI.
Source of truth is unchanged: ai-config/mcp/*.yaml.

Merge policy (same everywhere): ONLY ADD a server whose name doesn't already
exist in the target config. NEVER overwrite an existing entry with the same
name -- a user may have hand-customized it (confirmed real case: this
machine's VS Code "filesystem" server already pointed at different directories
than ai-os's own filesystem.yaml). Every other key in the target file is left
byte-for-byte alone.

Claude Code note: ~/.claude.json is a live session-state file (auth cache,
feature flags, growthbook data, etc.), not a plain settings file. We still
edit it directly here (same read-whole-json / touch only "mcpServers" /
write-whole-json-back approach as the other JSON targets) rather than
shelling out to `claude mcp add`, because `claude` was not reliably resolvable
in every shell on this machine during development. This is safe for JSON
specifically (no comments/formatting to lose, unlike YAML/TOML), but treat
this file with extra care if you ever change this script.

Usage:
  python3 setup/sync-ide-mcp-servers.py <mcp_dir> \
      [--vscode PATH] [--vscode-insiders PATH] [--codex PATH] [--claude PATH] [--gemini PATH]

Any flag can be omitted (e.g. a client not installed on this machine) --
omitted targets are skipped entirely, no file is touched or created.
"""

import argparse
import json
import os
import sys
import tempfile
from pathlib import Path

try:
    import yaml
except ImportError:
    yaml = None

try:
    import tomlkit
except ImportError:
    tomlkit = None


sys.path.insert(0, str(Path(__file__).resolve().parent))
import aios_profile  # noqa: E402  (per-person MCP overrides)


def fail(message):
    print(f"Error: {message}", file=sys.stderr)
    return 1


def load_yaml_mapping(path, label):
    with path.open(encoding="utf-8") as stream:
        value = yaml.safe_load(stream)
    if value is None:
        return {}
    if not isinstance(value, dict):
        raise ValueError(f"{label} {path} must contain a YAML mapping")
    return value


AI_OS_ROOT = str(Path(__file__).resolve().parent.parent)


def expand_home(value, home):
    return (str(value).replace("${HOME}", home).replace("${USERPROFILE}", home)
            .replace("${AI_OS_ROOT}", AI_OS_ROOT))


def service_answers(url, timeout=2):
    """True when url answers at all (any HTTP status). Used by `requires_url`: an MCP server that is a local
    service on its own (ui-indexador) is registered only on machines where that service runs."""
    import urllib.error
    import urllib.request
    try:
        urllib.request.urlopen(url, timeout=timeout).close()
        return True
    except urllib.error.HTTPError:
        return True
    except Exception:
        return False


def load_definitions(mcp_dir, home):
    """Return (enabled definitions, names of disabled ones). Disabled names are
    removed from every target, so `enabled: false` actually retires a server."""
    definitions, disabled = [], []
    raw = [load_yaml_mapping(path, "MCP definition") for path in sorted(mcp_dir.glob("*.yaml"))]
    if aios_profile.applies_to(mcp_dir):
        raw = aios_profile.apply_mcp(raw, aios_profile.load())
    for definition in raw:
        name = definition.get("name")
        if not isinstance(name, str) or not name:
            raise ValueError(f"MCP definition {definition!r} requires a non-empty string name")
        if not definition.get("enabled", True):
            disabled.append(name)
            continue
        requires = definition.get("requires_url")
        if requires and not service_answers(requires):
            # Not running here: neither add nor remove it, so a briefly stopped service keeps its entry.
            print(f"  {name}: skipped, {requires} does not answer (its service is not running here)")
            continue
        transport = definition.get("transport", "stdio")
        entry = {"name": name, "transport": transport}
        if transport == "stdio":
            command = definition.get("command")
            args = definition.get("args", [])
            if not isinstance(command, str) or not command:
                raise ValueError(f"MCP definition {name} requires a command")
            entry["command"] = expand_home(command, home)
            entry["args"] = [expand_home(a, home) for a in args]
            env = definition.get("env")
            if env:
                entry["env"] = dict(env)
        elif transport == "http":
            url = definition.get("url")
            if not isinstance(url, str) or not url:
                raise ValueError(f"MCP definition {name} requires a URL")
            entry["url"] = url
            headers = definition.get("headers")
            if headers:
                entry["headers"] = dict(headers)
        else:
            raise ValueError(f"MCP definition {name} has unsupported transport {transport!r}")
        definitions.append(entry)
    return definitions, disabled


def write_json_atomically(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    rendered = json.dumps(data, indent="\t", ensure_ascii=False) + "\n"
    with tempfile.NamedTemporaryFile(
        mode="w", encoding="utf-8", dir=path.parent, prefix=f".{path.name}.", delete=False
    ) as stream:
        stream.write(rendered)
        temp_path = Path(stream.name)
    try:
        os.replace(temp_path, path)
    except OSError:
        temp_path.unlink(missing_ok=True)
        raise


def sync_vscode_like(path, definitions, disabled=(), servers_key="servers", url_key="url"):
    """Shared logic for VS Code / Claude Code / Gemini: all use a top-level
    JSON object with a servers map keyed by name. Only the key name differs
    ("servers" for VS Code's mcp.json, "mcpServers" for Claude Code/Gemini).

    ai-config/mcp is the source of truth for the names it defines: an entry
    that drifted from its YAML (e.g. a bumped version pin) is rewritten, and a
    disabled one is removed. Servers the YAML does not name are left alone."""
    existing = {}
    if path.exists():
        with path.open(encoding="utf-8") as stream:
            content = stream.read().strip()
        existing = json.loads(content) if content else {}
        if not isinstance(existing, dict):
            raise ValueError(f"{path} must contain a JSON object")

    servers = existing.get(servers_key)
    if servers is None:
        servers = {}
    elif not isinstance(servers, dict):
        raise ValueError(f"{path}: {servers_key!r} must be a JSON object")

    added, updated, skipped, removed = [], [], [], []
    for definition in definitions:
        name = definition["name"]
        if definition["transport"] == "stdio":
            entry = {"type": "stdio", "command": definition["command"], "args": definition["args"]}
            if "env" in definition:
                entry["env"] = definition["env"]
        else:
            entry = {"type": "http", url_key: definition["url"]}
            if "headers" in definition:
                entry["headers"] = definition["headers"]
        if servers.get(name) == entry:
            skipped.append(name)
            continue
        (updated if name in servers else added).append(name)
        servers[name] = entry
    for name in disabled:
        if servers.pop(name, None) is not None:
            removed.append(name)

    existing[servers_key] = servers
    write_json_atomically(path, existing)
    return added, updated, skipped, removed


def sync_codex(path, definitions, disabled=()):
    if tomlkit is None:
        raise RuntimeError("tomlkit is required for Codex config.toml sync (pip install tomlkit)")
    if path.exists():
        with path.open(encoding="utf-8") as stream:
            doc = tomlkit.parse(stream.read())
    else:
        path.parent.mkdir(parents=True, exist_ok=True)
        doc = tomlkit.document()

    mcp_servers = doc.get("mcp_servers")
    if mcp_servers is None:
        mcp_servers = tomlkit.table(is_super_table=True)
        doc["mcp_servers"] = mcp_servers

    added, updated, skipped, unsupported, removed = [], [], [], [], []
    for definition in definitions:
        name = definition["name"]
        if definition["transport"] == "http":
            # Same shape `codex mcp add <name> --url <url>` writes (codex-cli 0.154).
            wanted = {"url": definition["url"]}
        elif definition["transport"] == "stdio":
            wanted = {"command": definition["command"], "args": definition["args"]}
            if "env" in definition:
                wanted["env"] = {key: str(value) for key, value in definition["env"].items()}
        else:
            unsupported.append(name)
            continue
        current = mcp_servers.get(name)
        if current is not None and current.unwrap() == wanted:
            skipped.append(name)
            continue
        server = tomlkit.table()
        for key, value in wanted.items():
            server[key] = value
        (updated if current is not None else added).append(name)
        mcp_servers[name] = server
    for name in disabled:
        if name in mcp_servers:
            del mcp_servers[name]
            removed.append(name)

    with tempfile.NamedTemporaryFile(
        mode="w", encoding="utf-8", dir=path.parent, prefix=f".{path.name}.", delete=False
    ) as stream:
        stream.write(tomlkit.dumps(doc))
        temp_path = Path(stream.name)
    try:
        os.replace(temp_path, path)
    except OSError:
        temp_path.unlink(missing_ok=True)
        raise
    return added, updated, skipped, unsupported, removed


def report(label, added, updated, skipped, removed, extra=""):
    print(f"{label}: added {added or 'none'}, updated {updated or 'none'}, "
          f"unchanged {skipped or 'none'}, removed {removed or 'none'}{extra}")


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("mcp_dir", type=Path)
    parser.add_argument("--vscode", type=Path, help="Path to VS Code's mcp.json")
    parser.add_argument("--vscode-insiders", type=Path, help="Path to VS Code Insiders' mcp.json")
    parser.add_argument("--codex", type=Path, help="Path to Codex's config.toml")
    parser.add_argument("--claude", type=Path, help="Path to Claude Code's .claude.json")
    parser.add_argument("--gemini", type=Path, help="Path to Gemini CLI's settings.json")
    args = parser.parse_args()

    if yaml is None:
        return fail("PyYAML is required. Install with: pip install pyyaml")
    if not args.mcp_dir.is_dir():
        return fail(f"MCP directory does not exist: {args.mcp_dir}")

    home = os.environ.get("HOME") or os.environ.get("USERPROFILE") or str(Path.home())
    try:
        definitions, disabled = load_definitions(args.mcp_dir, home)
    except ValueError as error:
        return fail(str(error))

    any_target = False
    try:
        if args.vscode:
            any_target = True
            report(f"VS Code ({args.vscode})",
                   *sync_vscode_like(args.vscode, definitions, disabled, servers_key="servers"))
        if args.vscode_insiders:
            any_target = True
            report(f"VS Code Insiders ({args.vscode_insiders})",
                   *sync_vscode_like(args.vscode_insiders, definitions, disabled, servers_key="servers"))
        if args.claude:
            any_target = True
            report(f"Claude Code ({args.claude})",
                   *sync_vscode_like(args.claude, definitions, disabled, servers_key="mcpServers"))
        if args.gemini:
            any_target = True
            report(f"Gemini CLI ({args.gemini})",
                   *sync_vscode_like(args.gemini, definitions, disabled, servers_key="mcpServers", url_key="httpUrl"),
                   extra=" (best-effort, schema unverified)")
        if args.codex:
            any_target = True
            added, updated, skipped, unsupported, removed = sync_codex(args.codex, definitions, disabled)
            report(f"Codex ({args.codex})", added, updated, skipped, removed,
                   extra=f", unsupported transport {unsupported or 'none'}")
    except (OSError, ValueError, json.JSONDecodeError) as error:
        return fail(str(error))

    if not any_target:
        print("No targets given -- nothing to do. Pass at least one of --vscode/--codex/--claude/--gemini.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
