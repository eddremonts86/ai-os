// What the AI-OS installers can install, read from the repo itself so the selector never drifts from them:
// Brewfile / Brewfile.extras (one group per "# ─── Section ───" header), pip-packages.txt, npm-globals.txt and,
// on Windows, the $ChocoPackages list in install-windows.ps1.
import { existsSync, readFileSync } from 'node:fs';
import { join } from 'node:path';

// key: how install.yaml records it. 'skip' parts are on unless listed under skip:; 'clis' are opt-in npm CLIs
// listed under clis:; 'flag' parts are opt-ins stored as `key: true`.
export const CLIS = [
  { value: 'claude', label: 'Claude Code', hint: 'native build', kind: 'skip', on: true },
  { value: 'codex', label: 'Codex', kind: 'clis', on: true },
  { value: 'gemini', label: 'Gemini CLI', kind: 'clis', on: true },
  { value: 'opencode', label: 'opencode', hint: 'local model router', kind: 'skip', on: true },
];

export const COMPONENTS = [
  { value: 'mcp', label: 'MCP servers', hint: 'config for every CLI', kind: 'skip', on: true },
  { value: 'memory', label: 'Memory stack', hint: 'FalkorDB, Graphiti, Ollama, code indexers', kind: 'skip', on: true },
  { value: 'ponytail', label: 'Ponytail ruleset', kind: 'skip', on: true },
  { value: 'hooks', label: 'Session hooks', hint: 'memory recall + strategic-compact', kind: 'skip', on: true },
  { value: 'ui_indexer', label: 'ui-indexador', hint: 'shadcn registry index', kind: 'flag', on: false, mac: true },
  { value: 'floorplan', label: 'Floorplan', hint: 'codebase map plugin, pinned to a reviewed commit', kind: 'flag', on: false },
  { value: 'shell_theme', label: 'Shell theme', hint: 'replaces your shell profile, yours kept as .pre-aios.bak', kind: 'flag', on: false },
  { value: 'fonts', label: 'Nerd Font', kind: 'flag', on: false },
  { value: 'terminal_theme', label: 'Terminal theme', hint: 'Terminal.app + Warp', kind: 'flag', on: false, mac: true },
];

// What AI-OS itself runs on (installer prerequisites, the venv's YAML/TOML readers): always installed, so the
// selector shows them but never writes them to exclude:.
export const REQUIRED = new Set(['git', 'gh', 'yq', 'jq', 'node', 'pnpm', 'uv', 'python@3.11', 'pyyaml', 'tomlkit',
  'nodejs', 'python311']);

const lines = (root, rel) => (existsSync(join(root, rel)) ? readFileSync(join(root, rel), 'utf8').split(/\r?\n/) : []);

// A package option. value is unique across groups; name is what install.yaml exclude: lists.
const pkg = (source, name, hint, extra = false) => {
  const required = !source.startsWith('mine') && REQUIRED.has(name);
  return { value: `${source}:${name}`, label: name, hint: [required && 'required', hint].filter(Boolean).join(', ') || undefined, name, source, extra, required };
};

function brewfileGroups(root, file, tag, extra) {
  const groups = {};
  let section = 'Other';
  for (const l of lines(root, `dev-env/packages/${file}`)) {
    const h = l.match(/^# ─── (.+?)(?: \(.*)? ───/);
    if (h) section = h[1].trim();
    const m = l.match(/^(brew|cask) "([^"]+)"\s*(?:#\s*(.*))?/);
    if (!m) continue;
    const hint = m[1] === 'cask' ? ['app', m[3]].filter(Boolean).join(', ') : m[3];
    (groups[`${tag} · ${section}`] ??= []).push(pkg('brew', m[2], hint, extra));
  }
  return groups;
}

// pip-packages.txt / npm-globals.txt: one entry per line, `# comment` after it.
function listGroup(root, rel, source) {
  return lines(root, rel)
    .map((l) => l.match(/^([^\s#]+)\s*(?:#\s*(.*))?$/))
    .filter(Boolean)
    .map((m) => pkg(source, m[1], m[2]));
}

function chocoGroup(root) {
  const text = lines(root, 'setup/install-windows.ps1').join('\n');
  const body = text.match(/\$ChocoPackages = @\(([\s\S]*?)\n\)/)?.[1] ?? '';
  return [...body.replace(/#.*$/gm, '').matchAll(/"([^"]+)"/g)].map((m) => pkg('choco', m[1]));
}

// The person's own packages from install.yaml (brew:, casks:, npm:); unchecking one removes it from there.
export function personalGroup(profile) {
  const out = [];
  for (const [key, hint] of [['brew', 'brew'], ['casks', 'app'], ['npm', 'npm']]) {
    for (const name of profile?.[key] ?? []) out.push({ ...pkg(`mine-${key}`, String(name), hint), mine: key });
  }
  return out;
}

export function loadCatalog(root, platform = process.platform, profile = {}) {
  const win = platform === 'win32';
  const groups = {};
  if (win) {
    groups['Chocolatey'] = chocoGroup(root);
  } else {
    Object.assign(groups, brewfileGroups(root, 'Brewfile', 'Core', false));
    const node = listGroup(root, 'dev-env/packages/npm-globals.txt', 'npm');
    if (node.length) groups['Core · Node globals (pnpm)'] = node;
    groups['Core · Python (AI-OS venv)'] = listGroup(root, 'dev-env/packages/pip-packages.txt', 'pip');
  }
  const mine = personalGroup(profile);
  if (mine.length && !win) groups['Yours (install.yaml)'] = mine;
  if (!win) Object.assign(groups, brewfileGroups(root, 'Brewfile.extras', 'Extras', true));
  for (const k of Object.keys(groups)) if (!groups[k].length) delete groups[k];
  return {
    platform,
    // Windows' installer has no per-CLI step yet: Claude, Codex and Gemini come from their own installers there.
    clis: win ? [] : CLIS,
    components: COMPONENTS.filter((c) => !(win && c.mac)),
    groups,
    packages: Object.values(groups).flat(),
  };
}
