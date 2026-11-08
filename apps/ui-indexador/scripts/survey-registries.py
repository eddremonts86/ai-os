#!/usr/bin/env python3
"""Survey what the shadcn registries actually contain, for a given kind of page.

  survey-registries.py items     --out DIR [--min-score 0]   # every item, tagged by section kind
  survey-registries.py sitemaps  --out DIR                   # robots.txt -> sitemaps -> preview URLs
  survey-registries.py classify  --out DIR [--kinds hero,about]  # fetch each item's source, tag its layout

Run them in order; each step reads the previous step's JSON from DIR. Inputs: the ranked index in
../data/registries.json (rank-registries.py) and the live directory at ui.shadcn.com/r/registries.json.

Why three sources: a registry's registry.json says what it exports (name, description, categories);
its sitemap says where each block's preview page lives; each item's JSON carries the full source, so
the layout can be read from the code for every item, not only the ones someone screenshotted.
The code tags are heuristics (an avatar row reads as "person"): use them to narrow a shortlist, then
look at the blocks (render them, see apps/ui-indexador) before choosing.
Standard library only. Surveyed for a developer profile site on 2026-11-06: 14,775 items, 4,062 classified.
"""

import argparse
import concurrent.futures as cf
import json
import re
import urllib.parse
import urllib.request
from collections import Counter
from pathlib import Path

HERE = Path(__file__).resolve().parent
DIRECTORY = "https://ui.shadcn.com/r/registries.json"
UA = {"User-Agent": "Mozilla/5.0 (ai-os registry survey)"}
SKIP_TYPES = {"registry:style", "registry:theme", "registry:lib", "registry:hook", "registry:font"}
KINDS = [  # section kind by item name/title/description/categories; first match wins
    ("hero", r"hero"),
    ("portfolio/profile", r"portfolio|profile|personal|resume|\bcv\b|\bbio\b|about[-_ ]?me|developer[-_ ]?card"),
    ("about", r"\babout"), ("projects/showcase", r"project|showcase|case[-_ ]?stud|work[-_ ]?grid|gallery|bento"),
    ("timeline/experience", r"timeline|experience|career|journey|changelog"),
    ("testimonials", r"testimonial|review|quote"), ("pricing", r"pricing|plans?\b"),
    ("skills/logos", r"skill|tech[-_ ]?stack|logo[-_ ]?cloud|marquee|logos"), ("faq", r"\bfaq"),
    ("contact/cta", r"contact|cta|call[-_ ]?to[-_ ]?action|newsletter"), ("nav/header", r"navbar|header|nav[-_ ]?bar|navigation"),
    ("footer", r"footer"), ("stats", r"\bstats?\b|metric|counter"),
]
FEATURES = {  # code feature -> regex over the item's source
    "split": r"(?:md|lg|xl):grid-cols-(?:2|12)|(?:md|lg):flex-row|grid-cols-\[",
    "centered": r"\btext-center\b.*\bmx-auto\b|\bmx-auto\b.*\btext-center\b",
    "image": r"<img\b|<Image\b|\.(?:jpe?g|png|webp|avif)[\"']",
    "person": r"avatar|portrait|headshot|profile[-_ ]?(?:pic|photo|image)|Avatar",
    "video": r"<video\b|youtube|vimeo", "shader3d": r"three|@react-three|webgl|shader|<canvas|\bogl\b",
    "marquee": r"marquee|animate-scroll|infinite[-_ ]?scroll", "cards": r"(?:md|lg):grid-cols-(?:3|4)",
    "timeline": r"timeline|border-l\b.*before:", "bento": r"row-span-2|col-span-2",
    "glass": r"backdrop-blur", "gradtext": r"bg-clip-text|text-transparent",
    "wide": r"max-w-(?:6xl|7xl|screen-xl|screen-2xl)", "narrow": r"max-w-(?:xl|2xl|3xl|prose)\b",
    "motion": r"framer-motion|motion/react|gsap",
}
FEATURES = {k: re.compile(v, re.I | re.S) for k, v in FEATURES.items()}


def get(url, as_json=True, timeout=15):
    with urllib.request.urlopen(urllib.request.Request(url, headers=UA), timeout=timeout) as r:
        body = r.read().decode("utf-8", "replace")
    return json.loads(body) if as_json else body


def pool(fn, xs, n=24):
    with cf.ThreadPoolExecutor(n) as ex:
        return list(ex.map(fn, xs))


def items(out, min_score):
    ranked = {r["name"]: r for r in json.loads((HERE.parent / "data" / "registries.json").read_text()) if r["score"] >= min_score}
    src = {r["name"]: r for r in get(DIRECTORY, timeout=30)}

    def one(name):
        try:
            d = get(src[name]["url"].replace("{name}", "registry"))
        except Exception:
            return []
        rows = []
        for it in d.get("items", []):
            if it.get("type") in SKIP_TYPES:
                continue
            txt = " ".join([it.get("name", ""), it.get("title") or "", it.get("description") or "",
                            " ".join(it.get("categories") or [])]).lower()
            kind = next((k for k, pat in KINDS if re.search(pat, txt)), None)
            if kind:
                r = ranked[name]
                rows.append({"registry": name, "name": it.get("name"), "kind": kind, "type": it.get("type"),
                             "desc": (it.get("description") or it.get("title") or "")[:160], "url": src[name]["url"],
                             "stars": r["stars"], "license": r["license"], "homepage": r["homepage"]})
        return rows

    rows = [r for rs in pool(one, [n for n in ranked if n in src]) for r in rs]
    (out / "items.json").write_text(json.dumps(rows, indent=1))
    print(f"{len(rows)} section items in {len({r['registry'] for r in rows})} registries:", Counter(r["kind"] for r in rows).most_common())


def sitemaps(out):
    regs = {r["registry"]: r["homepage"] for r in json.loads((out / "items.json").read_text())}
    preview = re.compile(r"preview|/view/|/blocks?/|/r/|/demo", re.I)

    def walk(sm, seen):
        if sm in seen or len(seen) > 12:
            return []
        seen.add(sm)
        try:
            locs = re.findall(r"<loc>\s*([^<\s]+)\s*</loc>", get(sm, as_json=False))
        except Exception:
            return []
        return [u for loc in locs for u in (walk(loc, seen) if loc.endswith(".xml") else [loc])]

    def one(item):
        name, home = item
        base = "{0.scheme}://{0.netloc}".format(urllib.parse.urlparse(home))
        try:
            sms = re.findall(r"(?im)^\s*sitemap:\s*(\S+)", get(base + "/robots.txt", as_json=False))
        except Exception:
            sms = []
        urls = [u for s in (sms or [base + "/sitemap.xml"]) for u in walk(s, set())]
        return {"registry": name, "urls_total": len(urls), "preview_like": [u for u in urls if preview.search(u)][:2000]}

    res = pool(one, list(regs.items()), 20)
    (out / "sitemaps.json").write_text(json.dumps(res, indent=1))
    print(f"{sum(1 for r in res if r['urls_total'])}/{len(res)} registries have a sitemap; "
          f"{sum(len(r['preview_like']) for r in res)} preview-like URLs")


def classify(out, kinds):
    rows = [r for r in json.loads((out / "items.json").read_text()) if not kinds or r["kind"] in kinds]

    def one(r):
        try:
            d = get(r["url"].replace("{name}", r["name"]))
        except Exception:
            return None
        code = "\n".join(f.get("content") or "" for f in d.get("files", []))
        if not code:
            return None
        f = {k: bool(p.search(code)) for k, p in FEATURES.items()}
        if r["kind"] == "timeline/experience":
            lay = "timeline" if f["timeline"] else "card-grid" if f["cards"] else "list-rows"
        elif r["kind"] == "projects/showcase":
            lay = "bento-grid" if f["bento"] else "card-grid" if f["cards"] else "horizontal-strip" if f["marquee"] else "list-rows"
        elif f["shader3d"]:
            lay = "shader-or-3d-background"
        elif f["video"]:
            lay = "video"
        elif f["split"]:
            lay = "split-text-portrait" if f["person"] else "split-text-media" if f["image"] else "split-text-only"
        elif f["centered"]:
            lay = "centered-text" + ("+media" if f["image"] else "")
        else:
            lay = "text-only-left" if not f["image"] else "media-other"
        return {**r, "layout": lay, **f}

    res = [x for x in pool(one, rows, 32) if x]
    (out / "classified.json").write_text(json.dumps(res, indent=1))
    print(f"classified {len(res)}/{len(rows)}")
    for k in sorted({x["kind"] for x in res}):
        print(f"  {k}:", Counter(x["layout"] for x in res if x["kind"] == k).most_common())


def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("step", choices=["items", "sitemaps", "classify"])
    ap.add_argument("--out", required=True)
    ap.add_argument("--min-score", type=float, default=0)
    ap.add_argument("--kinds", default="", help="comma list of section kinds for classify (default: all)")
    a = ap.parse_args()
    out = Path(a.out)
    out.mkdir(parents=True, exist_ok=True)
    {"items": lambda: items(out, a.min_score), "sitemaps": lambda: sitemaps(out),
     "classify": lambda: classify(out, set(filter(None, a.kinds.split(","))))}[a.step]()


if __name__ == "__main__":
    main()
