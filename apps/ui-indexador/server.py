#!/usr/bin/env python3
"""ui-indexador HTTP API: read-only, JSON. The same queries are offered over MCP by mcp_server.py.

  python3 server.py [--port 3040] [--host 127.0.0.1]      (env: UI_INDEXER_PORT, UI_INDEXER_HOST)

  /health                                             data counts, or what is missing
  /items?q=&kind=&type=&registry=&layout=&feature=&dep=&mode=auto|semantic|keyword&include_hidden=&limit=&offset=
                                                      search EVERY indexed component and block (install command included);
                                                      semantic by meaning when embeddings + Ollama are there
  /facets                                             the kinds, types, layouts, features you can filter by
  /registries?category=&q=&limit=                     ranked registries
  /blocks?kind=&layout=&tone=&registry=&min_fit=&q=   hand-scored blocks from the surveys
  /captures?dir=sites|blocks&kind=&q=                 screenshots, each with a /files/ url
  /themes?q=&vibe=   /themes/<name>                   tweakcn presets; one preset with tokens and CSS
  /index.md, /registries.md                           curated notes (markdown)
  /files/<path>                                       a file under data/

Standard library only; semantic search also needs numpy (run it with ~/.ai-os/venv/bin/python).
"""

import argparse
import json
import mimetypes
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from urllib.parse import parse_qs, unquote, urlparse

import indexer
from indexer import DATA

ROUTES = {
    "/health": lambda q: indexer.health(),
    "/items": lambda q: indexer.items(q.get("q"), q.get("kind"), q.get("type"), q.get("registry"), q.get("layout"),
                                      q.get("feature"), q.get("dep"), q.get("limit"), q.get("offset"),
                                      q.get("mode", "auto"), q.get("include_hidden", False)),
    "/facets": lambda q: indexer.facets(),
    "/registries": lambda q: indexer.registries(q.get("category"), q.get("q"), q.get("limit")),
    "/blocks": lambda q: indexer.blocks(q.get("kind"), q.get("layout"), q.get("tone"), q.get("registry"),
                                        q.get("min_fit"), q.get("q"), q.get("limit")),
    "/captures": lambda q: indexer.captures(q.get("dir"), q.get("kind"), q.get("q"), q.get("limit")),
    "/themes": lambda q: indexer.themes(q.get("q"), q.get("vibe")),
}


class Handler(BaseHTTPRequestHandler):
    server_version = "ui-indexador/2"

    def send(self, code, body, ctype="application/json; charset=utf-8"):
        if isinstance(body, str):
            body = body.encode()
        elif not isinstance(body, bytes):
            body = json.dumps(body, ensure_ascii=False, indent=1).encode()
        self.send_response(code)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(body)))
        self.send_header("X-Content-Type-Options", "nosniff")
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self):
        u = urlparse(self.path)
        q = {k: v[0] for k, v in parse_qs(u.query).items()}
        path = u.path.rstrip("/") or "/health"
        try:
            if path in ROUTES:
                self.send(200, ROUTES[path](q))
            elif path.startswith("/themes/"):
                self.send(200, indexer.theme(unquote(path.removeprefix("/themes/"))))
            elif path in ("/index.md", "/registries.md"):
                self.send(200, indexer.notes(path.lstrip("/")), "text/markdown; charset=utf-8")
            elif path.startswith("/files/"):
                target = (DATA / unquote(path.removeprefix("/files/"))).resolve()
                if not target.is_relative_to(DATA) or not target.is_file():
                    raise FileNotFoundError(path)
                self.send(200, target.read_bytes(), mimetypes.guess_type(target.name)[0] or "application/octet-stream")
            else:
                self.send(404, {"error": "not found", "see": "/health"})
        except FileNotFoundError as e:
            self.send(404 if "missing" not in str(e) else 503, {"error": str(e) if "missing" in str(e) else "not found"})
        except ValueError as e:
            self.send(400, {"error": str(e)})

    def log_message(self, fmt, *args):
        pass


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("--port", type=int, default=int(os.environ.get("UI_INDEXER_PORT", 3040)))
    ap.add_argument("--host", default=os.environ.get("UI_INDEXER_HOST", "127.0.0.1"))
    a = ap.parse_args()
    srv = ThreadingHTTPServer((a.host, a.port), Handler)
    print(f"ui-indexador on http://{a.host}:{a.port}", flush=True)
    srv.serve_forever()


if __name__ == "__main__":
    main()
