#!/usr/bin/env node
/**
 * Multi-Source Idea Scraper (ai-os edition) — 7 sources as of feat/plans-sources
 *
 * Fetches fresh startup/project ideas from multiple sources and generates
 * per-project documentation under ~/Projects/ai-os/apps/data/projects/(NNN-slug)/.
 *
 * Each project folder contains 5 files:
 *   SPEC.md, PLAN.md, TASKS.md, DESIGN.md, PRODUCT.md
 *
 * Sources (each a drop-in {name, fetchAll() -> {projects, total}} in sources/):
 *   - ProblemHunt (Tilda feed, EN)  --source=ph
 *   - Reddit RSS                     --source=reddit      [BROKEN: login required as of 2026-08]
 *   - HN Ask HN (hnrss)              --source=hnask
 *   - HN Show HN (hnrss)             --source=hnshow
 *   - ProductHunt Atom                --source=producthunt
 *   - IndieHackers Algolia            --source=indiehackers
 *   - BetaList Atom                   --source=betalist
 *
 * Telegram notification is optional (no hard failure if env is missing).
 *
 * Invocation:
 *   node scraper.cjs                       # all enabled sources, incremental
 *   node scraper.cjs --force              # re-generate everything
 *   node scraper.cjs --dry-run            # do not write files
 *   node scraper.cjs --quiet              # suppress per-project logs
 *   node scraper.cjs --source=ph          # only ProblemHunt
 *   node scraper.cjs --source=hnask       # only HN Ask
 *   node scraper.cjs --source=producthunt # only ProductHunt feed
 */

const fs = require('fs');
const path = require('path');
const os = require('os');
const { generateDesignMD } = require('./design-dna.js');
const { allocatePlanIds } = require('../lib/plan-ids.cjs');

// ── Source registry ────────────────────────────────────────────────────────────
// Each module exports { name, fetchAll() -> { projects: [], total: N } } and
// each project is { source, url, uid, title, rawTitle, description, category, tags, date }.
// Adding a new source is: drop a file in sources/, append it here, done.
const SOURCES = [
  require('./sources/problemhunt.js'),
  require('./sources/reddit.js'),
  require('./sources/hnask.js'),
  require('./sources/hnshow.js'),
  require('./sources/producthunt.js'),
  require('./sources/indiehackers.js'),
  require('./sources/betalist.js')
];

// CLI alias -> module.name (so users can keep typing --source=ph etc.)
const SOURCE_ALIASES = {
  ph: 'problemhunt',
  problemhunt: 'problemhunt',
  reddit: 'reddit',
  hnask: 'hnask',
  hnshow: 'hnshow',
  producthunt: 'producthunt',
  phfeed: 'producthunt',
  indiehackers: 'indiehackers',
  ih: 'indiehackers',
  betalist: 'betalist'
};

// Pick the sources the user actually wants this run.
// Unset SOURCE_FLAG  => all enabled (excludes broken ones).
// Set SOURCE_FLAG    => only the matching one(s).
function activeSources() {
  if (! SOURCE_FLAG) {
    // Reddit is silently broken since 2026-08 — skip by default. Re-enable
    // by passing --source=reddit explicitly if the user wants the noise.
    return SOURCES.filter(s => s.name !== 'reddit');
  }
  const wanted = SOURCE_ALIASES[SOURCE_FLAG];
  if (! wanted) {
    log(`⚠ Unknown --source=${SOURCE_FLAG}; valid: ${Object.keys(SOURCE_ALIASES).join(', ')}`);
    return [];
  }
  return SOURCES.filter(s => s.name === wanted);
}

// Resolve the repo root by walking up to the CLAUDE.md marker. The previous fallback was a
// hardcoded path.join(os.homedir(), 'Projects', 'ai-os'), which silently scraped into the
// wrong tree on any clone that lives elsewhere; hop counting has the same failure mode from a
// different direction. An explicit AI_OS_ROOT still wins, for callers that set it. Throwing is
// deliberate: a wrong root yields an empty corpus and a run that reports success. See
// docs/repo-layout.md.
function findAiOsRoot(from) {
  let dir = from;
  while (dir !== path.dirname(dir)) {
    if (fs.existsSync(path.join(dir, 'CLAUDE.md'))) return dir;
    dir = path.dirname(dir);
  }
  throw new Error(`cannot locate the AI-OS root above ${from}`);
}

// Display name per source slug, for the prose label and for the frontmatter `source.name` the
// formatter derives from it. This used to be a two-way branch — reddit, or "ProblemHunt" for
// everything else — so every betalist, Hacker News, ProductHunt and IndieHackers capture claimed
// to come from ProblemHunt. The values must stay inside the source.name enum in
// apps/data/projects/_schema.json.
const SOURCE_LABELS = {
  problemhunt: 'ProblemHunt',
  reddit: 'Reddit',
  hnask: 'HackerNews',
  hnshow: 'HackerNews',
  producthunt: 'ProductHunt',
  indiehackers: 'IndieHackers',
  betalist: 'BetaList',
};

const AI_OS_ROOT   = process.env.AI_OS_ROOT || findAiOsRoot(__dirname);
const PROJECTS_DIR = path.join(AI_OS_ROOT, 'apps', 'data', 'projects');
const SCRAPER_DIR  = __dirname;
const STATE_FILE   = path.join(SCRAPER_DIR, 'state.json');
const LOG_FILE     = path.join(SCRAPER_DIR, 'last-run.log');

// ── CLI flags ─────────────────────────────────────────────────────────────────
const FLAGS = new Set(process.argv.slice(2));
const FORCE   = FLAGS.has('--force');
const DRY_RUN = FLAGS.has('--dry-run');
const QUIET   = FLAGS.has('--quiet');
const SOURCE_FLAG = (process.argv.find(a => a.startsWith('--source=')) || '').split('=')[1];

// ── Helpers ──────────────────────────────────────────────────────────────────
function log(...args) {
  if (QUIET) return;
  const ts = new Date().toISOString().substring(11, 19);
  console.log(`[${ts}]`, ...args);
}

function titleToSlug(title) {
  if (!title) return null;
  return title.toLowerCase().replace(/[^a-z0-9\s-]/g, '')
    .replace(/\s+/g, '-').replace(/-+/g, '-')
    .replace(/^-+|-+$/g, '').substring(0, 55);
}

function cleanTitle(title) {
  if (!title) return 'Untitled';
  return title.replace(/[^a-zA-Z0-9\s\-.,!?'"]/g, '')
    .replace(/\s+/g, ' ').trim().substring(0, 120);
}

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

function cleanTitle(title) {
  if (!title) return 'Untitled';
  return title.replace(/[^a-zA-Z0-9 \-.,!?'"]/g, '')
    .replace(/\s+/g, ' ').trim().substring(0, 120);
}

const REDDIT = require('./sources/reddit.js');

// Re-export so legacy call sites keep working.
module.exports.cleanTitle = cleanTitle;

// ── Source: ProblemHunt ──────────────────────────────────────────────────────
const PROBLEMHUNT = require('./sources/problemhunt.js');

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

// ── State ────────────────────────────────────────────────────────────────────
function findAnalyzedProject(url, title, state) {
  for (const [slug, data] of Object.entries(state.analyzed)) {
    if (data.url === url && docsExist(slug)) return slug;
  }
  const clean = titleToSlug(title);
  if (clean) {
    for (const [slug, data] of Object.entries(state.analyzed)) {
      if (!docsExist(slug)) continue;
      if (slug.endsWith(clean) || clean.endsWith(slug.replace(/^\d+-/, ''))) return slug;
    }
  }
  return null;
}

function docsExist(folderSlug) {
  if (!folderSlug) return false;
  const dir = path.join(PROJECTS_DIR, folderSlug);
  if (!fs.existsSync(dir)) return false;
  const required = ['SPEC.md', 'PLAN.md', 'TASKS.md', 'DESIGN.md', 'PRODUCT.md'];
  return required.every(f => fs.existsSync(path.join(dir, f)));
}

function loadState() {
  try { return JSON.parse(fs.readFileSync(STATE_FILE, 'utf8')); }
  catch { return { analyzed: {}, lastRun: null, nextNumber: 1 }; }
}

function saveState(state) {
  // Guarded here, not at the call sites. A --dry-run that advances the scrape cursor is the
  // worst failure this script has: it reports "would write" while marking every capture as
  // already seen, so the next real run skips them and the items are lost until --force.
  if (DRY_RUN) return;
  fs.writeFileSync(STATE_FILE, JSON.stringify(state, null, 2));
}

function appendLog(text) {
  fs.appendFileSync(LOG_FILE, text + '\n');
}

// ── Source-tagged doc generators ─────────────────────────────────────────────
function generateSpec(project, folderSlug) {
  const { title, description, url, category, tags, date, rawTitle, source } = project;
  const docTitle = rawTitle || title;
  const sourceLabel = source === 'reddit'
    ? `**Source:** [Reddit r/${category}](${url})\n**Subreddit:** ${category}\n**Posted:** ${date}`
    : `**Source:** [${SOURCE_LABELS[source] || 'ProblemHunt'}](${url})\n**Primary category:** ${category}\n${tags ? `**Tags:** ${tags}` : ''}\n**Date:** ${date}`;

  return `# SPEC.md — ${docTitle}

## Problem

${description || '_Pending manual analysis._'}

${sourceLabel}

---

## Objective

Build a solution that addresses this problem clearly and at scale.

---

## Target Users

1. **[Primary user]** — the main user this serves
2. **[Secondary user]** — other relevant users

## MVP Scope

- Core functionality
- Leave out anything beyond the MVP

## Design Direction

See \`DESIGN.md\` for this project's design tokens.

## Constraints

- Keep the MVP simple
- No unnecessary external dependencies
`;
}

function generatePlan(project, folderSlug) {
  const { title, rawTitle } = project;
  const docTitle = rawTitle || title;
  return `# PLAN.md — ${docTitle}

## Tech Stack

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite with Drizzle ORM
- **Deployment:** Coolify + Docker

## Architecture

\`\`\`
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
\`\`\`

## Milestones

1. **M0:** Project setup + SPEC.md + DESIGN.md approved
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Risks

- Dependency on external APIs
- Ambiguous scope without further detail
`;
}

function generateTasks(project, folderSlug) {
  const { title, rawTitle } = project;
  const date2 = new Date().toISOString().split('T')[0];
  const docTitle = rawTitle || title;
  return `# TASKS.md — ${docTitle}

## Phase 0: Scaffold

- [ ] Create the project folder under \`apps/\`
- [ ] Initialise the git repo
- [ ] Copiar \`edd-app-template\` → \`apps/${folderSlug}/\`
- [ ] Write SPEC.md (this document)
- [ ] Write DESIGN.md (tokens + visual direction)
- [ ] Wire \`tailwind.config.ts\` to the DESIGN.md tokens
- [ ] Set up the development environment

## Phase 1: Core

- [ ] Implement the project scaffold
- [ ] Implement the core features
- [ ] Apply the design tokens to the components
- [ ] Write tests

## Phase 2: Deploy

- [ ] Create the GitHub repo
- [ ] Deploy to Coolify
- [ ] Verify in production

---

_Generated automatically by Lúa on ${date2}_
`;
}

function generateProduct(project, folderSlug) {
  const { title, description, url, category, tags, rawTitle, source } = project;
  const docTitle = rawTitle || title;

  const stakeholders = [];
  if (source === 'reddit') {
    if (category === 'SaaS') stakeholders.push('SaaS founders', 'B2B teams', 'Operators');
    else if (category === 'IndieHackers') stakeholders.push('Indie hackers', 'Solo founders');
    else if (category === 'startups') stakeholders.push('Startup founders', 'Early-stage teams');
    else if (category === 'SideProject') stakeholders.push('Hobbyist builders', 'Weekend hackers');
    else stakeholders.push('Developers', 'Founders');
  } else {
    if (category === 'productivity' || category === 'business') stakeholders.push('Founders', 'Small teams', 'Solo operators');
    else if (category === 'fintech' || category === 'banking') stakeholders.push('Consumers', 'Small merchants', 'Freelancers');
    else if (category === 'education' || category === 'learning') stakeholders.push('Students', 'Educators', 'Self-learners');
    else if (category === 'health' || category === 'healthcare') stakeholders.push('Patients', 'Caregivers', 'Clinicians');
    else if (category === 'design' || category === 'creative') stakeholders.push('Designers', 'Creative agencies', 'Founders');
    else if (category === 'developer' || category === 'devtools') stakeholders.push('Software engineers', 'Dev teams', 'Indie hackers');
    else stakeholders.push('Early adopters', 'Founders', 'SMEs');
    if (tags && /creator/i.test(tags)) stakeholders.push('Content creators');
    if (tags && /b2b/i.test(tags)) stakeholders.push('B2B buyers');
  }

  const sourceLine = source === 'reddit'
    ? `_Source:_ [Reddit r/${category}](${url}) · **Posted:** ${project.date || 'unknown'}`
    : `_Source:_ [${SOURCE_LABELS[source] || 'ProblemHunt'}](${url}) · **Category:** ${category} ${tags ? `· **Tags:** ${tags}` : ''}`;

  return `# PRODUCT.md — ${docTitle}

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

${description ? `_Based on source brief:_ ${description}` : '_Pending manual refinement._'}

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
${stakeholders.slice(0, 5).map(s => `| ${s} | _[What pain they feel, and how this solves it]_ |`).join('\n')}

## Jobs To Be Done

1. **Functional job** — _[What the user is trying to accomplish]_
2. **Emotional job** — _[How they want to feel]_
3. **Social job** — _[How others perceive them using this]_

## Success Metrics (North Star)

- **Activation:** _[% of signups who complete X within Y days]_
- **Retention:** _[DAU/MAU, week-1 retention, cohort curves]_
- **Revenue:** _[MRR target, ARPU, LTV/CAC]_

## Pricing & Monetization

_TODO:_ define model (freemium / subscription / one-time / marketplace fee).

## Competitive Landscape

_TODO:_ list 2-3 alternatives + differentiation.

## Risks & Open Questions

- [ ] Validate problem with 5 user interviews before MVP
- [ ] Confirm willingness to pay
- [ ] Define compliance scope (GDPR, payments, etc.)

---

${sourceLine}
`;
}

function generateDocs(project, folderSlug) {
  const dir = path.join(PROJECTS_DIR, folderSlug);

  // Generate everything before touching the filesystem. mkdirSync used to run here, above the
  // DRY_RUN return, so a --dry-run left one empty directory per capture behind — 810 of them in
  // a single run. An empty plan dir is worse than noise: listPlanDirs() counts it, so the corpus
  // size and the enrichment backlog both silently inflate.
  const spec    = generateSpec(project, folderSlug);
  const plan    = generatePlan(project, folderSlug);
  const tasks   = generateTasks(project, folderSlug);
  const designMd = generateDesignMD(folderSlug, project);
  const product  = generateProduct(project, folderSlug);

  if (DRY_RUN) {
    log(`  [dry-run] would write 5 files to ${dir}`);
    return;
  }

  fs.mkdirSync(dir, { recursive: true });
  fs.writeFileSync(path.join(dir, 'SPEC.md'),    spec);
  fs.writeFileSync(path.join(dir, 'PLAN.md'),    plan);
  fs.writeFileSync(path.join(dir, 'TASKS.md'),   tasks);
  fs.writeFileSync(path.join(dir, 'DESIGN.md'),  designMd);
  fs.writeFileSync(path.join(dir, 'PRODUCT.md'), product);
}

// ── Telegram (optional) ───────────────────────────────────────────────────────
async function notifyTelegram(message) {
  const envPath = path.join(SCRAPER_DIR, '.env');
  const token = process.env.TELEGRAM_BOT_TOKEN
    || (fs.existsSync(envPath) ? fs.readFileSync(envPath, 'utf8').match(/TELEGRAM_BOT_TOKEN=(\S+)/)?.[1] : null);
  const chatId = process.env.TELEGRAM_CHAT_ID
    || (fs.existsSync(envPath) ? fs.readFileSync(envPath, 'utf8').match(/TELEGRAM_CHAT_ID=(\S+)/)?.[1] : null);
  if (!token || !chatId) { log('⚠ No Telegram token/chatId configured — skipping'); return; }
  try {
    const res = await fetch(`https://api.telegram.org/bot${token}/sendMessage`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
      body: new URLSearchParams({ chat_id: chatId, text: message, parse_mode: 'HTML' })
    });
    const json = await res.json();
    if (json.ok) log('📱 Telegram OK'); else log('⚠ Telegram:', json.description);
  } catch (e) { log('⚠ Telegram error:', e.message); }
}

// ── Main ─────────────────────────────────────────────────────────────────────
async function main() {
  log('🚀 Multi-Source Scraper v9 (ai-os) starting...');
  appendLog(`\n[${new Date().toISOString()}] === START === force=${FORCE} dry=${DRY_RUN} source=${SOURCE_FLAG || 'all'}`);

  if (!fs.existsSync(PROJECTS_DIR)) {
    fs.mkdirSync(PROJECTS_DIR, { recursive: true });
  }

  const state = loadState();

  let allProjects = [];
  let phTotal = 0;
  let redditTotal = 0;

  const active = activeSources();
  if (active.length === 0) {
    log('⚠ No sources selected — nothing to do');
    appendLog(`[${new Date().toISOString()}] === DONE (no sources) ===`);
    return { newCount: 0, projects: [] };
  }

  for (const src of active) {
    log(`📡 Fetching ${src.name}...`);
    try {
      const { projects, total, error } = await src.fetchAll();
      if (error) log(`  [${src.name}] source error: ${error}`);
      allProjects = allProjects.concat(projects);
      if (src.name === 'problemhunt') phTotal = total || 0;
      else if (src.name === 'reddit') redditTotal = total || 0;
      log(`  [${src.name}] fetched ${projects.length}${total ? ` (of ${total})` : ''}`);
    } catch (e) {
      log(`  [${src.name}] crashed: ${e.message}`);
    }
  }

  if (allProjects.length === 0) {
    appendLog(`[${new Date().toISOString()}] === DONE (no projects) ===`);
    return { newCount: 0, projects: [] };
  }

  const seen = new Set();
  const uniqueProjects = [];
  for (const p of allProjects) {
    if (!p.url || seen.has(p.url)) continue;
    seen.add(p.url);
    uniqueProjects.push(p);
  }
  log(`\n📊 Unique projects: ${uniqueProjects.length} (PH=${phTotal}, Reddit=${redditTotal})`);

  const newProjects = uniqueProjects.filter(p => {
    const existing = findAnalyzedProject(p.url, p.title, state);
    if (FORCE) return true;
    if (!existing) return true;
    return !docsExist(existing);
  });

  // Ids come from the shared allocator rather than straight from `state.nextNumber`. The
  // counter was correct only while this scraper was the corpus's sole writer; submission
  // intake is a second one, and a counter owned by one of two writers is a race. The
  // allocator derives from the filesystem, which both writers already agree on because both
  // produce it, and still consults the counter as a high-water mark so the id of a deleted
  // top plan is never handed out twice.
  const { ids: allocated, nextNumber } = allocatePlanIds(
    PROJECTS_DIR, newProjects.length, STATE_FILE,
  );
  newProjects.forEach((p, i) => {
    p.folderSlug = `${allocated[i]}-${titleToSlug(p.title)}`;
  });
  state.nextNumber = nextNumber;

  log(`🆕 New (no docs yet): ${newProjects.length}`);

  if (newProjects.length === 0) {
    log('Nothing new. Exiting.');
    appendLog(`[${new Date().toISOString()}] === DONE (no new) ===`);
    return { newCount: 0, projects: [] };
  }

  const analyzed = [];
  for (const project of newProjects) {
    try {
      generateDocs(project, project.folderSlug);

      state.analyzed[project.folderSlug] = {
        url:      project.url,
        uid:      project.uid,
        title:    project.rawTitle || project.title,
        category: project.category,
        tags:     project.tags,
        source:   project.source,
        analyzedAt: new Date().toISOString()
      };
      state.lastRun = new Date().toISOString();
      saveState(state);

      analyzed.push(project);
      log(`  ✅ [${project.source}] ${project.folderSlug}`);
    } catch (e) {
      log(`  ⚠ ${project.folderSlug}: ${e.message}`);
    }
  }

  if (analyzed.length > 0 && !DRY_RUN) {
    const list = analyzed.slice(0, 20).map(p => `• [${p.source}] ${p.rawTitle || p.title}`).join('\n');
    const more = analyzed.length > 20 ? `\n_...and ${analyzed.length - 20} more_` : '';
    await notifyTelegram(`🫀 <b>Multi-Source Ideas (ai-os)</b>\n\n${analyzed.length} new project(s):\n\n${list}${more}`);
  }

  appendLog(`[${new Date().toISOString()}] === DONE: ${analyzed.length} analyzed (PH=${phTotal}, Reddit=${redditTotal}) ===`);
  log(`\n✅ ${analyzed.length} projects analysed.`);

  return { newCount: analyzed.length, projects: analyzed };
}

main().catch(e => { log('❌ Fatal:', e.message); process.exit(1); });
