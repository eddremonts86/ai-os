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
and corruption, not disk loss; Time Machine picks it up when its disk is
attached. Runs daily via the launchd agent ai.os.backup.
"""

import argparse
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
    a = ap.parse_args()
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
    sys.exit(main())
