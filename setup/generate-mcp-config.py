#!/usr/bin/env python3
"""
setup/generate-mcp-config.py

Generates ~/.hermes/config.yaml from the YAMLs in ai-config/mcp/.
Works on Mac, Linux, Windows (if you have Python 3+).

Dependency: PyYAML is preferred. If it is unavailable, this script falls back to
the small YAML subset used by ai-config/mcp/*.yaml.

Usage:
  python3 setup/generate-mcp-config.py ai-config/mcp ~/.hermes/config.yaml
"""
import os
import sys

try:
    import yaml
except ImportError:
    yaml = None

from pathlib import Path
from shutil import copy2


def _parse_scalar(value):
    value = value.strip()
    if value in {"true", "True"}:
        return True
    if value in {"false", "False"}:
        return False
    if value in {"null", "None", "~"}:
        return None
    if (value.startswith("'") and value.endswith("'")) or (value.startswith('"') and value.endswith('"')):
        return value[1:-1]
    return value


def _load_mcp_yaml(path):
    if yaml is not None:
        with open(path) as f:
            return yaml.safe_load(f)

    data = {}
    current_list = None
    with open(path) as f:
        for raw_line in f:
            line = raw_line.rstrip()
            stripped = line.strip()
            if not stripped or stripped.startswith("#"):
                continue
            if line.startswith("  - ") and current_list:
                data[current_list].append(_parse_scalar(stripped[2:]))
                continue
            if ":" not in stripped:
                continue
            key, value = stripped.split(":", 1)
            key = key.strip()
            value = value.strip()
            if value == "":
                data[key] = []
                current_list = key
            else:
                data[key] = _parse_scalar(value)
                current_list = None
    return data


def _dump_yaml(data):
    if yaml is not None:
        return yaml.safe_dump(data, default_flow_style=False, sort_keys=False)

    def scalar(value):
        if value is True:
            return "true"
        if value is False:
            return "false"
        if value is None:
            return "null"
        text = str(value)
        if any(ch in text for ch in [":", "#", "{", "}", "[", "]"]) or text.strip() != text:
            return "'" + text.replace("'", "''") + "'"
        return text

    lines = []
    for key, value in data.items():
        if isinstance(value, dict):
            lines.append(f"{key}:")
            for child_key, child_value in value.items():
                if isinstance(child_value, dict):
                    lines.append(f"  {child_key}:")
                    for grand_key, grand_value in child_value.items():
                        if isinstance(grand_value, list):
                            lines.append(f"    {grand_key}:")
                            for item in grand_value:
                                lines.append(f"      - {scalar(item)}")
                        elif isinstance(grand_value, dict):
                            lines.append(f"    {grand_key}:")
                            for item_key, item_value in grand_value.items():
                                lines.append(f"      {item_key}: {scalar(item_value)}")
                        else:
                            lines.append(f"    {grand_key}: {scalar(grand_value)}")
                else:
                    lines.append(f"  {child_key}: {scalar(child_value)}")
        else:
            lines.append(f"{key}: {scalar(value)}")
    return "\n".join(lines) + "\n"


def main():
    if len(sys.argv) < 3:
        print("Usage: python3 generate-mcp-config.py <mcp_dir> <config_path>")
        sys.exit(1)

    mcp_dir = Path(sys.argv[1])
    config_path = Path(sys.argv[2])

    # Backup if exists
    if config_path.exists():
        backup = config_path.with_suffix(config_path.suffix + ".pre-aios.bak")
        copy2(config_path, backup)
        print(f"📦 Backup: {backup}")

    # Load existing config
    existing = {}
    if config_path.exists() and yaml is not None:
        try:
            with open(config_path) as f:
                existing = yaml.safe_load(f) or {}
        except Exception as e:
            print(f"⚠️  Could not parse existing config: {e}")
    elif config_path.exists():
        print("⚠️  PyYAML unavailable; existing config will not be preserved")

    # Generate mcp_servers from YAMLs
    mcp_servers = {}
    for yaml_file in sorted(mcp_dir.glob("*.yaml")):
        try:
            server = _load_mcp_yaml(yaml_file)
        except Exception as e:
            print(f"⚠️  Skipping {yaml_file.name}: {e}")
            continue

        if not server or not server.get("name"):
            continue

        if server.get("enabled", True) is False:
            continue

        name = server["name"]
        transport = server.get("transport", "stdio")

        if transport == "stdio":
            args = server.get("args", [])
            args = [str(a).replace("${HOME}", os.environ.get("HOME", os.environ.get("USERPROFILE", "~"))) for a in args]

            mcp_servers[name] = {
                "command": server.get("command"),
                "args": args,
            }

            if server.get("env"):
                mcp_servers[name]["env"] = server["env"]

        elif transport == "http":
            mcp_servers[name] = {"url": server.get("url")}
            if server.get("headers"):
                mcp_servers[name]["headers"] = server["headers"]

    # Update
    existing["mcp_servers"] = mcp_servers

    # Write
    config_path.parent.mkdir(parents=True, exist_ok=True)
    with open(config_path, "w") as f:
        f.write(_dump_yaml(existing))

    print(f"✅ {len(mcp_servers)} MCP servers written to {config_path}")


if __name__ == "__main__":
    main()
