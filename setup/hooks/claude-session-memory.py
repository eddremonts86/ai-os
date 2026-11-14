#!/usr/bin/env python3
"""Claude Code SessionStart hook: preload what graphiti remembers about this repo.

The "Use the memory stack" rule asked agents to search graphiti before working;
nothing made them, and the graph stayed unused. This hook does the search itself:
it takes the session's repo (git toplevel name = graphiti group_id), asks graphiti
for current facts in that group and in `main`, and hands them to the session as
additionalContext, plus the exact group_id to record new decisions under.

Stdlib only. Never blocks a session: any failure (graphiti down, timeout, odd
input) exits 0 with no output. Wired into ~/.claude/settings.json by
setup/wire-memory-hook.py.
"""

import json
import os
import subprocess
import sys
import urllib.error
import urllib.parse
import urllib.request

GRAPHITI = os.environ.get("AIOS_GRAPHITI_URL", "http://127.0.0.1:8021/mcp/")
MAX_FACTS = 8
TIMEOUT = 4  # seconds per request; a session start must stay snappy


def post(url, payload, headers):
    req = urllib.request.Request(url, data=json.dumps(payload).encode(), method="POST",
                                 headers={"Content-Type": "application/json", **headers})
    try:
        with urllib.request.urlopen(req, timeout=TIMEOUT) as r:
            return r.read().decode(), dict(r.headers)
    except urllib.error.HTTPError as e:
        loc = (e.headers or {}).get("Location")
        if e.code in (307, 308) and loc:  # graphiti redirects /mcp/ → /mcp
            return post(urllib.parse.urljoin(url, loc), payload, headers)
        raise


def body_json(text):
    for line in text.splitlines():
        if line.startswith("data:"):
            return json.loads(line[5:].strip())
    return json.loads(text)


def search(groups, query):
    hdr = {"Accept": "application/json, text/event-stream"}
    _, h = post(GRAPHITI, {"jsonrpc": "2.0", "id": 1, "method": "initialize", "params": {
        "protocolVersion": "2025-06-18", "capabilities": {},
        "clientInfo": {"name": "ai-os-session-memory", "version": "1"}}}, hdr)
    sid = h.get("mcp-session-id") or h.get("Mcp-Session-Id")
    if sid:
        hdr["mcp-session-id"] = sid
    post(GRAPHITI, {"jsonrpc": "2.0", "method": "notifications/initialized"}, hdr)
    text, _ = post(GRAPHITI, {"jsonrpc": "2.0", "id": 2, "method": "tools/call", "params": {
        "name": "search_memory_facts",
        "arguments": {"query": query, "group_ids": groups, "max_facts": MAX_FACTS}}}, hdr)
    result = body_json(text).get("result", {})
    payload = result.get("structuredContent") or {}
    if not payload:
        for c in result.get("content", []):
            if c.get("type") == "text":
                payload = json.loads(c["text"])
                break
    payload = payload.get("result", payload)
    return [f for f in payload.get("facts", []) if not f.get("invalid_at") and not f.get("expired_at")]


def scope_lines(cwd):
    """Which scope this folder belongs to (personal / employer / company), from ai-os scope. Silent on any failure."""
    root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
    py = os.path.expanduser("~/.ai-os/venv/bin/python")
    try:
        out = subprocess.run([py if os.path.exists(py) else "python3", os.path.join(root, "setup", "ai-os-scope.py"),
                              "which", cwd, "--json"], capture_output=True, text=True, timeout=3).stdout
        info = json.loads(out)
    except Exception:
        return []
    if not info.get("scope") or "label" not in info:
        return []
    head = f"AI-OS scope: {info['label']}" + (f", brand {info['brand']}" if info.get("brand") else "")
    lines = [head + ". Work by this scope's rules, design system and git identity; keep other scopes' material out."]
    lines += [f"- design {k}: {v}" for k, v in (info.get("design") or {}).items()]
    if info.get("notes"):
        lines.append(f"- notes: {info['notes']}")
    return lines


def main():
    try:
        event = json.load(sys.stdin)
    except ValueError:
        event = {}
    cwd = event.get("cwd") or os.getcwd()
    top = subprocess.run(["git", "-C", cwd, "rev-parse", "--show-toplevel"],
                         capture_output=True, text=True, timeout=3).stdout.strip()
    # Outside a git repo, only `main`: graphiti creates a graph for every group it
    # is asked about, so searching by directory name would litter FalkorDB.
    repo = os.path.basename(top) if top else "main"
    groups = [repo] if repo == "main" else [repo, "main"]

    facts = search(groups, f"{repo}: decisions, conventions, root causes, environment facts")
    lines = [f"AI-OS memory — graphiti remembers ({', '.join(groups)}):"]
    seen = set()
    for f in facts:
        text = " ".join(f.get("fact", "").split())
        if text and text not in seen:
            seen.add(text)
            when = (f.get("valid_at") or f.get("created_at") or "")[:10]
            lines.append(f"- {text}" + (f" ({when})" if when else ""))
    if len(lines) == 1:
        lines = [f"AI-OS memory: graphiti has no facts yet for group `{repo}`."]
    lines.append(f"Search more with graphiti search_memory_facts (group_ids [\"{repo}\"]); record settled "
                 f"decisions, root causes and conventions with add_memory, group_id \"{repo}\".")
    lines = scope_lines(cwd) + lines
    print(json.dumps({"hookSpecificOutput": {"hookEventName": "SessionStart",
                                             "additionalContext": "\n".join(lines)}}))


if __name__ == "__main__":
    try:
        main()
    except Exception:
        pass  # never block or clutter a session start
    sys.exit(0)
