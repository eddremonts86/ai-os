<script setup lang="ts">
/**
 * Landing page. The app used to open straight into the search results, which asked the
 * visitor to filter a corpus before anyone had told them what the corpus is or why it is
 * free. This page answers that first, then hands them to the explorer.
 *
 * It also carries the only pitch for the two sibling tools, so the three products read as
 * one path instead of three unrelated links.
 *
 * Every number on this page is read from the generated index at runtime. Hardcoding 346
 * would go stale the first time the daily pipeline ships new plans, and a landing page
 * quoting a count the app itself contradicts is worse than no count.
 */
import { ref, onMounted, computed } from 'vue';
import { RouterLink } from 'vue-router';
import { loadPlans, loadRankings } from '@/data/load';
import type { Plan, Rankings } from '@/types';

const plans = ref<Plan[] | null>(null);
const rankings = ref<Rankings | null>(null);

onMounted(async () => {
  try {
    const [p, r] = await Promise.all([loadPlans(), loadRankings()]);
    plans.value = p;
    rankings.value = r;
  } catch {
    // Absent figures render as a dash. The page still reads without them; a wrong number
    // would not.
  }
});

const planCount = computed(() => plans.value?.length ?? null);
const countryCount = computed(() =>
  plans.value ? new Set(plans.value.map((p) => p.country).filter(Boolean)).size : null,
);
const categoryCount = computed(() =>
  plans.value ? new Set(plans.value.map((p) => p.category).filter(Boolean)).size : null,
);

// Hyphen, not an em-dash: the em-dash is the house tell this page is audited against, and a
// fallback that only renders when the fetch fails is exactly where one survives review.
const fmt = (n: number | null) => (n === null ? '-' : String(n));

/** The five documents every plan directory carries, plus the archive of all of them. */
const documents = ['SPEC', 'PRODUCT', 'PLAN', 'DESIGN', 'TASKS', '.zip'] as const;

/**
 * The three ranking lenses. `top` resolves to the real current leader so the section shows
 * the ranking rather than describing it.
 */
const lenses = computed(() => [
  {
    key: 'money' as const,
    name: 'Real revenue potential',
    body: 'Recurring over one-time, business buyers over consumers, and a price somebody already said out loud.',
    top: rankings.value?.money?.[0],
  },
  {
    key: 'learn' as const,
    name: 'Learning potential',
    body: 'A stack, a domain or a distribution channel you have not shipped in before.',
    top: rankings.value?.learn?.[0],
  },
  {
    key: 'fun' as const,
    name: 'Fun to build',
    body: 'Novel mechanics, room for design, and the least amount of plumbing between you and something that works.',
    top: rankings.value?.fun?.[0],
  },
]);

const titleOf = (id: string | undefined) =>
  id && plans.value ? plans.value.find((p) => p.id === id)?.title ?? null : null;
</script>

<template>
  <div class="landing">
    <!-- Hero: asymmetric split. Copy left, the actual product right. -->
    <section class="hero">
      <div class="container hero-grid">
        <div class="hero-copy">
          <h1>
            You don't need an idea.<br />
            You need a plan.
          </h1>
          <p class="hero-sub">
            Product plans written from real posts by people describing a problem they have.
            Free, no account.
          </p>
          <div class="hero-cta">
            <RouterLink to="/plans" class="btn btn-primary">Browse plans</RouterLink>
            <RouterLink to="/about" class="btn btn-ghost">How it works</RouterLink>
          </div>
        </div>

        <figure class="hero-shot">
          <img
            src="/img/shot-explorer.webp"
            width="2160"
            height="1230"
            alt="The plans explorer: a searchable grid of product plans with filters for category, tag and tech stack."
            fetchpriority="high"
            decoding="async"
          />
        </figure>
      </div>
    </section>

    <!-- Figures: a plain row, no cards. Numbers are mono so they read as data. -->
    <section class="figures">
      <div class="container figures-row">
        <div class="figure">
          <span class="figure-n">{{ fmt(planCount) }}</span>
          <span class="figure-l">plans, all free</span>
        </div>
        <div class="figure">
          <span class="figure-n">{{ fmt(countryCount) }}</span>
          <span class="figure-l">countries the problems come from</span>
        </div>
        <div class="figure">
          <span class="figure-n">{{ fmt(categoryCount) }}</span>
          <span class="figure-l">categories to filter by</span>
        </div>
        <div class="figure">
          <span class="figure-n">5</span>
          <span class="figure-l">documents in every plan</span>
        </div>
      </div>
    </section>

    <!-- Anatomy: full-width media, then the document set as pills underneath. -->
    <section class="anatomy">
      <div class="container">
        <h2>A plan is five documents, not a one-line idea.</h2>
        <p class="lede">
          The problem in the poster's own terms, who it is for, what the smallest useful
          version is, a stack chosen for this problem, and the tasks to get there. Read it in
          the browser or take the archive and open it in your editor.
        </p>
        <ul class="docs" aria-label="What every plan includes">
          <li v-for="d in documents" :key="d" class="doc">{{ d }}</li>
        </ul>
        <figure class="anatomy-shot">
          <img
            src="/img/shot-plan.webp"
            width="2160"
            height="1230"
            alt="A plan page: tabs for SPEC, Product, Plan, Design and Tasks, with country, tech stack, source link and a download button in the sidebar."
            loading="lazy"
            decoding="async"
          />
        </figure>
      </div>
    </section>

    <!-- Lenses: editorial rows. No media, so this reads differently from its neighbours. -->
    <section class="lenses">
      <div class="container">
        <h2>Three ways to sort, because money is not always the point.</h2>
        <dl class="lens-list">
          <div v-for="l in lenses" :key="l.key" class="lens">
            <dt>{{ l.name }}</dt>
            <dd>
              <p>{{ l.body }}</p>
              <RouterLink v-if="l.top && titleOf(l.top.id)" :to="`/plans/${l.top.id}`" class="lens-top">
                <span class="lens-score">{{ l.top.score }}/10</span>
                <span class="lens-title">{{ titleOf(l.top.id) }}</span>
              </RouterLink>
            </dd>
          </div>
        </dl>
        <RouterLink to="/rankings" class="btn btn-ghost">See all rankings</RouterLink>
      </div>
    </section>

    <!-- The path: one wide cell then two. Each cell is the real product, not a mockup. -->
    <section class="path">
      <div class="container">
        <h2>Three tools, one path.</h2>
        <p class="lede">
          Find something worth building, find the people already shipping, and make sure the
          CV you send can actually be read.
        </p>

        <div class="path-grid">
          <article class="path-cell path-cell-wide">
            <div class="path-body">
              <p class="path-where">You are here</p>
              <h3>Plans</h3>
              <p>
                Pick a problem somebody has already described, with the research done and the
                build broken down. Everything here is free and always will be.
              </p>
              <RouterLink to="/plans" class="btn btn-primary">Browse plans</RouterLink>
            </div>
          </article>

          <article class="path-cell">
            <a
              class="path-shot"
              href="https://builderhunt.dev"
              target="_blank"
              rel="noopener"
              tabindex="-1"
              aria-hidden="true"
            >
              <img
                src="/img/shot-builderhunt.webp"
                width="2160"
                height="990"
                alt=""
                loading="lazy"
                decoding="async"
              />
            </a>
            <div class="path-body">
              <h3>BuilderHunt</h3>
              <p>
                Find the people shipping right now, not just the repos. Activity from GitHub,
                Reddit, Hacker News and DEV.to, scored for recency.
              </p>
              <a class="btn btn-ghost" href="https://builderhunt.dev" target="_blank" rel="noopener">
                builderhunt.dev
              </a>
            </div>
          </article>

          <article class="path-cell">
            <a
              class="path-shot"
              href="https://hunterready.eduardoinerarte.dk"
              target="_blank"
              rel="noopener"
              tabindex="-1"
              aria-hidden="true"
            >
              <img
                src="/img/shot-hunterready.webp"
                width="2160"
                height="990"
                alt=""
                loading="lazy"
                decoding="async"
              />
            </a>
            <div class="path-body">
              <h3>HunterReady</h3>
              <p>
                Upload the CV you already have and see it the way automated screening reads
                it. Fix what it got wrong, download a PDF that parses.
              </p>
              <a
                class="btn btn-ghost"
                href="https://hunterready.eduardoinerarte.dk"
                target="_blank"
                rel="noopener"
              >
                hunterready.eduardoinerarte.dk
              </a>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- Single-purpose closing band. Same label as the hero: one intent, one wording. -->
    <section class="close">
      <div class="container close-inner">
        <h2>{{ planCount === null ? 'Every plan' : planCount + ' plans' }}, nothing to sign up for.</h2>
        <RouterLink to="/plans" class="btn btn-primary btn-lg">Browse plans</RouterLink>
      </div>
    </section>
  </div>
</template>

<style scoped>
/* Shape rule for this page: media frames and cells use --radius-lg, buttons --radius-md,
   pills fully rounded. Applied without exception below. */

.landing {
  padding-bottom: 96px;
}

h1,
h2,
h3 {
  letter-spacing: -0.025em;
  margin: 0;
}

.lede {
  color: var(--text-dim);
  max-width: 62ch;
  margin: 12px 0 0;
}

/* ---------- buttons ---------- */

.btn {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  /* Nowrap plus generous inline padding: a wrapped CTA label reads as a broken button, and
     these labels are short enough that they never need two lines. */
  white-space: nowrap;
  padding: 11px 20px;
  border-radius: var(--radius-md);
  border: 1px solid transparent;
  font: inherit;
  font-weight: 600;
  font-size: 14px;
  text-decoration: none;
  cursor: pointer;
  transition: background-color 0.18s, border-color 0.18s, transform 0.12s;
}

.btn:active {
  transform: translateY(1px);
}

.btn:focus-visible {
  outline: 2px solid var(--focus);
  outline-offset: 2px;
}

/* --accent sits in a dead zone for a 14px label: measured on this page it gives 4.35:1 with
   white text and 4.47:1 with --bg, so BOTH miss the 4.5:1 floor. Lifting the fill two steps
   and keeping the dark label clears it (4.97:1, hover 5.96:1) while staying the same hue, so
   the button still reads as the brand.
   Deliberately local rather than a new shared token: --accent keeps its documented job as the
   fill/rail/border colour, and this is only the derivation a filled label needs. */
.btn-primary {
  background: #8467ff;
  color: var(--bg);
}

.btn-primary:hover {
  background: #9479ff;
}

.btn-ghost {
  border-color: var(--line-strong);
  color: var(--text);
  background: transparent;
}

.btn-ghost:hover {
  border-color: var(--accent);
  background: var(--accent-a05);
}

.btn-lg {
  padding: 14px 28px;
  font-size: 15px;
}

/* ---------- hero ---------- */

.hero {
  /* Capped deliberately: more top padding and the copy floats down the viewport and reads
     as a layout fault rather than as space. */
  padding: 72px 0 24px;
}

.hero-grid {
  display: grid;
  /* The copy column is sized to the headline, not to a fraction: with two fr columns the
     image only grew when the container did, so widening the container widened both and the
     shot stayed small. Fixed left, remainder to the image. */
  grid-template-columns: minmax(0, 590px) minmax(0, 1fr);
  gap: 56px;
  align-items: center;
}

/* Bleed the shot to the right viewport edge on wide screens. Inside the 1280px container it
   rendered 551px wide, too small to read a dense UI, and taking the width from the copy
   column pushed the headline back to three lines. Running off the edge buys the image real
   size without touching the text, and the off-centre composition is the point. */
@media (min-width: 1180px) {
  .hero .container {
    max-width: none;
    padding-right: 0;
    margin-left: max(24px, calc((100vw - 1280px) / 2));
  }

  .hero-shot {
    border-right: 0;
    border-top-right-radius: 0;
    border-bottom-right-radius: 0;
  }
}

.hero-copy h1 {
  /* Capped at 50px, not 58px: at 58 the first line overflowed the copy column and the
     headline ran to three lines. */
  font-size: clamp(32px, 3.7vw, 48px);
  line-height: 1.06;
  font-weight: 700;
}

.hero-sub {
  color: var(--text-dim);
  font-size: 17px;
  line-height: 1.6;
  max-width: 46ch;
  margin: 20px 0 0;
}

.hero-cta {
  display: flex;
  flex-wrap: wrap;
  gap: 12px;
  margin-top: 28px;
}

.hero-shot,
.anatomy-shot {
  margin: 0;
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-lg);
  overflow: hidden;
  background: var(--surface);
  box-shadow: var(--shadow-2);
}

.hero-shot img,
.anatomy-shot img,
.path-shot img {
  display: block;
  width: 100%;
  height: auto;
}

/* ---------- figures ---------- */

.figures {
  padding: 56px 0;
}

.figures-row {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 32px;
  border-top: 1px solid var(--line);
  border-bottom: 1px solid var(--line);
  padding-top: 28px;
  padding-bottom: 28px;
}

.figure {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.figure-n {
  font-family: var(--font-mono);
  font-size: 34px;
  font-weight: 500;
  line-height: 1;
  color: var(--accent-text);
  font-variant-numeric: tabular-nums;
}

.figure-l {
  color: var(--text-dim);
  font-size: 13.5px;
  line-height: 1.4;
}

/* ---------- anatomy ---------- */

.anatomy {
  padding: 40px 0 64px;
}

.anatomy h2,
.lenses h2,
.path h2 {
  font-size: clamp(24px, 2.6vw, 34px);
  line-height: 1.15;
  font-weight: 700;
  max-width: 24ch;
}

.docs {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
  list-style: none;
  padding: 0;
  margin: 28px 0 32px;
}

.doc {
  font-family: var(--font-mono);
  font-size: 12.5px;
  padding: 6px 12px;
  border-radius: 999px;
  border: 1px solid var(--line-strong);
  color: var(--text-dim);
  background: var(--surface);
}

/* ---------- lenses ---------- */

.lenses {
  padding: 64px 0;
  border-top: 1px solid var(--line);
}

.lens-list {
  margin: 32px 0;
}

.lens {
  display: grid;
  grid-template-columns: minmax(0, 0.8fr) minmax(0, 1.2fr);
  gap: 32px;
  padding: 24px 0;
  /* One hairline between rows, none above the first and none below the last: a border on
     every row turns three items into a table. */
  border-top: 1px solid var(--line);
}

.lens:first-of-type {
  border-top: none;
}

.lens dt {
  font-size: 18px;
  font-weight: 650;
}

.lens dd {
  margin: 0;
}

.lens dd p {
  margin: 0;
  color: var(--text-dim);
  line-height: 1.6;
}

.lens-top {
  display: flex;
  align-items: baseline;
  gap: 10px;
  margin-top: 14px;
  text-decoration: none;
  color: var(--text);
  border-radius: var(--radius-md);
}

.lens-top:hover .lens-title {
  color: var(--accent-text);
  /* Not colour alone: the underline carries the state for anyone who cannot see the hue. */
  text-decoration: underline;
  text-underline-offset: 3px;
}

.lens-top:focus-visible {
  outline: 2px solid var(--focus);
  outline-offset: 3px;
}

.lens-score {
  font-family: var(--font-mono);
  font-size: 12.5px;
  color: var(--accent-text);
  border: 1px solid var(--accent-a30);
  background: var(--accent-a10);
  border-radius: 999px;
  padding: 3px 9px;
  flex: none;
}

.lens-title {
  font-size: 14.5px;
  line-height: 1.45;
  transition: color 0.18s;
}

/* ---------- path ---------- */

.path {
  padding: 64px 0;
  border-top: 1px solid var(--line);
}

/* Three cells for three products: one wide, then two. Not three equal columns, and no
   empty cell to pad a grid nobody filled. */
.path-grid {
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  gap: 20px;
  margin-top: 36px;
}

.path-cell {
  display: flex;
  flex-direction: column;
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  background: var(--surface);
  overflow: hidden;
}

.path-cell-wide {
  grid-column: 1 / -1;
  background:
    radial-gradient(120% 140% at 8% 0%, var(--accent-a10), transparent 58%),
    var(--surface);
  border-color: var(--accent-a30);
}

.path-body {
  padding: 24px;
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 12px;
}

.path-cell-wide .path-body {
  padding: 32px;
  max-width: 58ch;
}

.path-where {
  font-family: var(--font-mono);
  font-size: 11.5px;
  color: var(--accent-text);
  margin: 0;
}

.path-cell h3 {
  font-size: 21px;
  font-weight: 700;
}

.path-cell p {
  margin: 0;
  color: var(--text-dim);
  line-height: 1.6;
  font-size: 14.5px;
}

.path-cell .btn {
  margin-top: 4px;
}

/* The image is decorative here: the heading and body carry the meaning, and the visible
   link below is the real target. Keeping it out of the tab order avoids two stops on one
   destination. */
.path-shot {
  display: block;
  border-bottom: 1px solid var(--line);
  background: var(--surface-2);
  /* One aspect ratio for both cells regardless of how each source page had to be cropped:
     BuilderHunt has a marketing hero, HunterReady opens on a wizard step, and matching their
     crops by hand would break the moment either site changes. */
  aspect-ratio: 1440 / 560;
  overflow: hidden;
}

.path-shot img {
  height: 100%;
  object-fit: cover;
  object-position: center top;
}

/* ---------- close ---------- */

.close {
  padding: 72px 0 0;
  border-top: 1px solid var(--line);
}

.close-inner {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-between;
  gap: 24px;
}

.close h2 {
  font-size: clamp(22px, 2.4vw, 30px);
  font-weight: 700;
  margin: 0;
}

/* ---------- motion ---------- */

/* Entry and scroll reveals are handled by the .reveal utility in app.css where present;
   here motion is limited to hover and press feedback, which communicates that a control
   responded. Anything decorative stops under reduced motion. */
@media (prefers-reduced-motion: reduce) {
  .btn,
  .lens-title {
    transition: none;
  }

  .btn:active {
    transform: none;
  }
}

/* ---------- narrow ---------- */

@media (max-width: 1000px) {
  .hero-grid {
    grid-template-columns: 1fr;
    gap: 36px;
  }

  .hero {
    padding-top: 48px;
  }

  .figures-row {
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 24px;
  }

  .lens {
    grid-template-columns: 1fr;
    gap: 10px;
  }
}

@media (max-width: 700px) {
  .path-grid {
    grid-template-columns: 1fr;
  }

  .figures-row {
    grid-template-columns: 1fr;
    gap: 20px;
  }

  .figure {
    flex-direction: row;
    align-items: baseline;
    gap: 12px;
  }

  .figure-n {
    font-size: 26px;
    min-width: 3.2ch;
  }

  .close-inner {
    flex-direction: column;
    align-items: flex-start;
  }

  .path-cell-wide .path-body,
  .path-body {
    padding: 20px;
  }
}
</style>
