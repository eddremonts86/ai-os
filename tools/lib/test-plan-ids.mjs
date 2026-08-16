#!/usr/bin/env node
/**
 * Tests for the shared plan id allocator. Run: node tools/lib/test-plan-ids.mjs
 *
 * These exist because the allocator has two callers that never run in the same process, so
 * "it worked when I ran the scraper" proves nothing about intake. Every case builds a real
 * corpus in a temp directory and allocates against it.
 */

import { mkdtempSync, mkdirSync, writeFileSync, rmSync } from 'node:fs';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import { createRequire } from 'node:module';

const require = createRequire(import.meta.url);
const ids = require('./plan-ids.cjs');

let pass = 0;
const fails = [];
const ok = (name, cond, got) => {
  if (cond) { pass++; console.log(`  ✅ ${name}`); }
  else { fails.push(name); console.log(`  ❌ ${name}${got !== undefined ? `  got: ${JSON.stringify(got)}` : ''}`); }
};

/** Build a throwaway corpus with the given plan directory names. */
function corpus(names) {
  const dir = mkdtempSync(join(tmpdir(), 'aios-ids-'));
  const projects = join(dir, 'projects');
  mkdirSync(projects, { recursive: true });
  for (const n of names) {
    mkdirSync(join(projects, n), { recursive: true });
    writeFileSync(join(projects, n, 'SPEC.md'), '---\nstatus: draft\n---\n# x\n');
  }
  return { dir, projects, state: join(dir, 'state.json') };
}

console.log('\n[test] plan id allocator\n');

// ---------- parsing and width ----------
{
  ok('parses a three-digit dir', ids.parsePlanDir('007-a-slug')?.num === 7);
  ok('parses a four-digit dir', ids.parsePlanDir('1024-a-slug')?.num === 1024);
  ok('rejects a two-digit dir', ids.parsePlanDir('07-a-slug') === null);
  ok('rejects a non-plan dir', ids.parsePlanDir('_schema.json') === null);
  ok('pads to three', ids.formatPlanId(7) === '007', ids.formatPlanId(7));
  ok('leaves three alone', ids.formatPlanId(609) === '609', ids.formatPlanId(609));
  // The whole point of padding to a minimum rather than a fixed width: nothing gets renamed
  // when the corpus crosses 999.
  ok('grows past 999 rather than truncating', ids.formatPlanId(1000) === '1000', ids.formatPlanId(1000));
  ok('and keeps growing', ids.formatPlanId(10000) === '10000', ids.formatPlanId(10000));
}

// ---------- allocation ----------
{
  const c = corpus(['001-a', '002-b', '609-c']);
  const a = ids.allocatePlanIds(c.projects, 1);
  ok('allocates above the highest on disk', a.ids[0] === '610', a.ids);
  ok('reports the next number', a.nextNumber === 611, a.nextNumber);

  const many = ids.allocatePlanIds(c.projects, 3);
  ok('allocates a consecutive run', JSON.stringify(many.ids) === JSON.stringify(['610', '611', '612']), many.ids);

  const empty = corpus([]);
  ok('starts at 001 on an empty corpus', ids.allocatePlanIds(empty.projects, 1).ids[0] === '001');

  const wide = corpus(['999-a']);
  ok('crosses 999 into four digits', ids.allocatePlanIds(wide.projects, 1).ids[0] === '1000',
    ids.allocatePlanIds(wide.projects, 1).ids);

  // Lexicographic max would pick '999' over '1000' and hand out a duplicate.
  const mixed = corpus(['999-a', '1000-b', '1001-c']);
  ok('compares ids numerically, not as strings', ids.allocatePlanIds(mixed.projects, 1).ids[0] === '1002',
    ids.allocatePlanIds(mixed.projects, 1).ids);

  for (const x of [c, empty, wide, mixed]) rmSync(x.dir, { recursive: true, force: true });
}

// ---------- the high-water mark ----------
{
  const c = corpus(['001-a', '002-b']);
  writeFileSync(c.state, JSON.stringify({ nextNumber: 50, analyzed: { keep: 'me' } }));
  ok('honours a stored mark above the filesystem',
    ids.allocatePlanIds(c.projects, 1, c.state).ids[0] === '050',
    ids.allocatePlanIds(c.projects, 1, c.state).ids);

  // Deleting the top plan must not free its id: a reused id repoints a published URL.
  const gap = corpus(['001-a', '002-b']);
  writeFileSync(gap.state, JSON.stringify({ nextNumber: 100 }));
  ok('does not reuse the id of a deleted top plan',
    ids.allocatePlanIds(gap.projects, 1, gap.state).ids[0] === '100');

  writeFileSync(c.state, 'not json at all');
  ok('a corrupt state file does not wedge allocation',
    ids.allocatePlanIds(c.projects, 1, c.state).ids[0] === '003');

  writeFileSync(c.state, JSON.stringify({ nextNumber: 10, analyzed: { keep: 'me' } }));
  ids.saveHighWater(c.state, 42);
  const after = JSON.parse((await import('node:fs')).readFileSync(c.state, 'utf8'));
  ok('saving the mark preserves the rest of the file', after.analyzed?.keep === 'me', after);
  ok('saving the mark moves it forward', after.nextNumber === 42, after.nextNumber);
  ids.saveHighWater(c.state, 5);
  const back = JSON.parse((await import('node:fs')).readFileSync(c.state, 'utf8'));
  ok('the mark never moves backwards', back.nextNumber === 42, back.nextNumber);

  for (const x of [c, gap]) rmSync(x.dir, { recursive: true, force: true });
}

// ---------- two writers, which is the reason this module exists ----------
{
  const c = corpus(['001-a', '609-b']);
  writeFileSync(c.state, JSON.stringify({ nextNumber: 610 }));

  // The scraper allocates and writes its directories.
  const scraper = ids.allocatePlanIds(c.projects, 3, c.state);
  for (const id of scraper.ids) {
    mkdirSync(join(c.projects, `${id}-from-scraper`), { recursive: true });
    writeFileSync(join(c.projects, `${id}-from-scraper`, 'SPEC.md'), '---\n---\n');
  }
  ids.saveHighWater(c.state, scraper.nextNumber);

  // Intake then allocates, in a different process, knowing nothing about the above.
  const intake = ids.allocatePlanIds(c.projects, 2, c.state);

  const all = [...scraper.ids, ...intake.ids];
  ok('two writers never collide', new Set(all).size === all.length, all);
  ok('intake continues where the scraper stopped',
    intake.ids[0] === '613', intake.ids);

  // And the pathological order: intake first, scraper second.
  const d = corpus(['001-a']);
  const i2 = ids.allocatePlanIds(d.projects, 2, d.state);
  for (const id of i2.ids) {
    mkdirSync(join(d.projects, `${id}-from-intake`), { recursive: true });
    writeFileSync(join(d.projects, `${id}-from-intake`, 'SPEC.md'), '---\n---\n');
  }
  ids.saveHighWater(d.state, i2.nextNumber);
  const s2 = ids.allocatePlanIds(d.projects, 2, d.state);
  const all2 = [...i2.ids, ...s2.ids];
  ok('order of writers does not matter', new Set(all2).size === all2.length, all2);

  for (const x of [c, d]) rmSync(x.dir, { recursive: true, force: true });
}

// ---------- listing ----------
{
  const c = corpus(['1000-a', '002-b', '999-c', '010-d']);
  const listed = ids.listPlanDirNames(c.projects);
  ok('lists in numeric order, not lexicographic',
    JSON.stringify(listed) === JSON.stringify(['002-b', '010-d', '999-c', '1000-a']), listed);

  mkdirSync(join(c.projects, '500-no-spec'), { recursive: true });
  ok('skips a directory without SPEC.md', !ids.listPlanDirNames(c.projects).includes('500-no-spec'));

  rmSync(c.dir, { recursive: true, force: true });
}

console.log(`\n[test] ${pass} pass, ${fails.length} fail`);
if (fails.length) {
  for (const f of fails) console.log(`  - ${f}`);
  process.exit(1);
}
console.log('[test] OK\n');
