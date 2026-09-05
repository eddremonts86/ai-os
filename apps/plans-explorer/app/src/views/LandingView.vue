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
import { ref, onMounted, onBeforeUnmount, computed } from 'vue';
import { RouterLink } from 'vue-router';
import { loadPlans, loadRankings } from '@/data/load';
import type { Plan, Rankings } from '@/types';

const plans = ref<Plan[] | null>(null);
const rankings = ref<Rankings | null>(null);
const loadFailed = ref(false);

onMounted(async () => {
  try {
    const [p, r] = await Promise.all([loadPlans(), loadRankings()]);
    plans.value = p;
    rankings.value = r;
  } catch {
    // Absent figures render as a dash. The page still reads without them; a wrong number
    // would not.
    loadFailed.value = true;
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

/**
 * The "you are here" stop of the path shows the corpus itself rather than a screenshot of the
 * page the visitor is already on: the newest plans, four at a time, one swapped every few
 * seconds so the list reads as the living thing it is. Newest by capture date, ties broken by
 * id, so the order is stable between renders and between visitors.
 */
const LATEST_POOL = 12;
const LATEST_SHOWN = 4;
const latestPool = computed(() =>
  plans.value
    ? [...plans.value]
        .sort((a, b) => (b.date ?? '').localeCompare(a.date ?? '') || b.id.localeCompare(a.id))
        .slice(0, LATEST_POOL)
    : [],
);
const latestOffset = ref(0);
const latest = computed(() => {
  const pool = latestPool.value;
  if (pool.length <= LATEST_SHOWN) return pool;
  return Array.from({ length: LATEST_SHOWN }, (_, i) => pool[(latestOffset.value + i) % pool.length]);
});
const latestDate = computed(() => latestPool.value[0]?.date ?? null);

// The rotation is decoration. It does not run for anyone who asked for less motion, and it
// holds while the pointer or keyboard focus is on the list, or a title would move out from
// under the click it was about to receive.
const latestPaused = ref(false);
let latestTimer: ReturnType<typeof setInterval> | undefined;
onMounted(() => {
  if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) return;
  latestTimer = setInterval(() => {
    if (!latestPaused.value && !document.hidden) latestOffset.value += 1;
  }, 3500);
});
onBeforeUnmount(() => clearInterval(latestTimer));
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

    <!-- The path: three stops on one rail, in the order you use them. The reader is on the
         first one, so that stop shows the corpus itself instead of a screenshot of the page
         they are looking at; the other two show the real product in a browser frame. -->
    <section class="path">
      <div class="container">
        <h2>Three tools, one path.</h2>
        <p class="lede">
          Find something worth building, find the people already shipping, and make sure the
          CV you send can actually be read.
        </p>

        <ol class="stops" aria-label="The three tools, in the order you use them">
          <li class="stop is-here">
            <span class="stop-n" aria-hidden="true">01</span>
            <div class="stop-copy">
              <p class="stop-kicker">Find something worth building</p>
              <div class="stop-title">
                <h3>Plans</h3>
                <span class="chip is-accent">You are here</span>
              </div>
              <p>
                Pick a problem somebody has already described, with the research done and the
                build broken down. Everything here is free and always will be.
              </p>
              <div class="stop-actions">
                <RouterLink to="/plans" class="btn btn-primary">Browse plans</RouterLink>
              </div>
            </div>

            <div
              class="stop-visual latest"
              @pointerenter="latestPaused = true"
              @pointerleave="latestPaused = false"
              @focusin="latestPaused = true"
              @focusout="latestPaused = false"
            >
              <div class="latest-head">
                <span>Newest plans</span>
                <span v-if="latestDate" class="latest-date">added {{ latestDate }}</span>
              </div>
              <TransitionGroup v-if="latest.length" name="latest" tag="ul" class="latest-list">
                <li v-for="p in latest" :key="p.id" class="latest-item">
                  <RouterLink :to="`/plans/${p.id}`" class="latest-link">
                    <span class="latest-text">
                      <span class="latest-title">{{ p.title }}</span>
                      <span class="latest-excerpt">{{ p.excerpt }}</span>
                    </span>
                    <span class="chip">{{ p.category }}</span>
                  </RouterLink>
                </li>
              </TransitionGroup>
              <p v-else-if="loadFailed" class="latest-empty">
                The newest plans did not load. <RouterLink to="/plans">Open the explorer</RouterLink>.
              </p>
              <ul v-else class="latest-list" aria-hidden="true">
                <li v-for="i in LATEST_SHOWN" :key="i" class="latest-item">
                  <span class="latest-link latest-text">
                    <span class="skeleton-line" />
                    <span class="skeleton-line is-dim" />
                  </span>
                </li>
              </ul>
            </div>
          </li>

          <li class="stop">
            <span class="stop-n" aria-hidden="true">02</span>
            <div class="stop-copy">
              <p class="stop-kicker">Find the people already shipping</p>
              <div class="stop-title"><h3>BuilderHunt</h3></div>
              <p>
                Find the people shipping right now, not just the repos. Activity from GitHub,
                Reddit, Hacker News and DEV.to, scored for recency.
              </p>
              <div class="stop-actions">
                <a class="btn btn-ghost" href="https://builderhunt.dev" target="_blank" rel="noopener">
                  Open BuilderHunt<span aria-hidden="true"> ↗</span>
                </a>
                <span class="stop-domain">builderhunt.dev</span>
              </div>
            </div>

            <!-- Decorative duplicate of the visible link: out of the tab order so one
                 destination is one stop. -->
            <a
              class="stop-visual frame"
              href="https://builderhunt.dev"
              target="_blank"
              rel="noopener"
              tabindex="-1"
              aria-hidden="true"
            >
              <span class="frame-bar">
                <span class="frame-dots"><span /><span /><span /></span>
                <span class="frame-url">builderhunt.dev</span>
              </span>
              <img
                src="/img/shot-builderhunt.webp"
                width="2160"
                height="1110"
                alt=""
                loading="lazy"
                decoding="async"
              />
            </a>
          </li>

          <li class="stop">
            <span class="stop-n" aria-hidden="true">03</span>
            <div class="stop-copy">
              <p class="stop-kicker">Make sure the CV you send can be read</p>
              <div class="stop-title"><h3>HunterReady</h3></div>
              <p>
                Upload the CV you already have and see it the way automated screening reads
                it. Fix what it got wrong, download a PDF that parses.
              </p>
              <div class="stop-actions">
                <a
                  class="btn btn-ghost"
                  href="https://hunterready.eduardoinerarte.dk"
                  target="_blank"
                  rel="noopener"
                >
                  Open HunterReady<span aria-hidden="true"> ↗</span>
                </a>
                <span class="stop-domain">hunterready.eduardoinerarte.dk</span>
              </div>
            </div>

            <a
              class="stop-visual frame"
              href="https://hunterready.eduardoinerarte.dk"
              target="_blank"
              rel="noopener"
              tabindex="-1"
              aria-hidden="true"
            >
              <span class="frame-bar">
                <span class="frame-dots"><span /><span /><span /></span>
                <span class="frame-url">hunterready.eduardoinerarte.dk</span>
              </span>
              <img
                src="/img/shot-hunterready.webp"
                width="2160"
                height="1110"
                alt=""
                loading="lazy"
                decoding="async"
              />
            </a>
          </li>
        </ol>
      </div>
    </section>

    <!-- Single-purpose closing band. Same label as the hero: one intent, one wording. -->
    <section class="close">
      <div class="container close-inner">
        <h2>{{ planCount === null ? 'Every plan' : planCount + ' plans' }}, nothing to sign up for.</h2>
        <div class="close-actions">
          <RouterLink to="/plans" class="btn btn-primary btn-lg">Browse plans</RouterLink>
          <RouterLink to="/submit" class="btn btn-lg">Submit a problem</RouterLink>
        </div>
        <p class="close-fine">
          Seen one worth building? Send it. A person reads every submission.
        </p>
      </div>
    </section>
  </div>
</template>

<style scoped>
/* Shape rule for this page: media frames and cells use --radius-lg, buttons --radius-md,
   pills fully rounded. Applied without exception below. */

.close-actions {
  display: flex;
  gap: 12px;
  justify-content: center;
  flex-wrap: wrap;
}

.close-fine {
  margin: 16px 0 0;
  font-size: 14px;
  color: var(--text-dim);
}

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
  padding: 11px 22px;
  border-radius: var(--radius-pill);
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

/* Token fill, white label: 5.48:1, measured. The dark palette needed a local #8467ff here
   because its accent failed AA under a label; the light accent was chosen so it does not,
   and this literal was the first thing the palette change would have broken. */
.btn-primary {
  background: var(--accent);
  color: var(--on-accent);
}

.btn-primary:hover {
  background: color-mix(in srgb, var(--accent) 88%, var(--text));
}

.btn-ghost {
  border-color: var(--line-strong);
  color: var(--text);
  background: var(--surface);
  box-shadow: var(--shadow-1);
}

.btn-ghost:hover {
  border-color: var(--accent);
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
  /* The one gradient on the site. Three soft washes fading into the page, under the hero
     only: the brand moment gets colour, everything below it stays on the plain ground. */
  background: var(--wash);
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
.anatomy-shot img {
  display: block;
  width: 100%;
  height: auto;
}

/* ---------- figures ---------- */

.figures {
  padding: 56px 0;
}

/* A white panel, not two hairlines: the figures are the first thing under the hero and the
   reference UIs carry their stats on a raised tile. Width and padding are set here because
   the element also carries .container, whose gutter this replaces. */
.figures-row {
  display: grid;
  grid-template-columns: repeat(4, minmax(0, 1fr));
  gap: 32px;
  width: calc(100% - 48px);
  max-width: 1232px;
  padding: 28px 32px;
  background: var(--surface);
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-1);
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
  padding: 7px 13px;
  border-radius: var(--radius-pill);
  color: var(--text-dim);
  background: var(--surface-2);
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
  background: var(--accent-a10);
  border-radius: var(--radius-pill);
  padding: 4px 10px;
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

/* An ordered list on a rail. The three products are steps in one sequence and the layout
   says so, instead of a 1+2 card grid that left the lede to explain how three cards relate.
   Per stop: number, copy, visual at 5/7, so the product gets the wider share and the copy
   holds a readable measure. */
.stops {
  list-style: none;
  margin: 40px 0 0;
  padding: 0;
}

.stop {
  position: relative;
  display: grid;
  grid-template-columns: 32px minmax(0, 5fr) minmax(0, 7fr);
  column-gap: 32px;
  row-gap: 20px;
  align-items: start;
  padding: 8px 0 56px;
}

.stop:last-child {
  padding-bottom: 0;
}

/* The rail: one segment per stop, from this node's centre (8px padding + 16px) to the next
   node's centre, which is 24px into the next stop. Segments overlap under the nodes, which
   have a solid fill, so there is no seam and no rail dangling past the last node. */
.stop:not(:last-child)::before {
  content: '';
  position: absolute;
  left: 15px;
  top: 24px;
  bottom: -24px;
  width: 2px;
  background: var(--line-strong);
}

.stop-n {
  position: relative;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background: var(--surface);
  border: 2px solid var(--line-strong);
  font-family: var(--font-mono);
  font-size: 11.5px;
  font-weight: 600;
  letter-spacing: 0.02em;
  color: var(--text-dim);
}

/* The current stop is the only filled node and the only accent on the rail: the position
   is the message, not the number. */
.is-here .stop-n {
  background: var(--accent);
  border-color: var(--accent);
  color: var(--on-accent);
}

.stop-copy {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 12px;
  padding-top: 4px;
  max-width: 46ch;
}

/* The kicker is the lede's verb for this step, so the sentence above and the list below are
   visibly the same three things. */
.stop-kicker {
  margin: 0;
  font-family: var(--font-mono);
  font-size: 11.5px;
  letter-spacing: 0.02em;
  text-transform: uppercase;
  color: var(--text-dim);
}

.is-here .stop-kicker {
  color: var(--accent-text);
}

.stop-title {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 10px;
}

.stop-title h3 {
  margin: 0;
  font-size: 22px;
  font-weight: 700;
  letter-spacing: -0.01em;
  line-height: 1.2;
}

.stop-copy p {
  margin: 0;
  color: var(--text-dim);
  line-height: 1.6;
  font-size: 15px;
}

.stop-actions {
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  gap: 14px;
  margin-top: 6px;
}

/* The button says the action; the domain says where it goes. A raw hostname as a button
   label was the previous version and read as a link somebody forgot to name. */
.stop-domain {
  font-family: var(--font-mono);
  font-size: 12px;
  color: var(--text-dim);
}

.stop-visual {
  min-width: 0;
}

/* Browser frame for the two external shots. The bar with the real hostname is what makes a
   dark BuilderHunt hero read as "their site" on this light page rather than as a black
   rectangle. The image is captured at exactly the frame's ratio (scripts/capture-shots.mjs),
   so nothing is cropped in CSS and the frame shows what was captured. */
.frame {
  display: block;
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-lg);
  overflow: hidden;
  background: var(--surface);
  box-shadow: var(--shadow-1);
  text-decoration: none;
  transition:
    transform 0.3s cubic-bezier(0.16, 1, 0.3, 1),
    box-shadow 0.3s cubic-bezier(0.16, 1, 0.3, 1);
}

.frame:hover {
  transform: translateY(-3px);
  box-shadow: var(--shadow-2);
}

.frame-bar,
.latest-head {
  display: flex;
  align-items: center;
  gap: 10px;
  height: 34px;
  padding: 0 14px;
  background: var(--surface-2);
  border-bottom: 1px solid var(--line);
  font-family: var(--font-mono);
  font-size: 11px;
  color: var(--text-dim);
}

.frame-dots {
  display: inline-flex;
  gap: 5px;
}

.frame-dots span {
  width: 8px;
  height: 8px;
  border-radius: 50%;
  background: var(--line-strong);
}

.frame-url {
  flex: 1;
  text-align: center;
  /* Keep the hostname clear of the dots when the frame is narrow. */
  padding-right: 34px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.frame img {
  display: block;
  width: 100%;
  height: auto;
  aspect-ratio: 2160 / 1110;
  object-fit: cover;
  object-position: left top;
}

/* The live list on the "here" stop: same frame language as the shots, with real titles
   inside instead of pixels. */
.latest {
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-lg);
  overflow: hidden;
  background: var(--surface);
  box-shadow: var(--shadow-1);
}

.latest-head {
  justify-content: space-between;
  text-transform: uppercase;
  letter-spacing: 0.04em;
}

.latest-date {
  text-transform: none;
  letter-spacing: 0;
}

.latest-list {
  position: relative;
  list-style: none;
  margin: 0;
  padding: 0;
}

.latest-item + .latest-item {
  border-top: 1px solid var(--line);
}

.latest-link {
  display: flex;
  align-items: center;
  gap: 14px;
  /* Fixed row height, not min-height: the rotation lifts the leaving row out of flow and
     the three that stay slide by exactly one row, which only lines up if every row is the
     same height. Two lines of 14.5/13px type plus padding. */
  height: 66px;
  padding: 0 16px;
  color: var(--text);
  text-decoration: none;
  transition: background-color 0.15s;
}

a.latest-link:hover {
  background: var(--accent-a05);
}

/* Title over a one-line excerpt. The scrape keeps titles as the poster wrote them, and a
   one-word title ("Type") on its own reads as a broken row; the excerpt underneath says what
   it is. */
.latest-text {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
  gap: 3px;
}

.latest-title,
.latest-excerpt {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.latest-title {
  font-size: 14.5px;
  font-weight: 500;
  line-height: 1.35;
}

.latest-excerpt {
  font-size: 12.5px;
  line-height: 1.35;
  color: var(--text-dim);
}

.latest-link .chip {
  flex: none;
}

.latest-empty {
  margin: 0;
  padding: 20px 16px;
  font-size: 14px;
  color: var(--text-dim);
}

/* One swap every 3.5s: the leaving row is lifted out of flow so the three that stay slide
   up into place and the newcomer fades in at the bottom, with the list never changing
   height. */
.latest-move,
.latest-enter-active,
.latest-leave-active {
  transition:
    transform 0.5s cubic-bezier(0.16, 1, 0.3, 1),
    opacity 0.35s ease;
}

.latest-enter-from {
  opacity: 0;
  transform: translateY(10px);
}

.latest-leave-to {
  opacity: 0;
  transform: translateY(-10px);
}

.latest-leave-active {
  position: absolute;
  left: 0;
  right: 0;
}

/* Loading: four rows the height of the real ones, so the list does not jump when the index
   arrives. */
.skeleton-line {
  display: block;
  width: 62%;
  height: 11px;
  border-radius: 6px;
  background: linear-gradient(90deg, var(--surface-2) 25%, var(--line) 50%, var(--surface-2) 75%);
  background-size: 200% 100%;
  animation: shimmer 1.4s linear infinite;
}

.latest-item:nth-child(2) .skeleton-line {
  width: 78%;
}

.latest-item:nth-child(3) .skeleton-line {
  width: 55%;
}

.latest-item:nth-child(4) .skeleton-line {
  width: 70%;
}

.skeleton-line.is-dim {
  width: 84%;
  height: 9px;
  opacity: 0.7;
}

@keyframes shimmer {
  from {
    background-position: 200% 0;
  }

  to {
    background-position: -200% 0;
  }
}

@media (prefers-reduced-motion: reduce) {
  .frame,
  .latest-move,
  .latest-enter-active,
  .latest-leave-active {
    transition: none;
  }

  .frame:hover {
    transform: none;
  }

  .skeleton-line {
    animation: none;
  }
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

@media (max-width: 768px) {
  /* Single column under the rail: number and copy side by side, the visual below the copy
     in the same column. The node shrinks to 28px, so the rail moves with its centre. */
  .stop {
    grid-template-columns: 28px minmax(0, 1fr);
    column-gap: 16px;
    padding-bottom: 40px;
  }

  .stop-n {
    width: 28px;
    height: 28px;
    font-size: 10.5px;
  }

  .stop:not(:last-child)::before {
    left: 13px;
    top: 22px;
    bottom: -22px;
  }

  .stop-visual {
    grid-column: 2;
  }
}

@media (max-width: 700px) {
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
}
</style>
