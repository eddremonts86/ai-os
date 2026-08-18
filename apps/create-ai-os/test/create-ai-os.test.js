import { test } from 'node:test';
import assert from 'node:assert/strict';
import { spawnSync } from 'node:child_process';
import { mkdtempSync, rmSync, existsSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';

const BIN = new URL('../bin/create-ai-os.js', import.meta.url).pathname;

test('--help prints usage and exits 0', () => {
  const r = spawnSync(process.execPath, [BIN, '--help'], { encoding: 'utf8' });
  assert.equal(r.status, 0);
  assert.match(r.stdout, /Usage: create-ai-os/);
});

test('--version prints the package version', () => {
  const r = spawnSync(process.execPath, [BIN, '--version'], { encoding: 'utf8' });
  assert.equal(r.status, 0);
  assert.match(r.stdout.trim(), /^\d+\.\d+\.\d+$/);
});

test('clones (fixture) and runs installer in fake-git mode', () => {
  const dir = mkdtempSync(join(tmpdir(), 'create-ai-os-'));
  const target = join(dir, 'ai-os');
  rmSync(target, { recursive: true, force: true });
  const r = spawnSync(process.execPath, [BIN, target], {
    encoding: 'utf8',
    env: { ...process.env, AIOS_FAKE_GIT: '1' },
  });
  assert.equal(r.status, 0, r.stderr);
  assert.ok(existsSync(join(target, 'setup', 'install-mac.sh')));
  rmSync(dir, { recursive: true, force: true });
});

test('rejects a non-empty target folder', () => {
  const dir = mkdtempSync(join(tmpdir(), 'create-ai-os-'));
  const target = join(dir, 'ai-os');
  const r = spawnSync(process.execPath, [BIN, target], {
    encoding: 'utf8',
    env: { ...process.env, AIOS_FAKE_GIT: '1' },
  });
  assert.equal(r.status, 0);
  const r2 = spawnSync(process.execPath, [BIN, target], {
    encoding: 'utf8',
    env: { ...process.env, AIOS_FAKE_GIT: '1' },
  });
  assert.equal(r2.status, 2);
  assert.match(r2.stderr, /already exists and is not empty/);
  rmSync(dir, { recursive: true, force: true });
});
