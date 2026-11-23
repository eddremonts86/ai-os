// The selector's data side: the catalog read from the repo files, and the selection <-> install.yaml round trip.
import { test, describe } from 'node:test';
import assert from 'node:assert/strict';
import { mkdirSync, mkdtempSync, readFileSync, rmSync, writeFileSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import YAML from 'yaml';
import { loadCatalog } from '../lib/catalog.js';
import { applySelection, initialSelection, readProfile, writeProfile } from '../lib/selection.js';
import { summary } from '../lib/prompt.js';

const REPO = new URL('../../..', import.meta.url).pathname;

function fixture(t) {
  const root = mkdtempSync(join(tmpdir(), 'aios-catalog-'));
  t.after(() => rmSync(root, { recursive: true, force: true }));
  mkdirSync(join(root, 'dev-env/packages'), { recursive: true });
  mkdirSync(join(root, 'setup'));
  writeFileSync(join(root, 'dev-env/packages/Brewfile'), [
    '# Brewfile header comment',
    'tap "hashicorp/tap"',
    '# ─── Core tools ───',
    'brew "git"',
    'brew "jq"                  # JSON',
    '# ─── Scanners (aios-security-* skills) ───',
    'brew "trivy"',
    'cask "docker-desktop"      # daemon',
    '# ─── Fonts ───',
    '',
  ].join('\n'));
  writeFileSync(join(root, 'dev-env/packages/Brewfile.extras'), '# ─── Infra ───\nbrew "terraform"\ncask "slack"\n');
  writeFileSync(join(root, 'dev-env/packages/pip-packages.txt'), '# header\nmcp[cli]   # SDK\nruff\n\n');
  writeFileSync(join(root, 'dev-env/packages/npm-globals.txt'), '# empty on purpose\n');
  writeFileSync(join(root, 'setup/install-windows.ps1'), '$ChocoPackages = @(\n    "git", "jq",\n    "warp"  # comment "not-a-package"\n) | Where-Object { $true }\n');
  return root;
}

const names = (cat) => Object.fromEntries(Object.entries(cat.groups).map(([g, xs]) => [g, xs.map((x) => x.name)]));

describe('catalog', () => {
  test('one group per Brewfile section, pip apart, extras last, empty sections dropped', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin');
    assert.deepEqual(names(cat), {
      'Core · Core tools': ['git', 'jq'],
      'Core · Scanners': ['trivy', 'docker-desktop'],
      'Core · Python (AI-OS venv)': ['mcp[cli]', 'ruff'],
      'Extras · Infra': ['terraform', 'slack'],
    });
    const jq = cat.packages.find((p) => p.name === 'jq');
    assert.equal(jq.hint, 'required, JSON');
    assert.equal(cat.packages.find((p) => p.name === 'docker-desktop').hint, 'app, daemon');
    assert.equal(cat.packages.find((p) => p.name === 'slack').extra, true);
    assert.equal(new Set(cat.packages.map((p) => p.value)).size, cat.packages.length, 'values are unique');
  });

  test('the personal brew/casks/npm lists come in as their own group', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin', { brew: ['tmux'], casks: ['warp'], npm: ['@scope/pkg'] });
    assert.deepEqual(names(cat)['Yours (install.yaml)'], ['tmux', 'warp', '@scope/pkg']);
  });

  test('Windows: the Chocolatey list, no CLI step, no Mac-only components', (t) => {
    const cat = loadCatalog(fixture(t), 'win32');
    assert.deepEqual(names(cat), { Chocolatey: ['git', 'jq', 'warp'] });
    assert.deepEqual(cat.clis, []);
    assert.ok(!cat.components.some((c) => c.value === 'ui_indexer' || c.value === 'terminal_theme'));
  });

  test('reads the real repo lists without empty groups', () => {
    const cat = loadCatalog(REPO, 'darwin');
    assert.ok(cat.packages.length > 40, `only ${cat.packages.length} packages`);
    assert.ok(cat.groups['Core · Python (AI-OS venv)'].length > 5);
    for (const [g, xs] of Object.entries(cat.groups)) assert.ok(xs.length, g);
    assert.ok(loadCatalog(REPO, 'win32').packages.some((p) => p.name === 'git'));
  });
});

describe('selection', () => {
  test('recommended: every CLI, default-on components, core packages, no extras', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin');
    const sel = initialSelection(cat, {}, 'recommended');
    assert.deepEqual(sel.clis, ['claude', 'codex', 'gemini', 'opencode']);
    assert.deepEqual(sel.components, ['mcp', 'memory', 'ponytail', 'hooks']);
    assert.deepEqual(sel.packages, ['brew:git', 'brew:jq', 'brew:trivy', 'brew:docker-desktop', 'pip:mcp[cli]', 'pip:ruff']);
  });

  test('full: everything', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin');
    const sel = initialSelection(cat, { skip: ['memory'], exclude: ['git'] }, 'full');
    assert.equal(sel.packages.length, cat.packages.length);
    assert.deepEqual(sel.components, ['mcp', 'memory', 'ponytail', 'hooks', 'ui_indexer'], 'the shell/terminal look stays opt-in');
    assert.ok(initialSelection(cat, { fonts: true }, 'full').components.includes('fonts'), 'unless install.yaml already has it');
    assert.ok(!sel.components.includes('floorplan'), 'a third-party plugin stays opt-in');
    assert.ok(initialSelection(cat, { floorplan: true }, 'full').components.includes('floorplan'), 'unless install.yaml already has it');
  });

  test('saved: install.yaml skip/exclude/extras/clis/flags come back as they were written', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin', { brew: ['tmux'] });
    const profile = { clis: ['gemini'], skip: ['opencode', 'hooks'], fonts: true, extras: true, exclude: ['trivy', 'slack'], brew: ['tmux'] };
    const sel = initialSelection(cat, profile, 'saved');
    assert.deepEqual(sel.clis, ['claude', 'gemini']);
    assert.deepEqual(sel.components, ['mcp', 'memory', 'ponytail', 'fonts']);
    assert.deepEqual(sel.packages, ['brew:git', 'brew:jq', 'brew:docker-desktop', 'pip:mcp[cli]', 'pip:ruff', 'mine-brew:tmux', 'brew:terraform']);
    // and writing that selection gives the same keys back
    const back = applySelection(new YAML.Document({}), cat, sel).toJS();
    assert.deepEqual(back.clis, ['gemini']);
    assert.deepEqual(back.skip, ['opencode', 'hooks']);
    assert.deepEqual(back.exclude, ['trivy', 'slack']);
    assert.equal(back.extras, true);
    assert.equal(back.fonts, true);
    assert.equal(back.shell_theme, false);
  });

  test('no extras chosen: extras false and the extras are not listed as excluded', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin');
    const sel = initialSelection(cat, {}, 'recommended');
    sel.packages = sel.packages.filter((v) => v !== 'pip:ruff');
    const out = applySelection(new YAML.Document({}), cat, sel).toJS();
    assert.equal(out.extras, false);
    assert.deepEqual(out.exclude, ['ruff']);
  });

  test('unchecking a personal package removes it from install.yaml, other keys and comments stay', (t) => {
    const root = fixture(t);
    const path = join(root, 'install.yaml');
    writeFileSync(path, '# mine, keep me\nfonts: true\nclis: [codex, hermes]\nbrew: [tmux, htop]\nmcp:\n  enable: [x]\n');
    const { doc, data } = readProfile(path);
    const cat = loadCatalog(root, 'darwin', data);
    const sel = initialSelection(cat, data, 'saved');
    sel.packages = sel.packages.filter((v) => v !== 'mine-brew:htop');
    writeProfile(path, applySelection(doc, cat, sel));
    const text = readFileSync(path, 'utf8');
    assert.match(text, /^# mine, keep me/);
    const out = YAML.parse(text);
    assert.deepEqual(out.brew, ['tmux']);
    assert.deepEqual(out.clis, ['codex', 'hermes'], 'a CLI the selector does not know stays');
    assert.deepEqual(out.mcp, { enable: ['x'] });
  });

  test('a new install.yaml gets a header and the directory is created', (t) => {
    const root = fixture(t);
    const path = join(root, 'context/personal/machine/install.yaml');
    const { doc } = readProfile(path);
    const cat = loadCatalog(root, 'darwin');
    writeProfile(path, applySelection(doc, cat, initialSelection(cat, {}, 'recommended')));
    assert.match(readFileSync(path, 'utf8'), /^# Your install profile/);
  });

  test('a broken install.yaml is an error, not silently replaced', (t) => {
    const path = join(fixture(t), 'install.yaml');
    writeFileSync(path, 'brew: [unclosed\n');
    assert.throws(() => readProfile(path), /install\.yaml/);
  });

  test('a required package stays installed even when unchecked', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin');
    assert.match(cat.packages.find((p) => p.name === 'git').hint, /^required/);
    const sel = initialSelection(cat, {}, 'recommended');
    sel.packages = sel.packages.filter((v) => v !== 'brew:git' && v !== 'brew:trivy');
    assert.deepEqual(applySelection(new YAML.Document({}), cat, sel).toJS().exclude, ['trivy']);
  });

  test('the summary counts by tier', (t) => {
    const cat = loadCatalog(fixture(t), 'darwin');
    const text = summary(cat, initialSelection(cat, {}, 'recommended'));
    assert.match(text, /Packages {4}6 of 8/);
    assert.match(text, /Core +4\/4/);
    assert.match(text, /Extras +0\/2/);
    assert.match(text, /CLIs {8}Claude Code, Codex, Gemini CLI, opencode/);
  });
});
