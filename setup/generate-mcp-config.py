#!/usr/bin/env python3
"""
setup/generate-mcp-config.py

Genera ~/.hermes/config.yaml desde los YAMLs en ai-config/mcp/.
Funciona en Mac, Linux, Windows (si tenés Python 3+).

Dependencia: PyYAML (pip install pyyaml)

Uso:
  python3 setup/generate-mcp-config.py ai-config/mcp ~/.hermes/config.yaml
"""
import sys
import os
import subprocess

# Auto-install PyYAML si falta
try:
    import yaml  # noqa: F401
except ImportError:
    print("⚠️  PyYAML no instalado. Instalando...")
    subprocess.run([sys.executable, "-m", "pip", "install", "pyyaml", "--user"], check=True)
    import yaml

from pathlib import Path
from shutil import copy2


def main():
    if len(sys.argv) < 3:
        print("Uso: python3 generate-mcp-config.py <mcp_dir> <config_path>")
        sys.exit(1)

    mcp_dir = Path(sys.argv[1])
    config_path = Path(sys.argv[2])

    # Backup si existe
    if config_path.exists():
        backup = config_path.with_suffix(config_path.suffix + ".pre-aios.bak")
        copy2(config_path, backup)
        print(f"📦 Backup: {backup}")

    # Cargar config existente
    existing = {}
    if config_path.exists():
        try:
            with open(config_path) as f:
                existing = yaml.safe_load(f) or {}
        except Exception as e:
            print(f"⚠️  No pude parsear config existente: {e}")

    # Generar mcp_servers desde YAMLs
    mcp_servers = {}
    for yaml_file in sorted(mcp_dir.glob("*.yaml")):
        try:
            with open(yaml_file) as f:
                server = yaml.safe_load(f)
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

    # Escribir
    config_path.parent.mkdir(parents=True, exist_ok=True)
    with open(config_path, "w") as f:
        yaml.safe_dump(existing, f, default_flow_style=False, sort_keys=False)

    print(f"✅ {len(mcp_servers)} MCP servers escritos en {config_path}")


if __name__ == "__main__":
    main()
