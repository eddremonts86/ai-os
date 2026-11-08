#!/usr/bin/env python3
"""Smoke test: start the API on a free port and hit every endpoint.  python3 test_server.py"""

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
assert h["ok"] and h["registries"] > 0 and h["blocks"] > 0 and h["captures"] > 0, h

regs = js("/registries?limit=5")["items"]
assert len(regs) == 5 and regs[0]["score"] >= regs[-1]["score"]

heroes = js("/blocks?kind=hero&min_fit=4")["items"]
assert heroes and all(b["kind"] == "hero" and b["fit"] >= 4 for b in heroes)

caps = js("/captures?dir=blocks&kind=hero")["items"]
assert caps and all(c["kind"] == "hero" for c in caps)
status, ctype, body = get(caps[0]["url"])
assert status == 200 and ctype == "image/jpeg" and body[:2] == b"\xff\xd8"

assert get("/index.md")[1].startswith("text/markdown")

for bad in ("/files/../server.py", "/files/%2e%2e/server.py", "/files/..%2Fserver.py", "/nope"):
    try:
        get(bad)
        raise AssertionError(f"{bad} should be 404")
    except HTTPError as e:
        assert e.code == 404, (bad, e.code)

srv.shutdown()
print(f"ok: {h}")
