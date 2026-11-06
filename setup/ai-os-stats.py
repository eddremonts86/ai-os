#!/usr/bin/env python3
"""ai-os stats — the numbers AI-OS publishes, computed from the repo.

The landing page, its diagram, the social card and the README all state counts
(skills, MCP servers, commands, packages…). They were hand-edited and drifted:
on 2026-11-05 the site still said 186 skills / 10 MCP / 70 brew packages after
the catalogue changed, in ~15 places across HTML attributes, JS and images.

  ai-os stats            # print the numbers
  ai-os stats --json
  ai-os stats --check    # exit 1 if any published number disagrees with the repo
  ai-os stats --write    # rewrite the numbers in place, then re-render the PNGs

--check runs in the pre-push hook and in CI. Every published number lives in
CLAIMS below: add a row when you add a number to a page, or --check cannot see it.
"""

import argparse
import json
import re
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SITE = ROOT / "apps" / "site"
# The React landing imports every number it shows from this file; --write regenerates it.
SITE_STATS = SITE / "src" / "stats.json"


def count_lines(path):
    return sum(1 for l in path.read_text(encoding="utf-8").splitlines() if l.strip() and not l.lstrip().startswith("#"))


def compute():
    skills = ROOT / "ai-config" / "skills"
    flat = sum(1 for d in skills.iterdir() if (d / "SKILL.md").is_file())
    gstack = sum(1 for d in (ROOT / "vendor" / "gstack").iterdir() if (d / "SKILL.md").is_file())
    ecc = count_lines(ROOT / "vendor" / "ecc" / "DAILY_SKILLS.txt")
    manifest = (ROOT / "ai-config" / "manifest.yaml").read_text(encoding="utf-8")
    req = re.search(r"^required_skills:\n((?:\s+-.*\n)+)", manifest, re.M)
    superpowers = len(re.findall(r"^\s+-", req.group(1), re.M)) if req else 0
    mcp = list((ROOT / "ai-config" / "mcp").glob("*.yaml"))
    mcp_enabled = sum(1 for f in mcp if not re.search(r"^enabled:\s*false\s*$", f.read_text(encoding="utf-8"), re.M))
    brew = lambda f: len(re.findall(r'^\s*(?:brew|cask) "', (ROOT / "dev-env" / "packages" / f).read_text(encoding="utf-8"), re.M))
    linked = flat + gstack + ecc
    return {
        "skills_linked": linked,            # what every CLI gets
        "skills_flat": flat,
        "skills_gstack": gstack,
        "skills_ecc": ecc,
        "superpowers": superpowers,
        "skills_curated": linked - superpowers,
        "mcp_enabled": mcp_enabled,
        "mcp_total": len(mcp),
        "commands": sum(1 for f in (ROOT / "ai-config" / "commands").glob("*.md") if f.name != "README.md"),
        "brew_core": brew("Brewfile"),
        "brew_extras": brew("Brewfile.extras"),
        "brew_total": brew("Brewfile") + brew("Brewfile.extras"),
        "npm_globals": count_lines(ROOT / "dev-env" / "packages" / "npm-globals.txt"),
        "pip_packages": count_lines(ROOT / "dev-env" / "packages" / "pip-packages.txt"),
        "verify_sections": len(re.findall(r'^section "', (ROOT / "setup" / "verify.sh").read_text(encoding="utf-8"), re.M)),
    }


# (file relative to ROOT, regex with ONE capture group for the number, stat key, offset)
# offset: published = stat + offset (e.g. "/fix-ui-ux and 3 more" lists 5 by name).
CLAIMS = [
    ("apps/site/index.html", r"restores (\d+) skills", "skills_linked", 0),
    ("apps/site/ai-os-system.svg", r"(\d+) skills · \d+ MCP · \d+ cmd", "skills_linked", 0),
    ("apps/site/ai-os-system.svg", r"\d+ skills · (\d+) MCP · \d+ cmd", "mcp_enabled", 0),
    ("apps/site/ai-os-system.svg", r"\d+ skills · \d+ MCP · (\d+) cmd", "commands", 0),
    ("apps/site/ai-os-system.svg", r">(\d+) MCP servers<", "mcp_enabled", 0),
    ("apps/site/og-source.html", r"one command · (\d+) skills", "skills_linked", 0),
    ("README.md", r"badge/%2B_ECC-(\d+)-", "skills_ecc", 0),
    ("README.md", r"\[!\[\+ ECC: (\d+)\]", "skills_ecc", 0),
    ("README.md", r"\*\*\+(\d+) curated ECC skills\*\*", "skills_ecc", 0),
    ("README.md", r"`dev-env/packages/Brewfile` \((\d+) packages", "brew_core", 0),
    ("README.md", r"`ai-config/mcp/\*\.yaml` \((\d+) servers\)", "mcp_enabled", 0),
    ("README.md", r"runs verification \((\d+) sections\)", "verify_sections", 0),
    ("README.md", r"\*\*(\d+) MCP servers \(\d+ enabled\)\*\*", "mcp_total", 0),
    ("README.md", r"\*\*\d+ MCP servers \((\d+) enabled\)\*\*", "mcp_enabled", 0),
]


def scan(stats):
    """Yield (file, line, published, expected, claim) for every claim match."""
    for rel, pattern, key, offset in CLAIMS:
        path = ROOT / rel
        text = path.read_text(encoding="utf-8")
        matches = list(re.finditer(pattern, text))
        if not matches:
            yield rel, 0, None, stats[key] + offset, (rel, pattern, key, offset)
        for m in matches:
            yield rel, text.count("\n", 0, m.start(1)) + 1, int(m.group(1)), stats[key] + offset, (rel, pattern, key, offset)


def site_stats_ok(stats):
    try:
        return json.loads(SITE_STATS.read_text(encoding="utf-8")) == stats
    except (OSError, ValueError):
        return False


def write(stats):
    changed = set()
    if not site_stats_ok(stats):
        SITE_STATS.write_text(json.dumps(stats, indent=2) + "\n", encoding="utf-8")
        changed.add(str(SITE_STATS.relative_to(ROOT)))
    for rel, pattern, key, offset in CLAIMS:
        path = ROOT / rel
        text = path.read_text(encoding="utf-8")
        want = str(stats[key] + offset)
        new = re.sub(pattern, lambda m: m.group(0)[: m.start(1) - m.start(0)] + want + m.group(0)[m.end(1) - m.start(0):], text)
        if new != text:
            path.write_text(new, encoding="utf-8")
            changed.add(rel)
    return changed


def render_images(changed):
    """Re-render the PNGs whose source changed (needs Playwright's chromium)."""
    jobs = []
    if "apps/site/og-source.html" in changed:
        jobs.append(("og-source.html", "public/og.png", 1200, 630, 1))
    if "apps/site/ai-os-system.svg" in changed:
        jobs.append(("ai-os-system.svg", "ai-os-system.png", 1280, 721, 1.9))
    if not jobs:
        return []
    from playwright.sync_api import sync_playwright
    with sync_playwright() as p:
        browser = p.chromium.launch()
        for src, out, w, h, scale in jobs:
            page = browser.new_page(viewport={"width": w, "height": h}, device_scale_factor=scale)
            page.goto((SITE / src).as_uri())
            page.wait_for_timeout(1500)  # web fonts
            page.screenshot(path=str(SITE / out), clip={"x": 0, "y": 0, "width": w, "height": h})
        browser.close()
    return [j[1] for j in jobs]


def main():
    ap = argparse.ArgumentParser(description="Published AI-OS numbers, computed from the repo.")
    g = ap.add_mutually_exclusive_group()
    g.add_argument("--json", action="store_true")
    g.add_argument("--check", action="store_true", help="exit 1 if a published number is stale")
    g.add_argument("--write", action="store_true", help="fix published numbers in place and re-render PNGs")
    a = ap.parse_args()
    stats = compute()

    if a.json:
        print(json.dumps(stats, indent=2))
        return 0
    if a.check:
        bad = [(f, l, got, want, c) for f, l, got, want, c in scan(stats) if got != want]
        if not site_stats_ok(stats):
            bad.append((str(SITE_STATS.relative_to(ROOT)), 0, "stale values", "different values", (None, None, "all", 0)))
        for f, l, got, want, c in bad:
            where = f"{f}:{l}" if l else f
            print(f"{where}: says {got if got is not None else '(pattern not found)'}, repo says {want}  [{c[2]}]")
        if bad:
            print(f"\n{len(bad)} stale number(s). Fix with: ai-os stats --write")
            return 1
        print(f"all {sum(1 for _ in scan(stats))} published numbers match the repo")
        return 0
    if a.write:
        changed = write(stats)
        for rel in sorted(changed):
            print(f"updated {rel}")
        for png in render_images(changed):
            print(f"re-rendered apps/site/{png}")
        if not changed:
            print("already up to date")
        return 0
    for k, v in stats.items():
        print(f"{k:<16} {v}")
    return 0


if __name__ == "__main__":
    for _stream in (sys.stdout, sys.stderr):  # Windows consoles default to cp1252 and choke on the status symbols
        if hasattr(_stream, "reconfigure"):
            _stream.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
