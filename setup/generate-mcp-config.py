#!/usr/bin/env python3
"""Generate a merge-preserving Hermes config from AI-OS definitions.

Usage:
  python3 setup/generate-mcp-config.py ai-config/mcp ~/.hermes/config.yaml [external_skills_dir]

The optional third argument is added to `skills.external_dirs` (deduplicated,
existing user entries preserved) so Hermes scans it natively instead of AI-OS
symlinking every skill into `~/.hermes/skills/imported/`. See
https://hermes-agent.nousresearch.com/docs/user-guide/features/skills
("External Skill Directories") — confirmed current as of 2026-07-12.

PyYAML is required because this command must preserve arbitrary user YAML safely.
"""

import os
import sys
import tempfile
from pathlib import Path
from shutil import copy2

try:
    import yaml
except ImportError:
    yaml = None


def fail(message):
    print(f"Error: {message}", file=sys.stderr)
    return 1


def load_yaml_mapping(path, label):
    try:
        with path.open(encoding="utf-8") as stream:
            value = yaml.safe_load(stream)
    except (OSError, yaml.YAMLError) as error:
        raise ValueError(f"could not parse {label} {path}: {error}") from error

    if value is None:
        return {}
    if not isinstance(value, dict):
        raise ValueError(f"{label} {path} must contain a YAML mapping")
    return value


def expand_home(value, home):
    return str(value).replace("${HOME}", home).replace("${USERPROFILE}", home)


def merge_external_skill_dir(existing, external_dir):
    """Ensure `external_dir` is present in existing['skills']['external_dirs'].

    Preserves any other entries the user already configured (order, exact
    strings) and is idempotent — running it twice never duplicates the entry.
    """
    skills_section = existing.get("skills")
    if skills_section is None:
        skills_section = {}
    elif not isinstance(skills_section, dict):
        raise ValueError("existing config skills must be a mapping")

    external_dirs = skills_section.get("external_dirs")
    if external_dirs is None:
        external_dirs = []
    elif not isinstance(external_dirs, list):
        raise ValueError("existing config skills.external_dirs must be a list")

    if external_dir not in external_dirs:
        external_dirs = external_dirs + [external_dir]

    skills_section["external_dirs"] = external_dirs
    existing["skills"] = skills_section
    return existing


def render_server(definition, home):
    name = definition.get("name")
    if not isinstance(name, str) or not name:
        raise ValueError("MCP definition requires a non-empty string name")

    transport = definition.get("transport", "stdio")
    if transport == "stdio":
        command = definition.get("command")
        args = definition.get("args", [])
        if not isinstance(command, str) or not command:
            raise ValueError(f"MCP definition {name} requires a command")
        if not isinstance(args, list):
            raise ValueError(f"MCP definition {name} args must be a list")

        server = {
            "command": expand_home(command, home),
            "args": [expand_home(argument, home) for argument in args],
        }
        env = definition.get("env")
        if env is not None:
            if not isinstance(env, dict):
                raise ValueError(f"MCP definition {name} env must be a mapping")
            server["env"] = env
        return name, server

    if transport == "http":
        url = definition.get("url")
        if not isinstance(url, str) or not url:
            raise ValueError(f"MCP definition {name} requires a URL")
        server = {"url": url}
        headers = definition.get("headers")
        if headers is not None:
            if not isinstance(headers, dict):
                raise ValueError(f"MCP definition {name} headers must be a mapping")
            server["headers"] = headers
        return name, server

    raise ValueError(f"MCP definition {name} has unsupported transport {transport!r}")


def write_yaml_atomically(path, data):
    path.parent.mkdir(parents=True, exist_ok=True)
    rendered = yaml.safe_dump(data, default_flow_style=False, sort_keys=False)
    with tempfile.NamedTemporaryFile(
        mode="w", encoding="utf-8", dir=path.parent, prefix=f".{path.name}.", delete=False
    ) as stream:
        stream.write(rendered)
        temporary_path = Path(stream.name)
    try:
        os.replace(temporary_path, path)
    except OSError:
        temporary_path.unlink(missing_ok=True)
        raise


def main():
    if yaml is None:
        return fail("PyYAML is required for merge-preserving MCP generation. Install PyYAML and retry.")
    if len(sys.argv) not in (3, 4):
        return fail("Usage: python3 generate-mcp-config.py <mcp_dir> <config_path> [external_skills_dir]")

    mcp_dir = Path(sys.argv[1])
    config_path = Path(sys.argv[2])
    external_skills_dir = sys.argv[3] if len(sys.argv) == 4 else None
    if not mcp_dir.is_dir():
        return fail(f"MCP directory does not exist: {mcp_dir}")

    try:
        definitions = [load_yaml_mapping(path, "MCP definition") for path in sorted(mcp_dir.glob("*.yaml"))]
        existing = load_yaml_mapping(config_path, "existing config") if config_path.exists() else {}
        existing_servers = existing.get("mcp_servers", {})
        if not isinstance(existing_servers, dict):
            raise ValueError("existing config mcp_servers must be a mapping")

        home = os.environ.get("HOME") or os.environ.get("USERPROFILE") or str(Path.home())
        managed_names = set()
        generated_servers = {}
        for definition in definitions:
            name = definition.get("name")
            if not isinstance(name, str) or not name:
                raise ValueError("MCP definition requires a non-empty string name")
            if name in managed_names:
                raise ValueError(f"duplicate MCP definition name: {name}")
            managed_names.add(name)
            if definition.get("enabled", True) is False:
                continue
            name, server = render_server(definition, home)
            generated_servers[name] = server
    except ValueError as error:
        return fail(str(error))

    merged_servers = dict(existing_servers)
    for name in managed_names:
        merged_servers.pop(name, None)
    merged_servers.update(generated_servers)
    existing["mcp_servers"] = merged_servers

    if external_skills_dir:
        try:
            existing = merge_external_skill_dir(existing, external_skills_dir)
        except ValueError as error:
            return fail(str(error))

    try:
        if config_path.exists():
            backup = config_path.with_suffix(config_path.suffix + ".pre-aios.bak")
            copy2(config_path, backup)
            print(f"Backup: {backup}")
        write_yaml_atomically(config_path, existing)
    except OSError as error:
        return fail(f"could not write config {config_path}: {error}")

    print(f"Wrote {len(generated_servers)} AI-OS MCP servers to {config_path}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
