#!/usr/bin/env python3
"""registry.py: publish a design system as a shadcn registry, and install or update it in another project.

  registry.py publish [dir] --name N --scope S [--version V]     tokens.py check, build, validate, shadcn build
  registry.py install <address> [dir]                             guards, shadcn add, check, lock file
  registry.py update [dir] [--ref REF] [--yes]                    lists local edits and upstream changes first
  registry.py init <address of the base item> <name> [dir]        a new Vite project with the system (shadcn init)

An address is the local path of a built `<name>-tokens.json` (`<name>-base.json` for init), or a GitHub registry item
`owner/repo/<name>-tokens[#ref]` (`#ref` is a tag, branch or commit; none means the default branch). A private
repository needs `gh auth login` or GH_TOKEN. `update --ref` moves a GitHub install to another ref.

Standard library only, except that the scope guard reads AI-OS's scope config with PyYAML: run it with the AI-OS
venv's python. The shadcn CLI is run at the pinned version SHADCN_VERSION (AIOS_SHADCN_VERSION overrides).
Exit codes: 0 done, 1 a check or the CLI failed, 2 the CLI cannot be reached, 3 stopped before changing anything
(dirty tree, scope guard, or `update` waiting for --yes).
"""

import argparse
import importlib.util
import json
import os
import re
import shutil
import subprocess
import sys
from pathlib import Path

SHADCN_VERSION = "4.23.0"  # the version the placement rules below were measured on (2026-11-24)
LOCK = "ds-registry.lock.json"
BUILT = "registry/dist"  # not public/: a Vite app ships public/ in dist, and the registry is not part of the app
# Each part starts with a letter or digit: an address never begins with `-` (the CLI would read it as an option) and
# `../x/y` stays a relative path. A ref uses git's own alphabet, so no shell metacharacter can ride in it (npx and pnpm
# are .cmd shims on Windows and go through cmd.exe).
GITHUB = re.compile(r"(?P<owner>[A-Za-z0-9][\w.-]*)/(?P<repo>[A-Za-z0-9][\w.-]*)/(?P<item>[A-Za-z0-9][\w.-]*)(?:#(?P<ref>[\w./@+-]+))?")
ITEM_SCHEMA = "https://ui.shadcn.com/schema/registry-item.json"
REGISTRY_SCHEMA = "https://ui.shadcn.com/schema/registry.json"
ROOT_EXTRAS = ("--shadow-color", "--control-height")  # not in the token contract, but the shadow and the controls need them
THEME_NAMES = ("--font-sans", "--font-mono", "--shadow-sm", "--shadow-md", "--shadow-lg", "--ease-out",
               "--spacing-control")  # --spacing-control makes the h-control utility; it points at --control-height
UNREACHABLE = re.compile(r"ENOTFOUND|ETARGET|E404|EAI_AGAIN|ECONNREFUSED|ECONNRESET|ETIMEDOUT|No matching version|"
                         r"fetch failed|getaddrinfo|network", re.I)


def _load(path, name):
    spec = importlib.util.spec_from_file_location(name, path)
    mod = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(mod)
    return mod


def _tokens():
    here = Path(__file__).resolve()
    rel = Path("ai-config/skills/aios-ui-system-check/scripts/tokens.py")
    paths = [here.parents[2] / "aios-ui-system-check/scripts/tokens.py"]
    if os.environ.get("AI_OS_ROOT"):
        paths.append(Path(os.environ["AI_OS_ROOT"]) / rel)
    for p in paths:
        if p.is_file():
            return _load(p, "tokens")
    raise SystemExit("tokens.py not found: expected the aios-ui-system-check skill beside this one (or AI_OS_ROOT)")


tokens = _tokens()


# --- what goes into the registry --------------------------------------------------------------------------------

def _n(value):
    return " ".join(str(value).split())


def exported(name):
    return (name in tokens.COLOR_VARS or name in tokens.SINGLE_VARS or name in ROOT_EXTRAS or name in THEME_NAMES
            or name.startswith(("--duration-", "--transition-duration-")))


def _theme_type(name):
    return name in THEME_NAMES or name.startswith("--transition-duration-")


def build(css, *, name, scope, version, design_path, title=None, style="base-nova", icons="lucide", base_color="neutral"):
    """{"registry": registry.json content, "items": {item name: item}, "skipped": [names not exported]}.

    parse_css folds `@theme` and `@theme inline` into one block, so placement is by variable name:
    colours and --radius in cssVars light/dark; fonts, shadows, --ease-out and --transition-duration-* in cssVars
    theme (the CLI writes them to `@theme inline`); every other exported variable in `css :root` (cssVars would add a
    self-referencing alias such as `--duration-fast: var(--duration-fast)`). `@theme` is never a `css` key: the
    install fails on it."""
    if not isinstance(name, str) or not re.fullmatch(r"[a-z0-9][a-z0-9-]*", name):
        raise ValueError(f"name must be a lowercase slug, got {name!r}")
    if not isinstance(scope, str) or not scope.strip():
        raise ValueError("a scope is required: the registry must say whose system it is")
    blocks = tokens.parse_css(css)
    gaps = tokens.gaps(blocks)
    if gaps:
        raise ValueError("the stylesheet lacks the token contract: " + "; ".join(gaps[:5]) + (" ..." if len(gaps) > 5 else ""))
    root, dark, theme = (blocks.get(k, {}) for k in (":root", ".dark", "@theme"))
    pool = {**root, **theme}
    light = {n[2:]: _n(root[n]) for n in [*tokens.COLOR_VARS, "--radius"] if n in root}
    darkv = {n[2:]: _n(dark[n]) for n in tokens.COLOR_VARS if n in dark}
    themev = {n[2:]: _n(pool[n]) for n in pool if exported(n) and _theme_type(n)}
    rootv = {n: _n(v) for n, v in root.items()
             if exported(n) and not _theme_type(n) and n not in tokens.COLOR_VARS and n != "--radius"}
    darkcss = {n: _n(v) for n, v in dark.items() if exported(n) and n not in tokens.COLOR_VARS}
    css_out = {":root": rootv}
    if darkcss:
        css_out[".dark"] = darkcss
    for key, vars_ in blocks.items():
        if key.startswith("@media ") and key.endswith(" :root"):
            keep = {n: _n(v) for n, v in vars_.items() if exported(n)}
            if keep:
                css_out[key[: -len(" :root")]] = {":root": keep}

    members = {**{n: _n(v) for n, v in rootv.items()}, **{f"--{k}": v for k, v in {**light, **darkv, **themev}.items()}}
    members.update({n: v for n, v in darkcss.items()})
    for holder, value in members.items():
        for ref in re.findall(r"var\(\s*(--[\w-]+)", value):
            if not exported(ref):
                raise ValueError(f"{holder} refers to var({ref}), which is outside the export set; "
                                 f"export {ref} by name in the token contract or inline its value")

    skipped = sorted({n for blk in (root, dark, theme) for n in blk if not exported(n) and not n.startswith(("--color-", "--radius-"))})  # shadcn's own aliases
    meta = {"scope": scope.strip(), "version": str(version), "install": "tokens"}
    title = title or f"{name} design system"
    tokens_item = {"$schema": ITEM_SCHEMA, "name": f"{name}-tokens", "type": "registry:theme", "title": title,
                   "description": "Colour, radius, font, shadow, easing and duration tokens for both modes.",
                   "cssVars": {"theme": themev, "light": light, "dark": darkv}, "css": css_out, "meta": meta}
    items = {
        f"{name}-tokens": tokens_item,
        f"{name}-design-md": {
            "$schema": ITEM_SCHEMA, "name": f"{name}-design-md", "type": "registry:file", "title": f"{title}: DESIGN.md",
            "description": "The written system. Install once: the project owns it afterwards.",
            "files": [{"path": design_path, "type": "registry:file", "target": "~/DESIGN.md"}],
            "meta": {**meta, "install": "once"}},
        f"{name}-base": {
            "$schema": ITEM_SCHEMA, "name": f"{name}-base", "type": "registry:base", "title": f"{title}: new project",
            "description": "For `shadcn init`: the style, icons and base colour, with the tokens.",
            "config": {"style": style, "iconLibrary": icons, "tailwind": {"baseColor": base_color}},
            "files": [{"path": design_path, "type": "registry:file", "target": "~/DESIGN.md"}],
            "cssVars": tokens_item["cssVars"], "css": css_out, "meta": meta},
    }
    font = re.search(r"""@import\s+["']@fontsource(?:-variable)?/([\w-]+)["']""", css)
    if font and "font-sans" in themev:
        pkg = re.search(r"""@import\s+["'](@fontsource(?:-variable)?/[\w-]+)["']""", css).group(1)
        family = themev["font-sans"]
        items[f"{name}-font"] = {
            "$schema": ITEM_SCHEMA, "name": f"{name}-font", "type": "registry:font", "title": font.group(1).replace("-", " ").title(),
            "description": "The system's sans font, from fontsource.",
            "font": {"family": family, "provider": "google", "import": font.group(1).replace("-", " ").title(),
                     "variable": "--font-sans", "dependency": pkg}, "meta": {**meta, "install": "once"}}
    registry = {"$schema": REGISTRY_SCHEMA, "name": name, "homepage": "https://example.invalid",
                "items": [{k: v for k, v in item.items() if k != "$schema"} for item in items.values()]}
    return {"registry": registry, "items": items, "skipped": skipped}


def item_vars(item):
    """[(where, --name, value)] an item sets. where: light, dark, theme, or the css selector (media rules included)."""
    out = []
    for where in ("light", "dark", "theme"):
        out += [(where, f"--{k}", _n(v)) for k, v in item.get("cssVars", {}).get(where, {}).items()]
    for selector, body in item.get("css", {}).items():
        if selector.startswith("@media"):
            out += [(f"{selector} :root", n, _n(v)) for n, v in body.get(":root", {}).items()]
        elif isinstance(body, dict):
            out += [(selector, n, _n(v)) for n, v in body.items() if n.startswith("--") and isinstance(v, str)]
    return out


def _value(blocks, where, name):
    key = {"light": ":root", "dark": ".dark", "theme": "@theme"}.get(where, where)
    value = blocks.get(key, {}).get(name)
    return None if value is None else _n(value)


# --- lock file and drift ----------------------------------------------------------------------------------------

def make_lock(item, css, address):
    """What the project holds right after an install: every variable the item sets, read back from its stylesheet."""
    blocks = tokens.parse_css(css)
    meta = item.get("meta", {})
    return {"address": address, "name": item["name"], "version": meta.get("version"), "scope": meta.get("scope"),
            "vars": {f"{w} {n}": _value(blocks, w, n) for w, n, _ in item_vars(item)}}


def drift(lock, css, new_item):
    """Local edits (the project's value no longer equals the lock) and upstream changes (the new item differs)."""
    blocks = tokens.parse_css(css)
    local, upstream = [], []
    for key, was in lock["vars"].items():
        where, name = key.rsplit(" ", 1)
        now = _value(blocks, where, name)
        if was is not None and now != was:
            local.append({"where": where, "name": name, "lock": was, "now": now})
    for where, name, value in item_vars(new_item):
        was = lock["vars"].get(f"{where} {name}")
        if was != value:
            upstream.append({"where": where, "name": name, "lock": was, "new": value})
    return {"local_edits": local, "upstream": upstream}


# --- DESIGN.md --------------------------------------------------------------------------------------------------

def write_colors(text, block):
    """Replace the flat `colors:` map in DESIGN.md's frontmatter with `block` (as tokens.frontmatter prints it).
    ValueError when the file has no frontmatter, no `colors:`, or anything in it but `key: "value"` lines."""
    m = re.match(r"(﻿?---\r?\n)(.*?)(\r?\n---)", text, re.S)
    if not m:
        raise ValueError("DESIGN.md has no frontmatter")
    nl = "\r\n" if "\r\n" in text else "\n"
    lines = m.group(2).splitlines()
    start = next((i for i, line in enumerate(lines) if line.rstrip() == "colors:"), None)
    if start is None:
        raise ValueError("DESIGN.md frontmatter has no colors: block")
    end = start + 1
    while end < len(lines) and lines[end].startswith((" ", "\t")):
        if not re.fullmatch(r"""\s+["']?[\w-]+["']?\s*:\s*\S.*""", lines[end]) or lines[end].lstrip() != lines[end].lstrip(" "):
            raise ValueError(f"colors: holds something other than key: value lines ({lines[end].strip()!r})")
        end += 1
    new = [*lines[:start], *block.splitlines(), *lines[end:]]
    return text[: m.start(2)] + nl.join(new) + text[m.end(2):]


# --- guards -----------------------------------------------------------------------------------------------------

def scope_problem(item_scope, consumer_scope, known):
    """None when the item may be installed here, else why not. It checks `meta.scope`, which a hand-edited item can
    lie about: it stops a mistake, not an attack."""
    if not known:
        return "no scopes are configured in AI-OS (context/personal/work/scopes.yaml), so the scope cannot be checked"
    if not item_scope:
        return "the item carries no scope: publish it with --scope"
    if item_scope not in known:
        return f"'{item_scope}' is not a scope in the AI-OS configuration ({', '.join(sorted(known))})"
    if not consumer_scope:
        return "this folder resolves to no scope (run `ai-os scope which` here)"
    if item_scope != consumer_scope:
        return f"the item belongs to scope '{item_scope}' and this folder to '{consumer_scope}': a system never crosses scopes"
    return None


def _scopes(path):
    """(known scope names, the scope of `path`) from the AI-OS scope config; ({}, None) when it cannot be read."""
    mod = Path(os.environ["AI_OS_ROOT"]) / "setup/ai-os-scope.py" if os.environ.get("AI_OS_ROOT") else None
    if not mod or not mod.is_file():
        mod = Path(__file__).resolve().parents[4] / "setup/ai-os-scope.py"
    try:
        m = _load(mod, "ai_os_scope")
        cfg = m.load()
        return set((cfg or {}).get("scopes") or {}), m.which(cfg, str(path)).get("scope")
    except Exception as e:  # missing file, no PyYAML, unreadable config: the guard then refuses
        print(f"cannot read the AI-OS scope config ({type(e).__name__}: {e}); run with the AI-OS venv's python "
              f"(~/.ai-os/venv/bin/python)", file=sys.stderr)
        return set(), None


def _git(path, *args):
    env = {k: v for k, v in os.environ.items() if not k.startswith("GIT_")}  # a hook's GIT_DIR must not leak in
    return subprocess.run(["git", *args], cwd=str(path), env=env, capture_output=True, text=True,
                          encoding="utf-8", errors="replace")


def tree_problem(path):
    try:
        inside = _git(path, "rev-parse", "--is-inside-work-tree")
    except OSError as e:
        return f"git is not available: {e}"
    if inside.returncode or inside.stdout.strip() != "true":
        return f"{path} is not a git repository: the update is only reversible through git"
    if _git(path, "status", "--porcelain").stdout.strip():
        return "the tree has uncommitted changes: commit or stash them first, so the update can be rolled back"
    return None


def _runner(name, windows):
    """On Windows npx and pnpm are .cmd shims that subprocess only finds by full path."""
    return (shutil.which(name) or name) if windows else name


CMD_META = re.compile(r'[&|<>^%"\r\n]')


def cmd_unsafe(args, windows):
    """The first argument cmd.exe would interpret (`&`, `|`, `<`, `>`, `^`, `%`, a quote, a newline), None elsewhere or
    when there is none: on Windows npx and pnpm are .cmd shims, so such an argument could run another command."""
    return next((a for a in args if windows and CMD_META.search(str(a))), None)


def run_shadcn(args, cwd, run=subprocess.run, env=None, check=True):
    """Run `shadcn@<pinned> args` in cwd through pnpm dlx or npx. Exit 2 when the CLI cannot be reached or the version
    does not exist, 1 when it fails (check=False returns that failed run instead, for probes)."""
    if bad := cmd_unsafe(args, os.name == "nt"):
        _stop(f"refusing to pass {bad!r} to the shadcn CLI: it contains a character cmd.exe would interpret", 3)
    lookup = os.environ if env is None else env
    version = lookup.get("AIOS_SHADCN_VERSION") or SHADCN_VERSION
    pm = ["pnpm", "dlx"] if (Path(cwd) / "pnpm-lock.yaml").is_file() else ["npx", "--yes"]
    pm[0] = _runner(pm[0], os.name == "nt")
    cmd = [*pm, f"shadcn@{version}", *args]
    try:
        done = run(cmd, cwd=str(cwd), capture_output=True, text=True, encoding="utf-8", errors="replace", timeout=900)
    except (OSError, subprocess.TimeoutExpired) as e:
        print(f"shadcn {version} not reachable: {e}", file=sys.stderr)
        raise SystemExit(2)
    if done.returncode:
        text = f"{done.stdout}\n{done.stderr}".strip()
        if UNREACHABLE.search(text):
            lines = [ln for ln in text.splitlines() if UNREACHABLE.search(ln)]
            kind = "does not exist" if "No matching version" in text or "ETARGET" in text else "not reachable"
            print(f"shadcn {version} {kind}: {(lines or text.splitlines() or ['no output'])[0].strip()}", file=sys.stderr)
            raise SystemExit(2)
        if not check:
            return done
        print(text, file=sys.stderr)
        raise SystemExit(1)
    return done


# --- commands ---------------------------------------------------------------------------------------------------

def _stop(message, code=3):
    print(message, file=sys.stderr)
    raise SystemExit(code)


def parse_address(address):
    """("github", {owner, repo, item, ref}) for `owner/repo/item[#ref]`, else ("local", Path). A path that exists, or
    that ends in .json, is always local."""
    text = str(address)
    m = GITHUB.fullmatch(text)
    if m and not text.endswith(".json") and not Path(text).exists():
        return "github", m.groupdict()
    return "local", Path(text)


def _github(parts, item=None, ref=None):
    ref = parts["ref"] if ref is None else ref
    return f"{parts['owner']}/{parts['repo']}/{item or parts['item']}" + (f"#{ref}" if ref else "")


def with_ref(address, ref):
    kind, parts = parse_address(address)
    if kind != "github":
        raise ValueError("--ref applies to GitHub addresses (owner/repo/item#ref), not to a local path")
    if not re.fullmatch(r"[\w./@+-]+", ref):
        raise ValueError(f"{ref!r} is not a tag, branch or commit name")
    return _github(parts, ref=ref)


def sibling(address, old, new):
    """The address of the item next to this one (`-tokens` to `-design-md`), in the same repo at the same ref; None
    when the item is not named `...<old>`."""
    kind, parts = parse_address(address)
    if kind == "github":
        return _github(parts, item=parts["item"][: -len(old)] + new) if parts["item"].endswith(old) else None
    name = parts.name
    return str(parts.with_name(name[: -len(old + ".json")] + new + ".json")) if name.endswith(old + ".json") else None


def fetch_item(address, cwd, run=subprocess.run):
    """The registry item at an address: the file for a local path, `shadcn view` for a GitHub item."""
    kind, parts = parse_address(address)
    if kind == "local":
        return _read(parts)
    done = run_shadcn(["view", str(address)], cwd, run=run)
    start = done.stdout.find("[")
    try:
        return json.loads(done.stdout[start:])[0]
    except (ValueError, IndexError):
        _stop(f"could not read {address}: shadcn view printed no item", 1)


def item_exists(address, cwd, run=subprocess.run):
    kind, parts = parse_address(address)
    if kind == "local":
        return parts.is_file()
    return run_shadcn(["view", str(address)], cwd, run=run, check=False).returncode == 0


def _read(path):
    try:
        return json.loads(Path(path).read_text(encoding="utf-8"))
    except FileNotFoundError:
        _stop(f"{path} not found: the lock file records where the registry was built; rebuild it there with `publish`, "
              f"or correct the address in {LOCK}", 1)


def publish(project, *, name, scope, version="0.1.0", gates=True, run=subprocess.run, scopes=None):
    """Check, build and validate the project's system as a registry. gates=False skips the check and the scope test.
    Nothing is written until the shadcn CLI has answered."""
    project = Path(project).resolve()
    sheet = tokens.find_stylesheet(project)
    design = project / "DESIGN.md"
    if not sheet or not design.is_file():
        _stop("needs a stylesheet and a DESIGN.md at the project root: run /aios-ui-system-create or -extract first")
    if gates:
        known, here = (scopes or _scopes)(project)
        if problem := scope_problem(scope, here, known):
            _stop(f"--scope {scope}: {problem}")
        fails = tokens.check(project)
        if fails:
            _stop("tokens.py check fails, nothing was built:\n  " + "\n  ".join(fails), 1)
    run_shadcn(["--version"], project, run=run)
    try:
        components = json.loads((project / "components.json").read_text(encoding="utf-8"))
    except (OSError, ValueError):
        components = {}
    out = build(sheet.read_text(encoding="utf-8-sig", errors="replace"), name=name, scope=scope, version=version,
                design_path=f"registry/{name}/DESIGN.md", style=components.get("style") or "base-nova",
                icons=components.get("iconLibrary") or "lucide",
                base_color=(components.get("tailwind") or {}).get("baseColor") or "neutral")
    dest = project / "registry" / name
    dest.mkdir(parents=True, exist_ok=True)
    shutil.copyfile(design, dest / "DESIGN.md")
    (project / "registry.json").write_text(json.dumps(out["registry"], indent=2) + "\n", encoding="utf-8")
    run_shadcn(["registry", "validate"], project, run=run)
    run_shadcn(["build", "-o", BUILT], project, run=run)
    built = sorted((project / BUILT).glob(f"{name}-*.json"))
    return {"registry": str(project / "registry.json"), "built": [str(p) for p in built], "skipped": out["skipped"]}


def _sheet(project):
    sheet = tokens.find_stylesheet(Path(project))
    if not sheet:
        _stop(f"no stylesheet found in {project} (components.json tailwind.css, src/index.css, ...)", 1)
    return sheet


def _finish(project, item, address, run_check=True):
    sheet = _sheet(project)
    css = sheet.read_text(encoding="utf-8-sig", errors="replace")
    Path(project, LOCK).write_text(json.dumps(make_lock(item, css, address), indent=2) + "\n", encoding="utf-8")
    fails = tokens.check(project) if run_check else []
    print("check: ok" if not fails else "check fails:\n  " + "\n  ".join(fails))
    return 1 if fails else 0


def _normal(address):
    """A local path made absolute (the CLI runs in the project); a GitHub address as given."""
    kind, parts = parse_address(address)
    return str(parts.resolve()) if kind == "local" else str(address)


def install(address, project=".", run=subprocess.run, scopes=None):
    project = Path(project).resolve()
    if problem := tree_problem(project):
        _stop(problem)
    addr = _normal(address)
    item = fetch_item(addr, project, run)
    known, here = (scopes or _scopes)(project)
    if problem := scope_problem(item.get("meta", {}).get("scope"), here, known):
        _stop(problem)
    run_shadcn(["add", addr, "-y"], project, run=run)
    for suffix, once in (("-design-md", not (project / "DESIGN.md").exists()), ("-font", True)):
        other = sibling(addr, "-tokens", suffix)
        if other and once and item_exists(other, project, run):
            run_shadcn(["add", other, "-y"], project, run=run)
    return _finish(project, item, addr)


def init_project(address, name, cwd=".", run=subprocess.run, scopes=None):
    """A new Vite + shadcn project called `name` in `cwd`, from the system's base item, with the lock file `update`
    needs (it points at the `<name>-tokens` item beside the base item, at the same ref)."""
    if not re.fullmatch(r"[a-z0-9][a-z0-9-]*", name):
        _stop(f"project name must be a lowercase slug, got {name!r}", 1)
    cwd = Path(cwd).resolve()
    dest = cwd / name
    if dest.exists():
        _stop(f"{dest} already exists: init only creates new projects")
    base = _normal(address)
    item = fetch_item(base, cwd, run)
    known, here = (scopes or _scopes)(cwd)
    if problem := scope_problem(item.get("meta", {}).get("scope"), here, known):
        _stop(problem)
    run_shadcn(["init", base, "-t", "vite", "-y", "--name", name, "--cwd", str(cwd)], cwd, run=run)
    tokens_addr = sibling(base, "-base", "-tokens")
    sheet = tokens.find_stylesheet(dest) if dest.is_dir() else None
    if sheet and tokens_addr and item_exists(tokens_addr, dest, run):
        css = sheet.read_text(encoding="utf-8-sig", errors="replace")
        lock = make_lock(fetch_item(tokens_addr, dest, run), css, tokens_addr)
        (dest / LOCK).write_text(json.dumps(lock, indent=2) + "\n", encoding="utf-8")
        print(f"{name}: created, lock file written; commit everything (the CLI adds its own files) before the first update")
    return 0


def stale_design_notes(design_text, upstream):
    """DESIGN.md prose that still quotes the old value of a non-colour token the update changed."""
    return [f"DESIGN.md still mentions {e['lock']} ({e['name']} is now {e['new']}): update its text"
            for e in upstream if e["name"] not in tokens.COLOR_VARS and e["lock"] and len(e["lock"]) > 2
            and e["lock"] in design_text]


def update_design(design, block, upstream):
    """Rewrite the `colors:` block of a DESIGN.md in place and return the messages to show. The file is read and
    written as bytes decoded here, so a CRLF checkout stays CRLF and git shows only the block."""
    text = Path(design).read_bytes().decode("utf-8")
    notes = []
    try:
        Path(design).write_bytes(write_colors(text, block).encode("utf-8"))
    except ValueError as e:
        notes.append(f"DESIGN.md not updated ({e}); paste this block under its frontmatter:\n{block}")
    return notes + [f"note: {n}" for n in stale_design_notes(text, upstream)]


def update(project=".", yes=False, run=subprocess.run, scopes=None, ref=None):
    project = Path(project).resolve()
    if problem := tree_problem(project):
        _stop(problem)
    lock_path = project / LOCK
    if not lock_path.is_file():
        _stop(f"{LOCK} not found: this project has no recorded install (run install first)")
    lock = _read(lock_path)
    address = lock["address"]
    if ref:
        try:
            address = with_ref(address, ref)
        except ValueError as e:
            _stop(str(e))
    item = fetch_item(address, project, run)
    known, here = (scopes or _scopes)(project)
    if problem := scope_problem(item.get("meta", {}).get("scope"), here, known):
        _stop(problem)
    css = _sheet(project).read_text(encoding="utf-8-sig", errors="replace")
    d = drift(lock, css, item)
    moved = address != lock["address"]
    print(f"{lock['name']}: installed {lock['version']}, available {item['meta'].get('version')}"
          + (f" at {address}" if moved else ""))
    for e in d["local_edits"]:
        print(f"  local edit, will be overwritten: {e['name']} ({e['where']}) {e['lock']} -> {e['now']}")
    for e in d["upstream"]:
        print(f"  upstream: {e['name']} ({e['where']}) {e['lock']} -> {e['new']}")
    if moved:
        print(f"  the lock will move from {lock['address']} to {address}")
    if not d["upstream"] and not d["local_edits"] and not moved:
        print("  nothing to do")
        return 0
    if not yes:
        _stop("nothing changed yet: re-run with --yes to apply")
    run_shadcn(["add", address, "-o", "-y"], project, run=run)
    sheet = _sheet(project)
    block = tokens.frontmatter(tokens.parse_css(sheet.read_text(encoding="utf-8-sig", errors="replace")))
    design = project / "DESIGN.md"
    if design.is_file():
        for note in update_design(design, block, d["upstream"]):
            print(note, file=sys.stderr if note.startswith("DESIGN.md not updated") else sys.stdout)
    return _finish(project, item, address)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    sub = ap.add_subparsers(dest="cmd", required=True)
    p = sub.add_parser("publish"); p.add_argument("dir", nargs="?", default="."); p.add_argument("--name", required=True)
    p.add_argument("--scope", required=True); p.add_argument("--version", default="0.1.0")
    i = sub.add_parser("install"); i.add_argument("address"); i.add_argument("dir", nargs="?", default=".")
    n = sub.add_parser("init"); n.add_argument("address"); n.add_argument("name"); n.add_argument("dir", nargs="?", default=".")
    u = sub.add_parser("update"); u.add_argument("dir", nargs="?", default="."); u.add_argument("--yes", action="store_true")
    u.add_argument("--ref", help="move a GitHub install to this tag, branch or commit")
    a = ap.parse_args(argv)
    if a.cmd == "publish":
        r = publish(a.dir, name=a.name, scope=a.scope, version=a.version)
        print(f"registry: {r['registry']}")
        print("built: " + ", ".join(r["built"]))
        if r["skipped"]:
            print("not exported (outside the token contract): " + ", ".join(r["skipped"]))
        return 0
    if a.cmd == "install":
        return install(a.address, a.dir)
    if a.cmd == "init":
        return init_project(a.address, a.name, a.dir)
    return update(a.dir, a.yes, ref=a.ref)


if __name__ == "__main__":
    sys.exit(main())
