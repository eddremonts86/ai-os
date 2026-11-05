#!/usr/bin/env python3
"""ai-os update — deliberate, verified upgrades of everything AI-OS pins.

install-mac.sh never upgrades (brew --no-upgrade, pinned tags, pinned images),
so nothing breaks behind your back — and nothing moves forward either. This
command is the forward path:

  ai-os update                     # what is pinned vs what upstream has (read-only)
  ai-os update --apply grepai      # bump one component: edit its pins, install it,
                                   # run its `ai-os health` checks, roll back on FAIL

--apply never commits; review `git diff` and commit the pin change yourself.
Components without a safe automatic path are reported with the manual step.
"""

import argparse
import json
import os
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HOME = Path.home()
VENV_PY = HOME / ".ai-os" / "venv" / "bin" / "python"
PY = str(VENV_PY) if VENV_PY.exists() else sys.executable

# Re-run only the installer's memory section (cbm, grepai, compose, agents): ~30s.
INSTALL_MEMORY = ["bash", "setup/install-mac.sh"]
INSTALL_MEMORY_ENV = {"ASSUME_YES": "1", "SKIP_BREW": "1", "SKIP_NPM": "1", "SKIP_PIP": "1", "SKIP_OPENCODE": "1",
                      "SKIP_WARP": "1", "SKIP_CLAUDE_NATIVE": "1", "SKIP_VERIFY": "1", "SKIP_PONYTAIL": "1",
                      "SKIP_COMPACT_HOOK": "1", "SKIP_MEMORY_HOOK": "1"}
VSCODE_MCP = HOME / "Library/Application Support/Code/User/mcp.json"
SYNC_MCP = [[PY, "setup/sync-ide-mcp-servers.py", "ai-config/mcp", "--claude", str(HOME / ".claude.json"),
             "--codex", str(HOME / ".codex/config.toml"), "--gemini", str(HOME / ".gemini/settings.json")]
            + (["--vscode", str(VSCODE_MCP)] if VSCODE_MCP.exists() else []),
            [PY, "setup/generate-mcp-config.py", "ai-config/mcp", str(HOME / ".hermes/config.yaml"), str(HOME / ".agents/skills")]]


def mcp_component(yaml_name, registry, package):
    f = f"ai-config/mcp/{yaml_name}.yaml"
    sep = "==" if registry == "pypi" else "@"
    return {"id": f"mcp:{yaml_name}", "source": (registry, package),
            "pins": [(f, re.escape(package + sep) + r"([0-9][\w.\-]*)")],
            "apply": SYNC_MCP, "health": ["mcp"]}


COMPONENTS = [
    {"id": "grepai", "source": ("github", "yoanbernabeu/grepai"),
     "pins": [("setup/install-mac.sh", r'GREPAI_VERSION="v([\d.]+)"'),
              ("setup/install-windows.ps1", r'\$grepaiVersion = "v([\d.]+)"')],
     "apply": [INSTALL_MEMORY], "health": ["grepai", "mcp"]},
    {"id": "codebase-memory-mcp", "source": ("github", "deusdata/codebase-memory-mcp"),
     "pins": [("setup/install-mac.sh", r'CBM_VERSION="v([\d.]+)"'),
              ("setup/install-windows.ps1", r'\$cbmVersion = "v([\d.]+)"')],
     # the installer skips an existing binary; remove it so the new pin is fetched
     "pre_apply": lambda: (HOME / ".local/bin/codebase-memory-mcp").unlink(missing_ok=True),
     "apply": [INSTALL_MEMORY], "health": ["cbm", "mcp"]},
    {"id": "ponytail", "source": ("github", "DietrichGebert/ponytail"),
     "pins": [("ai-config/manifest.yaml", r"ponytail:\n\s+required: \w+\n\s+version: ([\d.]+)"),
              ("setup/install-mac.sh", r'PONYTAIL_VERSION="\$\{PONYTAIL_VERSION:-([\d.]+)\}"'),
              ("setup/install-windows.ps1", r'else \{ "([\d.]+)"'),
              ("setup/verify.sh", r"ponytail v([\d.]+)\)"),
              ("setup/verify-windows.ps1", r"ponytail v([\d.]+)\)")],
     "manual": "ponytail is wired into every CLI's plugin system: bump the pins, run "
               "`ASSUME_YES=1 SKIP_BREW=1 SKIP_NPM=1 SKIP_PIP=1 bash setup/install-mac.sh`, then `bash setup/verify.sh` (section 3d)."},
    {"id": "falkordb", "source": ("dockerhub", "falkordb/falkordb"),
     "pins": [("memory/docker-compose.yml", r"image: falkordb/falkordb:v([\d.]+)")],
     "apply": [["docker", "compose", "-f", "memory/docker-compose.yml", "up", "-d", "falkordb", "graphiti-mcp"]],
     "health": ["falkordb", "graphiti", "memory-usage"]},
    mcp_component("chrome", "npm", "chrome-devtools-mcp"),
    mcp_component("agent-browser", "npm", "agent-browser-mcp-server"),
    mcp_component("pdf", "pypi", "mcp-pdf"),
    mcp_component("time", "pypi", "mcp-server-time"),
    {"id": "ollama", "source": ("brew", "ollama"), "pins": [],
     "apply": [["brew", "upgrade", "ollama"], ["launchctl", "kickstart", "-k", "gui/%UID%/ai.os.ollama"]],
     "health": ["ollama", "graphiti-llm", "grepai"], "no_rollback": True},
    {"id": "graphiti-image", "source": ("github", "getzep/graphiti"), "pins": [],
     "manual": "custom image ai-os/graphiti-mcp:minimax-standalone — rebuild with the steps in the comment above "
               "its service in memory/docker-compose.yml, then `ai-os health --only graphiti,graphiti-llm`."},
]


def get_json(url):
    req = urllib.request.Request(url, headers={"User-Agent": "ai-os-update", "Accept": "application/json"})
    with urllib.request.urlopen(req, timeout=20) as r:
        return json.load(r)


def vtuple(v):
    return tuple(int(x) for x in re.findall(r"\d+", v)[:4])


def latest(source):
    kind, name = source
    if kind == "github":
        out = subprocess.run(["gh", "release", "view", "--repo", name, "--json", "tagName", "--jq", ".tagName"],
                             capture_output=True, text=True, timeout=30)
        return out.stdout.strip().lstrip("v") or None
    if kind == "npm":
        return get_json(f"https://registry.npmjs.org/{name}/latest").get("version")
    if kind == "pypi":
        return get_json(f"https://pypi.org/pypi/{name}/json")["info"]["version"]
    if kind == "dockerhub":
        tags = get_json(f"https://hub.docker.com/v2/repositories/{name}/tags?page_size=100&ordering=last_updated")["results"]
        semver = [t["name"].lstrip("v") for t in tags if re.fullmatch(r"v?\d+\.\d+\.\d+", t["name"])]
        return max(semver, key=vtuple) if semver else None
    if kind == "brew":
        out = subprocess.run(["brew", "info", "--json=v2", name], capture_output=True, text=True, timeout=60)
        return json.loads(out.stdout)["formulae"][0]["versions"]["stable"]
    return None


def current(comp):
    if comp["source"][0] == "brew":
        out = subprocess.run(["brew", "list", "--versions", comp["source"][1]], capture_output=True, text=True)
        return out.stdout.split()[-1] if out.stdout.split() else None
    if comp["id"] == "graphiti-image":
        out = subprocess.run(["docker", "image", "inspect", "ai-os/graphiti-mcp:minimax-standalone", "--format",
                              "{{.Created}}"], capture_output=True, text=True)
        return f"built {out.stdout.strip()[:10]}" if out.returncode == 0 else None
    found = set()
    for rel, pattern in comp["pins"]:
        found.update(re.findall(pattern, (ROOT / rel).read_text(encoding="utf-8")))
    if len(found) > 1:
        return "DRIFT:" + "/".join(sorted(found))  # pins disagree with each other
    return found.pop() if found else None


def report():
    rows = []
    for comp in COMPONENTS:
        try:
            cur, new = current(comp), latest(comp["source"])
        except Exception as e:
            rows.append((comp["id"], "?", "?", f"lookup failed: {type(e).__name__}"))
            continue
        if cur and cur.startswith("DRIFT:"):
            note = "pins disagree across files"
        elif comp["id"] == "graphiti-image":
            note = f"upstream release v{new}; rebuild is manual" if new else "—"
        elif not cur or not new:
            note = "unknown"
        elif vtuple(new) > vtuple(cur):
            major = vtuple(new)[0] != vtuple(cur)[0]
            how = "manual (see --apply output)" if "manual" in comp else f"ai-os update --apply {comp['id']}"
            note = ("MAJOR — read the changelog; " if major else "") + how
        else:
            note = "up to date"
        rows.append((comp["id"], cur or "—", new or "—", note))
    w = max(len(r[0]) for r in rows)
    print(f"{'component':<{w}}  {'pinned':<16} {'upstream':<14} action")
    for cid, cur, new, note in rows:
        print(f"{cid:<{w}}  {cur:<16} {new:<14} {note}")
    return 0


def run(cmds):
    for cmd in cmds:
        # os.getuid() does not exist on Windows, and this module is imported by CI there.
        cmd = [c.replace("%UID%", str(os.getuid())) if "%UID%" in c else c for c in cmd]
        p = subprocess.run(cmd, cwd=ROOT, env={**os.environ, **INSTALL_MEMORY_ENV}, capture_output=True, text=True)
        if p.returncode != 0:
            return False, f"`{' '.join(cmd[:3])}…` exited {p.returncode}: {(p.stdout + p.stderr).strip()[-300:]}"
    return True, ""


def health(ids):
    p = subprocess.run([PY, "setup/ai-os-health.py", "--json", "--only", ",".join(ids)], cwd=ROOT,
                       capture_output=True, text=True, timeout=600)
    data = json.loads(p.stdout)
    bad = [f"{c['check']}: {c['detail']}" for c in data["checks"] if c["status"] == "fail"]
    return not bad, bad


def apply(cid, target=None):
    comp = next((c for c in COMPONENTS if c["id"] == cid), None)
    if not comp:
        print(f"unknown component {cid}; one of: {', '.join(c['id'] for c in COMPONENTS)}")
        return 2
    if "manual" in comp:
        print(f"{cid}: no automatic path — {comp['manual']}")
        return 2
    cur, new = current(comp), target or latest(comp["source"])
    if comp["pins"] and cur == new:
        print(f"{cid} is already at {cur}")
        return 0
    print(f"{cid}: {cur} → {new}")

    snapshot = {rel: (ROOT / rel).read_text(encoding="utf-8") for rel, _ in comp["pins"]}
    for rel, pattern in comp["pins"]:
        text = snapshot[rel]
        (ROOT / rel).write_text(re.sub(pattern, lambda m: m.group(0).replace(m.group(1), new), text), encoding="utf-8")
    if comp.get("pre_apply"):
        comp["pre_apply"]()

    ok, err = run(comp["apply"])
    healthy, bad = health(comp["health"]) if ok else (False, [err])
    if healthy:
        print(f"✅ {cid} {new} installed and healthy ({', '.join(comp['health'])}).")
        if comp["pins"]:
            print("   Review and commit the pin change: git diff -- " + " ".join(snapshot))
        return 0

    print(f"❌ {cid} {new} failed: " + "; ".join(bad))
    if comp.get("no_rollback"):
        print("   No automatic rollback for this component — fix forward or reinstall the previous version by hand.")
        return 1
    for rel, text in snapshot.items():
        (ROOT / rel).write_text(text, encoding="utf-8")
    if comp.get("pre_apply"):
        comp["pre_apply"]()
    ok, err = run(comp["apply"])
    healthy, bad = health(comp["health"]) if ok else (False, [err])
    print(f"↩️  rolled back to {cur}: " + ("healthy again" if healthy else "STILL FAILING — " + "; ".join(bad)))
    return 1


def main():
    ap = argparse.ArgumentParser(description="Deliberate, verified upgrades of AI-OS pins.")
    ap.add_argument("--apply", metavar="COMPONENT")
    ap.add_argument("--to", metavar="VERSION", help="with --apply: a specific version instead of the latest")
    a = ap.parse_args()
    return apply(a.apply, a.to) if a.apply else report()


if __name__ == "__main__":
    for _stream in (sys.stdout, sys.stderr):  # Windows consoles default to cp1252 and choke on the status symbols
        if hasattr(_stream, "reconfigure"):
            _stream.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
