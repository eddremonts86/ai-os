"""The queries behind both front doors (server.py = HTTP, mcp_server.py = MCP). Pure functions over data/.

Data files (see README for how each is made):
  catalog.json     every installable item of every ranked shadcn registry (scripts/survey-registries.py catalog)
  registries.json  the ranked registries (scripts/rank-registries.py)
  survey/*.csv     hand-classified blocks with a fit score (the 2026-11-06 surveys)
  sites/, blocks/  captured screenshots; INDEX.md the curated pattern notes
  themes.json      tweakcn theme presets with vibes (scripts/fetch-themes.py)
"""

import csv
import json
import re
from functools import lru_cache
from pathlib import Path

DATA = Path(__file__).resolve().parent / "data"
MAX_LIMIT = 500


def _mtime(name):
    p = DATA / name
    return p.stat().st_mtime if p.exists() else 0


@lru_cache(maxsize=4)
def _json(name, mtime):
    return json.loads((DATA / name).read_text(encoding="utf-8"))


def load(name):
    """A data file, re-read only when it changes on disk (a rebuilt catalog shows up without a restart)."""
    if not (DATA / name).exists():
        hint = {"catalog.json": "python3 scripts/survey-registries.py catalog --deep --out data",
                "themes.json": "python3 scripts/fetch-themes.py"}.get(name, "")
        raise FileNotFoundError(f"data/{name} is missing. Build it: {hint}".strip())
    return _json(name, _mtime(name))


def clamp(limit, default=50):
    try:
        return max(1, min(int(limit or default), MAX_LIMIT))
    except (TypeError, ValueError):
        return default


def _eq(value, wanted):
    return not wanted or str(value or "").lower() == str(wanted).lower()


def _words(q):
    return [w for w in str(q or "").lower().split() if w]


def _has_words(text, words):
    """Every query word starts a word in text ("air" finds "airline", "airline" does not find "hairline")."""
    return all(re.search(r"(?<![a-z0-9])" + re.escape(w), text) for w in words)


# ── registries ────────────────────────────────────────────────────────────────

def registries(category=None, q=None, limit=50):
    rows = [r for r in load("registries.json") if _eq(r.get("category"), category)
            and all(w in f"{r['name']} {r.get('description', '')} {r.get('category', '')}".lower() for w in _words(q))]
    rows.sort(key=lambda r: r.get("score", 0), reverse=True)
    return {"total": len(rows), "items": rows[:clamp(limit)]}


@lru_cache(maxsize=2)
def _registry_facts(mtime):
    return {r["name"]: r for r in load("registries.json")}


# ── the catalog: every item ───────────────────────────────────────────────────

def _expand(row):
    reg = _registry_facts(_mtime("registries.json")).get(row["r"], {})
    out = {"registry": row["r"], "name": row["n"], "type": row["t"], "kind": row["k"],
           "install": f"npx shadcn@latest add {row['r']}/{row['n']}"}
    for short, long in (("ti", "title"), ("d", "description"), ("c", "categories"), ("dep", "dependencies"),
                        ("lay", "layout"), ("f", "features")):
        if short in row:
            out[long] = row[short]
    out.update({"registry_stars": reg.get("stars"), "license": reg.get("license"), "homepage": reg.get("homepage")})
    return out


def items(q=None, kind=None, type=None, registry=None, layout=None, feature=None, dep=None, limit=50, offset=0):
    """Search every indexed component and block. All filters are optional and combine (AND).
    q matches every word against name, title, description and categories. Best-ranked registry first."""
    cat = load("catalog.json")
    facts = _registry_facts(_mtime("registries.json"))
    words = _words(q)
    hits = []
    for r in cat["items"]:
        if not (_eq(r["k"], kind) and _eq(r["t"], type) and _eq(r["r"], registry) and _eq(r.get("lay"), layout)):
            continue
        if feature and feature.lower() not in r.get("f", []):
            continue
        if dep and not any(dep.lower() in d.lower() for d in r.get("dep", [])):
            continue
        if words:
            hay = f"{r['n']} {r.get('ti', '')} {r.get('d', '')} {' '.join(r.get('c', []))} {r['k']}".lower()
            if not _has_words(hay, words):
                continue
        hits.append(r)

    def relevance(r):  # a word in the name or kind counts more than one in the description
        return sum(3 * (w in r["n"].lower()) + 3 * (w in r["k"]) + 2 * (w in r.get("ti", "").lower()) for w in words)

    hits.sort(key=lambda r: (-relevance(r), -(facts.get(r["r"], {}).get("score") or 0), r["n"]))
    start = max(0, int(offset or 0))
    return {"total": len(hits), "built": cat.get("built"), "items": [_expand(r) for r in hits[start:start + clamp(limit)]]}


def facets():
    """What the catalog can be filtered by, with counts: kinds, types, layouts, features."""
    from collections import Counter
    cat = load("catalog.json")["items"]
    count = lambda key: dict(Counter(r[key] for r in cat if key in r).most_common())
    return {"total": len(cat), "registries": len({r["r"] for r in cat}), "kinds": count("k"), "types": count("t"),
            "layouts": count("lay"), "features": dict(Counter(f for r in cat for f in r.get("f", [])).most_common())}


# ── the curated layer: hand-scored blocks, captures, notes ───────────────────

@lru_cache(maxsize=2)
def _survey(stamp):
    rows = []
    for f in sorted((DATA / "survey").glob("*.csv")):
        with f.open(encoding="utf-8", newline="") as fh:
            for r in csv.DictReader(fh):
                try:
                    fit = int(r.get("fit") or 0)
                except ValueError:
                    fit = 0
                rows.append({"registry": r.get("registry", ""), "item": r.get("item") or r.get("item_or_label") or "",
                             "kind": r.get("kind", ""), "layout": r.get("layout", ""), "width": r.get("width", ""),
                             "media": r.get("media", ""), "tone": r.get("tone", ""), "fit": fit, "url": r.get("url", ""),
                             "survey": f.name})
    return rows


def blocks(kind=None, layout=None, tone=None, registry=None, min_fit=0, q=None, limit=100):
    """Hand-classified blocks from the surveys, with a 1-5 fit score (fit was judged for a developer profile)."""
    stamp = tuple(f.stat().st_mtime for f in sorted((DATA / "survey").glob("*.csv")))
    words = _words(q)
    rows = [r for r in _survey(stamp)
            if _eq(r["kind"], kind) and _eq(r["layout"], layout) and _eq(r["tone"], tone) and _eq(r["registry"], registry)
            and r["fit"] >= int(min_fit or 0) and all(w in f"{r['registry']} {r['item']} {r['layout']}".lower() for w in words)]
    rows.sort(key=lambda r: r["fit"], reverse=True)
    return {"total": len(rows), "items": rows[:clamp(limit, 100)]}


def captures(dir=None, kind=None, q=None, limit=MAX_LIMIT):
    """Captured screenshots (1440x900). url is a path on the HTTP server (/files/...)."""
    out = []
    for top in ("sites", "blocks"):
        if dir and dir != top:
            continue
        for p in sorted((DATA / top).rglob("*.jpg")):
            rel = p.relative_to(DATA)
            k = rel.parts[1] if len(rel.parts) > 2 else ("site" if top == "sites" else "unsorted")
            if _eq(k, kind) and all(w in p.stem.lower() for w in _words(q)):
                out.append({"dir": top, "kind": k, "name": p.stem, "url": f"/files/{rel.as_posix()}"})
    return {"total": len(out), "items": out[:clamp(limit, MAX_LIMIT)]}


def notes(name="index.md"):
    files = {"index.md": "INDEX.md", "registries.md": "registries.md"}
    if name not in files:
        raise FileNotFoundError(name)
    return (DATA / files[name]).read_text(encoding="utf-8")


# ── themes ────────────────────────────────────────────────────────────────────

def themes(q=None, vibe=None):
    """tweakcn presets, summarised. q matches name, label, description, keywords and vibes."""
    words = _words(q)
    out = []
    for t in load("themes.json")["themes"]:
        if vibe and vibe.lower() not in [v.lower() for v in t["vibes"]]:
            continue
        hay = f"{t['name']} {t['label']} {t['description']} {' '.join(t['keywords'])} {' '.join(t['vibes'])}".lower()
        if all(w in hay for w in words):
            out.append({k: t[k] for k in ("name", "label", "description", "vibes", "primary", "fonts", "radius")})
    return {"total": len(out), "items": out}


def theme(name):
    """One preset with its full light/dark tokens and ready-to-paste CSS variables."""
    t = next((t for t in load("themes.json")["themes"] if t["name"] == name), None)
    if not t:
        raise FileNotFoundError(f"no theme {name!r}")
    block = lambda sel, toks: sel + " {\n" + "".join(f"  --{k}: {v};\n" for k, v in toks.items()) + "}\n"
    return {**t, "css": block(":root", t["light"]) + block(".dark", t["dark"]),
            "source": load("themes.json")["source"]}


def health():
    out = {"ok": True}
    for name, fn in (("items", lambda: len(load("catalog.json")["items"])), ("registries", lambda: len(load("registries.json"))),
                     ("themes", lambda: len(load("themes.json")["themes"])), ("captures", lambda: captures()["total"])):
        try:
            out[name] = fn()
        except FileNotFoundError as e:
            out["ok"], out[name] = False, str(e)
    return out
