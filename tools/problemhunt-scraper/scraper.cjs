#!/usr/bin/env node
/**
 * Multi-Source Idea Scraper (ai-os edition) — ProblemHunt + Reddit
 *
 * Fetches fresh startup/project ideas from multiple sources and generates
 * per-project documentation under ~/Projects/ai-os/projects/(NNN-slug)/.
 *
 * Each project folder contains 5 files:
 *   SPEC.md, PLAN.md, TASKS.md, DESIGN.md, PRODUCT.md
 *
 * Sources:
 *   - ProblemHunt (Tilda feed, EN) — verified startup problems
 *   - Reddit RSS (r/SaaS, r/IndieHackers, r/startups, r/SideProject) — pain points
 *
 * Telegram notification is optional (no hard failure if env is missing).
 *
 * Invocation:
 *   node scraper.cjs                  # incremental (skip already analyzed)
 *   node scraper.cjs --force          # re-generate everything
 *   node scraper.cjs --dry-run        # do not write files
 *   node scraper.cjs --quiet          # suppress per-project logs
 *   node scraper.cjs --source=ph      # only ProblemHunt
 *   node scraper.cjs --source=reddit  # only Reddit
 */

const fs = require('fs');
const path = require('path');
const os = require('os');
const { generateDesignMD } = require('./design-dna.js');
const { allocatePlanIds } = require('../lib/plan-ids.cjs');

const AI_OS_ROOT   = process.env.AI_OS_ROOT || path.join(os.homedir(), 'Projects', 'ai-os');
const PROJECTS_DIR = path.join(AI_OS_ROOT, 'projects');
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

// ── Source: ProblemHunt ──────────────────────────────────────────────────────
const PROBLEMHUNT = {
  name: 'problemhunt',
  FEED_UID: '108885097871',
  REC_ID: '1651102281',
  API_BASE: 'https://feeds.tildaapi.com/api/getfeed',

  async fetchAll() {
    const allProjects = [];
    let slice = 1;
    let total = 0;
    while (true) {
      const ts = Date.now();
      const url = `${this.API_BASE}/?feeduid=${this.FEED_UID}&recid=${this.REC_ID}&c=${ts}&size=20&slice=${slice}&sort%5Bdate%5D=desc`;
      try {
        const res = await fetch(url);
        if (!res.ok) { log(`  [ph] slice ${slice} HTTP ${res.status}`); break; }
        const json = await res.json();
        if (!json.posts || json.posts.length === 0) break;
        total = json.total || total;
        json.posts.forEach(post => {
          if (post.url && post.url.includes('/en/')) {
            allProjects.push({
              source: 'problemhunt',
              url: post.url,
              uid: post.uid || null,
              title: cleanTitle(post.title),
              rawTitle: post.title || '',
              description: post.descr || post.text || '',
              category: post.url.match(/\/en\/([^/]+)\//)?.[1] || 'other',
              tags: post.parts || '',
              date: post.date || ''
            });
          }
        });
        if (!json.nextslice || slice >= 50) break;
        slice = json.nextslice;
        await sleep(300);
      } catch (e) {
        log(`  [ph] slice ${slice} error: ${e.message}`);
        break;
      }
    }
    return { projects: allProjects, total };
  }
};

// ── Source: Reddit (RSS) ─────────────────────────────────────────────────────
const REDDIT = {
  name: 'reddit',
  SUBREDDITS: ['SaaS', 'IndieHackers', 'startups', 'SideProject'],
  BASE: 'https://www.reddit.com',
  UA: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36',

  async fetchAll() {
    const allProjects = [];
    for (const sub of this.SUBREDDITS) {
      const url = `${this.BASE}/r/${sub}/new/.rss?limit=25`;
      try {
        const res = await fetch(url, { headers: { 'User-Agent': this.UA } });
        if (!res.ok) {
          log(`  [reddit] r/${sub} HTTP ${res.status}`);
          if (res.status === 429) {
            const resetSec = parseInt(res.headers.get('x-ratelimit-reset') || '30', 10);
            log(`  [reddit] rate-limited, sleeping ${resetSec}s`);
            await sleep((resetSec + 1) * 1000);
            continue;
          }
          continue;
        }
        const xml = await res.text();
        if (xml.length === 0) { log(`  [reddit] r/${sub} empty body`); continue; }
        const entries = parseRedditRSS(xml);
        entries.forEach(entry => {
          allProjects.push({
            source: 'reddit',
            url: entry.link,
            uid: null,
            title: cleanTitle(entry.title),
            rawTitle: entry.title,
            description: entry.contentSnippet || entry.content || '',
            category: sub,
            tags: '',
            date: entry.published || ''
          });
        });
        log(`  [reddit] r/${sub}: +${entries.length}`);
        await sleep(2000);
      } catch (e) {
        log(`  [reddit] r/${sub} error: ${e.message}`);
      }
    }
    return { projects: allProjects, total: allProjects.length };
  }
};

// Minimal Reddit Atom parser
function parseRedditRSS(xml) {
  const entries = [];
  const entryBlocks = xml.split(/<entry>/).slice(1);
  for (const block of entryBlocks) {
    const closeIdx = block.indexOf('</entry>');
    const entry = closeIdx >= 0 ? block.slice(0, closeIdx) : block;
    const title = (entry.match(/<title>([^<]+)<\/title>/) || [])[1] || '';
    const link = (entry.match(/<link[^>]*href="([^"]+)"/) || [])[1] || '';
    const published = (entry.match(/<published>([^<]+)<\/published>/) || [])[1] || '';
    const contentMatch = entry.match(/<content type="html">([\s\S]*?)<\/content>/);
    const content = contentMatch ? contentMatch[1].replace(/<[^>]+>/g, ' ').replace(/\s+/g, ' ').trim() : '';
    if (title && link) entries.push({ title, link, published, content, contentSnippet: content });
  }
  return entries;
}

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
    : `**Source:** [ProblemHunt](${url})\n**Categoría primaria:** ${category}\n${tags ? `**Tags:** ${tags}` : ''}\n**Fecha:** ${date}`;

  return `# SPEC.md — ${docTitle}

## Problema Detectado

${description || '_Pendiente de análisis manual._'}

${sourceLabel}

---

## Objetivo Principal

Crear una solución que aborde este problema de forma clara y escalable.

---

## Usuarios Objetivo

1. **[Usuario primario]** — descripción del usuario principal
2. **[Usuario secundario]** — otros usuarios relevantes

## Alcance MVP

- Funcionalidad core
- Evitar funcionalidades fuera del MVP

## Design Direction

Ver \`DESIGN.md\` para tokens específicos del proyecto.

## Constraints

- Mantener simple el MVP
- Sin dependencias externas innecesarias
`;
}

function generatePlan(project, folderSlug) {
  const { title, rawTitle } = project;
  const docTitle = rawTitle || title;
  return `# PLAN.md — ${docTitle}

## Tech Stack Propuesta

- **Frontend:** React + TypeScript
- **Backend:** Node.js API (TanStack Start)
- **DB:** SQLite con Drizzle ORM
- **Despliegue:** Coolify + Docker

## Arquitectura

\`\`\`
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│   Client    │────▶│   API       │────▶│   DB        │
└─────────────┘     └─────────────┘     └─────────────┘
\`\`\`

## Milestones

1. **M0:** Setup proyecto + SPEC.md + DESIGN.md aprobado
2. **M1:** Scaffold + auth
3. **M2:** Core feature
4. **M3:** Testing + deployment

## Riesgos

- Dependencia de APIs externas
- Alcance ambiguo sin más detalles
`;
}

function generateTasks(project, folderSlug) {
  const { title, rawTitle } = project;
  const date2 = new Date().toISOString().split('T')[0];
  const docTitle = rawTitle || title;
  return `# TASKS.md — ${docTitle}

## Phase 0: Scaffold

- [ ] Crear carpeta del proyecto en \`apps/\`
- [ ] Inicializar repo git
- [ ] Copiar \`edd-app-template\` → \`apps/${folderSlug}/\`
- [ ] Escribir SPEC.md (este documento)
- [ ] Escribir DESIGN.md (tokens + dirección visual)
- [ ] Configurar \`tailwind.config.ts\` con los tokens de DESIGN.md
- [ ] Configurar entorno de desarrollo

## Phase 1: Core

- [ ] Implementar scaffold del proyecto
- [ ] Implementar features core
- [ ] Aplicar design tokens al components
- [ ] Escribir tests

## Phase 2: Deploy

- [ ] Crear repo en GitHub
- [ ] Desplegar a Coolify
- [ ] Verificar en producción

---

_Lúa generó este análisis automáticamente el ${date2}_
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
    : `_Source:_ [ProblemHunt](${url}) · **Category:** ${category} ${tags ? `· **Tags:** ${tags}` : ''}`;

  return `# PRODUCT.md — ${docTitle}

> Auto-generated product brief. Review and refine before MVP scoping.

## Value Proposition

${description ? `_Based on source brief:_ ${description}` : '_Pending manual refinement._'}

**One-liner:** _[Define the single sentence that explains why this product exists.]_

## Target Users

| Stakeholder | Why they care |
|---|---|
${stakeholders.slice(0, 5).map(s => `| ${s} | _[What pain they feel]_\n| _[How this solves it]_ |`).join('\n')}

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
  fs.mkdirSync(dir, { recursive: true });

  const spec    = generateSpec(project, folderSlug);
  const plan    = generatePlan(project, folderSlug);
  const tasks   = generateTasks(project, folderSlug);
  const designMd = generateDesignMD(folderSlug, project);
  const product  = generateProduct(project, folderSlug);

  if (DRY_RUN) {
    log(`  [dry-run] would write 5 files to ${dir}`);
    return;
  }

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

  if (!SOURCE_FLAG || SOURCE_FLAG === 'ph' || SOURCE_FLAG === 'problemhunt') {
    log('📡 Fetching ProblemHunt...');
    const { projects, total } = await PROBLEMHUNT.fetchAll();
    phTotal = total;
    allProjects = allProjects.concat(projects);
    log(`  [ph] fetched ${projects.length} (of ${total})`);
  }

  if (!SOURCE_FLAG || SOURCE_FLAG === 'reddit') {
    log('📡 Fetching Reddit (r/SaaS, r/IndieHackers, r/startups, r/SideProject)...');
    const { projects } = await REDDIT.fetchAll();
    redditTotal = projects.length;
    allProjects = allProjects.concat(projects);
    log(`  [reddit] fetched ${projects.length}`);
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

  log(`🆕 Nuevos (sin docs): ${newProjects.length}`);

  if (newProjects.length === 0) {
    log('Nada nuevo. Saliendo.');
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
    await notifyTelegram(`🫀 <b>Multi-Source Ideas (ai-os)</b>\n\n${analyzed.length} proyecto(s) nuevo(s):\n\n${list}${more}`);
  }

  appendLog(`[${new Date().toISOString()}] === DONE: ${analyzed.length} analyzed (PH=${phTotal}, Reddit=${redditTotal}) ===`);
  log(`\n✅ ${analyzed.length} proyectos analizados.`);

  return { newCount: analyzed.length, projects: analyzed };
}

main().catch(e => { log('❌ Fatal:', e.message); process.exit(1); });
