/**
 * Read and write plan documents, tolerating both shapes.
 *
 * Two shapes exist during the migration:
 *   - schema:  YAML frontmatter + English headings.
 *   - legacy:  metadata as bold labels inside prose, Spanish headings.
 *
 * Everything here reads both and writes only the first, so `ai-os plans format` is
 * safe to run per-plan and re-run on an already-formatted plan.
 */

import { readFileSync, writeFileSync, readdirSync, existsSync, statSync } from 'node:fs';
import { join, dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const HERE = dirname(fileURLToPath(import.meta.url));
export const AI_OS_ROOT = resolve(HERE, '..', '..', '..');
export const PROJECTS_DIR = join(AI_OS_ROOT, 'apps', 'data', 'projects');
export const SCHEMA_PATH = join(PROJECTS_DIR, '_schema.json');

export const DOC_NAMES = ['SPEC.md', 'PRODUCT.md', 'PLAN.md', 'DESIGN.md', 'TASKS.md'];

export function loadSchema() {
  return JSON.parse(readFileSync(SCHEMA_PATH, 'utf8'));
}

export function listPlanDirs() {
  if (!existsSync(PROJECTS_DIR)) return [];
  return readdirSync(PROJECTS_DIR)
    .filter((n) => /^\d{3,}-/.test(n))
    .map((n) => join(PROJECTS_DIR, n))
    .filter((p) => statSync(p).isDirectory() && existsSync(join(p, 'SPEC.md')))
    // Numeric, not lexicographic: once ids pass 999 a plain sort puts 1000 before 999.
    .sort((a, b) => parseInt(a.split('/').pop(), 10) - parseInt(b.split('/').pop(), 10));
}

export function planIdSlug(dirPath) {
  const m = dirPath.split('/').pop().match(/^(\d{3,})-(.+)$/);
  return m ? { id: m[1], slug: m[2] } : null;
}

// ---------- Frontmatter ----------

/**
 * Frontmatter reader/writer with a deliberately narrow interpreter.
 *
 * `raw` is always the verbatim block, `body` is always the rest. `data` is the
 * INTERPRETED map, and it is null whenever the block uses YAML beyond the shallow
 * subset this tool writes: scalars, inline string arrays, and one level of nesting
 * at two-space indent.
 *
 * That distinction is load-bearing. DESIGN.md already ships a real design-token
 * block — `source: "Linear"`, nested `typography.heading.fontFamily`, one-space
 * indent — authored long before this schema existed. This tool must preserve it
 * byte-for-byte and must never pretend to understand it. An earlier version threw on
 * anything it could not parse, which surfaced the DESIGN.md case immediately but
 * would also have made `check` unusable on the corpus it exists to measure.
 *
 * So: no dependency, no guessing, and no crash. A document whose frontmatter cannot
 * be interpreted reports `data: null` and is skipped by the field-level rules
 * instead of failing the run.
 */
export function parseFrontmatter(text) {
  if (!text.startsWith('---\n')) return { raw: null, data: null, body: text };
  const end = text.indexOf('\n---', 4);
  if (end === -1) return { raw: null, data: null, body: text };
  const raw = text.slice(4, end);
  const body = text.slice(end + 4).replace(/^\n+/, '');
  return { raw, data: interpret(raw), body };
}

/** Returns the shallow map, or null when the block is outside the subset. */
function interpret(raw) {
  const data = {};
  let currentKey = null;
  for (const line of raw.split('\n')) {
    if (!line.trim() || line.trim().startsWith('#')) continue;
    const listItem = line.match(/^ {2}- (.*)$/);
    const nested = line.match(/^ {2}([A-Za-z][\w-]*):\s*(.*)$/);
    const top = line.match(/^([A-Za-z][\w-]*):\s*(.*)$/);

    if (listItem && currentKey) {
      if (!Array.isArray(data[currentKey])) data[currentKey] = [];
      data[currentKey].push(parseScalar(listItem[1]));
    } else if (nested && currentKey && isPlainObject(data[currentKey])) {
      // A nested key whose value is itself empty means a third level — outside the
      // subset, so refuse the whole block rather than silently dropping depth.
      if (nested[2].trim() === '') return null;
      data[currentKey][nested[1]] = parseScalar(nested[2]);
    } else if (top) {
      currentKey = top[1];
      const v = top[2];
      if (v === '') data[currentKey] = {};
      else if (v.startsWith('[')) data[currentKey] = parseInlineArray(v);
      else data[currentKey] = parseScalar(v);
    } else {
      return null;
    }
  }
  return data;
}

function isPlainObject(v) {
  return !!v && typeof v === 'object' && !Array.isArray(v);
}

function parseScalar(v) {
  const s = v.trim().replace(/\s+#.*$/, '');
  if (s === '' ) return '';
  if (s === 'true') return true;
  if (s === 'false') return false;
  if (s === 'null' || s === '~') return null;
  if (/^-?\d+$/.test(s)) return parseInt(s, 10);
  if (/^-?\d*\.\d+$/.test(s)) return parseFloat(s);
  if ((s.startsWith('"') && s.endsWith('"')) || (s.startsWith("'") && s.endsWith("'"))) {
    return s.slice(1, -1).replace(/\\"/g, '"');
  }
  return s;
}

function parseInlineArray(v) {
  const inner = v.trim().slice(1, -1).trim();
  if (!inner) return [];
  return inner.split(',').map((x) => parseScalar(x));
}

function needsQuote(s) {
  return /^[\s]|[\s]$|[:#\[\]{}&*!|>'"%@`,]|^$/.test(s) || /^(true|false|null|~|-?\d)/.test(s);
}

function emitScalar(v) {
  if (v === null || v === undefined) return 'null';
  if (typeof v === 'number' || typeof v === 'boolean') return String(v);
  const s = String(v);
  return needsQuote(s) ? `"${s.replace(/"/g, '\\"')}"` : s;
}

/** Emit frontmatter in schema field order so diffs stay readable across runs. */
export function stringifyFrontmatter(data, schema) {
  const order = [
    ...schema.frontmatter.required,
    ...schema.frontmatter.optional,
  ];
  const keys = [
    ...order.filter((k) => data[k] !== undefined && data[k] !== null && data[k] !== ''),
    ...Object.keys(data).filter((k) => !order.includes(k)),
  ];
  const lines = ['---'];
  for (const k of keys) {
    const v = data[k];
    if (Array.isArray(v)) {
      if (v.length === 0) continue;
      lines.push(`${k}: [${v.map(emitScalar).join(', ')}]`);
    } else if (v && typeof v === 'object') {
      const entries = Object.entries(v).filter(([, x]) => x !== undefined && x !== null && x !== '');
      if (entries.length === 0) continue;
      lines.push(`${k}:`);
      for (const [ik, iv] of entries) lines.push(`  ${ik}: ${emitScalar(iv)}`);
    } else {
      lines.push(`${k}: ${emitScalar(v)}`);
    }
  }
  lines.push('---', '');
  return lines.join('\n');
}

// ---------- Sections ----------

/** [{ heading, body, level }] for every H2+ in a markdown body. */
export function parseSections(body) {
  const out = [];
  const re = /^(#{2,6})\s+(.+?)\s*$/gm;
  const marks = [];
  let m;
  while ((m = re.exec(body)) !== null) {
    marks.push({ level: m[1].length, heading: m[2].trim(), start: m.index, contentStart: m.index + m[0].length });
  }
  for (let i = 0; i < marks.length; i++) {
    const next = marks.findIndex((x, j) => j > i && x.level <= marks[i].level);
    const end = next === -1 ? body.length : marks[next].start;
    out.push({
      level: marks[i].level,
      heading: marks[i].heading,
      body: body.slice(marks[i].contentStart, end).trim(),
    });
  }
  return out;
}

export function extractH1(body) {
  const m = body.match(/^#\s+(.+?)\s*$/m);
  return m ? m[1].trim() : null;
}

export function readDoc(dirPath, name) {
  const p = join(dirPath, name);
  if (!existsSync(p)) return null;
  const text = readFileSync(p, 'utf8');
  const { raw, data, body } = parseFrontmatter(text);
  return {
    path: p, name, text, body,
    frontmatter: data,          // interpreted, or null
    frontmatterRaw: raw,        // verbatim, or null — preserve this when rewriting
    hasFrontmatter: raw !== null,
    sections: parseSections(body),
  };
}

/**
 * Write exactly the text the caller composed.
 *
 * An earlier version took (frontmatter, body, schema) and re-composed the file itself,
 * so a caller that had built a different string — DESIGN.md, whose authored design-token
 * frontmatter must be preserved verbatim — compared its own version but wrote the
 * recomposed one. That silently replaced the token block in every plan. Composing in one
 * place and writing in another is the bug; this signature removes the opportunity.
 */
export function writeDocText(dirPath, name, text) {
  const p = join(dirPath, name);
  writeFileSync(p, text);
  return text;
}

/** True when the plan predates the schema (no frontmatter on SPEC.md). */
export function isLegacy(dirPath) {
  const doc = readDoc(dirPath, 'SPEC.md');
  return !!doc && !doc.hasFrontmatter;
}

/**
 * Which `source.*` fields are missing for this capture's origin.
 *
 * `source.url` is required for a scraped capture, which always has an upstream page to check
 * a claim against, and must NOT be required for a web submission, which has none: demanding
 * one would either block submissions or invite a fabricated URL, and a fabricated source is
 * worse than an absent one. `source.consent` is the mirror case, required only for `web`.
 *
 * Lives here rather than inline in the gate so the condition can be tested directly. An
 * unconditional check that silently never fires is the failure mode this is guarding against.
 */
export function missingSourceFields(source, schema) {
  if (!source) return [];
  const cond = schema.frontmatter.fields.source.conditionalRequired ?? {};
  const absent = (v) => v === undefined || v === null || v === '';
  return Object.entries(cond)
    .filter(([field, rule]) => {
      const applies = rule.whenNameIn
        ? rule.whenNameIn.includes(source.name)
        : !(rule.unlessNameIn ?? []).includes(source.name);
      return applies && absent(source[field]);
    })
    .map(([field]) => field);
}
