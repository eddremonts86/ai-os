#!/usr/bin/env python3
"""ai-os skills — keep the skill catalogue cheap and unambiguous.

Every linked skill's name and description is loaded into every session of every CLI,
so the catalogue has a standing token cost, and overlapping triggers make the wrong
skill fire. On 2026-11-05 it was 203 skills / ~14.6K tokens with ~30 UI skills and no
routing rule; this keeps it from drifting back.

  ai-os skills                 # lint: budget, name/dir mismatches, near-duplicate descriptions
  ai-os skills lint --strict   # exit 1 on a hard problem (what the pre-push hook runs)
  ai-os skills route "text"    # which skills a request lexically matches best
  ai-os skills bank            # run setup/skills-routing-bank.json (32 typical requests)

`route`/`bank` score descriptions with TF-IDF word overlap. That is NOT the model's real
choice — it is a regression alarm: a skill whose description loses its trigger words, or
a new skill that steals a prompt, shows up here. Real activation is judged by the model.
"""

import argparse
import json
import math
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HARD_MAX = 500      # chars: above this a description is trimmed (fails --strict)
SOFT_MAX = 350      # chars: the target after the 2026-11-05 trim
DUP_JACCARD = 0.5   # descriptions this similar compete for the same requests
BANK = ROOT / "setup" / "skills-routing-bank.json"
STOP = set("""a an and are as at be by can for from has have how i in into is it its of on or that the this to use used
using when with you your not do does no any all also than then them they their there these those which who will would
should could may might must up out over per via etc e g such like each other more most some only own same so too very just
skill skills user asks ask work working""".split())


def parse(text):
    m = re.match(r"---\n(.*?)\n---", text, re.S)
    if not m:
        return {}
    try:
        import yaml
        return yaml.safe_load(m.group(1)) or {}
    except ImportError:  # CI runners have PyYAML; fall back to a scalar-only reader
        out = {}
        for line in m.group(1).splitlines():
            k, _, v = line.partition(":")
            if k in ("name", "description"):
                out[k] = v.strip().strip("\"'")
        return out
    except Exception:
        return {}


def load():
    """Every skill the installer links into the CLIs: flat + ECC DAILY + gstack."""
    dirs = [d for d in (ROOT / "ai-config" / "skills").iterdir() if (d / "SKILL.md").is_file()]
    daily = (ROOT / "vendor" / "ecc" / "DAILY_SKILLS.txt")
    names = [l.strip() for l in daily.read_text(encoding="utf-8").splitlines() if l.strip() and not l.startswith("#")] if daily.exists() else []
    dirs += [d for n in names if (d := ROOT / "vendor" / "ecc" / "skills" / n).is_dir() and (d / "SKILL.md").is_file()]
    gstack = ROOT / "vendor" / "gstack"
    dirs += [d for d in gstack.iterdir() if (d / "SKILL.md").is_file()] if gstack.exists() else []
    skills = []
    for d in dirs:
        fm = parse((d / "SKILL.md").read_text(encoding="utf-8"))
        skills.append({"dir": d.name, "name": str(fm.get("name") or d.name), "description": " ".join(str(fm.get("description") or "").split())})
    return skills


def words(text):
    out = []
    for w in re.findall(r"[a-z][a-z0-9+#.-]{2,}", text.lower()):
        w = w.strip(".-")
        w = re.sub(r"(ing|ed|es|s)$", "", w) if len(w) > 5 else w
        if w and w not in STOP:
            out.append(w)
    return out


def lint(strict=False):
    skills = load()
    problems, notes = [], []
    total = sum(len(s["description"]) + len(s["name"]) for s in skills)
    for s in skills:
        n = len(s["description"])
        if not s["description"]:
            problems.append(f"{s['dir']}: empty description")
        elif n > HARD_MAX:
            problems.append(f"{s['dir']}: description {n} chars (> {HARD_MAX}); trim to ≤ {SOFT_MAX}")
        elif n > SOFT_MAX:
            notes.append(f"{s['dir']}: description {n} chars (target ≤ {SOFT_MAX})")
        if s["name"] != s["dir"]:
            notes.append(f"{s['dir']}: frontmatter name is '{s['name']}' (two names for one trigger)")
    sets = {s["dir"]: set(words(s["description"])) for s in skills}
    keys = sorted(sets)
    dups = []
    for i, a in enumerate(keys):
        for b in keys[i + 1:]:
            if len(sets[a]) >= 6 and len(sets[b]) >= 6:
                j = len(sets[a] & sets[b]) / len(sets[a] | sets[b])
                if j >= DUP_JACCARD:
                    dups.append((j, a, b))
    for j, a, b in sorted(dups, reverse=True):
        notes.append(f"{a} ~ {b}: descriptions {j:.0%} alike — do both need to exist?")
    print(f"{len(skills)} linked skills; always-loaded text ≈ {total // 4:,} tokens ({total:,} chars)")
    for p in problems:
        print(f"❌ {p}")
    for n in notes:
        print(f"⚠️  {n}")
    if not problems and not notes:
        print("✅ catalogue within budget, no near-duplicates")
    return 1 if (strict and problems) else 0


def index():
    skills = load()
    docs = {s["dir"]: Counter(words(s["name"].replace("-", " ") + " " + s["description"])) for s in skills}
    df = Counter(w for c in docs.values() for w in c)
    n = len(docs)
    idf = {w: math.log((n + 1) / (c + 0.5)) for w, c in df.items()}
    return docs, idf


def route(prompt, k=3):
    docs, idf = index()
    q = Counter(words(prompt))
    scored = []
    for name, c in docs.items():
        score = sum(idf.get(w, 0) * (1 + math.log(c[w])) for w in q if w in c)
        scored.append((score, name))
    return [name for score, name in sorted(scored, reverse=True)[:k] if score > 0]


def bank(threshold):
    entries = json.loads(BANK.read_text(encoding="utf-8"))
    known = {s["dir"] for s in load()}
    unknown = sorted({e for x in entries for e in x["expect"] if e not in known})
    hits, misses = 0, []
    for x in entries:
        top = route(x["prompt"])
        if any(e in top for e in x["expect"]):
            hits += 1
        else:
            misses.append((x["prompt"], x["expect"], top))
    for u in unknown:
        print(f"❌ bank expects '{u}', which is not a linked skill (retired or renamed?)")
    for prompt, expect, top in misses:
        print(f"⚠️  \"{prompt}\"\n     expected one of {expect}, lexical top-3 {top}")
    rate = hits / len(entries)
    print(f"\nrouting bank: {hits}/{len(entries)} requests land an expected skill in the top 3 ({rate:.0%}; alarm below {threshold:.0%})")
    return 1 if unknown or rate < threshold else 0


def main():
    ap = argparse.ArgumentParser(description="Keep the skill catalogue cheap and unambiguous.")
    ap.add_argument("command", nargs="?", default="lint", choices=["lint", "route", "bank"])
    ap.add_argument("text", nargs="*")
    ap.add_argument("--strict", action="store_true")
    ap.add_argument("--threshold", type=float, default=0.7)
    a = ap.parse_args()
    if a.command == "route":
        print("\n".join(route(" ".join(a.text))) or "no skill matches")
        return 0
    if a.command == "bank":
        return bank(a.threshold)
    return lint(a.strict)


if __name__ == "__main__":
    sys.exit(main())
