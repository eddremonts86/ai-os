#!/usr/bin/env python3
"""Deterministic security scan of a web app: run every scanner that is installed, merge the results.

  scan.py <repo> [--out DIR] [--url URL] [--image IMAGE] [--zap] [--skip tool,tool] [--baseline REF]

--baseline REF reports only what the current branch adds since REF: semgrep compares against REF, gitleaks reads
only the new commits, and the dependency and container scanners run only when a lockfile or Dockerfile changed.

Scanners (each one optional; a missing one is reported as NOT RUN, never as clean):
  gitleaks     secrets in the working tree and git history
  osv-scanner  known vulnerabilities in lockfiles (OSV database)
  pnpm/npm     package-manager audit of the lockfile
  semgrep      SAST: OWASP Top 10, TypeScript, React, Node, secrets rules (metrics off)
  trivy        filesystem vulns + IaC/Dockerfile/compose/GitHub Actions misconfig; --image adds the image
  hadolint     Dockerfile lint
  --url        passive HTTP checks with the standard library: security headers, cookies, CSP basics,
               exposed source maps, server banner. Read-only GETs, safe against staging or production.
  --zap        OWASP ZAP baseline (passive) against --url, through Docker. Never the active scan.

Writes DIR/findings.json (one normalised list), DIR/summary.md, and each tool's raw output in DIR/raw/.
Exit 1 when there is a critical or high finding, 2 when nothing could run, else 0.
Raw reports can contain secret values: gitleaks runs with --redact, but keep DIR out of git.
"""

import argparse
import hashlib
import json
import re
import shutil
import subprocess
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path

SEV_ORDER = ["critical", "high", "medium", "low", "info"]
SEMGREP_CONFIGS = ["p/owasp-top-ten", "p/typescript", "p/react", "p/nodejsscan", "p/secrets", "p/jwt"]


def sev(value):
    v = str(value or "").lower()
    return {"error": "high", "warning": "medium", "note": "low", "moderate": "medium", "unknown": "low"}.get(v, v if v in SEV_ORDER else "low")


def finding(tool, rule, severity, title, file="", line=0, cwe="", detail="", key=None):
    """key: dedup identity shared across tools (e.g. "dep|GHSA-x|pkg"); defaults to tool+location."""
    fp = hashlib.sha1((key or f"{tool}|{rule}|{file}|{line}|{title}").encode()).hexdigest()[:12]
    return {"tool": tool, "rule": rule, "severity": sev(severity), "title": title.strip()[:300], "file": file,
            "line": line, "cwe": cwe, "detail": detail.strip()[:600], "fingerprint": fp}


def run(cmd, cwd, out_file, timeout=900):
    """Run a scanner; returns parsed JSON (or None) and a status string."""
    try:
        p = subprocess.run(cmd, cwd=cwd, capture_output=True, text=True, timeout=timeout)
    except subprocess.TimeoutExpired:
        return None, f"timed out after {timeout}s"
    out_file.write_text(p.stdout or "", encoding="utf-8")
    try:
        return json.loads(p.stdout) if p.stdout.strip() else None, f"exit {p.returncode}"
    except json.JSONDecodeError:
        return None, f"exit {p.returncode}, unreadable output: {(p.stderr or p.stdout)[-200:]}"


def cwe_of(values):
    for v in values or []:
        m = re.search(r"CWE-\d+", str(v))
        if m:
            return m.group(0)
    return ""


# ---------- scanners ----------

def gitleaks(repo, raw, baseline=None):
    report = raw / "gitleaks.json"
    log_opts = ["--log-opts", f"{baseline}..HEAD"] if baseline else []
    p = subprocess.run(["gitleaks", "git", "--redact", "--no-banner", *log_opts, "--report-format", "json", "--report-path", str(report), "."],
                       cwd=repo, capture_output=True, text=True, timeout=900)
    try:
        data = json.loads(report.read_text() or "[]")
    except (OSError, json.JSONDecodeError):
        return None, f"exit {p.returncode}: {(p.stderr or p.stdout)[-200:]}"
    st = f"exit {p.returncode}"  # 1 = leaks found
    out = [finding("gitleaks", f.get("RuleID", ""), "high", f"Secret: {f.get('Description', '')}", f.get("File", ""), f.get("StartLine", 0),
                   "CWE-798", f"commit {str(f.get('Commit', ''))[:10]} by {f.get('Author', '')}") for f in (data or [])]
    return out, st


def osv(repo, raw):
    data, st = run(["osv-scanner", "scan", "source", "-r", "--format", "json", "."], repo, raw / "osv.json")
    out = []
    for res in (data or {}).get("results", []):
        src = res.get("source", {}).get("path", "")
        for pkg in res.get("packages", []):
            p = pkg.get("package", {})
            groups = {g["ids"][0]: g for g in pkg.get("groups", []) if g.get("ids")}
            for v in pkg.get("vulnerabilities", []):
                g = groups.get(v.get("id"), {})
                score = float(g.get("max_severity") or 0 or 0)
                level = "critical" if score >= 9 else "high" if score >= 7 else "medium" if score >= 4 else "low"
                ghsa = next((i for i in [v.get("id", ""), *v.get("aliases", [])] if i.startswith("GHSA-")), v.get("id", ""))
                out.append(finding("osv-scanner", ghsa, level, f"{p.get('name')}@{p.get('version')}: {v.get('summary', v.get('id'))}",
                                   Path(src).name, 0, cwe_of(v.get("database_specific", {}).get("cwe_ids")), ", ".join(v.get("aliases", [])[:3]),
                                   key=f"dep|{ghsa}|{p.get('name')}"))
    return out, st


def pm_audit(repo, raw):
    if (repo / "pnpm-lock.yaml").exists() and shutil.which("pnpm"):
        cmd, tool = ["pnpm", "audit", "--json"], "pnpm-audit"
    elif (repo / "package-lock.json").exists() and shutil.which("npm"):
        cmd, tool = ["npm", "audit", "--json"], "npm-audit"
    else:
        return None, "no pnpm or npm lockfile"
    data, st = run(cmd, repo, raw / f"{tool}.json")
    out = []
    for adv in ((data or {}).get("advisories") or {}).values():  # pnpm / npm v6 shape
        ghsa = (re.search(r"GHSA-[\w-]+", adv.get("url", "") or "") or [str(adv.get("id"))])[0]
        out.append(finding(tool, ghsa, adv.get("severity"), f"{adv.get('module_name')}: {adv.get('title')}",
                           "lockfile", 0, cwe_of(adv.get("cwe")), adv.get("url", ""), key=f"dep|{ghsa}|{adv.get('module_name')}"))
    for name, v in ((data or {}).get("vulnerabilities") or {}).items():  # npm v7+ shape
        via = next((x for x in v.get("via", []) if isinstance(x, dict)), {})
        ghsa = (re.search(r"GHSA-[\w-]+", via.get("url", "") or "") or [str(via.get("source", name))])[0]
        out.append(finding(tool, ghsa, v.get("severity"), f"{name}: {via.get('title', 'vulnerable dependency')}",
                           "lockfile", 0, cwe_of(via.get("cwe")), via.get("url", ""), key=f"dep|{ghsa}|{name}"))
    return out, st


def semgrep(repo, raw, baseline=None):
    cmd = ["semgrep", "scan", "--json", "--metrics=off", "--quiet", "--timeout", "30"] + (["--baseline-commit", baseline] if baseline else [])
    for c in SEMGREP_CONFIGS:
        cmd += ["--config", c]
    data, st = run(cmd, repo, raw / "semgrep.json", timeout=1800)
    out = []
    for r in (data or {}).get("results", []):
        md = r.get("extra", {}).get("metadata", {})
        out.append(finding("semgrep", r.get("check_id", "").split(".")[-1], r.get("extra", {}).get("severity"),
                           r.get("extra", {}).get("message", ""), r.get("path", ""), r.get("start", {}).get("line", 0),
                           cwe_of(md.get("cwe") if isinstance(md.get("cwe"), list) else [md.get("cwe")]),
                           # without a Semgrep login the snippet comes back as "requires login": read the file instead
                           "" if r.get("extra", {}).get("lines", "").strip() == "requires login" else r.get("extra", {}).get("lines", "")))
    return out, st


def trivy(repo, raw, image=None):
    out, statuses = [], []
    targets = [("fs", ["trivy", "fs", "--quiet", "--format", "json", "--scanners", "vuln,misconfig", "."], "trivy-fs.json")]
    if image:
        targets.append(("image", ["trivy", "image", "--quiet", "--format", "json", "--scanners", "vuln,misconfig,secret", image], "trivy-image.json"))
    for kind, cmd, name in targets:
        data, st = run(cmd, repo, raw / name, timeout=1800)
        statuses.append(f"{kind}: {st}")
        for res in (data or {}).get("Results", []):
            target = res.get("Target", "")
            for v in res.get("Vulnerabilities") or []:
                vid = v.get("VulnerabilityID", "")
                ghsa = next((i for i in [vid, *(v.get("VendorIDs") or [])] if str(i).startswith("GHSA-")), "")
                out.append(finding(f"trivy-{kind}", vid, v.get("Severity"),
                                   f"{v.get('PkgName')}@{v.get('InstalledVersion')}: {v.get('Title') or vid}",
                                   target, 0, cwe_of(v.get("CweIDs")), f"fixed in {v.get('FixedVersion') or 'no fix yet'}",
                                   key=f"dep|{ghsa}|{v.get('PkgName')}" if ghsa else None))
            for m in res.get("Misconfigurations") or []:
                out.append(finding(f"trivy-{kind}", m.get("ID", ""), m.get("Severity"), m.get("Title", ""), target,
                                   (m.get("CauseMetadata") or {}).get("StartLine", 0), "", m.get("Resolution", "")))
            for s in res.get("Secrets") or []:
                out.append(finding(f"trivy-{kind}", s.get("RuleID", ""), s.get("Severity"), f"Secret: {s.get('Title')}", target,
                                   s.get("StartLine", 0), "CWE-798"))
    return out, "; ".join(statuses)


def hadolint(repo, raw):
    files = [p for p in repo.rglob("Dockerfile*") if "node_modules" not in p.parts and p.is_file()]
    if not files:
        return [], "no Dockerfile"
    data, st = run(["hadolint", "-f", "json", *[str(f.relative_to(repo)) for f in files]], repo, raw / "hadolint.json")
    level = {"error": "medium", "warning": "low", "info": "info", "style": "info"}
    return [finding("hadolint", h.get("code", ""), level.get(h.get("level"), "low"), h.get("message", ""), h.get("file", ""), h.get("line", 0))
            for h in (data or [])], st


# ---------- running app (passive, standard library) ----------

HEADERS = {  # header -> (severity when missing, CWE, why)
    "content-security-policy": ("medium", "CWE-1021", "no CSP: XSS has no second line of defence"),
    "strict-transport-security": ("medium", "CWE-319", "no HSTS: first visit can be downgraded to HTTP"),
    "x-content-type-options": ("low", "CWE-16", "no nosniff: MIME confusion"),
    "referrer-policy": ("low", "CWE-200", "no Referrer-Policy: full URLs leak to third parties"),
    "permissions-policy": ("info", "CWE-16", "no Permissions-Policy"),
}


def http_checks(url, raw):
    out, log = [], {}
    req = urllib.request.Request(url, headers={"User-Agent": "aios-security-audit/1.0"})
    try:
        with urllib.request.urlopen(req, timeout=20) as r:
            headers = {k.lower(): v for k, v in r.headers.items()}
            cookies = r.headers.get_all("Set-Cookie") or []
            body = r.read(400_000).decode("utf-8", "replace")
    except (urllib.error.URLError, OSError) as e:
        return None, f"could not fetch {url}: {e}"
    log["headers"] = headers
    https = url.startswith("https://")
    for h, (level, cwe, why) in HEADERS.items():
        if h == "strict-transport-security" and not https:
            continue
        if h not in headers:
            out.append(finding("http", f"missing-{h}", level, why, url, 0, cwe))
    csp = headers.get("content-security-policy", "")
    if csp:
        if "'unsafe-inline'" in csp and "script-src" in csp and "nonce-" not in csp and "strict-dynamic" not in csp:
            out.append(finding("http", "csp-unsafe-inline", "medium", "CSP allows inline scripts without a nonce or hash", url, 0, "CWE-79", csp[:300]))
        if "frame-ancestors" not in csp and "x-frame-options" not in headers:
            out.append(finding("http", "clickjacking", "medium", "No frame-ancestors / X-Frame-Options: the page can be framed", url, 0, "CWE-1021"))
    elif "x-frame-options" not in headers:
        out.append(finding("http", "clickjacking", "medium", "No frame-ancestors / X-Frame-Options: the page can be framed", url, 0, "CWE-1021"))
    for name in ("server", "x-powered-by"):
        if re.search(r"\d", headers.get(name, "")):
            out.append(finding("http", f"banner-{name}", "low", f"{name} header discloses a version: {headers[name]}", url, 0, "CWE-200"))
    for c in cookies:
        n = c.split("=", 1)[0]
        flags = c.lower()
        missing = [f for f in ("httponly", "samesite") if f not in flags] + (["secure"] if https and "secure" not in flags else [])
        if missing:
            out.append(finding("http", "cookie-flags", "medium" if "httponly" in missing else "low",
                               f"Cookie {n} lacks {', '.join(missing)}", url, 0, "CWE-614"))
    scripts = re.findall(r'<script[^>]+src="([^"]+\.js)"', body)[:5]
    log["maps_checked"] = []
    for s in scripts:
        js = urllib.parse.urljoin(url, s)
        try:
            with urllib.request.urlopen(urllib.request.Request(js + ".map", headers={"User-Agent": "aios-security-audit/1.0"}), timeout=10) as r:
                if r.status == 200 and b'"sources"' in r.read(4000):
                    out.append(finding("http", "sourcemap-exposed", "low", f"Source map is public: {js}.map", url, 0, "CWE-540"))
        except (urllib.error.URLError, OSError):
            pass
        log["maps_checked"].append(js + ".map")
    (raw / "http.json").write_text(json.dumps(log, indent=1), encoding="utf-8")
    return out, "ok"


def zap_baseline(url, raw):
    if not shutil.which("docker"):
        return None, "docker not installed"
    target = url.replace("localhost", "host.docker.internal").replace("127.0.0.1", "host.docker.internal")
    p = subprocess.run(["docker", "run", "--rm", "-v", f"{raw}:/zap/wrk:rw", "-t", "ghcr.io/zaproxy/zaproxy:stable",
                        "zap-baseline.py", "-t", target, "-J", "zap.json", "-I"], capture_output=True, text=True, timeout=1800)
    try:
        data = json.loads((raw / "zap.json").read_text())
    except (OSError, json.JSONDecodeError):
        return None, f"exit {p.returncode}: {p.stdout[-200:]}"
    risk = {"3": "high", "2": "medium", "1": "low", "0": "info"}
    return [finding("zap-baseline", a.get("pluginid", ""), risk.get(str(a.get("riskcode")), "low"), a.get("alert", ""),
                    url, 0, f"CWE-{a['cweid']}" if a.get("cweid") not in (None, "", "-1", "0") else "", re.sub("<[^>]+>", "", a.get("solution", "")))
            for site in data.get("site", []) for a in site.get("alerts", [])], f"exit {p.returncode}"


# ---------- main ----------

def main():
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    ap.add_argument("repo")
    ap.add_argument("--out", default=".security")
    ap.add_argument("--url")
    ap.add_argument("--image")
    ap.add_argument("--zap", action="store_true")
    ap.add_argument("--skip", default="")
    ap.add_argument("--baseline", help="git ref: report only what changed since it")
    a = ap.parse_args()
    repo = Path(a.repo).resolve()
    out = Path(a.out).resolve()
    raw = out / "raw"
    raw.mkdir(parents=True, exist_ok=True)
    skip = set(filter(None, a.skip.split(",")))

    if a.baseline:
        changed = subprocess.run(["git", "diff", "--name-only", f"{a.baseline}...HEAD"], cwd=repo, capture_output=True, text=True).stdout.split()
        if not any(re.search(r"(package\.json|lock\.ya?ml|-lock\.json|\.lock)$", f) for f in changed):
            skip |= {"osv-scanner", "audit"}
        if not any(re.search(r"(Dockerfile|compose.*\.ya?ml|\.github/workflows/)", f) for f in changed):
            skip |= {"trivy", "hadolint"}
    plan = [("gitleaks", "gitleaks", lambda: gitleaks(repo, raw, a.baseline)), ("osv-scanner", "osv-scanner", lambda: osv(repo, raw)),
            ("audit", None, lambda: pm_audit(repo, raw)), ("semgrep", "semgrep", lambda: semgrep(repo, raw, a.baseline)),
            ("trivy", "trivy", lambda: trivy(repo, raw, a.image)), ("hadolint", "hadolint", lambda: hadolint(repo, raw))]
    if a.url:
        plan.append(("http", None, lambda: http_checks(a.url, raw)))
        if a.zap:
            plan.append(("zap", None, lambda: zap_baseline(a.url, raw)))

    findings, status = [], {}
    for name, binary, fn in plan:
        if name in skip:
            status[name] = "SKIPPED (no relevant change since baseline)" if a.baseline and name not in set(filter(None, a.skip.split(","))) else "SKIPPED (--skip)"
            continue
        if binary and not shutil.which(binary):
            status[name] = f"NOT RUN: {binary} not installed (brew install {binary})"
            continue
        print(f"[scan] {name} ...", file=sys.stderr, flush=True)
        res, st = fn()
        if res is None:
            status[name] = f"NOT RUN: {st}"
            continue
        findings += res
        status[name] = f"ran ({st}), {len(res)} finding(s)"

    by_fp, uniq = {}, []
    for f in sorted(findings, key=lambda f: SEV_ORDER.index(f["severity"])):
        kept = by_fp.get(f["fingerprint"])
        if kept is None:
            f["also"] = []
            by_fp[f["fingerprint"]] = f
            uniq.append(f)
        elif f["tool"] != kept["tool"] and f["tool"] not in kept["also"]:
            kept["also"].append(f["tool"])  # same advisory from another scanner: one finding, both named
    (out / "findings.json").write_text(json.dumps({"repo": str(repo), "url": a.url, "status": status, "findings": uniq}, indent=1), encoding="utf-8")

    counts = {s: sum(1 for f in uniq if f["severity"] == s) for s in SEV_ORDER}
    lines = [f"# Security scan: {repo.name}", "", "## Scanners", "", "| Scanner | Result |", "|---|---|"]
    lines += [f"| {k} | {v} |" for k, v in status.items()]
    lines += ["", "## Findings", "", " · ".join(f"{s}: {n}" for s, n in counts.items()), "",
              "| Sev | Tool | Rule | Where | What | CWE |", "|---|---|---|---|---|---|"]
    for f in uniq[:150]:
        where = f"{f['file']}:{f['line']}" if f["line"] else f["file"]
        lines.append(f"| {f['severity']} | {'+'.join([f['tool'], *f['also']])} | {f['rule']} | {where} | {f['title'].replace('|', '/')[:140]} | {f['cwe']} |")
    if len(uniq) > 150:
        lines.append(f"\n{len(uniq) - 150} more in findings.json")
    (out / "summary.md").write_text("\n".join(lines) + "\n", encoding="utf-8")

    ran = [k for k, v in status.items() if v.startswith("ran")]
    print("\n".join(f"  {k}: {v}" for k, v in status.items()))
    print(f"{len(uniq)} findings ({', '.join(f'{s} {n}' for s, n in counts.items() if n)}); report: {out / 'summary.md'}")
    if not ran:
        return 2
    return 1 if counts["critical"] or counts["high"] else 0


if __name__ == "__main__":
    sys.exit(main())
