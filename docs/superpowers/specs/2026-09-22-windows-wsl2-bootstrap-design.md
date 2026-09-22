# Windows/WSL2 bootstrap for the actives/ workspace + novelaudio pipeline migration

**Status**: approved (design), not yet implemented
**Owner**: Edd
**Date**: 2026-09-22

## Problem

Everything in this workspace — `ai-os` and the 12 projects under
`eddremonts86/actives/` — currently only runs on one Mac. Two separate needs
came up for a second machine, a Windows PC with an NVIDIA RTX 2060 Super
(8 GB VRAM, CUDA-capable):

1. A full mirror of the dev environment (all 12 `actives/` projects + ai-os),
   so development isn't Mac-only, without hand-configuring each piece.
2. novelaudio's production pipeline (scrape → clean → chunk → TTS → publish)
   currently runs only on the Mac via 8 `launchd` agents. The user wants
   Windows to **replace** the Mac as the machine running this pipeline going
   forward — plus a local backup mirror of everything already in production
   storage, since Windows has disk space the Mac doesn't.

## Why not do this natively on Windows

Nearly everything here assumes a POSIX environment: bash scripts throughout,
Homebrew as the package manager, `launchd` for scheduling, Python venvs,
`piper-tts`/`kokoro`/`espeak-ng` (uncertain-to-nonexistent native Windows
support). Porting every script to PowerShell and finding Windows-native
replacements for each dependency is a much larger, riskier effort than
running the existing POSIX tooling inside **WSL2** (a real Ubuntu kernel
inside Windows), where the vast majority of it works with little or no
change. NVIDIA's WSL2 CUDA passthrough is mature — the GPU is usable from
inside WSL2 once the Windows-side driver supports it, no separate WSL-side
driver needed.

**Decision: WSL2 + Ubuntu is the platform for all of this. Windows itself
only hosts the NVIDIA driver, WSL2, and Docker Desktop (WSL2 backend).**
Everything else — the repos, the toolchain, the pipeline — lives inside the
WSL2 Ubuntu filesystem, not on the Windows side.

## Architecture

```
Windows 11
├── NVIDIA driver (WSL2-CUDA-enabled)         ← installed on Windows, not WSL2
├── Docker Desktop (WSL2 backend)              ← installed on Windows, not WSL2
└── WSL2 : Ubuntu
    ├── ai-os/                                 (Fase A)
    │   └── setup/install-mac.sh               ← reused as-is; already Linux-tested via CI
    ├── actives/                                (Fase B)
    │   ├── HunterReady/, budget-app/, ... (12 projects, `pnpm install` each)
    │   └── .infra/docker-compose.yml          ← reused as-is (Postgres 18, ChromaDB, MinIO, Mailpit)
    └── novelaudio/                             (Fase C)
        ├── scripts/bootstrap_wsl.sh            ← NEW, ported from bootstrap_mac.sh
        ├── systemd --user units (8)            ← NEW, replace the 8 launchd plists
        └── novelaudio-backup/                  ← NEW, rclone mirror of production storage
```

## Phase A — Windows + WSL2 + ai-os

1. **Manual, not scriptable**: enable WSL2 (`wsl --install -d Ubuntu`), install
   the NVIDIA driver with WSL2/CUDA support, install Docker Desktop for
   Windows with the WSL2 backend enabled for the Ubuntu distro. All three
   need a Windows reboot and/or admin rights partway through; no script can
   safely automate this unattended.
2. Inside WSL2 Ubuntu: `git clone https://github.com/eddremonts86/ai-os` and
   run `setup/install-mac.sh` — despite the name, this is already exercised
   on Ubuntu by `test-linux.yml` in CI, so it's the right script to run, not
   `install-windows.ps1` (that one targets native PowerShell, a different
   codepath we don't need once we're inside a real Linux userspace).
3. One real gap: `install-mac.sh`'s package list doesn't include `pnpm`
   (only `node`) — every `actives/` project needs it. Add it
   (`corepack enable && corepack prepare pnpm@latest --activate`, matching
   how the Mac side gets it) as part of this phase's implementation, not
   assumed already covered.
4. Verify: `nvidia-smi` runs inside WSL2 and shows the 2060S; `docker info`
   inside WSL2 talks to the Windows-side Docker Desktop engine.

## Phase B — the 12 `actives/` projects

1. Clone all 12 repos into WSL2's filesystem (not the Windows-side
   `/mnt/c/...` — native ext4 inside WSL2 is dramatically faster for
   node_modules-heavy JS projects than the 9p-protocol-backed Windows
   filesystem bridge).
2. `pnpm install` in each.
3. Bring up `.infra/docker-compose.yml` unchanged — Docker Compose files are
   portable, and this one has no macOS-specific paths.
4. **Manual, not scriptable**: copy the canonical secrets file
   (`ai-os/dev-env/env-config/.env`) from the Mac to the new machine over a
   channel the user trusts (e.g. an encrypted USB, a password manager's file
   attachment, or `scp` directly between the two machines if both are on a
   network the user controls) — never through a chat transcript or an
   unencrypted transfer. This mirrors `bootstrap_mac.sh`'s own rule: "it
   never writes a secret... the dossier lives outside the repo and has to be
   copied by hand."
5. Per-project `.env` files get created from `.env.example` same as always;
   nothing here is Windows-specific.

## Phase C — novelaudio pipeline migration (Windows replaces the Mac)

### C1. Port `bootstrap_mac.sh` → `bootstrap_wsl.sh`

Same shape, same checks, same `--apply`/`--from` flags. What actually changes:

| bootstrap_mac.sh | bootstrap_wsl.sh |
| --- | --- |
| `uname -s = Darwin` gate | `uname -s = Linux` + confirm running under WSL2 (`grep -qi microsoft /proc/version`) |
| Homebrew (`/opt/homebrew/bin`) | apt for system packages (`ffmpeg`, `espeak-ng`); `pnpm`/node already from Phase A |
| 8 `launchd` plists (`~/Library/LaunchAgents`) | 8 `systemd --user` unit files (`~/.config/systemd/user/`) |
| `launchctl bootstrap/bootout` | `systemctl --user enable --now` / `systemctl --user stop` |
| N/A | `loginctl enable-linger $USER` — required so the user units keep running without an active login session (WSL2's default behavior otherwise stops user services when the last WSL window closes) |

Python venv, pip install, the piper voice download, and the Playwright
Chromium install are unchanged — pure Python/curl steps, already portable.

`StartInterval`/`RunAtLoad`/`KeepAlive` (launchd) map to systemd timers
(`OnCalendar`/`OnBootSec` for the interval agents) and `Restart=always` unit
directives (for the two `KeepAlive` agents: narration watchers, backfill).

### C2. Migrate state and cut over

Reuse the **existing** `--from` flow unchanged in spirit — it already does
exactly what's needed and already runs over SSH/rsync, which work the same
from WSL2:

```bash
scripts/bootstrap_wsl.sh --apply --from edd@old-mac.local
```

This already: stops the Mac's agents first (`ssh $FROM ... agents.sh down
all`), rsyncs `data/` (62 GB, `--partial` for resume) and
`config/pipeline.env`, then only loads the new machine's agents once state
looks complete. No new logic needed here beyond the launchd→systemd swap in
C1 — the safety gates (refuse to start without `manifest.db`/
`.publish_state.json`, the "why" comments) all carry over as-is.

### C3. GPU verification before calling the migration done

`kokoro` (14.6x realtime on Mac's Apple GPU) needs a real check that it's
using CUDA inside WSL2, not silently falling back to CPU — run a short
narration and compare throughput against the Mac's known numbers before
trusting it for production volume.

### C4. Local backup mirror of production storage (rclone)

New, independent of the pipeline's own lifecycle:

- **Why independent**: `prune_uploaded.py` already deletes local render
  output once uploaded (by design — it's the pipeline's working set, not a
  backup). The Mac's disk constraints made that the right call there;
  Windows having room doesn't mean the pipeline's pruning should change —
  it means a *separate* backup should exist. Coupling the backup to
  `prune_uploaded.py` would tie two unrelated concerns (working-set hygiene
  vs. disaster recovery) into one script.
- **Mechanism**: `rclone` configured against the same S3-compatible endpoint
  novelaudio's `boto3` client already uses (Hetzner Object Storage,
  `STORAGE_ENDPOINT`/`STORAGE_BUCKET`/`STORAGE_ACCESS_KEY`/
  `STORAGE_SECRET_KEY` — same dossier keys `bootstrap_mac.sh` already
  checks for, reused, not duplicated).
- **First run**: `rclone sync remote:$BUCKET ~/novelaudio-backup/` — full
  backfill of everything currently in production, including anything the
  Mac already pruned locally before this existed.
- **Ongoing**: a `systemd --user` timer (e.g. every 6h) re-runs the same
  `rclone sync` — incremental after the first pass, cheap.
- This directly answers the risk `bootstrap_mac.sh` itself already flags at
  the end of every run: *"Once local audio is deleted the bucket is the
  only copy... turn on versioning for the bucket."* This backup is a
  second, independent mitigation for that same risk, not a replacement for
  bucket versioning (worth still turning on separately, but out of scope
  here — that's a Hetzner console setting, not something this script touches).

## What stays manual, and why

Consistent with `bootstrap_mac.sh`'s own stated philosophy ("it never writes
a secret... two things this script cannot do for you"), the new scripts
follow the same rule: anything genuinely irreversible, security-sensitive,
or requiring interactive/admin steps stays a documented manual step, not a
prompt-suppressed automation:

1. WSL2/NVIDIA driver/Docker Desktop installation (Windows admin + reboot).
2. Copying the secrets dossier (never over an unverified channel).
3. The actual cutover moment — stopping the Mac's agents — surfaces clearly
   in the script's output (as it already does today), not silently.

## Testing / verification

- Phase A: `nvidia-smi` and `docker info` succeed inside WSL2.
- Phase B: each project's dev server answers on its port; `.infra` containers
  report `healthy` (same checks already used all session on the Mac).
- Phase C: `bootstrap_wsl.sh` (no `--apply`) reports all checks green before
  ever running `--apply`; after cutover, `systemctl --user list-units
  'com.novelaudio.*'` shows 8 active units; a real narration run measured
  against the Mac's throughput numbers; `rclone sync` completes and
  `rclone size remote:$BUCKET` vs. `du -sh ~/novelaudio-backup/` match.

## Out of scope (for this spec)

- Turning on Hetzner bucket versioning (recommended, separate, manual).
- Running the pipeline on both machines at once (rejected — two independent
  ledgers publishing to one bucket re-upload each other's work, per
  `bootstrap_mac.sh`'s own warning).
- Any change to `prune_uploaded.py` itself.
