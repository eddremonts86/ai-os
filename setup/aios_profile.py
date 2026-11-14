"""The per-person install profile: context/personal/machine/install.yaml (git-ignored).

What each person adds on top of the shared base: optional CLIs, MCP servers turned on or off or added, extra
brew/npm packages, shell and terminal opt-ins. The installers read the scalar and list fields with yq; the MCP
generators call apply_mcp() so every client gets the same per-person set.

  python3 setup/aios_profile.py get KEY     # one value per line (lists) or the scalar; nothing when unset
"""

import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PROFILE = ROOT / "context" / "personal" / "machine" / "install.yaml"
SHARED_MCP = ROOT / "ai-config" / "mcp"


def load(path=None):
    p = Path(path or os.environ.get("AIOS_INSTALL_PROFILE") or PROFILE)
    if not p.is_file():
        return {}
    import yaml
    data = yaml.safe_load(p.read_text(encoding="utf-8")) or {}
    if not isinstance(data, dict):
        raise ValueError(f"{p} must be a YAML mapping")
    return data


def applies_to(mcp_dir):
    """The profile adjusts the shared set only; a test or ad-hoc directory is taken as it is."""
    return Path(mcp_dir).resolve() == SHARED_MCP.resolve()


def apply_mcp(definitions, profile):
    """Shared ai-config/mcp definitions -> this person's set: enable/disable by name, then their own servers."""
    mcp = profile.get("mcp") or {}
    enable, disable = set(mcp.get("enable") or []), set(mcp.get("disable") or [])
    out = []
    for d in definitions:
        d = dict(d)
        if d.get("name") in enable:
            d["enabled"] = True
        if d.get("name") in disable:
            d["enabled"] = False
        out.append(d)
    names = {d.get("name") for d in out}
    # ponytail: a server removed from mcp.servers is not removed from client configs; disable it first if that matters.
    for s in mcp.get("servers") or []:
        if not isinstance(s, dict) or not s.get("name"):
            raise ValueError("install.yaml mcp.servers: every entry needs a name")
        if s["name"] in names:
            raise ValueError(f"install.yaml mcp.servers: {s['name']!r} is already in ai-config/mcp, use mcp.enable/disable")
        names.add(s["name"])
        out.append(dict(s))
    return out


if __name__ == "__main__":
    if len(sys.argv) != 3 or sys.argv[1] != "get":
        sys.exit(__doc__)
    value = load().get(sys.argv[2])
    if isinstance(value, list):
        print("\n".join(str(v) for v in value))
    elif value is not None:
        print(str(value).lower() if isinstance(value, bool) else value)
