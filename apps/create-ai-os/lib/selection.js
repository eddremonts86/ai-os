// Selection <-> install.yaml. A selection is { clis: [], components: [], packages: [] } of catalog values.
// install.yaml keeps it as: clis: (opt-in npm CLIs), skip: (default-on parts turned off), the opt-in flags,
// extras:, exclude: (unchecked shared packages, by name) and the person's own brew:/casks:/npm: lists.
import { existsSync, mkdirSync, readFileSync, writeFileSync } from 'node:fs';
import { dirname } from 'node:path';
import YAML from 'yaml';

const values = (xs) => xs.map((x) => x.value);
const on = (item, profile) => {
  if (item.kind === 'skip') return !(profile.skip ?? []).includes(item.value);
  if (item.kind === 'clis') return profile.clis ? profile.clis.includes(item.value) : item.on;
  return profile[item.value] === true;
};

export function initialSelection(catalog, profile = {}, mode = 'saved') {
  // full: everything but the look of your shell and terminal (it replaces your own files) and Floorplan (a
  // third-party plugin with its own agent): those stay opt-in
  const look = new Set(['shell_theme', 'fonts', 'terminal_theme', 'floorplan']);
  if (mode === 'full') return { clis: values(catalog.clis), components: values(catalog.components.filter((c) => !look.has(c.value) || on(c, profile))), packages: values(catalog.packages) };
  const pick = (xs) => values(xs.filter((x) => (mode === 'recommended' ? x.on : on(x, profile))));
  const exclude = new Set(mode === 'recommended' ? [] : (profile.exclude ?? []).map(String));
  const extras = mode !== 'recommended' && profile.extras === true;
  return {
    clis: pick(catalog.clis),
    components: pick(catalog.components),
    packages: values(catalog.packages.filter((p) => p.required || p.mine || (p.extra ? extras : true) && !exclude.has(p.name))),
  };
}

export function readProfile(path) {
  if (!existsSync(path)) return { doc: new YAML.Document({}), data: {} };
  const doc = YAML.parseDocument(readFileSync(path, 'utf8'));
  if (doc.errors.length) throw new Error(`${path}: ${doc.errors[0].message}`);
  const data = doc.toJS() ?? {};
  if (typeof data !== 'object' || Array.isArray(data)) throw new Error(`${path} must be a YAML mapping`);
  return { doc, data };
}

const flow = (doc, arr) => {
  const node = doc.createNode(arr);
  node.flow = true;
  return node;
};

// Write the selection into the install.yaml document, keeping every other key and its comments.
export function applySelection(doc, catalog, sel) {
  const chosen = new Set([...sel.clis, ...sel.components, ...sel.packages, ...catalog.packages.filter((p) => p.required).map((p) => p.value)]);
  const parts = [...catalog.clis, ...catalog.components];
  if (doc.contents == null) doc.contents = doc.createNode({});

  const known = new Set(catalog.clis.filter((c) => c.kind === 'clis').map((c) => c.value));
  const otherClis = (doc.get('clis')?.toJSON?.() ?? []).filter((c) => !known.has(c));
  if (catalog.clis.length) doc.set('clis', flow(doc, [...catalog.clis.filter((c) => c.kind === 'clis' && chosen.has(c.value)).map((c) => c.value), ...otherClis]));
  doc.set('skip', flow(doc, parts.filter((p) => p.kind === 'skip' && !chosen.has(p.value)).map((p) => p.value)));
  for (const p of parts.filter((x) => x.kind === 'flag')) doc.set(p.value, chosen.has(p.value));

  const shared = catalog.packages.filter((p) => !p.mine);
  const extras = shared.some((p) => p.extra && chosen.has(p.value));
  if (shared.some((p) => p.extra)) doc.set('extras', extras);
  // ponytail: exclude: is by name, so a name in two lists (brew and pip) goes from both; none does today.
  const exclude = shared.filter((p) => !chosen.has(p.value) && (!p.extra || extras)).map((p) => p.name);
  doc.set('exclude', flow(doc, [...new Set(exclude)]));

  for (const key of ['brew', 'casks', 'npm']) {
    const mine = catalog.packages.filter((p) => p.mine === key);
    const keep = mine.filter((p) => chosen.has(p.value)).map((p) => p.name);
    if (mine.length) doc.set(key, key === 'npm' ? keep : flow(doc, keep)); // npm names are long: one per line
  }
  return doc;
}

export function writeProfile(path, doc) {
  mkdirSync(dirname(path), { recursive: true });
  if (!existsSync(path)) doc.commentBefore = ' Your install profile: what AI-OS installs on THIS machine. Git-ignored.\n Written by create-ai-os / `ai-os install`; safe to edit by hand.';
  writeFileSync(path, doc.toString({ lineWidth: 0, flowCollectionPadding: false }));
}
