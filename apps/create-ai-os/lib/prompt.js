// The interactive selector: mode -> (CLIs, components) -> every package, one by one -> summary -> confirm.
// Returns the selection, or null when the person cancels or says no.
import * as p from '@clack/prompts';
import { initialSelection } from './selection.js';

const MODES = [
  { value: 'saved', label: 'My last choices', hint: 'from context/personal/machine/install.yaml' },
  { value: 'recommended', label: 'Recommended', hint: 'every CLI, the core components and packages, no extras' },
  { value: 'full', label: 'Full', hint: 'every CLI, component and package (shell/terminal look stays yours)' },
  { value: 'custom', label: 'Custom', hint: 'choose CLIs and components too' },
];

const cancelled = (v) => p.isCancel(v);

export async function choose(catalog, profile, { hasProfile }) {
  p.intro(' AI-OS installer ');
  const mode = await p.select({
    message: 'How do you want to install?',
    options: hasProfile ? MODES : MODES.slice(1),
    initialValue: hasProfile ? 'saved' : 'recommended',
  });
  if (cancelled(mode)) return null;

  const start = initialSelection(catalog, profile, mode === 'custom' ? (hasProfile ? 'saved' : 'recommended') : mode);
  const sel = { ...start };
  if (mode === 'custom') {
    if (catalog.clis.length) {
      sel.clis = await p.multiselect({ message: 'Which AI CLIs?', options: catalog.clis, initialValues: start.clis, required: false });
      if (cancelled(sel.clis)) return null;
    }
    sel.components = await p.multiselect({ message: 'Which components?', options: catalog.components, initialValues: start.components, required: false });
    if (cancelled(sel.components)) return null;
  }

  sel.packages = await p.groupMultiselect({
    message: 'Packages (space toggles one, on a group title the whole group; Enter confirms)',
    options: catalog.groups,
    initialValues: start.packages,
    maxItems: Math.max(10, (process.stdout.rows || 30) - 12),
    required: false,
  });
  if (cancelled(sel.packages)) return null;
  // what AI-OS runs on stays, checked or not; say so instead of counting it as removed
  const kept = catalog.packages.filter((x) => x.required && !sel.packages.includes(x.value));
  if (kept.length) p.log.info(`Kept (AI-OS needs them): ${kept.map((x) => x.name).join(', ')}`);
  sel.packages = [...sel.packages, ...kept.map((x) => x.value)];

  p.note(summary(catalog, sel), 'Summary');
  const go = await p.confirm({ message: 'Save these choices and install now?' });
  if (cancelled(go) || !go) {
    p.cancel('Nothing installed, nothing saved.');
    return null;
  }
  return sel;
}

export function summary(catalog, sel) {
  const label = (xs, chosen) => xs.filter((x) => chosen.includes(x.value)).map((x) => x.label).join(', ') || 'none';
  const chosen = new Set(sel.packages);
  // one row per tier (Core, Core · Python, Yours, Extras): the part before " · ", Python kept apart
  const tiers = {};
  for (const [g, xs] of Object.entries(catalog.groups)) {
    const tier = g.includes('Python') || g.includes('Node') ? g : g.split(' · ')[0];
    const t = (tiers[tier] ??= [0, 0]);
    t[0] += xs.filter((x) => chosen.has(x.value)).length;
    t[1] += xs.length;
  }
  const rows = Object.entries(tiers).map(([g, [n, t]]) => [g, n, t]);
  const width = Math.max(...rows.map(([g]) => g.length));
  return [
    ...(catalog.clis.length ? [`CLIs        ${label(catalog.clis, sel.clis)}`] : []),
    `Components  ${label(catalog.components, sel.components)}`,
    `Packages    ${chosen.size} of ${catalog.packages.length}`,
    ...rows.map(([g, n, t]) => `  ${g.padEnd(width)}  ${String(n).padStart(2)}/${t}`),
  ].join('\n');
}

export const done = (msg) => p.outro(msg);
