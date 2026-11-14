#!/usr/bin/env python3
"""ai-os secrets — where could the values in dev-env/env-config/.env have leaked?

The .env stays a plain file (decision 2026-11-05): dozens of scripts in ai-os and
eight other projects read it, FileVault encrypts the disk, and moving values into
the Keychain would break those readers without helping — any process of yours can
read the Keychain too. The real risk is a value ending up in a repository.

  ai-os secrets                 # cheap checks: permissions, git-ignored, untracked, FileVault
  ai-os secrets audit           # + scan git history and tracked files of every local repo
  ai-os secrets audit --repos core|hold|all     # default core = everything outside inHold/
  ai-os secrets audit --json
  ai-os secrets check-push <rev-range>   # used by setup/hooks/pre-push: does what is about to be
                                         # pushed contain a .env value? exit 1 if it looks real

It prints key NAMES, repo paths, file paths and a heuristic verdict — never a
value. The pattern file handed to grep lives in a 0700 temp dir and is removed.
"""

import argparse
import json
import math
import os
import re
import shlex
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
PROJECTS = Path(os.environ.get("AI_OS_PROJECTS_DIR", ROOT.parent))
ENV = Path(os.environ.get("AI_OS_ENV_FILE", ROOT / "dev-env" / "env-config" / ".env"))

PLACEHOLDER = re.compile(r"change|example|placeholder|dev[-_ ]?secret|test|replace|your[-_]|xxx|local|password|secret[-_]?key|todo|dummy", re.I)
# Credentials that are public by design (they ship in client bundles) or are only identifiers.
PUBLIC_BY_DESIGN = re.compile(r"(^|_)(DSN|MODEL|USER|HOST|UUID|BUCKET|EMAIL|URL|PROJECT|SERVER|PORT)(_|$)")


def read_env():
    env = {}
    if ENV.exists():
        for line in ENV.read_text(encoding="utf-8").splitlines():
            m = re.match(r"^(?:export )?([A-Z][A-Z0-9_]*)=(.*)$", line.strip())
            if m:
                env[m.group(1)] = m.group(2).strip().strip('"').strip("'")
    return env


def entropy(v):
    return -sum(v.count(c) / len(v) * math.log2(v.count(c) / len(v)) for c in set(v))


def classify(key, value):
    """Heuristic verdict for a value found in a repo: (severity, reason). Never includes the value."""
    if re.search(r"(^|_)(UUID|ID)$", key):
        return "info", "identifier (UUID/ID), not a credential"
    if re.search(r"/|\.pem$|\.key$", value) and not re.search(r"://", value):
        return "info", "file path"
    if PLACEHOLDER.search(value) or re.search(r"localhost|127\.0\.0\.1", value):
        return "info", "placeholder / local value"
    if PUBLIC_BY_DESIGN.search(key) and "KEY" not in key and "TOKEN" not in key and "SECRET" not in key:
        return "info", "identifier or public-by-design value"
    if len(value) >= 20 and entropy(value) >= 3.5:
        return "leak", f"looks like a real credential (len={len(value)}, entropy={entropy(value):.1f})"
    return "info", "low-entropy or short value"


def credential_values(env):
    """value -> [key names], for values long enough and not prose or plain public URLs."""
    out = {}
    for k, v in env.items():
        if len(v) < 16 or " " in v or re.fullmatch(r"https?://[^@\s]*", v):
            continue
        out.setdefault(v, []).append(k)
    return out


def quick_checks():
    findings = []
    if not ENV.exists():
        return [("fail", f"{ENV} not found")]
    mode = ENV.stat().st_mode & 0o777
    findings.append(("ok" if mode & 0o077 == 0 else "fail", f"permissions {oct(mode)[2:]}" + ("" if mode & 0o077 == 0 else " — others can read it: chmod 600")))
    ign = subprocess.run(["git", "check-ignore", "-q", str(ENV)], cwd=ROOT).returncode == 0
    trk = subprocess.run(["git", "ls-files", "--error-unmatch", str(ENV)], cwd=ROOT, capture_output=True).returncode == 0
    findings.append(("ok" if ign and not trk else "fail", "git-ignored and untracked" if ign and not trk else f"git-ignored={ign} tracked={trk} — a tracked .env is published"))
    if sys.platform == "darwin":
        fv = subprocess.run(["fdesetup", "status"], capture_output=True, text=True).stdout.strip()
        findings.append(("ok" if "On" in fv else "warn", f"FileVault: {fv or 'unknown'}"))
    return findings


def repos_for(scope):
    repos = sorted({p.parent for pat in ("*/*/.git", "*/*/*/.git") for p in PROJECTS.glob(pat)})
    if (ROOT / ".git").exists():
        repos.append(ROOT)
    if scope == "core":
        repos = [r for r in repos if "/inHold/" not in str(r)]
    elif scope == "hold":
        repos = [r for r in repos if "/inHold/" in str(r)]
    return repos


def is_private(repo):
    url = subprocess.run(["git", "-C", str(repo), "remote", "get-url", "origin"], capture_output=True, text=True).stdout
    m = re.search(r"github\.com[:/]([^/]+/[^/.\s]+)", url)
    if not m:
        return "no-remote"
    r = subprocess.run(["gh", "repo", "view", m.group(1), "--json", "isPrivate", "--jq", ".isPrivate"], capture_output=True, text=True)
    return {"true": "private", "false": "PUBLIC"}.get(r.stdout.strip(), "unknown")


def grep_lines(cmd, cwd):
    # The pipelines are fixed strings built here; the only variable parts are shlex-quoted paths and revs.
    p = subprocess.run(cmd, cwd=cwd, shell=True,  # nosemgrep: subprocess-shell-true -- no user input reaches cmd unquoted
 capture_output=True, text=True, errors="replace", timeout=1200)
    return {x for x in p.stdout.splitlines() if x}


def audit(scope):
    env = read_env()
    values = credential_values(env)
    tmp = tempfile.mkdtemp(prefix="aios-secrets-")
    os.chmod(tmp, 0o700)
    pat = Path(tmp) / "patterns"
    pat.write_text("\n".join(values) + "\n", encoding="utf-8")
    os.chmod(pat, 0o600)
    results = []
    try:
        for repo in repos_for(scope):
            rel = str(repo.relative_to(PROJECTS)) if repo != ROOT else "ai-os"
            try:
                tracked = sorted(grep_lines(f"git ls-files -z | xargs -0 grep -I -l -a -F -f {shlex.quote(str(pat))} 2>/dev/null", repo))
                hist_vals = grep_lines(f"git log --all -p --no-color 2>/dev/null | grep -a -F -f {shlex.quote(str(pat))} -o", repo)
            except subprocess.TimeoutExpired:
                results.append({"repo": rel, "error": "timeout"})
                continue
            keys = {}
            for v in hist_vals:
                for val, names in values.items():
                    if val in v:
                        for n in names:
                            keys[n] = classify(n, val)
            leaks = sorted(k for k, (sev, _) in keys.items() if sev == "leak")
            if leaks or tracked:
                results.append({"repo": rel, "visibility": is_private(repo) if leaks else None, "leaks": leaks,
                                "details": {k: keys[k][1] for k in leaks}, "other_matches": sorted(set(keys) - set(leaks)),
                                "tracked_files": tracked[:6]})
    finally:
        subprocess.run(["rm", "-rf", tmp])
    return results


def check_push(revs):
    """Scan only the patch text of `git log -p <revs>` (what a push adds) for .env values."""
    values = credential_values(read_env())
    if not values:
        return 0
    tmp = tempfile.mkdtemp(prefix="aios-secrets-")
    os.chmod(tmp, 0o700)
    pat = Path(tmp) / "patterns"
    pat.write_text("\n".join(values) + "\n", encoding="utf-8")
    os.chmod(pat, 0o600)
    try:
        hist = grep_lines(f"git log -p --no-color {' '.join(shlex.quote(r) for r in revs)} 2>/dev/null | grep -a -F -f {shlex.quote(str(pat))} -o", Path.cwd())
    finally:
        subprocess.run(["rm", "-rf", tmp])
    found = {}
    for v in hist:
        for val, names in values.items():
            if val in v:
                for n in names:
                    found[n] = classify(n, val)
    leaks = sorted(k for k, (sev, _) in found.items() if sev == "leak")
    for k in leaks:
        print(f"{k}: {found[k][1]}")
    return 1 if leaks else 0


def main():
    ap = argparse.ArgumentParser(description="Where could the values in the .env have leaked? (names only, never values)")
    ap.add_argument("command", nargs="?", default="check", choices=["check", "audit", "check-push"])
    ap.add_argument("revs", nargs="*", help="check-push: arguments for git log, e.g. A..B or B --not --remotes")
    ap.add_argument("--repos", default="core", choices=["core", "hold", "all"])
    ap.add_argument("--json", action="store_true")
    a = ap.parse_args()
    if a.command == "check-push":
        return check_push(a.revs)

    checks = quick_checks()
    if a.command == "check":
        for status, text in checks:
            print(f"{ {'ok': '✅', 'warn': '⚠️ ', 'fail': '❌'}[status] } {text}")
        return 1 if any(s == "fail" for s, _ in checks) else 0

    results = audit(a.repos)
    if a.json:
        print(json.dumps({"checks": checks, "findings": results}, indent=2))
    else:
        for status, text in checks:
            print(f"{ {'ok': '✅', 'warn': '⚠️ ', 'fail': '❌'}[status] } {text}")
        real = [r for r in results if r.get("leaks")]
        for r in real:
            print(f"❌ {r['repo']} [{r['visibility']}]: history contains a credential-like value of {r['leaks']} — {r['details']}")
        for r in results:
            if not r.get("leaks") and r.get("tracked_files"):
                print(f"ℹ️  {r['repo']}: values of {r['other_matches'] or 'public/placeholder keys'} appear in tracked files (placeholders/identifiers)")
        print(f"\n{len(real)} repo(s) with a probable real leak, {len(results) - len(real)} with only placeholders/identifiers")
    return 1 if any(r.get("leaks") for r in results) or any(s == "fail" for s, _ in checks) else 0


if __name__ == "__main__":
    for _stream in (sys.stdout, sys.stderr):  # Windows consoles default to cp1252 and choke on the status symbols
        if hasattr(_stream, "reconfigure"):
            _stream.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
