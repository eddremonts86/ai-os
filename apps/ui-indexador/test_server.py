#!/usr/bin/env python3
"""Smoke test: start the HTTP API on a free port and hit every endpoint; list the MCP tools if `mcp` is installed.

  python3 test_server.py        (needs data/catalog.json: scripts/survey-registries.py catalog --out data)
"""

import json
import threading
from http.server import ThreadingHTTPServer
from urllib.error import HTTPError
from urllib.request import urlopen

from server import Handler

srv = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
threading.Thread(target=srv.serve_forever, daemon=True).start()
base = f"http://127.0.0.1:{srv.server_address[1]}"


def get(path):
    with urlopen(base + path) as r:
        return r.status, r.headers.get("Content-Type"), r.read()


def js(path):
    return json.loads(get(path)[2])


h = js("/health")
assert h["ok"] and h["items"] > 10000 and h["registries"] > 0 and h["themes"] > 0 and h["captures"] > 0, h

heroes = js("/items?kind=hero&limit=5")
assert heroes["total"] > 100 and all(i["kind"] == "hero" and i["install"].startswith("npx shadcn@latest add @")
                                     for i in heroes["items"]), heroes["items"][:1]
login = js("/items?q=login+form&type=block")["items"]
assert login and all(i["type"] == "block" for i in login)
assert js("/items?dep=recharts&limit=3")["items"], "dep filter"
page2 = js("/items?kind=hero&limit=5&offset=5")["items"]
assert page2 and page2[0]["name"] != heroes["items"][0]["name"]

f = js("/facets")
assert f["kinds"] and f["types"], f.keys()

regs = js("/registries?limit=5")["items"]
assert len(regs) == 5 and regs[0]["score"] >= regs[-1]["score"]

assert all(b["fit"] >= 4 for b in js("/blocks?kind=hero&min_fit=4")["items"])

caps = js("/captures?dir=blocks&kind=hero")["items"]
status, ctype, body = get(caps[0]["url"])
assert status == 200 and ctype == "image/jpeg" and body[:2] == b"\xff\xd8"

minimal = js("/themes?vibe=minimal")["items"]
assert minimal and all("minimal" in t["vibes"] for t in minimal)
t = js(f"/themes/{minimal[0]['name']}")
assert t["css"].startswith(":root {") and ".dark {" in t["css"] and "--primary:" in t["css"]

assert get("/index.md")[1].startswith("text/markdown")

for bad in ("/files/../server.py", "/files/%2e%2e/server.py", "/files/..%2Fserver.py", "/themes/nope", "/nope"):
    try:
        get(bad)
        raise AssertionError(f"{bad} should be 404")
    except HTTPError as e:
        assert e.code == 404, (bad, e.code)

srv.shutdown()

try:
    import asyncio

    import mcp_server

    tools = {t.name for t in asyncio.run(mcp_server.mcp.list_tools())}
    assert {"search_items", "list_facets", "search_themes", "get_theme"} <= tools, tools
    print(f"mcp tools: {sorted(tools)}")
except ImportError:
    print("mcp not installed for this Python: MCP tools not checked")

print(f"ok: {h}")
