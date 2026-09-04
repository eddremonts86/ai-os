#!/usr/bin/env node
/**
 * setup/wire-compact-hook.mjs
 *
 * Wires the vendored strategic-compact suggester into Claude Code as a
 * PreToolUse hook. Shared by setup/install-mac.sh and setup/install-windows.ps1
 * (and read back by both verify scripts) so the JSON merge has one
 * implementation instead of one in python and one in PowerShell.
 *
 * Usage:
 *   node setup/wire-compact-hook.mjs           # install/repair (idempotent)
 *   node setup/wire-compact-hook.mjs --check    # report only, never writes
 *
 * Exit codes: 0 = wired (or would be), 1 = not wired, 2 = cannot wire
 * (vendor/ecc absent, or settings.json is not valid JSON). Callers treat every
 * non-zero as an optional miss — this hook never gates an install.
 *
 * Why a symlink and not a copy: the hook does require('../lib/utils') and
 * require('../lib/transcript-context'), which resolve against the realpath of
 * the module. A copy into ~/.claude/scripts/hooks/ would leave those requires
 * dangling; a symlink resolves them inside vendor/ecc and picks up repo
 * updates for free. Where symlinks are not permitted (Windows without
 * Developer Mode), we skip the link and point the hook command straight at the
 * vendored path instead.
 */

import { existsSync, lstatSync, mkdirSync, readFileSync, readlinkSync, realpathSync, rmSync, symlinkSync, writeFileSync } from 'node:fs';
import { dirname, join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';
import { homedir } from 'node:os';

const CHECK_ONLY = process.argv.includes('--check');
const PREFIX = '[compact-hook]';
const say = (msg) => console.log(`${PREFIX} ${msg}`);

const SCRIPT_DIR = dirname(fileURLToPath(import.meta.url));
const AI_OS_ROOT = resolve(SCRIPT_DIR, '..');
const HOME = process.env.AI_OS_HOME_DIR || homedir();

// Windows paths go into JSON with forward slashes: node accepts them, and no
// escaping layer between here and the hook shell can eat them.
const posix = (p) => p.replace(/\\/g, '/');

const VENDORED = join(AI_OS_ROOT, 'vendor', 'ecc', 'scripts', 'hooks', 'suggest-compact.js');
const LINK_DIR = join(HOME, '.claude', 'scripts', 'hooks');
const LINK = join(LINK_DIR, 'suggest-compact.js');
const SETTINGS = join(HOME, '.claude', 'settings.json');
const BACKUP_DIR = join(HOME, '.claude', 'backups');
const MATCHER = 'Write|Edit|MultiEdit';

/** True when `p` is a symlink resolving to the vendored hook. */
function linkPointsAtVendor(p) {
  try {
    if (!lstatSync(p).isSymbolicLink()) return false;
    return realpathSync(p) === realpathSync(VENDORED);
  } catch {
    return false;
  }
}

/**
 * Ensure ~/.claude/scripts/hooks/suggest-compact.js links to the vendored hook.
 * Returns the path the hook command should invoke: the link when we have one,
 * the vendored script itself when symlinks are unavailable.
 */
function ensureLink() {
  if (linkPointsAtVendor(LINK)) return LINK;
  if (CHECK_ONLY) return existsSync(LINK) ? LINK : VENDORED;

  mkdirSync(LINK_DIR, { recursive: true });
  // A stale link (or a plain copy from an older run) is ours to replace; a
  // real file the user wrote is not, so only remove what we recognise.
  if (existsSync(LINK) || isDanglingLink(LINK)) {
    try {
      if (lstatSync(LINK).isSymbolicLink() || readFileSync(LINK, 'utf8').includes('StrategicCompact')) {
        rmSync(LINK, { force: true });
      } else {
        say(`WARN ${posix(LINK)} exists and is not ours — leaving it, pointing the hook at vendor/ecc`);
        return VENDORED;
      }
    } catch {
      rmSync(LINK, { force: true });
    }
  }
  try {
    symlinkSync(VENDORED, LINK, 'file');
    return LINK;
  } catch (err) {
    say(`WARN symlink not permitted (${err.code}) — pointing the hook at vendor/ecc directly`);
    return VENDORED;
  }
}

function isDanglingLink(p) {
  try {
    return lstatSync(p).isSymbolicLink() && !existsSync(p);
  } catch {
    return false;
  }
}

function readSettings() {
  if (!existsSync(SETTINGS)) return {};
  return JSON.parse(readFileSync(SETTINGS, 'utf8'));
}

/** The PreToolUse entry we own, identified by the script name in its command. */
const isOurs = (entry) => JSON.stringify(entry).includes('suggest-compact');

function main() {
  if (!existsSync(VENDORED)) {
    say(`SKIP vendor/ecc absent — no ${posix(VENDORED)}`);
    process.exit(2);
  }

  let settings;
  try {
    settings = readSettings();
  } catch (err) {
    say(`FAIL ${posix(SETTINGS)} is not valid JSON (${err.message}) — not touching it`);
    process.exit(2);
  }

  const hookPath = ensureLink();
  const command = `node "${posix(hookPath)}"`;
  const existing = settings.hooks?.PreToolUse?.filter(isOurs) ?? [];
  const wired = existing.some((e) => e.hooks?.some((h) => h.command === command));

  if (CHECK_ONLY) {
    const linked = linkPointsAtVendor(LINK);
    if (wired && linked) {
      say(`OK hook linked (${posix(LINK)} → vendor/ecc) and wired in settings.json (PreToolUse ${MATCHER})`);
      process.exit(0);
    }
    if (wired) {
      say(`OK hook wired in settings.json, running from ${posix(existing[0]?.hooks?.[0]?.command ?? '?')}`);
      process.exit(0);
    }
    say(`MISS no suggest-compact entry in ${posix(SETTINGS)} PreToolUse — run the installer`);
    process.exit(1);
  }

  if (wired && existing.length === 1) {
    say(`already wired (PreToolUse ${MATCHER} → ${posix(hookPath)})`);
    process.exit(0);
  }

  // Back up before touching a file the user also edits by hand.
  if (existsSync(SETTINGS)) {
    mkdirSync(BACKUP_DIR, { recursive: true });
    const stamp = new Date().toISOString().replace(/[:.]/g, '-');
    writeFileSync(join(BACKUP_DIR, `settings.json.bak-${stamp}`), readFileSync(SETTINGS));
  }

  settings.hooks ??= {};
  settings.hooks.PreToolUse = (settings.hooks.PreToolUse ?? []).filter((e) => !isOurs(e));
  settings.hooks.PreToolUse.push({
    matcher: MATCHER,
    hooks: [{ type: 'command', command }],
  });
  writeFileSync(SETTINGS, `${JSON.stringify(settings, null, 2)}\n`);
  say(`wired PreToolUse ${MATCHER} → ${command}`);
  process.exit(0);
}

main();
