<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { loadPlans, loadIndexedAt } from '@/data/load';

const planCount = ref<number | null>(null);
const indexedAt = ref<string | null>(null);

onMounted(async () => {
  try {
    const [plans, at] = await Promise.all([loadPlans(), loadIndexedAt()]);
    planCount.value = plans.length;
    indexedAt.value = at;
  } catch {
    // Leave the counts absent rather than printing a stale hardcoded number.
  }
});

// Pipeline stage labels. Drawn as a horizontal flow on wide screens and
// stacked on narrow ones — readers can scan the whole thing in one pass.
const pipeline = [
  { tag: '01', title: 'Scrape', body: 'problemhunt-scraper fetches fresh posts from ProblemHunt (EN) and Reddit (r/SaaS, r/IndieHackers, r/startups, r/SideProject).' },
  { tag: '02', title: 'Format', body: 'ai-os plans format normalizes frontmatter, English headings and rewrites template filler into a visible TODO marker.' },
  { tag: '03', title: 'Enrich', body: 'A reading-and-judgment agent writes the per-plan prose (Problem, MVP Scope, Tech Stack, Milestones) — never invents facts.' },
  { tag: '04', title: 'Web-ready', body: 'ai-os plans check grants web-ready only after sections-written and problem-substantive pass; the SPA renders the corpus as a searchable static site.' },
] as const;

const features = [
  { tag: 'Search',  body: 'Matches titles, the original problem text and tags at once via Fuse.js.' },
  { tag: 'Facets',  body: 'Categories and tags stack: pick two to widen, add a tag to narrow. State lives in the URL.' },
  { tag: 'Income',  body: 'Range filter over the midpoint of the stated willingness-to-pay. Plans without a stated price drop out the moment you move either handle.' },
  { tag: 'Scores',  body: 'Money / Learn / Fun, 1–10, parsed from TOP_PROJECTS.md. A dash means that plan is not ranked on that axis.' },
  { tag: 'ZIP',     body: 'Each plan ships a self-contained .zip (SPEC + PRODUCT + PLAN + DESIGN + TASKS + README) from the Download button on the plan page.' },
  { tag: 'Share',   body: 'Every filter and search lives in the URL — bookmark or paste any view, including a single plan.' },
] as const;

const stack = [
  'Vite 6', 'Vue 3', 'vue-router 4', 'markdown-it', 'highlight.js',
  'Fuse.js', 'YAML', 'Node', 'Zod-shaped schema', 'ai-os plans CLI',
] as const;
</script>

<template>
  <div class="about">
    <!-- Hero -->
    <header class="hero">
      <div class="hero-meta">
        <span class="eyebrow">Framework component · AI-OS</span>
        <h1 class="hero-title">Plansmith</h1>
        <p class="hero-sub">
          A searchable, rankable static SPA for product plans scraped from
          <a href="https://problemhunt.pro" target="_blank" rel="noopener">ProblemHunt</a>
          and Reddit. Every plan ships as four <code>.md</code> docs plus a downloadable
          <code>.zip</code> ready to hand to an MVP builder.
        </p>

        <div class="stat-row">
          <div class="stat">
            <span class="stat-label">Plans indexed</span>
            <span class="stat-value">
              <template v-if="planCount !== null">{{ planCount }}</template>
              <template v-else>—</template>
            </span>
          </div>
          <div class="stat">
            <span class="stat-label">Last indexed</span>
            <span class="stat-value mono">
              <template v-if="indexedAt">{{ indexedAt }}</template>
              <template v-else>—</template>
            </span>
          </div>
          <div class="stat">
            <span class="stat-label">Source corpus</span>
            <span class="stat-value mono">../projects/</span>
          </div>
        </div>
      </div>

      <aside class="hero-card" aria-label="What you can do here">
        <p class="eyebrow">What you can do</p>
        <ul class="hero-list">
          <li>Search the corpus and stack category and tag filters.</li>
          <li>Open any plan to read its 4 docs and (if present) its architecture diagram.</li>
          <li>Download a <code>.zip</code> per plan, ready to implement.</li>
          <li>Compare the auto-ranked Top 5 across money / learn / fun.</li>
        </ul>
      </aside>
    </header>

    <!-- Pipeline -->
    <section class="block">
      <div class="block-head">
        <p class="eyebrow">Pipeline · how a plan gets to web-ready</p>
        <h2 class="block-title">Four steps, one CLI</h2>
      </div>
      <ol class="pipeline">
        <li v-for="step in pipeline" :key="step.tag" class="pipeline-step">
          <span class="pipeline-tag">{{ step.tag }}</span>
          <h3 class="pipeline-name">{{ step.title }}</h3>
          <p class="pipeline-body">{{ step.body }}</p>
        </li>
      </ol>
    </section>

    <!-- Features grid -->
    <section class="block">
      <div class="block-head">
        <p class="eyebrow">Features · what the SPA does for you</p>
        <h2 class="block-title">Six affordances worth knowing</h2>
      </div>
      <ul class="features">
        <li v-for="f in features" :key="f.tag" class="feature">
          <span class="feature-tag">{{ f.tag }}</span>
          <p class="feature-body">{{ f.body }}</p>
        </li>
      </ul>
    </section>

    <!-- Stack + footer -->
    <section class="block">
      <div class="block-head">
        <p class="eyebrow">Stack · what runs at build time</p>
        <h2 class="block-title">No backend</h2>
      </div>
      <p class="stack-line">
        The corpus is read once at <code>npm run build</code>; the resulting
        <code>plans.json</code>, <code>rankings.json</code>, <code>documents/</code> and
        <code>zips/</code> ship as static assets. There is no server.
      </p>
      <ul class="stack-chips">
        <li v-for="s in stack" :key="s" class="chip">{{ s }}</li>
      </ul>
    </section>

    <footer class="colophon">
      <p>
        Plansmith is a framework component of
        <a href="https://github.com/eddremonts86/ai-os" target="_blank" rel="noopener">AI-OS</a>.
        Brand: <span class="dot dot-accent"></span> accent (purple), <span class="dot dot-accent-2"></span> accent-2 (mint), <span class="dot dot-warn"></span> warn (amber).
        Type: Inter (UI) + JetBrains Mono (mono).
      </p>
    </footer>
  </div>
</template>

<style scoped>
/* ---- Page container ---- */
.about {
  max-width: 1200px;
  margin: 0 auto;
  padding: 40px 24px 80px;
}

/* ---- Eyebrow tag (shared) ---- */
.eyebrow {
  display: inline-block;
  margin: 0 0 12px;
  padding: 4px 10px;
  border-radius: var(--radius-pill);
  background: var(--accent-a10);
  color: var(--accent-text);
  font-family: var(--font-mono);
  font-size: 11px;
  font-weight: 500;
  letter-spacing: 0.06em;
  text-transform: uppercase;
}

/* ---- Hero ---- */
.hero {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 360px;
  gap: 32px;
  align-items: start;
  margin-bottom: 56px;
}

@media (max-width: 900px) {
  .hero { grid-template-columns: 1fr; }
}

.hero-meta { min-width: 0; }

.hero-title {
  margin: 0 0 16px;
  font-size: clamp(36px, 5vw, 52px);
  font-weight: 700;
  letter-spacing: -0.025em;
  line-height: 1.05;
  color: var(--text);
}

.hero-sub {
  margin: 0 0 28px;
  font-size: 16px;
  line-height: 1.6;
  color: var(--text-dim);
  max-width: 62ch;
}

.hero-sub a { color: var(--accent-text); text-decoration: none; border-bottom: 1px solid transparent; transition: border-color 150ms; }
.hero-sub a:hover { border-bottom-color: var(--accent); }
.hero-sub code {
  font-family: var(--font-mono);
  font-size: 14px;
  background: var(--surface-2);
  padding: 1px 6px;
  border-radius: var(--radius-sm);
  color: var(--text);
}

/* Stat row */
.stat-row {
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 12px;
  max-width: 640px;
}

@media (max-width: 640px) {
  .stat-row { grid-template-columns: 1fr; }
}

.stat {
  display: flex;
  flex-direction: column;
  gap: 4px;
  padding: 14px 16px;
  background: var(--surface);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-1);
}

.stat-label {
  font-family: var(--font-mono);
  font-size: 11px;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--text-dim);
}

.stat-value {
  font-size: 22px;
  font-weight: 600;
  color: var(--text);
  letter-spacing: -0.01em;
}

.stat-value.mono {
  font-family: var(--font-mono);
  font-size: 14px;
  font-weight: 500;
  letter-spacing: 0;
}

/* Hero side card */
.hero-card {
  padding: 20px;
  background: var(--surface);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-1);
  align-self: stretch;
}

.hero-list {
  margin: 8px 0 0;
  padding: 0;
  list-style: none;
  display: flex;
  flex-direction: column;
  gap: 10px;
  font-size: 14px;
  line-height: 1.55;
  color: var(--text-dim);
}

.hero-list li {
  position: relative;
  padding-left: 18px;
}

.hero-list li::before {
  content: '';
  position: absolute;
  left: 0;
  top: 9px;
  width: 6px;
  height: 6px;
  border-radius: 50%;
  background: var(--accent);
}

.hero-list code {
  font-family: var(--font-mono);
  font-size: 12px;
  background: var(--surface-2);
  padding: 1px 5px;
  border-radius: var(--radius-sm);
  color: var(--text);
}

/* ---- Block wrapper (used 3x) ---- */
.block {
  margin-bottom: 48px;
}

.block-head {
  margin-bottom: 20px;
}

.block-title {
  margin: 0;
  font-size: 22px;
  font-weight: 600;
  letter-spacing: -0.015em;
  color: var(--text);
}

/* ---- Pipeline (4 steps) ---- */
.pipeline {
  margin: 0;
  padding: 0;
  list-style: none;
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 12px;
}

@media (max-width: 900px) {
  .pipeline { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 540px) {
  .pipeline { grid-template-columns: 1fr; }
}

.pipeline-step {
  display: flex;
  flex-direction: column;
  gap: 8px;
  padding: 18px;
  background: var(--surface);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-1);
  position: relative;
}

.pipeline-tag {
  font-family: var(--font-mono);
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.10em;
  color: var(--accent-text);
}

.pipeline-name {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
  color: var(--text);
}

.pipeline-body {
  margin: 0;
  font-size: 13px;
  line-height: 1.55;
  color: var(--text-dim);
}

/* ---- Features grid (6 cards) ---- */
.features {
  margin: 0;
  padding: 0;
  list-style: none;
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 12px;
}

@media (max-width: 900px) {
  .features { grid-template-columns: repeat(2, minmax(0, 1fr)); }
}

@media (max-width: 540px) {
  .features { grid-template-columns: 1fr; }
}

.feature {
  display: flex;
  flex-direction: column;
  gap: 10px;
  padding: 18px;
  background: var(--surface);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-1);
  transition: box-shadow 150ms;
}

.feature:hover { box-shadow: var(--shadow-2); }

.feature-tag {
  display: inline-block;
  align-self: flex-start;
  font-family: var(--font-mono);
  font-size: 11px;
  font-weight: 600;
  letter-spacing: 0.08em;
  text-transform: uppercase;
  color: var(--accent-text);
  padding: 4px 10px;
  border-radius: var(--radius-pill);
  background: var(--accent-a10);
}

.feature-body {
  margin: 0;
  font-size: 14px;
  line-height: 1.55;
  color: var(--text-dim);
}

/* ---- Stack chips ---- */
.stack-line {
  margin: 0 0 16px;
  font-size: 14px;
  line-height: 1.6;
  color: var(--text-dim);
  max-width: 70ch;
}

.stack-line code {
  font-family: var(--font-mono);
  font-size: 13px;
  background: var(--surface-2);
  padding: 1px 6px;
  border-radius: var(--radius-sm);
  color: var(--text);
}

.stack-chips {
  margin: 0;
  padding: 0;
  list-style: none;
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

/* ---- Colophon ---- */
.colophon {
  margin-top: 56px;
  padding-top: 20px;
  border-top: 1px solid var(--line);
  font-size: 13px;
  line-height: 1.6;
  color: var(--text-dim);
}

.colophon a {
  color: var(--accent-text);
  text-decoration: none;
  border-bottom: 1px solid transparent;
  transition: border-color 150ms;
}
.colophon a:hover { border-bottom-color: var(--accent); }

.dot {
  display: inline-block;
  width: 8px;
  height: 8px;
  border-radius: 50%;
  vertical-align: 0;
  margin: 0 2px;
}
.dot-accent { background: var(--accent); }
.dot-accent-2 { background: var(--accent-2); }
.dot-warn { background: var(--warn); }
</style>