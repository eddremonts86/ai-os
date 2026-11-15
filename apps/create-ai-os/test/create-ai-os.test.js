import { test, describe } from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { chmodSync, existsSync, mkdtempSync, mkdirSync, readFileSync, realpathSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const BIN = new URL('../bin/create-ai-os.js', import.meta.url).pathname;
const PKG = JSON.parse(readFileSync(new URL('../package.json', import.meta.url), 'utf8'));
const POSIX = process.platform !== 'win32';

// ---- helpers ----------------------------------------------------------------
function sandbox(t) {
  const dir = mkdtempSync(join(tmpdir(), 'create-ai-os-'));
  t.after(() => rmSync(dir, { recursive: true, force: true }));
  return dir;
}

function run(args, { cwd, env = {}, nodeArgs = [] } = {}) {
  return spawnSync(process.execPath, [...nodeArgs, BIN, ...args], {
    encoding: 'utf8',
    cwd,
    env: { ...process.env, ...env },
  });
}

const fake = { AIOS_FAKE_GIT: '1' };
const esc = (s) => s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');

/**
 * A stand-in for `git`: logs its arguments, answers `--version`, and on `clone`
 * creates <target>/setup/install-mac.sh with the given body. No network, no real installer.
 */
function fakeGit(dir, { cloneStatus = 0, installer = 'exit 0', name = 'fake-git' } = {}) {
  const log = join(dir, 'git.log');
  const bin = join(dir, name);
  writeFileSync(
    bin,
    [
      '#!/bin/sh',
      `echo "$@" >> '${log}'`,
      'if [ "$1" = "--version" ]; then exit 0; fi',
      'if [ "$1" != "clone" ]; then echo "unexpected git call: $*" >&2; exit 64; fi',
      'echo "GIT-STDOUT"; echo "GIT-STDERR" >&2',
      'for last; do :; done',
      `if [ ${cloneStatus} -ne 0 ]; then exit ${cloneStatus}; fi`,
      'mkdir -p "$last/setup"',
      `printf '%s\\n' '#!/usr/bin/env bash' '${installer}' > "$last/setup/install-mac.sh"`,
      'exit 0',
      '',
    ].join('\n'),
  );
  chmodSync(bin, 0o755);
  return { bin, calls: () => (existsSync(log) ? readFileSync(log, 'utf8').trim().split('\n') : []) };
}

// ---- metadata --------------------------------------------------------------------
describe('--help / --version', () => {
  for (const flag of ['--help', '-h']) {
    test(`${flag} prints usage, every option and exits 0`, () => {
      const r = run([flag]);
      assert.equal(r.status, 0);
      assert.match(r.stdout, /Usage: create-ai-os \[folder\] \[options\]/);
      for (const opt of ['--clone-only', '--here', '--full', '-y, --yes', '--dry-run']) assert.ok(r.stdout.includes(opt), opt);
      assert.match(r.stdout, /-h, --help/);
      assert.match(r.stdout, /-V, --version/);
      assert.match(r.stdout, new RegExp(`create-ai-os v${PKG.version.replaceAll('.', '\\.')}`));
      assert.equal(r.stderr, '');
    });
  }

  for (const flag of ['--version', '-V']) {
    test(`${flag} prints exactly the package version`, () => {
      const r = run([flag]);
      assert.equal(r.status, 0);
      assert.equal(r.stdout, `${PKG.version}\n`);
    });
  }

  test('help wins over a folder argument', (t) => {
    const dir = sandbox(t);
    const r = run([join(dir, 'ai-os'), '--help'], { env: fake });
    assert.equal(r.status, 0);
    assert.match(r.stdout, /Usage:/);
    assert.equal(existsSync(join(dir, 'ai-os')), false);
  });
});

// ---- target folder rules -----------------------------------------------------------
describe('target folder', () => {
  test('clones (fixture) and runs the installer step in fake-git mode', (t) => {
    const dir = sandbox(t);
    const target = join(dir, 'ai-os');
    const r = run([target], { env: fake });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(target, 'setup', 'install-mac.sh')));
    assert.ok(existsSync(join(target, 'setup', 'install-windows.ps1')));
    assert.ok(existsSync(join(target, 'README.md')));
    assert.match(r.stdout, /AI-OS ready in /);
    assert.match(r.stdout, new RegExp(`ready in ${target.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')}`));
    assert.doesNotMatch(r.stdout, /^fixture$/m, 'fake-git mode must never execute the fixture installer');
  });

  test('defaults to ./ai-os in the current directory', (t) => {
    const dir = sandbox(t);
    const r = run([], { cwd: dir, env: fake });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(dir, 'ai-os', 'README.md')));
  });

  test('resolves a relative folder against the current directory', (t) => {
    const dir = sandbox(t);
    const r = run(['nested/project'], { cwd: dir, env: fake });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(dir, 'nested', 'project', 'README.md')));
  });

  test('takes the first argument that is not a flag as the folder', (t) => {
    const dir = sandbox(t);
    const r = run(['--clone-only', 'chosen'], { cwd: dir, env: fake });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(dir, 'chosen', 'README.md')));
    assert.equal(existsSync(join(dir, 'ai-os')), false);
  });

  test('accepts an existing empty folder', (t) => {
    const dir = sandbox(t);
    const target = join(dir, 'empty');
    mkdirSync(target);
    const r = run([target], { env: fake });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(target, 'README.md')));
  });

  test('rejects a non-empty folder without touching it', (t) => {
    const dir = sandbox(t);
    const target = join(dir, 'busy');
    mkdirSync(target);
    writeFileSync(join(target, 'keep.txt'), 'mine');
    const r = run([target], { env: fake });
    assert.equal(r.status, 2);
    assert.match(r.stderr, /Target folder already exists and is not empty/);
    assert.match(r.stderr, /rm -rf /);
    assert.equal(readFileSync(join(target, 'keep.txt'), 'utf8'), 'mine');
    assert.equal(existsSync(join(target, 'README.md')), false);
  });

  test('rejects a second run into the folder the first run filled', (t) => {
    const dir = sandbox(t);
    const target = join(dir, 'ai-os');
    assert.equal(run([target], { env: fake }).status, 0);
    const again = run([target], { env: fake });
    assert.equal(again.status, 2);
    assert.match(again.stderr, /already exists and is not empty/);
  });

  test('rejects a target that is a file', (t) => {
    const dir = sandbox(t);
    const target = join(dir, 'file.txt');
    writeFileSync(target, 'x');
    const r = run([target], { env: fake });
    assert.equal(r.status, 2);
    assert.match(r.stderr, /Target exists and is not a directory/);
    assert.equal(readFileSync(target, 'utf8'), 'x');
  });

  test('rejects characters outside letters, digits and . _ - /', { skip: !POSIX }, (t) => {
    const dir = sandbox(t);
    for (const bad of ['with space', 'semi;colon', 'dollar$sign', 'quote"mark']) {
      const r = run([bad], { cwd: dir, env: fake });
      assert.equal(r.status, 2, bad);
      assert.match(r.stderr, /Invalid target folder/, bad);
    }
    assert.equal(existsSync(join(dir, 'with space')), false);
  });

  test('accepts dots, dashes and underscores in the folder name', (t) => {
    const dir = sandbox(t);
    const r = run(['my_ai-os.v1'], { cwd: dir, env: fake });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(dir, 'my_ai-os.v1', 'README.md')));
  });
});

// ---- Node version guard ---------------------------------------------------------------
describe('Node version guard', () => {
  const asNode = (version) => ['--import', `data:text/javascript,Object.defineProperty(process.versions,'node',{value:'${version}',configurable:true})`];

  test('the declared engine floor is the floor the script enforces', () => {
    assert.equal(PKG.engines.node, '>=18');
  });

  for (const version of ['16.20.0', '17.9.1']) {
    test(`refuses Node ${version} with exit 2 and creates nothing`, (t) => {
      const dir = sandbox(t);
      const r = run(['out'], { cwd: dir, env: fake, nodeArgs: asNode(version) });
      assert.equal(r.status, 2);
      assert.match(r.stderr, new RegExp(`Node 18 or higher required. You are running ${version.replaceAll('.', '\\.')}`));
      assert.equal(existsSync(join(dir, 'out')), false);
    });
  }

  for (const version of ['18.0.0', '22.5.0']) {
    test(`allows Node ${version}`, (t) => {
      const dir = sandbox(t);
      const r = run(['out'], { cwd: dir, env: fake, nodeArgs: asNode(version) });
      assert.equal(r.status, 0, r.stderr);
    });
  }
});

// ---- --clone-only and installer hand-off ----------------------------------------------
describe('clone and install', { skip: !POSIX && 'needs a POSIX shell for the git/installer doubles' }, () => {
  test('clones the canonical repository, shallow, into the target', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir);
    const target = join(dir, 'ai-os');
    const r = run([target], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 0, r.stderr);
    assert.deepEqual(git.calls(), ['--version', `clone --depth 1 https://github.com/eddremonts86/ai-os.git ${target}`]);
    assert.match(r.stdout, /Cloning https:\/\/github\.com\/eddremonts86\/ai-os\.git into /);
  });

  test('runs the installer from inside the cloned repo and prints the next steps', (t) => {
    const dir = sandbox(t);
    const marker = join(dir, 'installer-ran');
    const git = fakeGit(dir, { installer: `pwd > '${marker}'` });
    const target = join(dir, 'ai-os');
    const r = run([target], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(marker), 'installer did not run');
    assert.ok(readFileSync(marker, 'utf8').trim().endsWith('ai-os'), 'installer ran outside the clone');
    assert.match(r.stdout, /Running setup\/install-mac\.sh/);
    assert.match(r.stdout, /AI-OS ready in /);
    assert.match(r.stdout, /bash setup\/verify\.sh/);
    assert.match(r.stdout, /github\.com\/eddremonts86\/ai-os\/issues/);
    assert.match(r.stdout, /^ {2}Next steps:$/m);
    assert.match(r.stdout, new RegExp(`^ {4}1\\. cd ${esc(target)}$`, 'm'));
    assert.match(r.stdout, /^ {4}2\. bash setup\/verify\.sh/m);
    assert.match(r.stdout, /^ {4}3\. Read CLAUDE\.md, then describe yourself in context\/personal\//m);
    assert.match(r.stdout, /^ {2}Docs: {3}https:\/\/github\.com\/eddremonts86\/ai-os$/m);
  });

  test('shows the git and installer output live instead of swallowing it', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir, { installer: 'echo INSTALLER-STDOUT; echo INSTALLER-STDERR >&2' });
    const r = run([join(dir, 'ai-os')], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 0, r.stderr);
    assert.match(r.stdout, /GIT-STDOUT/);
    assert.match(r.stderr, /GIT-STDERR/);
    assert.match(r.stdout, /INSTALLER-STDOUT/);
    assert.match(r.stderr, /INSTALLER-STDERR/);
  });

  test('uses git from PATH when AIOS_GIT_BIN is not set', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir, { name: 'git' });
    const target = join(dir, 'ai-os');
    const r = run([target, '--clone-only'], { env: { AIOS_GIT_BIN: '', PATH: `${dir}:/usr/bin:/bin` } });
    assert.equal(r.status, 0, r.stderr);
    assert.deepEqual(git.calls(), ['--version', `clone --depth 1 https://github.com/eddremonts86/ai-os.git ${target}`]);
  });

  test('--clone-only clones but never runs the installer', (t) => {
    const dir = sandbox(t);
    const marker = join(dir, 'installer-ran');
    const git = fakeGit(dir, { installer: `touch '${marker}'` });
    const target = join(dir, 'ai-os');
    const r = run([target, '--clone-only'], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 0, r.stderr);
    assert.ok(existsSync(join(target, 'setup', 'install-mac.sh')));
    assert.equal(existsSync(marker), false);
    assert.match(r.stdout, /skipping install \(--clone-only\)/);
    assert.match(r.stdout, /Run the installer yourself when ready:/);
    assert.match(r.stdout, new RegExp(`cd ${esc(target)} && bash setup/install-mac\\.sh {3}# Mac/Linux`));
    assert.match(r.stdout, new RegExp(`cd ${esc(target)} && powershell -ExecutionPolicy Bypass -File \\.\\\\setup\\\\install-windows\\.ps1 {3}# Windows`));
    assert.doesNotMatch(r.stdout, /Running setup\//);
  });

  test('propagates the installer exit code and says how to re-run it', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir, { installer: 'exit 7' });
    const target = join(dir, 'ai-os');
    const r = run([target], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 7);
    assert.match(r.stderr, /install-mac\.sh exited with code 7/);
    assert.match(r.stderr, /Re-run it directly from .* once fixed:/);
    assert.match(r.stderr, new RegExp(`cd ${esc(target)} && bash setup/install-mac\\.sh`));
    assert.doesNotMatch(r.stdout, /AI-OS ready/);
  });

  test('propagates a failed clone and does not try to install', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir, { cloneStatus: 9 });
    const r = run([join(dir, 'ai-os')], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 9);
    assert.match(r.stderr, /git clone failed \(exit 9\)/);
    assert.doesNotMatch(r.stdout, /Running setup\//);
  });

  test('explains how to get git when it is missing', (t) => {
    const dir = sandbox(t);
    const r = run([join(dir, 'ai-os')], { env: { AIOS_GIT_BIN: join(dir, 'no-such-git') } });
    assert.equal(r.status, 3);
    assert.match(r.stderr, /git is required but was not found on PATH/);
    assert.match(r.stderr, /git-scm\.com/);
    assert.equal(existsSync(join(dir, 'ai-os')), false);
  });

  test('fake-git mode never calls git at all', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir);
    const r = run([join(dir, 'ai-os')], { env: { ...fake, AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 0, r.stderr);
    assert.deepEqual(git.calls(), []);
  });
});

// ---- Windows hand-off (simulated: platform override + a stand-in powershell on PATH) ---------
describe('Windows installer', { skip: !POSIX && 'needs a POSIX shell for the powershell double' }, () => {
  const asWindows = ['--import', "data:text/javascript,Object.defineProperty(process,'platform',{value:'win32'})"];

  function fakePowershell(dir, status = 0) {
    const log = join(dir, 'ps.log');
    const bin = join(dir, 'powershell');
    writeFileSync(bin, ['#!/bin/sh', `echo "cwd=$(pwd)" >> '${log}'`, `echo "$@" >> '${log}'`, 'echo PS-STDOUT', `exit ${status}`, ''].join('\n'));
    chmodSync(bin, 0o755);
    return { calls: () => (existsSync(log) ? readFileSync(log, 'utf8').trim().split('\n') : []) };
  }

  test('runs install-windows.ps1 through PowerShell from inside the repo', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir);
    const ps = fakePowershell(dir);
    const target = join(dir, 'ai-os');
    const r = run([target], { env: { AIOS_GIT_BIN: git.bin, PATH: `${dir}:/usr/bin:/bin` }, nodeArgs: asWindows });
    assert.equal(r.status, 0, r.stderr);
    const [cwd, args] = ps.calls();
    assert.ok(cwd.endsWith('/ai-os'), cwd);
    assert.equal(args, `-ExecutionPolicy Bypass -File ${join(target, 'setup', 'install-windows.ps1')}`);
    assert.match(r.stdout, /Running setup\/install-windows\.ps1/);
    assert.match(r.stdout, /PS-STDOUT/);
    assert.match(r.stdout, /AI-OS ready in /);
  });

  test('propagates a PowerShell failure and names the Windows installer', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir);
    fakePowershell(dir, 5);
    const r = run([join(dir, 'ai-os')], { env: { AIOS_GIT_BIN: git.bin, PATH: `${dir}:/usr/bin:/bin` }, nodeArgs: asWindows });
    assert.equal(r.status, 5);
    assert.match(r.stderr, /install-windows\.ps1 exited with code 5/);
    assert.doesNotMatch(r.stdout, /AI-OS ready/);
  });
});

// ---- --full / --yes / --dry-run / --here --------------------------------------------------
describe('install options', { skip: !POSIX && 'needs a POSIX shell for the installer double' }, () => {
  // The installer double records the variables create-ai-os hands it.
  const report = (out) => `echo "FULL=\${AIOS_FULL:-} YES=\${ASSUME_YES:-} DRY=\${DRY_RUN:-}" > '${out}'`;

  for (const [flags, expected] of [
    [['--full'], 'FULL=1 YES=1 DRY='],
    [['--yes'], 'FULL= YES=1 DRY='],
    [['-y', '--dry-run'], 'FULL= YES=1 DRY=1'],
    [[], 'FULL= YES= DRY='],
  ]) {
    test(`${flags.join(' ') || 'no flags (no terminal)'} -> ${expected}`, (t) => {
      const dir = sandbox(t);
      const out = join(dir, 'env');
      const git = fakeGit(dir, { installer: report(out) });
      const r = run([join(dir, 'ai-os'), ...flags], { env: { AIOS_GIT_BIN: git.bin, AIOS_FULL: '', ASSUME_YES: '', DRY_RUN: '' } });
      assert.equal(r.status, 0, r.stderr);
      assert.equal(readFileSync(out, 'utf8').trim(), expected);
      if (flags.includes('--full')) assert.match(r.stdout, /Running setup\/install-mac\.sh --full/);
    });
  }

  test('an unknown option is refused before anything is cloned', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir);
    const r = run([join(dir, 'ai-os'), '--ful'], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 2);
    assert.match(r.stderr, /Unknown option: --ful/);
    assert.deepEqual(git.calls(), []);
  });

  test('--here runs the installer of an existing checkout without cloning', (t) => {
    const dir = sandbox(t);
    const git = fakeGit(dir);
    const repo = join(dir, 'My Projects', 'ai-os é'); // an existing checkout may live anywhere
    mkdirSync(join(repo, 'setup'), { recursive: true });
    writeFileSync(join(repo, 'CLAUDE.md'), '# x\n');
    writeFileSync(join(repo, 'setup', 'install-mac.sh'), `pwd > '${join(dir, 'ran')}'\n`);
    const r = run(['--here', repo, '--yes'], { env: { AIOS_GIT_BIN: git.bin } });
    assert.equal(r.status, 0, r.stderr);
    assert.deepEqual(git.calls(), [], 'git was called');
    assert.equal(realpathSync(readFileSync(join(dir, 'ran'), 'utf8').trim()), realpathSync(repo));
  });

  test('--here refuses a folder that is not an ai-os checkout', (t) => {
    const dir = sandbox(t);
    const r = run(['--here', dir]);
    assert.equal(r.status, 2);
    assert.match(r.stderr, /not an ai-os checkout/);
  });
});

// ---- the published package ---------------------------------------------------------------
describe('package contract', () => {
  test('bin entry exists, is a node script and is the file the tests run', () => {
    const bin = new URL(`../${PKG.bin['create-ai-os']}`, import.meta.url);
    assert.equal(bin.pathname, BIN);
    assert.match(readFileSync(bin, 'utf8'), /^#!\/usr\/bin\/env node\n/);
  });

  test('ships only bin, lib, README and LICENSE, and all of them exist', () => {
    assert.deepEqual(PKG.files, ['bin/', 'lib/', 'README.md', 'LICENSE']);
    for (const f of ['bin', 'lib', 'README.md', 'LICENSE']) {
      assert.ok(existsSync(new URL(`../${f}`, import.meta.url)), f);
    }
  });
});
