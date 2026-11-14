#!/usr/bin/env python3
"""ai-os scope — which part of your work a folder belongs to: personal, an employer, your own company.

  ai-os scope which [PATH] [--json]    scope, brand, design system, git identity and notes for PATH (default: cwd)
  ai-os scope check-push RANGE...      guard for pre-push: terms of other scopes in the commits being pushed
  ai-os scope git-config [--apply]     the includeIf block that gives each scope its own git identity

Config: context/personal/work/scopes.yaml (git-ignored; template in context/personal.example/work/scopes.yaml).
Paths are folders relative to the projects folder (the folder that contains this repo); a folder covers
everything inside it, and the first scope that matches wins. A scope may hold brands (one company, several
products): the brand's design wins over the scope's.

Guard severity: `block` terms stop a push, `warn` terms are reported and let it through. A scope's terms are
checked in every repo of another scope; `guard.always_block` is checked in every repo.
"""

import argparse
import json
import re
import shutil
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PROJECTS = ROOT.parent
CONFIG = ROOT / "context" / "personal" / "work" / "scopes.yaml"
MARK_BEGIN, MARK_END = "# >>> ai-os scopes >>>", "# <<< ai-os scopes <<<"


def load(path=CONFIG):
    if not Path(path).is_file():
        return None
    import yaml  # the AI-OS venv and CI have PyYAML
    data = yaml.safe_load(Path(path).read_text(encoding="utf-8")) or {}
    if not isinstance(data.get("scopes", {}), dict):
        raise SystemExit(f"{path}: `scopes` must be a mapping")
    return data


def _rel(path, projects):
    try:
        return Path(path).resolve().relative_to(Path(projects).resolve()).as_posix().lower()
    except ValueError:
        return None


def _covers(folders, rel):
    for f in folders or []:
        f = str(f).strip("/").lower()
        if rel == f or rel.startswith(f + "/"):
            return True
    return False


def which(cfg, path, projects=PROJECTS):
    """{scope, label, brand, design, git, notes} for path; scope None when nothing matches and no default."""
    if not cfg:
        return {"scope": None}
    rel = _rel(path, projects)
    scopes = cfg.get("scopes") or {}
    name = next((n for n, s in scopes.items() if rel is not None and _covers((s or {}).get("paths"), rel)), None)
    name = name or cfg.get("default")
    if not name or name not in scopes:
        return {"scope": name}
    s = scopes[name] or {}
    out = {"scope": name, "label": s.get("label", name), "brand": None, "design": dict(s.get("design") or {}),
           "git": s.get("git"), "notes": s.get("notes")}
    for bname, b in (s.get("brands") or {}).items():
        if rel is not None and _covers((b or {}).get("paths"), rel):
            out["brand"] = bname
            out["design"].update((b or {}).get("design") or {})
            break
    return out


def guard_terms(cfg, own_scope):
    """[(severity, scope, term)] that must not appear in a repo of own_scope."""
    terms = [("block", "always", t) for t in ((cfg.get("guard") or {}).get("always_block") or [])]
    for name, s in (cfg.get("scopes") or {}).items():
        if name == own_scope:
            continue
        g = (s or {}).get("guard") or {}
        terms += [("block", name, t) for t in g.get("block") or []]
        terms += [("warn", name, t) for t in g.get("warn") or []]
    return terms


def _matcher(term):
    term = str(term)
    if term.startswith("re:"):
        return re.compile(term[3:], re.I)
    return re.compile(re.escape(term), re.I)


def scan(diff_text, terms):
    """Findings [(severity, scope, term, file)] for the added lines of a unified diff."""
    compiled = [(sev, scope, term, _matcher(term)) for sev, scope, term in terms]
    found, seen, current = [], set(), "?"
    for line in diff_text.splitlines():
        if line.startswith("+++ "):
            current = line[6:] if line.startswith("+++ b/") else line[4:]
            continue
        if not line.startswith("+"):
            continue
        for sev, scope, term, rx in compiled:
            if rx.search(line[1:]) and (sev, scope, term, current) not in seen:
                seen.add((sev, scope, term, current))
                found.append((sev, scope, term, current))
    return found


def check_push(cfg, repo, ranges):
    own = which(cfg, repo)["scope"]
    terms = guard_terms(cfg, own)
    if not terms:
        return 0, [f"no guard terms apply to scope {own!r}"]
    out, code = [], 0
    for r in ranges:
        diff = subprocess.run(["git", "-C", str(repo), "log", "-p", "--format=", *r.split()],
                              capture_output=True, text=True).stdout
        for sev, scope, term, f in scan(diff, terms):
            # always_block terms are personal data: name the rule, not the value.
            shown = "an always-blocked term" if scope == "always" else repr(term)
            out.append(f"{sev.upper()}  {shown} ({scope}) in {f}")
            code = 1 if sev == "block" else code
    return code, out


def git_block(cfg, projects=PROJECTS, root=ROOT):
    lines = [MARK_BEGIN, "# One git identity per scope; generated by `ai-os scope git-config --apply`."]
    for name, s in (cfg.get("scopes") or {}).items():
        ident = (s or {}).get("git")
        if not ident:
            continue
        for folder in (s or {}).get("paths") or []:
            lines += [f'[includeIf "gitdir/i:{(Path(projects) / folder).as_posix().rstrip("/")}/"]',
                      f"    path = {(Path(root) / ident).as_posix()}"]
    lines.append(MARK_END)
    return "\n".join(lines) + "\n"


def apply_git(block, gitconfig):
    gitconfig = Path(gitconfig)
    text = gitconfig.read_text(encoding="utf-8") if gitconfig.exists() else ""
    backup = gitconfig.with_name(gitconfig.name + ".pre-aios-scope.bak")
    if gitconfig.exists() and not backup.exists():
        shutil.copy2(gitconfig, backup)
    if MARK_BEGIN in text and MARK_END in text:
        head, rest = text.split(MARK_BEGIN, 1)
        text = head + block + rest.split(MARK_END, 1)[1].lstrip("\n")
    else:
        text = text.rstrip("\n") + ("\n\n" if text else "") + block
    gitconfig.write_text(text, encoding="utf-8")


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    w = sub.add_parser("which"); w.add_argument("path", nargs="?", default="."); w.add_argument("--json", action="store_true")
    c = sub.add_parser("check-push"); c.add_argument("ranges", nargs="*")
    g = sub.add_parser("git-config"); g.add_argument("--apply", action="store_true")
    a = ap.parse_args(argv)
    cfg = load()

    if a.cmd == "which":
        info = which(cfg, a.path)
        if a.json:
            print(json.dumps(info))
        elif not cfg:
            print(f"no scopes configured ({CONFIG.relative_to(ROOT)} missing; template in context/personal.example/)")
        else:
            print(f"scope: {info['scope'] or 'none'}" + (f" · brand: {info['brand']}" if info.get("brand") else ""))
            for k, v in (info.get("design") or {}).items():
                print(f"design {k}: {v}")
            for k in ("git", "notes"):
                if info.get(k):
                    print(f"{k}: {info[k]}")
        return 0

    if a.cmd == "check-push":
        if not cfg:
            print("skipped (no context/personal/work/scopes.yaml)")
            return 0
        top = subprocess.run(["git", "rev-parse", "--show-toplevel"], capture_output=True, text=True).stdout.strip() or "."
        code, out = check_push(cfg, top, a.ranges or ["HEAD --not --remotes"])
        print("\n".join(out) if out else "clean")
        return code

    if not cfg:
        print("no scopes configured")
        return 1
    block = git_block(cfg)
    if a.apply:
        apply_git(block, Path.home() / ".gitconfig")
        print(f"written to ~/.gitconfig (backup: ~/.gitconfig.pre-aios-scope.bak)\n{block}", end="")
    else:
        print(block, end="")
    return 0


if __name__ == "__main__":
    sys.exit(main())
