#!/usr/bin/env node
// create-ai-os — bootstrap Edd's AI Operating System with one command.
// Thin wrapper: clones the ai-os repo, then delegates to the existing
// setup/install-mac.sh (Mac + Linux) or setup/install-windows.ps1 (Windows).
// Tests pass AIOS_FAKE_GIT to avoid real network access / system mutation in CI.
import { spawnSync } from 'node:child_process';
import { existsSync, mkdirSync, statSync, writeFileSync, readFileSync, readdirSync } from 'node:fs';
import { join, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const __dirname = fileURLToPath(new URL('.', import.meta.url));
const PKG_PATH = join(__dirname, '..', 'package.json');
const PKG = JSON.parse(readFileSync(PKG_PATH, 'utf8'));
const REPO_URL = PKG.repository.url.replace(/^git\+/, '').replace(/\.git$/, '') + '.git';

// ---- arg parsing -----------------------------------------------------------
const args = process.argv.slice(2);
if (args.includes('--help') || args.includes('-h')) {
  printHelp();
  process.exit(0);
}
if (args.includes('--version') || args.includes('-V')) {
  process.stdout.write(`${PKG.version}\n`);
  process.exit(0);
}
const cloneOnly = args.includes('--clone-only');
const targetArg = args.find((a) => !a.startsWith('-'));
const target = resolve(process.cwd(), targetArg || 'ai-os');

// ---- preconditions ----------------------------------------------------------
const major = parseInt(process.versions.node.split('.')[0], 10);
if (major < 18) {
  process.stderr.write(`✖  Node 18 or higher required. You are running ${process.versions.node}.\n`);
  process.exit(2);
}
if (!/^[A-Za-z0-9._\-/]+$/.test(target)) {
  process.stderr.write(`✖  Invalid target folder: ${target}\n`);
  process.exit(2);
}
if (existsSync(target)) {
  const st = statSync(target);
  if (st.isDirectory()) {
    if (readdirSync(target).length > 0) {
      process.stderr.write(`✖  Target folder already exists and is not empty: ${target}\n`);
      process.stderr.write(`   Re-run with a different name, or remove it first: rm -rf ${target}\n`);
      process.exit(2);
    }
  } else {
    process.stderr.write(`✖  Target exists and is not a directory: ${target}\n`);
    process.exit(2);
  }
}

// ---- clone -------------------------------------------------------------------
let clone;
if (process.env.AIOS_FAKE_GIT) {
  // Test mode: simulate clone by mkdir + writing fixture files
  clone = { status: 0 };
  mkdirSync(join(target, 'setup'), { recursive: true });
  writeFileSync(join(target, 'setup', 'install-mac.sh'), '#!/usr/bin/env bash\necho fixture\n');
  writeFileSync(join(target, 'setup', 'install-windows.ps1'), 'Write-Host "fixture"\n');
  writeFileSync(join(target, 'README.md'), '# fixture\n');
} else {
  const git = process.env.AIOS_GIT_BIN || 'git';
  const probe = spawnSync(git, ['--version'], { stdio: 'pipe' });
  if (probe.status !== 0) {
    process.stderr.write(`✖  git is required but was not found on PATH.\n`);
    process.stderr.write(`   Install git: https://git-scm.com/downloads\n`);
    process.exit(3);
  }
  process.stdout.write(`⤷  Cloning ${REPO_URL} into ${target}…\n`);
  clone = spawnSync(git, ['clone', '--depth', '1', REPO_URL, target], {
    stdio: ['ignore', 'inherit', 'inherit'],
  });
  if (clone.status !== 0) {
    process.stderr.write(`✖  git clone failed (exit ${clone.status}).\n`);
    process.exit(clone.status || 4);
  }
}

if (cloneOnly) {
  process.stdout.write(`\n✅  Cloned into ${target} — skipping install (--clone-only).\n`);
  process.stdout.write(`  Run the installer yourself when ready:\n`);
  process.stdout.write(`    cd ${target} && bash setup/install-mac.sh   # Mac/Linux\n`);
  process.stdout.write(`    cd ${target} && powershell -ExecutionPolicy Bypass -File .\\setup\\install-windows.ps1   # Windows\n\n`);
  process.exit(0);
}

// ---- delegate to the existing platform installer ----------------------------
// install-mac.sh doubles as the Linux installer (see .github/workflows/test-linux.yml);
// install-windows.ps1 is Windows-only. Both scripts own their own confirmation
// prompts, idempotency, and DRY_RUN mode — this wrapper never duplicates that logic.
const isWindows = process.platform === 'win32';
const installer = isWindows ? 'install-windows.ps1' : 'install-mac.sh';
process.stdout.write(`\n⤷  Running setup/${installer}…\n\n`);

let install;
if (process.env.AIOS_FAKE_GIT) {
  install = { status: 0 };
} else if (isWindows) {
  install = spawnSync('powershell', ['-ExecutionPolicy', 'Bypass', '-File', join(target, 'setup', 'install-windows.ps1')], {
    cwd: target,
    stdio: 'inherit',
  });
} else {
  install = spawnSync('bash', [join(target, 'setup', 'install-mac.sh')], {
    cwd: target,
    stdio: 'inherit',
  });
}
if (install.status !== 0) {
  process.stderr.write(`\n✖  ${installer} exited with code ${install.status}.\n`);
  process.stderr.write(`   Re-run it directly from ${target} once fixed:\n`);
  process.stderr.write(`     cd ${target} && bash setup/install-mac.sh\n`);
  process.exit(install.status || 5);
}

// ---- success panel -----------------------------------------------------------
process.stdout.write(`\n✅  AI-OS ready in ${target}\n\n`);
process.stdout.write(`  Next steps:\n`);
process.stdout.write(`    1. cd ${target}\n`);
process.stdout.write(`    2. bash setup/verify.sh   # or verify-windows.ps1 on Windows\n`);
process.stdout.write(`    3. Read CLAUDE.md and context/00_profile.md to see how it's wired.\n\n`);
process.stdout.write(`  Docs:   https://github.com/eddremonts86/ai-os\n`);
process.stdout.write(`  Issues: https://github.com/eddremonts86/ai-os/issues\n\n`);
process.exit(0);

function printHelp() {
  process.stdout.write(`create-ai-os v${PKG.version}\n\n`);
  process.stdout.write(`Usage: create-ai-os [folder] [options]\n\n`);
  process.stdout.write(`Bootstrap AI-OS by cloning the canonical ai-os repo into <folder>\n`);
  process.stdout.write(`(default: ./ai-os), then running the platform installer\n`);
  process.stdout.write(`(setup/install-mac.sh or setup/install-windows.ps1).\n\n`);
  process.stdout.write(`Arguments:\n`);
  process.stdout.write(`  [folder]              Target folder. Relative paths resolve from $PWD.\n`);
  process.stdout.write(`                       Defaults to ./ai-os.\n\n`);
  process.stdout.write(`Options:\n`);
  process.stdout.write(`  --clone-only          Clone only; do not run the installer.\n`);
  process.stdout.write(`  -h, --help            Show this help.\n`);
  process.stdout.write(`  -V, --version         Print version and exit.\n\n`);
  process.stdout.write(`Examples:\n`);
  process.stdout.write(`  $ create-ai-os\n`);
  process.stdout.write(`  $ create-ai-os ~/Projects/ai-os\n`);
  process.stdout.write(`  $ create-ai-os --clone-only /tmp/ai-os-preview\n\n`);
  process.stdout.write(`Repo:   https://github.com/eddremonts86/ai-os\n`);
  process.stdout.write(`npm:    https://www.npmjs.com/package/${PKG.name}\n`);
}
