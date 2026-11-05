#!/usr/bin/env python3
"""ai-os backup — snapshot what AI-OS cannot rebuild, and prove it restores.

Rebuildable state (code indexes, skill links, MCP configs) is not backed up.
What is: the graphiti knowledge graph (FalkorDB RDB snapshot, one graph per
group), the merged secrets file dev-env/env-config/.env, and Claude Code's
per-project memory (~/.claude/projects/*/memory).

  ai-os backup              # take a snapshot (keeps the newest 14)
  ai-os backup --list
  ai-os backup --verify     # restore the newest snapshot into a throwaway
                            # FalkorDB container and compare graph sizes

Destination: $AI_OS_BACKUP_DIR or ~/Backups/ai-os (dirs 0700, files 0600 — it
holds secrets). That is the same SSD as /Volumes/Works, so it covers mistakes
and corruption, not disk loss.

Off-site: every snapshot is also encrypted (AES-256-GCM, authenticated) and
copied to iCloud Drive/Backups/ai-os as one `.enc` file (newest 14). The key is
random, lives in the macOS Keychain (service ai-os-backup-key) and NEVER leaves
the Mac unencrypted — which is also the catch: if the Mac is lost, so is the
Keychain. Save the recovery key once, somewhere that is not this Mac:

  ai-os backup --show-key               # run in your own terminal; copy into a password manager
  ai-os backup --confirm-key-saved      # silences the health warning
  ai-os backup --verify-offsite         # decrypt the newest iCloud copy and compare it
  ai-os backup --restore-offsite DIR    # decrypt + extract it (key: Keychain or $AI_OS_BACKUP_KEY)

The same encrypted file also goes to a PRIVATE GitHub repo (default
<your login>/ai-os-backups, override with $AI_OS_GITHUB_BACKUP_REPO; disable with
AI_OS_GITHUB=0), because iCloud Drive can stall silently. The repo's history is
one commit that is rewritten on every run (force-pushed — it is a backup mirror,
not a project), so it never grows past the newest 14 files. Only ciphertext is
published; without the key the files are unreadable.

Runs daily via the launchd agent ai.os.backup.
"""

import argparse
import base64
import io
import json
import os
import shutil
import subprocess
import sys
import tarfile
import tempfile
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
HOME = Path.home()
DEST = Path(os.environ.get("AI_OS_BACKUP_DIR", HOME / "Backups" / "ai-os"))
KEEP = 14
ICLOUD = HOME / "Library" / "Mobile Documents" / "com~apple~CloudDocs"
OFFSITE = Path(os.environ.get("AI_OS_OFFSITE_DIR", ICLOUD / "Backups" / "ai-os"))
KEY_SERVICE, KEY_ACCOUNT = "ai-os-backup-key", "ai-os"
KEY_CONFIRMED = HOME / ".ai-os" / "backup-key-saved"
GH_WORK = HOME / ".ai-os" / "offsite-github"  # local working clone of the mirror
MAGIC = b"AIOSBK1"  # file header; also the GCM associated data
FALKOR = "ia-os-falkordb"
FALKOR_DATA = ROOT / "memory" / "falkordb" / "data"
# launchd starts jobs with a bare PATH; docker lives in /usr/local/bin.
os.environ["PATH"] = os.pathsep.join(["/usr/local/bin", "/opt/homebrew/bin", os.environ.get("PATH", "")])


def sh(*cmd, timeout=60):
    p = subprocess.run(cmd, capture_output=True, text=True, timeout=timeout)
    return p.returncode, p.stdout.strip()


def graph_sizes(container, port_args=()):
    rc, out = sh("docker", "exec", container, "redis-cli", *port_args, "GRAPH.LIST")
    if rc != 0:
        raise RuntimeError(f"{container}: GRAPH.LIST failed")
    sizes = {}
    for g in [l for l in out.splitlines() if l.strip()]:
        rc, res = sh("docker", "exec", container, "redis-cli", *port_args, "GRAPH.QUERY", g, "MATCH (n) RETURN count(n)")
        lines = res.splitlines()
        sizes[g] = int(lines[1]) if rc == 0 and len(lines) > 1 and lines[1].strip().isdigit() else -1
    return sizes


def snapshot_graph(out):
    """BGSAVE, wait for it to land, copy the RDB the host mount now holds."""
    rc, before = sh("docker", "exec", FALKOR, "redis-cli", "LASTSAVE")
    if rc != 0:
        raise RuntimeError("FalkorDB not reachable — is Docker running?")
    sh("docker", "exec", FALKOR, "redis-cli", "BGSAVE")
    for _ in range(60):
        rc, now = sh("docker", "exec", FALKOR, "redis-cli", "LASTSAVE")
        if now != before:
            break
        time.sleep(1)
    else:
        raise RuntimeError("BGSAVE did not finish in 60s")
    rdb = FALKOR_DATA / "dump.rdb"
    if not rdb.exists():
        raise RuntimeError(f"{rdb} missing — FalkorDB data dir not mounted?")
    shutil.copy2(rdb, out / "falkordb-dump.rdb")
    return graph_sizes(FALKOR)


def get_key(create=False):
    """32-byte key: $AI_OS_BACKUP_KEY (base64, for restoring on a new Mac) or the Keychain."""
    env = os.environ.get("AI_OS_BACKUP_KEY")
    if env:
        return base64.b64decode(env)
    rc, out = sh("security", "find-generic-password", "-s", KEY_SERVICE, "-a", KEY_ACCOUNT, "-w")
    if rc == 0 and out:
        return base64.b64decode(out)
    if not create:
        raise RuntimeError("no backup key in the Keychain (and $AI_OS_BACKUP_KEY is unset)")
    key = os.urandom(32)
    # `security` only takes the secret as an argument (visible in `ps` for a moment); acceptable
    # on a single-user Mac, and the item is created by `security` itself so it needs no prompt.
    rc, out = sh("security", "add-generic-password", "-s", KEY_SERVICE, "-a", KEY_ACCOUNT, "-U",
                 "-w", base64.b64encode(key).decode(), "-j", "AI-OS backup encryption key")
    if rc != 0:
        raise RuntimeError(f"could not store the key in the Keychain: {out}")
    return key


def encrypt(data, key):
    from cryptography.hazmat.primitives.ciphers.aead import AESGCM
    nonce = os.urandom(12)
    return MAGIC + nonce + AESGCM(key).encrypt(nonce, data, MAGIC)


def decrypt(blob, key):
    from cryptography.hazmat.primitives.ciphers.aead import AESGCM
    if not blob.startswith(MAGIC):
        raise RuntimeError("not an AI-OS backup file")
    nonce, body = blob[len(MAGIC):len(MAGIC) + 12], blob[len(MAGIC) + 12:]
    return AESGCM(key).decrypt(nonce, body, MAGIC)  # raises InvalidTag on a wrong key or tampering


def pack(snap):
    buf = io.BytesIO()
    with tarfile.open(fileobj=buf, mode="w:gz") as tar:
        tar.add(snap, arcname=snap.name)
    return buf.getvalue()


def github_repo():
    """owner/name of the private mirror, or None when disabled."""
    if os.environ.get("AI_OS_GITHUB") == "0":
        return None
    repo = os.environ.get("AI_OS_GITHUB_BACKUP_REPO")
    if repo:
        return repo
    rc, login = sh("gh", "api", "user", "--jq", ".login")
    return f"{login}/ai-os-backups" if rc == 0 and login else None


def git(*args, cwd=GH_WORK, timeout=120):
    # Auth through gh's own token; never writes the global git config.
    env = {**os.environ, "GIT_TERMINAL_PROMPT": "0", "GIT_AUTHOR_NAME": "ai-os backup", "GIT_AUTHOR_EMAIL": "noreply@localhost",
           "GIT_COMMITTER_NAME": "ai-os backup", "GIT_COMMITTER_EMAIL": "noreply@localhost"}
    cfg = ["-c", "credential.helper=", "-c", "credential.helper=!gh auth git-credential"]
    p = subprocess.run(["git", *cfg, *args], cwd=cwd, capture_output=True, text=True, timeout=timeout, env=env)
    if p.returncode != 0:
        raise RuntimeError(f"git {args[0]} failed: {(p.stderr or p.stdout).strip()[-300:]}")
    return p.stdout.strip()


def push_github(name, blob):
    repo = github_repo()
    if not repo:
        raise RuntimeError("GitHub mirror disabled or `gh` is not logged in")
    rc, vis = sh("gh", "repo", "view", repo, "--json", "isPrivate", "--jq", ".isPrivate")
    if vis != "true":  # refuse to publish anything, even ciphertext, to a public or missing repo
        raise RuntimeError(f"{repo} is not a private repo that exists (isPrivate={vis or 'unknown'})")
    GH_WORK.mkdir(parents=True, exist_ok=True)
    if not (GH_WORK / ".git").exists():
        git("init", "-q", "-b", "main")
    git("remote", "remove", "origin") if "origin" in git("remote").split() else None
    git("remote", "add", "origin", f"https://github.com/{repo}.git")
    (GH_WORK / name).write_bytes(blob)
    (GH_WORK / "README.md").write_text(
        "# ai-os-backups\n\nEncrypted AI-OS backups (AES-256-GCM). Unreadable without the key, which is not here.\n"
        "Restore: `AI_OS_BACKUP_KEY=<key> ai-os backup --restore-offsite <dir>`.\n"
        "History is a single commit rewritten on every run; only the newest files are kept.\n", encoding="utf-8")
    files = sorted(GH_WORK.glob("ai-os-*.tar.gz.enc"))
    for old in files[:-KEEP]:
        old.unlink()
    git("add", "-A")
    tree = git("write-tree")
    commit = git("commit-tree", tree, "-m", f"encrypted backups up to {name}")  # parentless: history never grows
    git("update-ref", "refs/heads/main", commit)
    git("push", "--force", "origin", "main")
    git("reflog", "expire", "--expire=now", "--all")
    git("gc", "--prune=now", "--quiet")
    return f"https://github.com/{repo}"


def push_offsite(snap):
    """Encrypt once, write the same ciphertext to iCloud Drive and the private GitHub mirror.
    Returns a list of (destination, error-or-None); the local snapshot is already safe."""
    name = f"ai-os-{snap.name}.tar.gz.enc"
    blob = encrypt(pack(snap), get_key(create=True))
    results = []
    try:
        if not ICLOUD.exists() and "AI_OS_OFFSITE_DIR" not in os.environ:
            raise RuntimeError("iCloud Drive is not available on this Mac")
        OFFSITE.mkdir(parents=True, exist_ok=True)
        out = OFFSITE / name
        tmp = out.with_suffix(".part")
        tmp.write_bytes(blob)
        os.chmod(tmp, 0o600)
        os.replace(tmp, out)  # iCloud never sees a half-written file under the final name
        for old in sorted(OFFSITE.glob("ai-os-*.tar.gz.enc"))[:-KEEP]:
            old.unlink()
        results.append((f"iCloud Drive ({out})", None))
    except Exception as e:
        results.append(("iCloud Drive", f"{type(e).__name__}: {e}"))
    try:
        results.append((f"GitHub {push_github(name, blob)}", None))
    except Exception as e:
        results.append(("GitHub", f"{type(e).__name__}: {e}"))
    return results


def offsite_files():
    return sorted(OFFSITE.glob("ai-os-*.tar.gz.enc")) if OFFSITE.exists() else []


def github_files():
    """Names of the encrypted files in the private mirror (via the API; no clone needed)."""
    repo = github_repo()
    if not repo:
        return []
    rc, out = sh("gh", "api", f"repos/{repo}/contents", "--jq", ".[].name")
    return sorted(n for n in out.splitlines() if n.startswith("ai-os-") and n.endswith(".tar.gz.enc")) if rc == 0 else []


def github_blob(name):
    p = subprocess.run(["gh", "api", f"repos/{github_repo()}/contents/{name}", "-H", "Accept: application/vnd.github.raw"],
                       capture_output=True, timeout=120)
    if p.returncode != 0:
        raise RuntimeError(p.stderr.decode(errors="replace").strip()[-200:])
    return p.stdout


def open_offsite(blob, key):
    return tarfile.open(fileobj=io.BytesIO(decrypt(blob, key)), mode="r:gz")


def verify_one(label, name, blob, key):
    stamp = name[len("ai-os-"):-len(".tar.gz.enc")]
    try:
        with open_offsite(blob, key) as tar:
            names = tar.getnames()
            manifest = json.load(tar.extractfile(f"{stamp}/manifest.json"))
            rdb = tar.extractfile(f"{stamp}/falkordb-dump.rdb").read()
    except Exception as e:
        print(f"❌ {label} {name}: cannot decrypt/read ({type(e).__name__}: {e})")
        return False
    local = DEST / stamp
    if local.exists() and (local / "falkordb-dump.rdb").read_bytes() != rdb:
        print(f"❌ {label} {name}: RDB differs from the local snapshot")
        return False
    print(f"✅ {label} {name} decrypts: {manifest['graphs']} ({len(names)} entries, {len(blob) // 1024} KB)")
    return True


def verify_offsite():
    """Decrypt the newest copy at every destination that has one and compare with the local snapshot."""
    key = get_key()
    checked = []
    files = offsite_files()
    if files:
        checked.append(verify_one("iCloud", files[-1].name, files[-1].read_bytes(), key))
    names = github_files()
    if names:
        try:
            checked.append(verify_one("GitHub", names[-1], github_blob(names[-1]), key))
        except Exception as e:
            print(f"❌ GitHub {names[-1]}: cannot download ({e})")
            checked.append(False)
    if not checked:
        print("no off-site copy to verify")
        return 1
    return 0 if all(checked) else 1


def restore_offsite(target, source=None):
    target = Path(target)
    files = offsite_files()
    names = github_files()
    if source == "github" or (source is None and not files):
        if not names:
            print("no off-site copy found (iCloud folder empty, GitHub mirror empty or unreachable)")
            return 1
        label, blob = f"GitHub {names[-1]}", github_blob(names[-1])
    else:
        if not files:
            print("no off-site copy found in " + str(OFFSITE))
            return 1
        label, blob = files[-1].name, files[-1].read_bytes()
    target.mkdir(parents=True, exist_ok=True, mode=0o700)
    with open_offsite(blob, get_key()) as tar:
        tar.extractall(target, filter="data")
    print(f"restored {label} into {target} (graph: falkordb-dump.rdb → memory/falkordb/data/dump.rdb)")
    return 0


def take():
    stamp = time.strftime("%Y-%m-%d-%H%M%S")
    out = DEST / stamp
    out.mkdir(parents=True, mode=0o700)
    os.chmod(DEST, 0o700)
    manifest = {"created": stamp, "items": {}}

    try:
        manifest["graphs"] = snapshot_graph(out)
    except Exception:
        shutil.rmtree(out)  # no half snapshots: retention counts directories
        raise
    manifest["items"]["falkordb-dump.rdb"] = (out / "falkordb-dump.rdb").stat().st_size

    env = ROOT / "dev-env" / "env-config" / ".env"
    if env.exists():
        shutil.copy2(env, out / "env-config.env")
        manifest["items"]["env-config.env"] = env.stat().st_size

    mem_dirs = sorted((HOME / ".claude" / "projects").glob("*/memory"))
    if mem_dirs:
        with tarfile.open(out / "claude-memory.tar.gz", "w:gz") as tar:
            for d in mem_dirs:
                tar.add(d, arcname=f"{d.parent.name}/memory")
        manifest["items"]["claude-memory.tar.gz"] = (out / "claude-memory.tar.gz").stat().st_size

    (out / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    for f in out.iterdir():
        os.chmod(f, 0o600)

    snapshots = sorted(p for p in DEST.iterdir() if p.is_dir())
    for old in snapshots[:-KEEP]:
        shutil.rmtree(old)
    print(f"backup {out}  graphs={manifest['graphs']}  files={list(manifest['items'])}")
    if os.environ.get("AI_OS_OFFSITE") != "0":
        failed = False
        try:
            results = push_offsite(out)
        except Exception as e:  # e.g. no key and the Keychain refused to create one
            print(f"off-site copy failed: {type(e).__name__}: {e}")
            return 1
        for dest, err in results:  # the local snapshot is kept either way
            print(f"off-site {dest}  (AES-256-GCM, key in the Keychain)" if not err else f"off-site {dest} FAILED: {err}")
            failed = failed or bool(err)
        return 1 if failed else 0
    return 0


def latest():
    snaps = sorted(p for p in DEST.iterdir() if p.is_dir() and (p / "manifest.json").exists()) if DEST.exists() else []
    return snaps[-1] if snaps else None


def verify(snap=None):
    """Restore into a throwaway FalkorDB and compare per-graph node counts."""
    snap = snap or latest()
    if not snap:
        print("no backup to verify")
        return 1
    manifest = json.loads((snap / "manifest.json").read_text(encoding="utf-8"))
    rc, image = sh("docker", "inspect", FALKOR, "--format", "{{.Config.Image}}")
    if rc != 0:
        print("cannot read the FalkorDB image from the running container")
        return 1
    with tempfile.TemporaryDirectory(prefix="aios-restore-") as tmp:
        shutil.copy2(snap / "falkordb-dump.rdb", Path(tmp) / "dump.rdb")
        name = f"aios-restore-check-{os.getpid()}"
        rc, _ = sh("docker", "run", "-d", "--rm", "--name", name, "-e", "BROWSER=0",
                   "-v", f"{tmp}:/var/lib/falkordb/data", image, timeout=120)
        if rc != 0:
            print("could not start a throwaway FalkorDB")
            return 1
        try:
            for _ in range(30):
                if sh("docker", "exec", name, "redis-cli", "PING")[1] == "PONG":
                    break
                time.sleep(1)
            restored = graph_sizes(name)
        finally:
            sh("docker", "rm", "-f", name)
    expected = manifest["graphs"]
    if restored != expected:
        print(f"❌ {snap.name}: restored {restored}, backup recorded {expected}")
        return 1
    print(f"✅ {snap.name} restores: {restored}")
    return 0


def main():
    ap = argparse.ArgumentParser(description="Snapshot and verify what AI-OS cannot rebuild.")
    g = ap.add_mutually_exclusive_group()
    g.add_argument("--list", action="store_true")
    g.add_argument("--verify", action="store_true", help="restore the newest snapshot into a throwaway FalkorDB")
    g.add_argument("--verify-offsite", action="store_true", help="decrypt the newest iCloud copy and compare it")
    g.add_argument("--restore-offsite", metavar="DIR", help="decrypt + extract the newest off-site copy into DIR (iCloud, else GitHub)")
    g.add_argument("--show-key", action="store_true", help="print the recovery key (store it OFF this Mac)")
    g.add_argument("--confirm-key-saved", action="store_true", help="record that the recovery key is saved elsewhere")
    a = ap.parse_args()
    if a.show_key:
        print(base64.b64encode(get_key(create=True)).decode())
        return 0
    if a.confirm_key_saved:
        KEY_CONFIRMED.parent.mkdir(parents=True, exist_ok=True)
        KEY_CONFIRMED.write_text(time.strftime("%Y-%m-%d") + "\n", encoding="utf-8")
        print(f"recorded in {KEY_CONFIRMED}")
        return 0
    if a.verify_offsite:
        return verify_offsite()
    if a.restore_offsite:
        return restore_offsite(a.restore_offsite, os.environ.get("AI_OS_RESTORE_FROM"))
    if a.list:
        for p in sorted(DEST.iterdir()) if DEST.exists() else []:
            m = p / "manifest.json"
            if m.exists():
                print(p.name, json.loads(m.read_text(encoding="utf-8")).get("graphs"))
        return 0
    if a.verify:
        return verify()
    try:
        return take()
    except (RuntimeError, OSError) as e:
        print(f"backup failed: {e}")
        return 1


if __name__ == "__main__":
    for _stream in (sys.stdout, sys.stderr):  # Windows consoles default to cp1252 and choke on the status symbols
        if hasattr(_stream, "reconfigure"):
            _stream.reconfigure(encoding="utf-8", errors="replace")
    sys.exit(main())
