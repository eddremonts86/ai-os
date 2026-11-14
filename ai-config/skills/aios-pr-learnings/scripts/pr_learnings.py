#!/usr/bin/env python3
"""pr_learnings.py — Bitbucket Data Center PR review threads -> distillable batches.

  extract   fetch MERGED+DECLINED PRs (activities) into a per-PR disk cache; re-runs only fetch new PRs
  filter    cache -> threads, drop bots/trivia/self-comments, write metrics + a sample of drops
  batches   filtered threads -> size-bounded batch files for the distill step

Deterministic only. Distilling threads into rules is done by Claude (see ../SKILL.md).
Stdlib only. Token: BITBUCKET_TOKEN in the environment. Server: --base or BITBUCKET_BASE.
Data dir: ~/.pr-learnings/<project>-<repo>/  (never inside the repo being analysed).
"""
import argparse
import hashlib
import json
import os
import random
import re
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
from concurrent.futures import ThreadPoolExecutor
from datetime import datetime, timezone
from pathlib import Path

TRIVIAL = re.compile(
    r"^(lgtm|looks good( to me)?|thanks?( you)?|thx|tak( for det)?|ok(ay)?|okey|done|fixed?|fixet|rettet|"
    r"godkendt|approved?|nice|good|fine|great|yes|ja|nej|no|\+1|agreed?|enig|sure)$"
)
COORD = re.compile(r"(rebase|ping @|merge conflict|konflikt|please merge|can you merge|kan du merge|\bmerge (it|this|den)\b)", re.I)


def ts(ms):
    return datetime.fromtimestamp(ms / 1000, tz=timezone.utc).strftime("%Y-%m-%dT%H:%M:%SZ")


# ---------------------------------------------------------------- pure helpers (tested)
def hunk_text(diff, line, before=6, after=2, max_len=200):
    """Render the diff lines around the anchored line as +/-/space text."""
    out = []
    for h in (diff or {}).get("hunks", []):
        for seg in h.get("segments", []):
            sign = {"ADDED": "+", "REMOVED": "-"}.get(seg.get("type"), " ")
            for ln in seg.get("lines", []):
                n = ln.get("source") if sign == "-" else ln.get("destination")
                if line is None or (n is not None and line - before <= n <= line + after):
                    out.append(f"{sign}{ln.get('line', '')[:max_len]}")
    return "\n".join(out[:14])


def is_trivial(text):
    t = re.sub(r"[\W_]+", " ", text.lower()).strip()
    return len(t) < 12 and (not t or bool(TRIVIAL.match(t)) or len(t) < 4)


def build_threads(cached, bots=()):
    """cache entry {pr, comments:[activity], rescoped:[ms]} -> list of thread dicts (root + replies)."""
    seen, deleted = {}, set()

    def walk(c, root, anchor, diff):
        prev = seen.get(c["id"])
        if prev and prev["root"] is not None and root is None:
            root = prev["root"]
        seen[c["id"]] = {"c": c, "root": root, "anchor": anchor or (prev or {}).get("anchor"), "diff": diff or (prev or {}).get("diff")}
        for r in c.get("comments", []):
            walk(r, root if root is not None else c["id"], anchor, diff)

    for a in cached["comments"]:
        if a.get("commentAction") == "DELETED":
            deleted.add(a["comment"]["id"])
        else:
            # a reply may also arrive as its own activity; the root's nested walk later overrides its root id
            walk(a["comment"], a["comment"]["id"], a.get("commentAnchor"), a.get("diff"))
    pr, threads = cached["pr"], {}
    for cid, s in seen.items():
        if cid in deleted:
            continue
        threads.setdefault(s["root"] if s["root"] is not None else cid, []).append(s)
    out = []
    for root_id, members in threads.items():
        root = seen.get(root_id)
        if not root or root_id in deleted:
            continue
        c, anchor = root["c"], root["anchor"]
        msgs = sorted(members, key=lambda m: m["c"]["createdDate"])
        after = [r for r in cached.get("rescoped", []) if r > c["createdDate"]]
        resolved, orphaned = c.get("state") == "RESOLVED", bool(anchor and anchor.get("orphaned"))
        out.append({
            "thread_id": f"{pr['id']}-{root_id}", "pr_id": pr["id"], "pr_title": pr["title"], "pr_url": pr["url"],
            "pr_author": pr["author"], "pr_state": pr["state"], "created_at": ts(c["createdDate"]),
            "kind": "inline" if anchor else "general", "path": (anchor or {}).get("path"), "line": (anchor or {}).get("line"),
            "hunk": hunk_text(root["diff"], (anchor or {}).get("line")) if anchor else "",
            "resolved": resolved, "orphaned": orphaned, "commits_after": len(after),
            # ponytail: "applied" is a heuristic (anchor vanished, or resolved + commits followed); no per-file check
            "applied": orphaned or (resolved and bool(after)), "severity": c.get("severity", "NORMAL"),
            "is_bot": c["author"].get("type") != "NORMAL" or c["author"]["slug"] in bots,
            "root_author": c["author"]["slug"],
            "messages": [{"author": m["c"]["author"]["slug"], "role": "pr_author" if m["c"]["author"]["slug"] == pr["author"] else "reviewer",
                          "text": m["c"]["text"].strip()} for m in msgs],
        })
    return out


def drop_reason(t):
    root = t["messages"][0]["text"] if t["messages"] else ""
    if t["is_bot"]:
        return "bot"
    if t["root_author"] == t["pr_author"]:
        return "self_comment"
    if is_trivial(root):
        return "trivial"
    if len(root) < 120 and COORD.search(root):
        return "coordination"
    return None


# ---------------------------------------------------------------- Bitbucket DC adapter
class DC:
    def __init__(self, base, project, repo, token):
        self.base, self.token = base.rstrip("/"), token
        self.root = f"/rest/api/1.0/projects/{project}/repos/{repo}"

    def get(self, path, params=None, tries=6):
        url = self.base + path + ("?" + urllib.parse.urlencode(params) if params else "")
        for i in range(tries):
            try:
                req = urllib.request.Request(url, headers={"Authorization": f"Bearer {self.token}"})
                with urllib.request.urlopen(req, timeout=60) as r:
                    return json.load(r)
            except urllib.error.HTTPError as e:
                if e.code in (429, 502, 503, 504) and i < tries - 1:
                    time.sleep(float(e.headers.get("Retry-After", 2 ** i)))
                    continue
                raise
            except (urllib.error.URLError, TimeoutError):
                if i == tries - 1:
                    raise
                time.sleep(2 ** i)

    def paged(self, path, params=None, page=100):
        start = 0
        while True:
            j = self.get(path, {**(params or {}), "limit": page, "start": start})
            yield from j["values"]
            if j.get("isLastPage", True):
                return
            start = j["nextPageStart"]

    def list_prs(self, states):
        for st in states:
            yield from self.paged(f"{self.root}/pull-requests", {"state": st, "order": "NEWEST"})

    def pr_entry(self, pr):
        comments, rescoped = [], []
        for a in self.paged(f"{self.root}/pull-requests/{pr['id']}/activities", page=200):
            if a["action"] == "COMMENTED":
                comments.append({k: a[k] for k in ("commentAction", "comment", "commentAnchor", "diff") if k in a})
            elif a["action"] == "RESCOPED" and a.get("added", {}).get("total"):
                rescoped.append(a["createdDate"])
        meta = {"id": pr["id"], "title": pr["title"], "description": (pr.get("description") or "")[:600], "state": pr["state"],
                "created": pr["createdDate"], "closed": pr.get("closedDate"), "author": pr["author"]["user"]["slug"],
                "source": pr["fromRef"]["displayId"], "target": pr["toRef"]["displayId"],
                "url": pr["links"]["self"][0]["href"], "reviewers": [r["user"]["slug"] for r in pr.get("reviewers", [])]}
        return {"pr": meta, "comments": comments, "rescoped": rescoped}


# ---------------------------------------------------------------- commands
def data_dir(a):
    d = Path(os.path.expanduser(a.data)) / f"{a.project}-{a.repo}".lower()
    (d / "cache").mkdir(parents=True, exist_ok=True)
    return d


def token():
    t = os.environ.get("BITBUCKET_TOKEN")
    if not t:
        sys.exit("set BITBUCKET_TOKEN (HTTP access token, read-only) in the environment")
    return t


def cmd_extract(a):
    if not a.base:
        sys.exit("set --base or BITBUCKET_BASE (the Bitbucket Data Center URL)")
    d, dc = data_dir(a), DC(a.base, a.project, a.repo, token())
    prs = []
    for pr in dc.list_prs(a.states.split(",")):
        prs.append(pr)
        if a.limit and len(prs) >= a.limit:
            break
    todo = [p for p in prs if not (d / "cache" / f"{p['id']}.json").exists()]
    print(f"{len(prs)} PRs listed, {len(todo)} not cached yet", flush=True)

    def one(p):
        e = dc.pr_entry(p)
        tmp = d / "cache" / f"{p['id']}.json.tmp"
        tmp.write_text(json.dumps(e), encoding="utf-8")
        tmp.replace(d / "cache" / f"{p['id']}.json")
        time.sleep(a.pause)

    done = 0
    with ThreadPoolExecutor(a.workers) as ex:
        for _ in ex.map(one, todo):
            done += 1
            if done % 100 == 0:
                print(f"  {done}/{len(todo)}", flush=True)
    print(f"extract done: {done} fetched, cache={len(list((d / 'cache').glob('*.json')))} PRs -> {d}")


def cmd_filter(a):
    d = data_dir(a)
    bots = set(a.bots.split(",")) if a.bots else set()
    kept, dropped, reasons, total_c = [], [], {}, 0
    for f in sorted((d / "cache").glob("*.json"), key=lambda p: int(p.stem)):
        for t in build_threads(json.loads(f.read_text(encoding="utf-8")), bots):
            total_c += len(t["messages"])
            r = drop_reason(t)
            if r:
                reasons[r] = reasons.get(r, 0) + 1
                dropped.append({**t, "drop_reason": r})
            else:
                kept.append(t)
    with open(d / "filtered.jsonl", "w", encoding="utf-8") as fh:
        for t in kept:
            fh.write(json.dumps(t, ensure_ascii=False) + "\n")
    random.seed(7)
    with open(d / "dropped_sample.jsonl", "w", encoding="utf-8") as fh:
        for t in random.sample(dropped, min(30, len(dropped))):
            fh.write(json.dumps({k: t[k] for k in ("thread_id", "drop_reason", "kind", "path", "messages")}, ensure_ascii=False) + "\n")
    n = len(kept) + len(dropped)
    m = {"prs": len(list((d / "cache").glob("*.json"))), "threads": n, "comments": total_c, "kept": len(kept),
         "kept_pct": round(100 * len(kept) / max(n, 1), 1), "dropped_by_reason": reasons,
         "kept_inline": sum(t["kind"] == "inline" for t in kept), "kept_applied": sum(t["applied"] for t in kept),
         "kept_by_year": {y: sum(t["created_at"][:4] == y for t in kept) for y in sorted({t["created_at"][:4] for t in kept})}}
    (d / "metrics.json").write_text(json.dumps(m, indent=2), encoding="utf-8")
    print(json.dumps(m, indent=2))


def cmd_batches(a):
    d = data_dir(a)
    out = d / "batches"
    out.mkdir(exist_ok=True)
    for old in out.glob("b*.json"):
        old.unlink()
    threads = [json.loads(l) for l in (d / "filtered.jsonl").read_text(encoding="utf-8").splitlines()]
    batch, size, n = [], 0, 0

    def flush():
        nonlocal batch, size, n
        if batch:
            n += 1
            (out / f"b{n:04d}.json").write_text(json.dumps(batch, ensure_ascii=False, indent=1), encoding="utf-8")
            batch, size = [], 0

    for t in threads:
        slim = {k: t[k] for k in ("thread_id", "pr_title", "path", "line", "hunk", "resolved", "applied", "messages")}
        slim["messages"] = [{"role": m["role"], "text": m["text"][:1500]} for m in t["messages"]]
        s = len(json.dumps(slim, ensure_ascii=False))
        if batch and (size + s > a.chars or len(batch) >= a.threads):
            flush()
        batch.append(slim)
        size += s
    flush()
    print(f"{len(threads)} threads -> {n} batches in {out}")


def read_json(p):
    return json.loads(Path(p).read_text(encoding="utf-8"))


def cmd_rules(a):
    """Validate distilled/*.json against batches/, apply categories.json, write rules.jsonl, print category counts."""
    d = data_dir(a)
    cmap = read_json(d / "categories.json") if (d / "categories.json").exists() else {}
    rules, bad, files = [], [], sorted((d / "distilled").glob("b*.json"))
    batches = sorted((d / "batches").glob("b*.json"))
    for f in files:
        try:
            ids = {t["thread_id"] for t in read_json(d / "batches" / f.name)}
            items = read_json(f)
            miss = ids - {i.get("thread_id") for i in items}
            if miss:
                bad.append(f"{f.name}: {len(miss)} threads missing")
            for i in items:
                if i.get("is_actionable_rule") and i.get("rule"):
                    i["category_raw"] = i.get("category", "other")
                    i["category"] = cmap.get(i["category_raw"], i["category_raw"])
                    rules.append(i)
        except Exception as e:  # malformed batch: report, never guess
            bad.append(f"{f.name}: {e}")
    with open(d / "rules.jsonl", "w", encoding="utf-8") as fh:
        for r in rules:
            fh.write(json.dumps(r, ensure_ascii=False) + "\n")
    print(f"batches {len(batches)}, distilled {len(files)}, missing {[b.name for b in batches if not (d / 'distilled' / b.name).exists()][:10]}")
    print(f"actionable rules: {len(rules)}; problems: {bad or 'none'}")
    cats = {}
    for r in rules:
        cats[r["category"]] = cats.get(r["category"], 0) + 1
    for c, n in sorted(cats.items(), key=lambda x: -x[1])[:80]:
        print(f"  {n:5d}  {c}")


def cmd_mergeprep(a):
    """rules.jsonl -> merge_in/<category>-<n>.json chunks (similar rules adjacent) for the merge subagents."""
    d = data_dir(a)
    out = d / "merge_in"
    out.mkdir(exist_ok=True)
    for old in out.glob("*.json"):
        old.unlink()
    rules = [json.loads(l) for l in (d / "rules.jsonl").read_text(encoding="utf-8").splitlines()]
    by = {}
    for r in rules:
        by.setdefault(re.sub(r"[^a-z0-9]+", "-", r["category"].lower()).strip("-") or "other", []).append(r)
    n = 0
    for cat, rs in by.items():
        rs.sort(key=lambda r: (r.get("area", ""), r["rule"]))
        for k in range(0, len(rs), a.size):
            n += 1
            chunk = [{"thread_id": r["thread_id"], "rule": r["rule"], "rationale": r.get("rationale", ""), "area": r.get("area", ""),
                      "scope": r.get("scope", ""), "bad_example": r.get("bad_example", ""), "good_example": r.get("good_example", "")}
                     for r in rs[k:k + a.size]]
            (out / f"{cat}-{k // a.size + 1}.json").write_text(json.dumps(chunk, ensure_ascii=False, indent=1), encoding="utf-8")
    print(f"{len(rules)} rules, {len(by)} categories -> {n} merge chunks in {out}")


def load_docs(d, drop_areas=(), drop_text=(), conv_files=("standard",)):
    """docrules/*.json (extracted from the repo's own docs), docmap.json (learned-rule gk -> {doc: [ids], conflict}), docrules/paths.json."""
    conv, dom, root = {}, {}, d / "docrules"
    for f in sorted(root.glob("*.json")) if root.exists() else []:
        if f.stem == "paths":
            continue
        for r in read_json(f):
            if r.get("kind") == "process" or r.get("area") in drop_areas or any(n in json.dumps(r, ensure_ascii=False) for n in drop_text):
                continue  # --exclude-doc-*: docs written from held-out PRs would leak the answer into a retrospective test
            r["file"] = f.stem
            (conv if f.stem in conv_files else dom)[r["id"] if f.stem in conv_files else f"{f.stem}/{r['id']}"] = r
    noisy = read_json(d / "noisy.json") if (d / "noisy.json").exists() else {"gk": [], "doc": []}  # calibration from the retrospective test
    return {"conv": conv, "dom": dom, "noisy": noisy, "map": read_json(d / "docmap.json") if (d / "docmap.json").exists() else {},
            "paths": read_json(root / "paths.json") if (root / "paths.json").exists() else {}}


def write_doc_refs(out, doc, groups, a):
    """references/documented-standard.md, domain/<area>.md + INDEX.md; returns the extra checklist section."""
    if not doc["conv"] and not doc["dom"]:
        return ""
    seen = {}
    for g in groups:
        for i in doc["map"].get(g["gk"], {}).get("doc", []):
            seen.setdefault(i, []).append(g["id"])
    byarea = {}
    for i, r in doc["conv"].items():
        byarea.setdefault(r.get("area", "other"), []).append((i, r))
    body = ["# Documented standard\n\nEvery rule the repo's own docs state (coding standard, CLAUDE.md, other convention guides). "
            "`raised` = reviewers also enforced it in PRs (ids refer to the learned rules). The standard contradicts itself in places; both sides are listed.\n"]
    for area, rs in sorted(byarea.items()):
        body.append(f"\n## {area}\n")
        body += [f"- `D-{i}` [{r['strength']}] {r['text']} ({r['source']})" + (f" - raised: {', '.join(seen[i])}" if i in seen else "") for i, r in rs]
    (out / "references").mkdir(exist_ok=True)
    (out / "references" / "documented-standard.md").write_text("\n".join(body) + "\n", encoding="utf-8")
    dom_areas = {}
    for i, r in doc["dom"].items():
        dom_areas.setdefault(r.get("area", "other"), []).append((i, r))
    (out / "domain").mkdir(exist_ok=True)
    idx = ["# Domain knowledge by module\n\nExtracted from the repo's per-module guides. Read the file of every module the diff touches "
           "(path hints are approximate; the full guide is in the repo).\n"]
    for area, rs in sorted(dom_areas.items()):
        (out / "domain" / f"{area}.md").write_text(f"# {area}\n\n" + "\n".join(f"- [{r['strength']}] {r['text']} ({r['source']})" for _, r in rs) + "\n", encoding="utf-8")
        idx.append(f"- `domain/{area}.md` - {len(rs)} points; code under: {', '.join(doc['paths'].get(area, [])) or 'see the guide'}")
    (out / "domain" / "INDEX.md").write_text("\n".join(idx) + "\n", encoding="utf-8")
    extra = [(i, r) for i, r in doc["conv"].items() if r.get("kind") == "mechanical" and r.get("strength") == "must" and i not in seen][:a.doc_checklist]
    return ("\n## Documented rules reviewers have not raised in PRs (check anyway)\n\n"
            + "\n".join(f"- [ ] `D-{i}` {r['text']} ({r['source']})" for i, r in extra) + "\n")


def write_profile(out, d, groups, doc):
    """profile.md, layer 1: general practice as this repo applies it. Needs gen_class.json ({gk: {class, topic}});
    classes: generic-lang | generic-ecosystem | framework | domain. Returns whether it was written."""
    if not (d / "gen_class.json").exists():
        return False
    cls = read_json(d / "gen_class.json")
    generic = lambda g: cls.get(g["gk"], {}).get("class", "").startswith("generic")
    conflict = lambda g: doc["map"].get(g["gk"], {}).get("conflict", "")
    noisy = set(doc["noisy"]["gk"])

    def written(g):
        ids = doc["map"].get(g["gk"], {}).get("doc", [])
        return f"written: {doc['conv'][ids[0]]['source'][:40]}" if ids and ids[0] in doc["conv"] else "unwritten"
    dec = [g for g in groups if generic(g) and conflict(g)]
    enforced = [g for g in groups if generic(g) and not conflict(g) and g["gk"] not in noisy][:30]
    calm = [g for g in groups if generic(g) and g["gk"] in noisy]
    fw = [g for g in groups if cls.get(g["gk"], {}).get("class") == "framework"]
    fw_unwritten = sum(1 for g in fw if not doc["map"].get(g["gk"], {}).get("doc"))
    txt = [
        "# Profile: general practice as this repo applies it\n",
        "Read this before the checklist. It is layer 1: what any good C++ engineer already knows, adjusted to this repo. "
        "Framework rules (2.1 objects, SCH_* macros, the project's string/DB/text helpers) are layer 2 and live in the checklist and references.\n",
        "## 1. New code follows the conventions\n",
        "Conventions apply to new and changed code even when the surrounding or sibling code does not follow them. "
        "Reviewers enforce them on new code; copying a neighbour's habit is the most common way to get the same comment again. "
        "Only pure layout (indentation, whitespace, line breaks) follows the local file.\n",
        "## 2. Undecided: the written standard and the reviewers disagree\n",
        "Provisional default until the team decides: write what the reviewers ask (they are the gate) and name the conflict in the PR description.\n"]
    txt += [f"- **{g['rule']}** ({g['prs']} PRs)  \n  Standard: {conflict(g)}" for g in dec]
    txt += ["\n## 3. General rules reviewers enforce here (most evidence first)\n"]
    txt += [f"- {g['rule']} `{g['id']}` ({g['prs']} PRs, {written(g)})" for g in enforced]
    txt += ["\n## 4. General rules not to apply mechanically\n",
            "In a retrospective test these produced many findings and none matched a reviewer. Raise them only for an unambiguous case.\n"]
    txt += [f"- {g['rule']} `{g['id']}`" for g in calm]
    txt += [f"\n## Layer 2 in numbers\n\n{len(fw)} framework rules, {fw_unwritten} of them in no document: no general guide or popular skill covers them. "
            "See `checklist.md` and `references/`.\n"]
    (out / "profile.md").write_text("\n".join(txt) + "\n", encoding="utf-8")
    return True


def cmd_generate(a):
    """merge_out/*.json (+ filtered.jsonl metadata) -> scored rules -> <out>/SKILL.md, references/, examples/, meta.json."""
    d, out = data_dir(a), Path(a.out)
    threads, skip = {}, set(filter(None, a.exclude_prs.split(",")))  # --exclude-prs: hold PRs out for a retrospective test
    for l in (d / "filtered.jsonl").read_text(encoding="utf-8").splitlines():
        t = json.loads(l)
        if str(t["pr_id"]) not in skip:
            threads[t["thread_id"]] = t
    counts = {}
    for t in threads.values():
        counts[t["root_author"]] = counts.get(t["root_author"], 0) + 1
    maint = {s for s, _ in sorted(counts.items(), key=lambda x: -x[1])[:a.maintainers]}  # D4: most active reviewers
    now = time.time()
    groups = []
    for f in sorted((d / "merge_out").glob("*.json")):
        j = read_json(f)
        for g in j["groups"]:
            ms = [threads[m] for m in g.get("members", []) if m in threads]
            if not ms:
                continue
            per_pr = {}
            for t in ms:  # one vote per PR: its best thread
                age = (now - datetime.strptime(t["created_at"], "%Y-%m-%dT%H:%M:%SZ").replace(tzinfo=timezone.utc).timestamp()) / 86400
                w = 0.5 ** (age / a.half_life) * (1.5 if t["root_author"] in maint else 1) * (1.5 if t["applied"] else 1)
                if t["pr_id"] not in per_pr or w > per_pr[t["pr_id"]][0]:
                    per_pr[t["pr_id"]] = (w, t)
            reviewers = {t["root_author"] for t in ms}
            score = sum(w for w, _ in per_pr.values()) * min(1 + 0.25 * (len(reviewers) - 1), 1.75)
            keep = len(per_pr) >= a.min_prs or any(t["root_author"] in maint and t["applied"] for t in ms)
            groups.append({**g, "category": j.get("category", f.stem), "score": round(score, 2), "prs": len(per_pr),
                           "reviewers": len(reviewers), "applied": sum(t["applied"] for t in ms), "keep": keep,
                           "links": [t["pr_url"] for _, t in sorted(per_pr.values(), key=lambda x: -x[0])[:3]]})
    groups = sorted([g for g in groups if g["keep"]], key=lambda g: -g["score"])
    for i, g in enumerate(groups, 1):
        g["id"] = f"r{i:03d}"
    (out / "references").mkdir(parents=True, exist_ok=True)
    (out / "examples").mkdir(exist_ok=True)
    doc = load_docs(d, set(filter(None, a.exclude_doc_areas.split(","))), [x for x in a.exclude_doc_text.split(",") if x],
                    tuple(filter(None, getattr(a, "conv_docs", "standard").split(","))))
    for g in groups:
        g["gk"] = hashlib.sha1((g["category"] + "|" + g["rule"]).encode("utf-8")).hexdigest()[:8]  # stable across --exclude-prs (ids are not)
    (out / "rules.json").write_text(json.dumps([{"gk": g["gk"], "id": g["id"], "rule": g["rule"], "category": g["category"], "prs": g["prs"],
                                                  "reviewers": g["reviewers"], "area": g.get("area", "")} for g in groups], ensure_ascii=False, indent=1), encoding="utf-8")

    def doctag(g):
        if not doc["conv"]:
            return ""
        e = doc["map"].get(g["gk"])
        if not e or not e.get("doc"):
            return " `[reviewers only: not in the docs]`" + (f" ⚠ {e['conflict']}" if e and e.get("conflict") else "")
        refs = ", ".join(f"{i} {doc['conv'][i]['source'][:42]}" for i in e["doc"][:2] if i in doc["conv"])
        return f" `[doc: {refs}]`" + (f" ⚠ conflicts with the docs: {e['conflict']}" if e.get("conflict") else "")
    NOISY = " `[noisy in tests: report only an unambiguous case]`"
    tag = lambda g: (" *(single reviewer's view)*" if g["reviewers"] == 1 else "") + doctag(g) + (NOISY if g["gk"] in doc["noisy"]["gk"] else "")
    line = lambda g: f"- **{g['rule']}**{tag(g)} `{g['id']}` · {g['category']} · {g['prs']} PRs · e.g. {g['links'][0]}"
    cats = {}
    for g in groups:
        cats.setdefault(g["category"], []).append(g)
        if g.get("bad_example") or g.get("good_example"):
            body = f"# {g['id']} — {g['rule']}\n\n{g.get('rationale', '')}\n\n"
            if g.get("bad_example"):
                body += f"Bad:\n```\n{g['bad_example']}\n```\n\n"
            if g.get("good_example"):
                body += f"Good:\n```\n{g['good_example']}\n```\n\n"
            (out / "examples" / f"{g['id']}.md").write_text(body + "PRs: " + ", ".join(g["links"]) + "\n", encoding="utf-8")
    for c, gs in cats.items():
        txt = f"# {c}\n\n" + "\n\n".join(f"{line(g)}\n  - Why: {g.get('rationale', '')}\n  - Area: {g.get('area', 'repo-wide')}"
                                          + (f"\n  - Conflict: {g['conflict_note']}" if g.get("conflict_note") else "") for g in gs) + "\n"
        (out / "references" / f"{re.sub(r'[^a-z0-9]+', '-', c.lower()).strip('-')}.md").write_text(txt, encoding="utf-8")
    # pre-review reads this line by line: free reading skipped even the most frequent rules (measured 26% recall)
    (out / "checklist.md").write_text(
        "# Pre-review checklist\n\nFor EVERY line below, scan the ADDED lines of the diff for a violation. Do not skip lines.\n\n"
        + "\n".join(f"- [ ] `{g['id']}` {g['rule']}{tag(g)}" for g in groups[:a.checklist]) + "\n" + write_doc_refs(out, doc, groups, a), encoding="utf-8")
    has_profile = write_profile(out, d, groups, doc)
    top = groups[:a.top]
    idx = "\n".join(f"- `references/{re.sub(r'[^a-z0-9]+', '-', c.lower()).strip('-')}.md` — {len(gs)} rules" for c, gs in sorted(cats.items(), key=lambda x: -len(x[1])))
    (out / "SKILL.md").write_text(
        f"---\nname: {a.repo}-conventions\ndescription: Code-review conventions of the {a.repo} repo, learned from review comments on {len(set(t['pr_id'] for t in threads.values()))} PRs. "
        f"Use when writing, changing or reviewing code in {a.repo}, and before opening a PR.\n---\n\n# {a.repo} conventions\n\n"
        f"Rules the reviewers repeat in PRs, ranked by evidence (frequency, recency, whether the code was changed after). "
        f"Generated by aios-pr-learnings; do not hand-edit — re-run it. Read the matching `references/` file for the area you touch; "
        f"`examples/<id>.md` has bad/good code. To pre-review a diff, go through `checklist.md` line by line.\n\n"
        + ("**Read `profile.md` first**: how general good practice applies in this repo (where it deviates, what is still undecided, what not to apply mechanically).\n\n" if has_profile else "")
        + "## Top rules\n\n" + "\n".join(line(g) for g in top) + f"\n\n## References by category\n\n{idx}\n", encoding="utf-8")
    (out / "meta.json").write_text(json.dumps({"generated": ts(now * 1000), "threads": len(threads), "rules": len(groups),
                                               "categories": len(cats), "min_prs": a.min_prs, "half_life_days": a.half_life}, indent=1), encoding="utf-8")
    print(f"{len(groups)} rules ({len(cats)} categories), top {len(top)} in SKILL.md -> {out}")


def main():
    p = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    p.add_argument("--base", default=os.environ.get("BITBUCKET_BASE"), help="Bitbucket DC base URL (or BITBUCKET_BASE)")
    p.add_argument("--project", required=True, help="Bitbucket project key")
    p.add_argument("--repo", required=True, help="repository slug")
    p.add_argument("--data", default="~/.pr-learnings")
    sub = p.add_subparsers(dest="cmd", required=True)
    e = sub.add_parser("extract")
    e.add_argument("--limit", type=int, default=0, help="newest N PRs per run (0 = all)")
    e.add_argument("--states", default="MERGED,DECLINED")
    e.add_argument("--workers", type=int, default=4)
    e.add_argument("--pause", type=float, default=0.1)
    f = sub.add_parser("filter")
    f.add_argument("--bots", default="", help="comma-separated extra bot slugs")
    b = sub.add_parser("batches")
    b.add_argument("--chars", type=int, default=45000)
    b.add_argument("--threads", type=int, default=40)
    sub.add_parser("rules")
    m = sub.add_parser("mergeprep")
    m.add_argument("--size", type=int, default=120)
    g = sub.add_parser("generate")
    g.add_argument("--out", required=True, help="skill dir, e.g. <repo>/.claude/skills/<repo>-conventions")
    g.add_argument("--top", type=int, default=25)
    g.add_argument("--checklist", type=int, default=80, help="learned rules in checklist.md")
    g.add_argument("--exclude-doc-areas", default="", help="comma-separated docrules areas to leave out (retrospective test)")
    g.add_argument("--exclude-doc-text", default="", help="comma-separated strings (e.g. ticket ids); doc rules containing any are left out")
    g.add_argument("--conv-docs", default="standard", help="comma-separated docrules/<name>.json files that hold code conventions; the rest are per-module guides")
    g.add_argument("--doc-checklist", type=int, default=100, help="documented-but-unraised rules appended to checklist.md")
    g.add_argument("--min-prs", type=int, default=2)
    g.add_argument("--maintainers", type=int, default=6)
    g.add_argument("--half-life", type=float, default=730, help="recency half-life in days")
    g.add_argument("--exclude-prs", default="", help="comma-separated PR ids to leave out (retrospective test)")
    a = p.parse_args()
    {"extract": cmd_extract, "filter": cmd_filter, "batches": cmd_batches, "rules": cmd_rules,
     "mergeprep": cmd_mergeprep, "generate": cmd_generate}[a.cmd](a)


if __name__ == "__main__":
    main()
