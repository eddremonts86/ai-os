"""Self-check for the pure helpers: python test_pr_learnings.py"""
from pr_learnings import build_threads, drop_reason, hunk_text, is_trivial

A = lambda slug, t="NORMAL": {"slug": slug, "type": t}
seg = lambda typ, lines: {"type": typ, "lines": [{"destination": d, "source": d, "line": s} for d, s in lines]}
DIFF = {"hunks": [{"segments": [seg("CONTEXT", [(10, "a")]), seg("ADDED", [(11, "b"), (12, "c")]), seg("REMOVED", [(40, "far")])]}]}


def entry(root_author="rev", pr_author="dev", orphaned=False, state="OPEN", rescoped=(2000,)):
    reply = {"id": 2, "text": "ok will do", "author": A(pr_author), "createdDate": 1500, "comments": []}
    root = {"id": 1, "text": "Pass by const ref here", "author": A(root_author), "createdDate": 1000, "state": state, "comments": [reply]}
    act = {"commentAction": "ADDED", "comment": root, "commentAnchor": {"path": "a.cpp", "line": 11, "orphaned": orphaned}, "diff": DIFF}
    pr = {"id": 7, "title": "T", "url": "u", "author": pr_author, "state": "MERGED"}
    return {"pr": pr, "comments": [act], "rescoped": list(rescoped)}


# hunk: window around line 11 keeps nearby +/context lines, drops the far removed line
h = hunk_text(DIFF, 11)
assert h == " a\n+b\n+c", h
# trivia
assert is_trivial("LGTM") and is_trivial("tak!") and is_trivial("👍") and not is_trivial("Use const ref for buffers")
# thread = root + reply, role tagging, applied heuristic
t = build_threads(entry(state="RESOLVED"))[0]
assert [m["role"] for m in t["messages"]] == ["reviewer", "pr_author"] and t["applied"] and t["commits_after"] == 1
assert not build_threads(entry(rescoped=()))[0]["applied"]
assert build_threads(entry(orphaned=True, rescoped=()))[0]["applied"]
# drop reasons
assert drop_reason(build_threads(entry(root_author="dev"))[0]) == "self_comment"
assert drop_reason(build_threads(entry())[0]) is None
bot = entry(); bot["comments"][0]["comment"]["author"] = A("ci", "SERVICE")
assert drop_reason(build_threads(bot)[0]) == "bot"
print("ok")

# generate: scoring, thresholds, no reviewer names in output
import json, tempfile, types
from pathlib import Path
from pr_learnings import cmd_generate

tmp = Path(tempfile.mkdtemp())
d = tmp / "data" / "acme-repo"
(d / "merge_out").mkdir(parents=True)
th = lambda i, pr, who, applied: {"thread_id": i, "pr_id": pr, "pr_url": f"http://x/{pr}", "root_author": who, "applied": applied, "created_at": "2026-10-01T00:00:00Z"}
(d / "filtered.jsonl").write_text("\n".join(json.dumps(x) for x in [
    th("1-a", 1, "alice", True), th("2-a", 2, "bob", False), th("3-a", 3, "alice", False), th("3-b", 3, "alice", False)]), encoding="utf-8")
(d / "merge_out" / "perf.json").write_text(json.dumps({"category": "perf", "groups": [
    {"rule": "Use const ref", "members": ["1-a", "2-a"], "bad_example": "f(B b)", "good_example": "f(const B&)"},   # 2 PRs, 2 reviewers -> kept
    {"rule": "One-off", "members": ["3-a", "3-b"]}]}), encoding="utf-8")                                          # 1 PR, 1 reviewer, not top maintainer? see below
a = types.SimpleNamespace(data=str(tmp / "data"), project="acme", repo="repo", out=str(tmp / "skill"), top=25, min_prs=2, maintainers=1, half_life=730, exclude_prs="", checklist=80, doc_checklist=100, exclude_doc_areas="", exclude_doc_text="")
cmd_generate(a)
skill = (tmp / "skill" / "SKILL.md").read_text(encoding="utf-8")
assert "Use const ref" in skill and "One-off" not in skill  # alice is the lone maintainer but 3-a/3-b are not applied
assert "alice" not in skill and "bob" not in skill and (tmp / "skill" / "examples" / "r001.md").exists()
print("generate ok")

# idcheck: only code-looking names inside backticks; a::b keeps its last segment
from idcheck import tokens
assert tokens("Use `db::Q<Order>::OrderKey` and `GetValidator()`, not `the` or plain words.") == {"Q", "OrderKey", "GetValidator"}
assert tokens("`MAX_LEN` and `snake_case` but not `ok` or `Word`") == {"MAX_LEN", "snake_case"}
print("idcheck ok")
