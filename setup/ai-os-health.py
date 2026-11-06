#!/usr/bin/env python3
"""ai-os health — functional checks for the running AI-OS.

setup/verify.sh asks "is it installed?". This asks "does it work right now?":
every check exercises the real thing (a graph query, a semantic search, an MCP
handshake, an API call with each token) instead of looking for a file or a
running container. It exists because on 2026-11-05 a dozen failures were found
that verify.sh reported green for weeks: FalkorDB mounted at the wrong path,
MiniMax out of credit (empty graph), the reindex cron dead since 09-18, an
expired Coolify token, a grepai pin to a tag that never existed, a broken MCP.

Usage:
  ai-os health              # human-readable report, exit 1 if anything FAILs
  ai-os health --json       # machine-readable
  ai-os health --notify     # also raise a macOS notification when something FAILs
  ai-os health --only mcp,graphiti

Runs daily via the launchd agent ai.os.health (memory/launchd/install-health.sh).
Stdlib + PyYAML only (the AI-OS venv has it). Never prints secret values.
"""

import argparse
import calendar
import concurrent.futures as cf
import json
import os
import re
import select
import shutil
import subprocess
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

try:
    import yaml
except ImportError:  # verify.sh / install-mac.sh guarantee it in ~/.ai-os/venv
    yaml = None

ROOT = Path(__file__).resolve().parent.parent
HOME = Path.home()
ENV_FILE = ROOT / "dev-env" / "env-config" / ".env"
OLLAMA = "http://127.0.0.1:11500"
GRAPHITI = "http://127.0.0.1:8021"
os.environ["PATH"] = os.pathsep.join(
    [str(HOME / ".local/bin"), str(HOME / "go/bin"), "/opt/homebrew/bin", "/usr/local/bin", os.environ.get("PATH", "")]
)

OK, WARN, FAIL = "ok", "warn", "fail"
ICON = {OK: "✅", WARN: "⚠️ ", FAIL: "❌"}


# ─── helpers ──────────────────────────────────────────────────────────────────

def run(cmd, timeout=30, **kw):
    try:
        p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout, **kw)
        return p.returncode, (p.stdout or "") + (p.stderr or "")
    except FileNotFoundError:
        return 127, f"{cmd[0]}: not found"
    except subprocess.TimeoutExpired:
        return 124, f"timed out after {timeout}s"


def http(url, data=None, headers=None, timeout=20, method=None):
    """Return (status, body_text, response_headers); status 0 = unreachable."""
    body = json.dumps(data).encode() if data is not None else None
    req = urllib.request.Request(url, data=body, method=method, headers={"Content-Type": "application/json", **(headers or {})})
    try:
        with urllib.request.urlopen(req, timeout=timeout) as r:
            return r.status, r.read().decode("utf-8", "replace"), dict(r.headers)
    except urllib.error.HTTPError as e:
        # urllib won't replay a POST across 307/308; graphiti redirects /mcp/ → /mcp.
        loc = (e.headers or {}).get("Location")
        if e.code in (307, 308) and loc:
            return http(urllib.parse.urljoin(url, loc), data, headers, timeout, method)
        return e.code, e.read().decode("utf-8", "replace"), dict(e.headers or {})
    except Exception as e:  # connection refused, DNS, timeout
        return 0, f"{type(e).__name__}: {e}", {}


def load_env():
    env = {}
    if ENV_FILE.exists():
        for line in ENV_FILE.read_text(encoding="utf-8").splitlines():
            m = re.match(r"^(?:export )?([A-Z][A-Z0-9_]*)=(.*)$", line.strip())
            if m:
                env[m.group(1)] = m.group(2).strip().strip('"').strip("'")
    return env


def mcp_definitions():
    defs = []
    for path in sorted((ROOT / "ai-config" / "mcp").glob("*.yaml")):
        d = yaml.safe_load(path.read_text(encoding="utf-8")) if yaml else None
        if isinstance(d, dict) and d.get("enabled", True) is not False:
            defs.append(d)
    return defs


def sse_json(text):
    """Streamable-HTTP MCP replies either as JSON or as SSE `data:` lines."""
    for line in text.splitlines():
        if line.startswith("data:"):
            return json.loads(line[5:].strip())
    return json.loads(text)


INIT = {"jsonrpc": "2.0", "id": 1, "method": "initialize",
        "params": {"protocolVersion": "2025-06-18", "capabilities": {}, "clientInfo": {"name": "ai-os-health", "version": "1"}}}


def mcp_http_call(url, tool=None, args=None, timeout=30):
    """initialize (+ optional tools/call). Returns (ok, detail)."""
    hdr = {"Accept": "application/json, text/event-stream"}
    st, body, rh = http(url, INIT, hdr, timeout)
    if st != 200:
        return False, f"initialize → HTTP {st or 'unreachable'}"
    sid = rh.get("mcp-session-id") or rh.get("Mcp-Session-Id")
    if sid:
        hdr["mcp-session-id"] = sid
    name = sse_json(body).get("result", {}).get("serverInfo", {}).get("name", "?")
    if not tool:
        return True, f"initialize ok ({name})"
    http(url, {"jsonrpc": "2.0", "method": "notifications/initialized"}, hdr, timeout)
    st, body, _ = http(url, {"jsonrpc": "2.0", "id": 2, "method": "tools/call",
                              "params": {"name": tool, "arguments": args or {}}}, hdr, timeout)
    if st != 200:
        return False, f"{tool} → HTTP {st or 'unreachable'}"
    res = sse_json(body)
    if "error" in res or res.get("result", {}).get("isError"):
        return False, f"{tool} returned an error"
    return True, f"{tool} ok"


def mcp_stdio_handshake(command, args, env_extra=None, timeout=90):
    """Spawn a stdio MCP server, send initialize, wait for the id=1 reply."""
    cmd = [os.path.expandvars(command.replace("${HOME}", str(HOME)))] + [
        os.path.expandvars(str(a).replace("${HOME}", str(HOME))) for a in args]
    env = {**os.environ, **{k: str(v) for k, v in (env_extra or {}).items()}}
    try:
        # cwd=ROOT: grepai's server refuses to start outside a repo with a .grepai/ index,
        # and launchd starts this script in /.
        p = subprocess.Popen(cmd, stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                             env=env, text=True, cwd=ROOT)
    except FileNotFoundError:
        return False, f"{cmd[0]}: not found"
    try:
        p.stdin.write(json.dumps(INIT) + "\n")
        p.stdin.flush()
        deadline = time.time() + timeout
        while time.time() < deadline:
            r, _, _ = select.select([p.stdout], [], [], 1)
            if r:
                line = p.stdout.readline()
                if not line:
                    break
                try:
                    msg = json.loads(line)
                except ValueError:
                    continue
                if msg.get("id") == 1:
                    if "result" in msg:
                        return True, f"initialize ok ({msg['result'].get('serverInfo', {}).get('name', '?')})"
                    return False, f"initialize error: {msg.get('error', {}).get('message', '?')}"
            elif p.poll() is not None:
                break
        err = (p.stderr.read() if p.poll() is not None else "").strip().splitlines()
        return False, (err[-1][:160] if err else f"no initialize reply within {timeout}s")
    finally:
        p.kill()


# ─── checks: each returns (status, detail) ───────────────────────────────────

def check_docker():
    rc, out = run(["docker", "info", "--format", "{{.ServerVersion}}"], 20)
    if rc != 0:
        return FAIL, "Docker daemon not reachable (FalkorDB + graphiti are down)"
    store = HOME / "Library/Group Containers/group.com.docker/settings-store.json"
    try:
        autostart = json.loads(store.read_text(encoding="utf-8")).get("AutoStart")
    except (OSError, ValueError):  # TCC blocks launchd agents from Group Containers
        autostart = None
    if autostart is False:
        return WARN, f"daemon {out.strip()} up, but Docker Desktop does not start at login"
    return OK, f"daemon {out.strip()} up" + (", starts at login" if autostart else " (login autostart not readable here)")


def check_falkordb():
    rc, out = run(["docker", "exec", "ia-os-falkordb", "redis-cli", "PING"], 15)
    if "PONG" not in out:
        return FAIL, "ia-os-falkordb does not answer PING"
    rc, mounts = run(["docker", "inspect", "ia-os-falkordb", "--format", "{{range .Mounts}}{{.Destination}} {{end}}"], 15)
    if "/var/lib/falkordb/data" not in mounts:
        return FAIL, "data dir not mounted — every graph write is lost on recreate"
    rc, aof = run(["docker", "exec", "ia-os-falkordb", "redis-cli", "CONFIG", "GET", "appendonly"], 15)
    return (OK if "yes" in aof else WARN), "PING ok, data persisted" + ("" if "yes" in aof else ", AOF off")


def check_graphiti():
    st, _, _ = http(f"{GRAPHITI}/health", timeout=10)
    if st != 200:
        return FAIL, f"/health → {st or 'unreachable'}"
    ok, detail = mcp_http_call(f"{GRAPHITI}/mcp/", "search_memory_facts",
                               {"query": "ai-os health probe", "group_ids": ["ai-os"], "max_facts": 1})
    if not ok:
        return FAIL, f"MCP {detail}"
    # Extraction runs async; its failures (no LLM credit, LLM down, bad JSON)
    # only show up in the server log, never to the caller of add_memory.
    rc, logs = run(["docker", "logs", "--since", "24h", "ia-os-graphiti-mcp"], 30)
    fails = len(re.findall(r"Failed to process episode", logs))
    wins = len(re.findall(r"Successfully processed episode", logs))
    if fails and not wins:
        last = re.findall(r"Failed to process episode[^\n]*", logs)[-1][-120:]
        return FAIL, f"search ok, but every episode in 24h failed ({fails}): {last}"
    if fails:
        return WARN, f"search ok; episodes 24h: {wins} ok, {fails} failed"
    return OK, f"search ok; episodes 24h: {wins} ok"


def check_memory_usage():
    """Is the graph actually being used? graphiti keeps one FalkorDB graph per group."""
    rc, out = run(["docker", "exec", "ia-os-falkordb", "redis-cli", "GRAPH.LIST"], 15)
    if rc != 0:
        return FAIL, "cannot list FalkorDB graphs"
    since = time.strftime("%Y-%m-%dT%H:%M:%S", time.gmtime(time.time() - 7 * 86400))
    per_group, total = {}, 0
    for g in [l.strip() for l in out.splitlines() if l.strip() and l.strip() != "default_db"]:
        rc, res = run(["docker", "exec", "ia-os-falkordb", "redis-cli", "GRAPH.QUERY", g,
                       f"MATCH (e:Episodic) WHERE e.created_at >= '{since}' RETURN count(e)"], 15)
        lines = res.splitlines()
        n = int(lines[1]) if rc == 0 and len(lines) > 1 and lines[1].strip().isdigit() else 0
        if n:
            per_group[g] = n
            total += n
    if not total:
        return WARN, "no memories recorded in 7 days — the graph is running but unused"
    return OK, f"{total} memories in 7 days: " + ", ".join(f"{g} {n}" for g, n in sorted(per_group.items()))


def check_graphiti_llm():
    rc, model = run(["docker", "exec", "ia-os-graphiti-mcp", "printenv", "GRAPHITI_LLM_MODEL"], 15)
    model = model.strip() if rc == 0 and model.strip() else "gemma3:12b"
    rc, base = run(["docker", "exec", "ia-os-graphiti-mcp", "printenv", "GRAPHITI_LLM_BASE_URL"], 15)
    if rc == 0 and base.strip() and "11500" not in base:
        return WARN, f"{model} on a hosted endpoint — not probed (would spend credit)"
    # graphiti needs structured output; gemma4 on Ollama 0.40 answers 501 here.
    st, body, _ = http(f"{OLLAMA}/v1/chat/completions", {
        "model": model, "max_tokens": 20, "messages": [{"role": "user", "content": "Return JSON {\"a\":\"ok\"}"}],
        "response_format": {"type": "json_schema", "json_schema": {"name": "p", "schema": {
            "type": "object", "properties": {"a": {"type": "string"}}, "required": ["a"]}}}}, timeout=90)
    if st == 0 and "timed out" in body.lower():
        # One slot: a long extraction (gemma3 sometimes loops for 10+ minutes) queues the probe behind it.
        return WARN, f"{model} did not answer in 90s — Ollama is busy; if graphiti has been 'Processing episode' for many minutes: docker restart ia-os-graphiti-mcp"
    if st != 200:
        return FAIL, f"{model} structured output → HTTP {st or 'unreachable'}: {body[:100]}"
    return OK, f"{model} answers structured output"


def check_ollama():
    st, body, _ = http(f"{OLLAMA}/api/version", timeout=10)
    if st != 200:
        return FAIL, "nothing answers on :11500 (embeddings, grepai, graphiti all down)"
    server = json.loads(body).get("version", "?")
    rc, out = run(["ollama", "--version"], 15)
    m = re.search(r"client version is ([\d.]+)", out) or re.search(r"version is ([\d.]+)", out)
    client = m.group(1) if m else server
    st, tags, _ = http(f"{OLLAMA}/api/tags", timeout=10)
    names = [t["name"] for t in json.loads(tags).get("models", [])] if st == 200 else []
    if not any(n.startswith("nomic-embed-text") for n in names):
        return FAIL, "nomic-embed-text missing (embeddings break)"
    if client != server:
        return WARN, f"server {server} ≠ installed {client} — run: launchctl kickstart -k gui/$(id -u)/ai.os.ollama"
    return OK, f"{server}, models: {', '.join(names)}"


def check_grepai():
    rc, ver = run(["grepai", "version"], 15)
    if rc != 0:
        return FAIL, "grepai binary missing or broken"
    rc, out = run(["grepai", "search", "where is the MCP config generated"], 60, cwd=ROOT)
    if rc != 0 or "Result 1" not in out:
        return FAIL, f"search failed: {out.strip().splitlines()[-1][:120] if out.strip() else rc}"
    return OK, f"{ver.strip()}, search returns results"


def check_codebase_memory():
    rc, out = run(["codebase-memory-mcp", "cli", "list_projects", "{}"], 30)
    if rc != 0:
        return FAIL, "codebase-memory-mcp cli failed"
    # <= 0.8 answers JSON; 0.12 answers a compact text table ("projects: 21  (cols: …)").
    m = re.search(r"\{.*\}", out, re.S)
    try:
        count = len(json.loads(m.group(0)).get("projects", [])) if m else 0
    except ValueError:
        count = 0
    if not count:
        t = re.search(r"^projects: (\d+)", out, re.M)
        count = int(t.group(1)) if t else 0
    if not count:
        return FAIL, "no projects indexed"
    return OK, f"{count} projects indexed"


def check_reindex():
    rc, _ = run(["launchctl", "print", f"gui/{os.getuid()}/ai.os.reindex"], 10)
    logs = sorted((ROOT / "memory" / "logs").glob("cron-reindex-*.log"), key=lambda p: p.stat().st_mtime)
    if not logs:
        return FAIL, "never ran"
    last = logs[-1]
    age_h = (time.time() - last.stat().st_mtime) / 3600
    text = last.read_text(errors="replace")
    m = re.search(r"summary: (\d+) ok, (\d+) failed", text)
    if rc != 0:
        return FAIL, f"agent ai.os.reindex not loaded (last run {age_h:.0f}h ago)"
    if age_h > 8:  # runs every 4h
        return FAIL, f"last run {age_h:.0f}h ago — the schedule is not firing"
    if not m or int(m.group(2)) or "✗ grepai" in text:
        return WARN, f"last run {age_h:.1f}h ago with failures — see {last.name}"
    return OK, f"last run {age_h:.1f}h ago, {m.group(1)} repos ok"


def check_mcp_servers():
    if yaml is None:
        return FAIL, "PyYAML missing — run with ~/.ai-os/venv/bin/python"
    results = {}

    def probe(d):
        if d.get("transport") == "http":
            return d["name"], mcp_http_call(d["url"])
        return d["name"], mcp_stdio_handshake(d["command"], d.get("args", []), d.get("env"))

    with cf.ThreadPoolExecutor(max_workers=8) as ex:
        for name, (ok, detail) in ex.map(probe, mcp_definitions()):
            results[name] = (ok, detail)
    bad = {n: d for n, (ok, d) in results.items() if not ok}
    if bad:
        return FAIL, f"{len(results) - len(bad)}/{len(results)} answer; broken: " + "; ".join(f"{n}: {d}" for n, d in bad.items())
    return OK, f"{len(results)}/{len(results)} answer initialize: {', '.join(sorted(results))}"


def check_tokens():
    env = load_env()
    probes = {
        "Coolify": (env.get("COOLIFY_API_URL", "").rstrip("/") + "/api/v1/version", env.get("COOLIFY_API_TOKEN")),
        "Hetzner": ("https://api.hetzner.cloud/v1/locations?per_page=1", env.get("HETZNER_API_TOKEN")),
    }
    bad, good = [], []
    for name, (url, tok) in probes.items():
        if not tok or not url.startswith("http"):
            continue
        st, _, _ = http(url, headers={"Authorization": f"Bearer {tok}"}, timeout=20)
        (good if st == 200 else bad).append(f"{name} {st or 'unreachable'}" if st != 200 else name)
    rc, _ = run(["gh", "auth", "status"], 20)
    (good if rc == 0 else bad).append("GitHub CLI" if rc == 0 else "GitHub CLI not logged in")
    if bad:
        return FAIL, "rejected: " + ", ".join(bad) + (f" (ok: {', '.join(good)})" if good else "")
    return OK, "valid: " + ", ".join(good)


def check_ci():
    rc, out = run(["gh", "run", "list", "--branch", "main", "--limit", "30", "--json", "name,conclusion,status,createdAt"], 30, cwd=ROOT)
    if rc != 0:
        return WARN, "gh run list failed (offline or not logged in)"
    latest = {}
    for r in json.loads(out):
        if r["status"] == "completed":
            latest.setdefault(r["name"], r)
    failing = sorted(n for n, r in latest.items() if r["conclusion"] not in ("success", "skipped"))
    if failing:
        return FAIL, "latest run failing on main: " + ", ".join(failing)
    return OK, f"latest run green for {len(latest)} workflows"


def check_backup():
    try:  # same file and defaults as setup/ai-os-backup.py
        cfg = json.loads(Path(os.environ.get("AI_OS_BACKUP_CONFIG", HOME / ".ai-os" / "backup.json")).read_text(encoding="utf-8"))
    except (OSError, ValueError):
        cfg = {}
    if cfg.get("schedule", True) is False:
        return OK, "daily backups disabled by choice (turn on: ai-os backup --enable)"
    dest = Path(os.environ.get("AI_OS_BACKUP_DIR", HOME / "Backups" / "ai-os"))
    snaps = sorted(p for p in dest.iterdir() if (p / "manifest.json").exists()) if dest.exists() else []
    if not snaps:
        return FAIL, f"no AI-OS backup in {dest} (run: ai-os backup)"
    age_h = (time.time() - (snaps[-1] / "manifest.json").stat().st_mtime) / 3600
    if age_h > 36:  # runs daily at 13:00
        return FAIL, f"last AI-OS backup {age_h:.0f}h ago — the schedule is not firing"
    parts = [f"local {age_h:.0f}h ago ({len(snaps)} kept)"]
    real_offsite = False  # a copy that has demonstrably left this SSD
    # Each machine writes its own iCloud folder and mirror branch; ai-os-backup.py saves the name on its first run.
    branch = os.environ.get("AI_OS_BACKUP_BRANCH") or cfg.get("branch") or ""

    # Off-site 1: the encrypted copy in iCloud Drive. A file in that folder is not off-site until
    # iCloud uploads it, and iCloud Drive can stall silently (2026-11-05: last sync six days old).
    offsite = Path(os.environ.get("AI_OS_OFFSITE_DIR", HOME / "Library/Mobile Documents/com~apple~CloudDocs/Backups/ai-os")) / branch
    icloud_on = cfg.get("icloud", True) is not False or "AI_OS_OFFSITE_DIR" in os.environ
    files = sorted(offsite.glob("ai-os-*.tar.gz.enc")) if icloud_on and offsite.exists() else []
    if files:
        off_h = (time.time() - files[-1].stat().st_mtime) / 3600
        if off_h > 36:
            return FAIL, "; ".join(parts) + f"; newest iCloud copy is {off_h:.0f}h old — the off-site write stopped"
        note = f"iCloud copy {off_h:.0f}h ago"
        if "AI_OS_OFFSITE_DIR" not in os.environ and sys.platform == "darwin":
            rc, out = run(["brctl", "status", "com.apple.CloudDocs"], 25)
            m = re.search(r"last-sync:(\d{4}-\d\d-\d\d \d\d:\d\d:\d\d)", re.sub(r"\x1b\[[0-9;]*m", "", out))
            if rc == 124 or not m:
                note += " (iCloud's sync daemon did not answer: upload unconfirmed)"
            elif (time.time() - time.mktime(time.strptime(m.group(1), "%Y-%m-%d %H:%M:%S"))) / 3600 > 36:
                note += f" (iCloud Drive last synced {m.group(1)}: not uploaded yet)"
            else:
                real_offsite = True
        else:
            real_offsite = True
        parts.append(note)

    # Off-site 2: the private GitHub mirror, only when the user configured one.
    if os.environ.get("AI_OS_GITHUB") != "0":
        repo = os.environ.get("AI_OS_GITHUB_BACKUP_REPO") or cfg.get("github_repo") or None
        if repo:
            rc, out = run(["gh", "api", f"repos/{repo}/commits/{branch or 'main'}", "--jq", ".commit.committer.date"], 30)
            if rc == 0 and out.strip():
                gh_h = (time.time() - calendar.timegm(time.strptime(out.strip(), "%Y-%m-%dT%H:%M:%SZ"))) / 3600  # the API date is UTC
                if gh_h > 36:
                    return FAIL, "; ".join(parts) + f"; GitHub mirror {repo} is {gh_h:.0f}h old — the upload stopped"
                parts.append(f"GitHub mirror ({branch or 'main'}) {gh_h:.0f}h ago")
                real_offsite = True
            else:
                parts.append(f"GitHub mirror {repo} unreachable or not created")

    detail = "; ".join(parts)
    if not real_offsite:
        return WARN, detail + " — no confirmed off-site copy: nothing has left this SSD yet"
    if not (HOME / ".ai-os" / "backup-key-saved").exists():
        return WARN, detail + " — the key is only in this Mac's Keychain: run `ai-os backup --show-key`, save it in a password manager, then `ai-os backup --confirm-key-saved`"
    return OK, detail


def check_secrets():
    rc, out = run([sys.executable, str(ROOT / "setup" / "ai-os-secrets.py")], 30)
    lines = [l for l in out.strip().splitlines() if l.strip()]
    if rc != 0:
        return FAIL, "; ".join(l.lstrip("❌⚠️ ") for l in lines if l.startswith(("❌", "⚠️")))[:200] or "ai-os secrets failed"
    return OK, "; ".join(l.lstrip("✅ ") for l in lines) + " (leak scan of repo histories: ai-os secrets audit)"


def check_disk():
    worst = []
    for p in {Path("/"), ROOT}:
        u = shutil.disk_usage(p)
        worst.append((u.free / u.total, p, u.free / 1e9))
    frac, p, gb = min(worst)
    status = FAIL if frac < 0.05 else WARN if frac < 0.10 else OK
    return status, f"lowest free: {gb:.0f} GB ({frac:.0%}) on {p}"


CHECKS = [
    ("docker", "Docker", check_docker),
    ("falkordb", "FalkorDB", check_falkordb),
    ("graphiti", "Graphiti memory", check_graphiti),
    ("graphiti-llm", "Graphiti LLM", check_graphiti_llm),
    ("memory-usage", "Memory usage", check_memory_usage),
    ("ollama", "Ollama", check_ollama),
    ("grepai", "grepai", check_grepai),
    ("cbm", "codebase-memory", check_codebase_memory),
    ("reindex", "Scheduled reindex", check_reindex),
    ("mcp", "MCP servers", check_mcp_servers),
    ("tokens", "API tokens", check_tokens),
    ("ci", "CI on main", check_ci),
    ("secrets", "Secrets (.env)", check_secrets),
    ("backup", "Backups", check_backup),
    ("disk", "Disk", check_disk),
]


def main():
    ap = argparse.ArgumentParser(description="Functional health checks for the running AI-OS.")
    ap.add_argument("--json", action="store_true")
    ap.add_argument("--notify", action="store_true", help="macOS notification when a check FAILs")
    ap.add_argument("--only", help="comma-separated check ids: " + ",".join(c[0] for c in CHECKS))
    a = ap.parse_args()
    selected = [c for c in CHECKS if not a.only or c[0] in a.only.split(",")]

    started = time.time()

    def guarded(check):
        cid, label, fn = check
        t = time.time()
        try:
            status, detail = fn()
        except Exception as e:  # a crashing check is itself a finding
            status, detail = FAIL, f"check crashed: {type(e).__name__}: {e}"
        return {"id": cid, "check": label, "status": status, "detail": detail, "seconds": round(time.time() - t, 1)}

    with cf.ThreadPoolExecutor(max_workers=6) as ex:
        results = list(ex.map(guarded, selected))

    fails = [r for r in results if r["status"] == FAIL]
    warns = [r for r in results if r["status"] == WARN]
    if a.json:
        print(json.dumps({"ok": not fails, "seconds": round(time.time() - started, 1), "checks": results}, indent=2, ensure_ascii=False))
    else:
        print(f"AI-OS health — {time.strftime('%Y-%m-%d %H:%M')}")
        for r in results:
            print(f"{ICON[r['status']]} {r['check']:<18} {r['detail']}")
        print(f"\n{len(results) - len(fails) - len(warns)} ok, {len(warns)} warn, {len(fails)} fail in {time.time() - started:.0f}s")

    if a.notify and fails:
        msg = "; ".join(f"{r['check']}: {r['detail']}" for r in fails)[:220].replace('"', "'")
        run(["osascript", "-e", f'display notification "{msg}" with title "AI-OS health: {len(fails)} failing" sound name "Basso"'], 10)
    return 1 if fails else 0


if __name__ == "__main__":
    for _stream in (sys.stdout, sys.stderr):  # Windows consoles default to cp1252 and choke on the status symbols
        if hasattr(_stream, "reconfigure"):
            _stream.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
