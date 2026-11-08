#!/usr/bin/env python3
"""ui-indexador: read-only HTTP API over the shadcn registry index and the captured design gallery.

  python3 server.py [--port 3040] [--host 127.0.0.1]      (env: UI_INDEXER_PORT, UI_INDEXER_HOST)

Endpoints (all GET, JSON unless noted):
  /health                                  {"ok": true, counts}
  /registries?category=&q=&limit=          ranked registries (data/registries.json), best score first
  /blocks?kind=&layout=&tone=&registry=&min_fit=&q=&limit=
                                           surveyed blocks (data/survey/*.csv), best fit first
  /captures?dir=sites|blocks&kind=&q=      captured screenshots, each with a /files/ url
  /index.md, /registries.md                the curated pattern notes and ranked tables (text/markdown)
  /files/<path>                            a file under data/ (the screenshots)

Standard library only. The data is loaded per request: files are small and edits show up without a restart.
"""

import argparse
import csv
import json
import mimetypes
import os
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import parse_qs, unquote, urlparse

DATA = Path(__file__).resolve().parent / "data"
MAX_LIMIT = 500


def registries():
    return json.loads((DATA / "registries.json").read_text(encoding="utf-8"))


def blocks():
    rows = []
    for f in sorted((DATA / "survey").glob("*.csv")):
        with f.open(encoding="utf-8", newline="") as fh:
            for r in csv.DictReader(fh):
                item = r.get("item") or r.get("item_or_label") or ""
                try:
                    fit = int(r.get("fit") or 0)
                except ValueError:
                    fit = 0
                rows.append({"registry": r.get("registry", ""), "item": item, "kind": r.get("kind", ""),
                             "layout": r.get("layout", ""), "width": r.get("width", ""), "media": r.get("media", ""),
                             "tone": r.get("tone", ""), "fit": fit, "url": r.get("url", ""),
                             "date": r.get("date") or f.stem.removeprefix("blocks-"), "survey": f.name})
    return rows


def captures():
    out = []
    for top in ("sites", "blocks"):
        for p in sorted((DATA / top).rglob("*.jpg")):
            rel = p.relative_to(DATA)
            kind = rel.parts[1] if len(rel.parts) > 2 else ("site" if top == "sites" else "unsorted")
            out.append({"dir": top, "kind": kind, "name": p.stem, "url": f"/files/{rel.as_posix()}"})
    return out


def match(row, field, wanted):
    return not wanted or str(row.get(field, "")).lower() == wanted.lower()


def contains(row, q, fields):
    return not q or any(q.lower() in str(row.get(f, "")).lower() for f in fields)


def limit_of(qs, default=100):
    try:
        return max(1, min(int(qs.get("limit", default)), MAX_LIMIT))
    except ValueError:
        return default


class Handler(BaseHTTPRequestHandler):
    server_version = "ui-indexador/1"

    def send(self, code, body, ctype="application/json; charset=utf-8"):
        data = body if isinstance(body, bytes) else (
            json.dumps(body, ensure_ascii=False, indent=1).encode() if not isinstance(body, str) else body.encode())
        self.send_response(code)
        self.send_header("Content-Type", ctype)
        self.send_header("Content-Length", str(len(data)))
        self.send_header("X-Content-Type-Options", "nosniff")
        self.end_headers()
        self.wfile.write(data)

    def do_GET(self):
        u = urlparse(self.path)
        qs = {k: v[0] for k, v in parse_qs(u.query).items()}
        path = u.path.rstrip("/") or "/"
        try:
            if path in ("/", "/health"):
                self.send(200, {"ok": True, "registries": len(registries()), "blocks": len(blocks()),
                                "captures": len(captures())})
            elif path == "/registries":
                rows = [r for r in registries()
                        if match(r, "category", qs.get("category"))
                        and contains(r, qs.get("q"), ("name", "description", "category"))]
                rows.sort(key=lambda r: r.get("score", 0), reverse=True)
                self.send(200, {"total": len(rows), "items": rows[:limit_of(qs)]})
            elif path == "/blocks":
                min_fit = int(qs.get("min_fit", 0) or 0)
                rows = [r for r in blocks()
                        if all(match(r, f, qs.get(f)) for f in ("kind", "layout", "tone", "registry"))
                        and r["fit"] >= min_fit and contains(r, qs.get("q"), ("registry", "item", "layout", "url"))]
                rows.sort(key=lambda r: r["fit"], reverse=True)
                self.send(200, {"total": len(rows), "items": rows[:limit_of(qs)]})
            elif path == "/captures":
                rows = [r for r in captures() if match(r, "dir", qs.get("dir")) and match(r, "kind", qs.get("kind"))
                        and contains(r, qs.get("q"), ("name",))]
                self.send(200, {"total": len(rows), "items": rows[:limit_of(qs, MAX_LIMIT)]})
            elif path in ("/index.md", "/registries.md"):
                self.send(200, (DATA / path.lstrip("/")).read_text(encoding="utf-8"), "text/markdown; charset=utf-8")
            elif path.startswith("/files/"):
                target = (DATA / unquote(path.removeprefix("/files/"))).resolve()
                if not target.is_relative_to(DATA) or not target.is_file():
                    self.send(404, {"error": "not found"})
                else:
                    self.send(200, target.read_bytes(), mimetypes.guess_type(target.name)[0] or "application/octet-stream")
            else:
                self.send(404, {"error": "not found", "see": "/health"})
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
