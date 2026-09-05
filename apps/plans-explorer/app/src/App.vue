<script setup lang="ts">
import { ref, onMounted } from 'vue';
import { RouterView, RouterLink } from 'vue-router';
import { loadPlans, loadIndexedAt } from '@/data/load';
import BrandMark from '@/components/BrandMark.vue';

// The footer used to hardcode "525 plans" and print `new Date()` as the index
// date, so it always claimed the corpus was indexed today. Both now come from
// the generated manifest, and render as nothing rather than as a guess.
const planCount = ref<number | null>(null);
const indexedAt = ref<string | null>(null);

onMounted(async () => {
  try {
    const [plans, at] = await Promise.all([loadPlans(), loadIndexedAt()]);
    planCount.value = plans.length;
    indexedAt.value = at;
  } catch {
    // Footer metadata is decorative; the views surface load failures themselves.
  }
});
</script>

<template>
  <div class="app-shell">
    <a class="skip-link" href="#main">Skip to content</a>

    <header class="app-header">
      <RouterLink to="/" class="brand">
        <BrandMark />
        <span class="brand-text">Plansmith</span>
      </RouterLink>
      <nav class="app-nav" aria-label="Main">
        <RouterLink to="/plans" active-class="is-active">Plans</RouterLink>
        <RouterLink to="/rankings" active-class="is-active">Rankings</RouterLink>
        <RouterLink to="/submit" active-class="is-active">Submit</RouterLink>
        <RouterLink to="/about" active-class="is-active">About</RouterLink>
      </nav>
    </header>

    <main id="main" class="app-main">
      <RouterView v-slot="{ Component }">
        <Transition name="fade" mode="out-in">
          <component :is="Component" />
        </Transition>
      </RouterView>
    </main>

    <!-- Footer: brand and a one-line tagline, the four routes, and where else to go. The
         meta line keeps what the old one-liner carried, from the generated index, never a
         guess. Column labels are paragraphs, not headings, so the outline stays the page's. -->
    <footer class="app-footer">
      <div class="container foot-grid">
        <div class="foot-brand">
          <RouterLink to="/" class="brand">
            <BrandMark />
            <span class="brand-text">Plansmith</span>
          </RouterLink>
          <p class="foot-tag">Product plans written from real problems people post. Free, no account.</p>
        </div>

        <nav class="foot-col" aria-label="Footer">
          <p class="foot-head">Explore</p>
          <RouterLink to="/plans">Plans</RouterLink>
          <RouterLink to="/rankings">Rankings</RouterLink>
          <RouterLink to="/submit">Submit a problem</RouterLink>
          <RouterLink to="/about">About</RouterLink>
        </nav>

        <div class="foot-col">
          <p class="foot-head">Elsewhere</p>
          <a href="https://builderhunt.dev" target="_blank" rel="noopener">BuilderHunt<span class="ext" aria-hidden="true">↗</span></a>
          <a href="https://hunterready.eduardoinerarte.dk" target="_blank" rel="noopener">HunterReady<span class="ext" aria-hidden="true">↗</span></a>
          <a href="https://github.com/eddremonts86/ai-os" target="_blank" rel="noopener">Source on GitHub<span class="ext" aria-hidden="true">↗</span></a>
          <a href="https://ai-os.eduardoinerarte.dk/" target="_blank" rel="noopener">Part of AI-OS<span class="ext" aria-hidden="true">↗</span></a>
        </div>
      </div>

      <div class="container foot-meta">
        <span>
          <template v-if="planCount !== null">{{ planCount }} plans</template>
          <template v-else>Plans</template>
          <template v-if="indexedAt"> · indexed {{ indexedAt }}</template>
        </span>
        <span>The problems are other people's. The plans are free.</span>
      </div>
    </footer>
  </div>
</template>

<style scoped>
.app-shell {
  min-height: 100vh;
  min-height: 100dvh;
  display: flex;
  flex-direction: column;
}

.app-header {
  position: sticky;
  top: 0;
  z-index: 10;
  display: flex;
  align-items: center;
  justify-content: space-between;
  height: var(--header-h);
  padding: 0 24px;
  /* Translucent so the backdrop-filter below actually has something to blur — it
     was sitting on an opaque --surface, making it a compositing layer that blurred
     nothing. color-mix keeps it tied to the token instead of a second literal. */
  background: color-mix(in srgb, var(--surface) 82%, transparent);
  border-bottom: 1px solid var(--line);
  backdrop-filter: blur(8px);
}

/* No backdrop-filter support: fall back to the opaque surface rather than a
   see-through header over scrolling cards. */
@supports not (backdrop-filter: blur(8px)) {
  .app-header {
    background: var(--surface);
  }
}

.brand {
  display: flex;
  align-items: center;
  gap: 10px;
  /* Do not wrap: at 375px the nav squeezed this to "AI-OS / Plans / Explorer"
     across three lines. min-width:0 lets it shrink; the label truncates instead. */
  flex: 0 1 auto;
  min-width: 0;
  text-decoration: none;
  color: var(--text);
  font-weight: 600;
  letter-spacing: -0.01em;
  white-space: nowrap;
}

.brand-text {
  overflow: hidden;
  text-overflow: ellipsis;
}

.app-nav {
  flex: none;
}

.brand-text {
  font-size: 16px;
  font-weight: 650;
  letter-spacing: -0.02em;
}

/* Segmented control, not a row of links: one grey pill holds the items and the active one
   sits on a white pill with a resting shadow. Same idiom as the doc tabs' segmented look in
   the reference UIs, and it reads as "you are here" without a colour the eye has to decode. */
.app-nav {
  display: flex;
  gap: 2px;
  padding: 4px;
  background: var(--surface-2);
  border-radius: var(--radius-pill);
}

.app-nav a {
  padding: 7px 14px;
  border-radius: var(--radius-pill);
  color: var(--text-dim);
  text-decoration: none;
  font-size: 14px;
  font-weight: 500;
  transition: color 150ms, background 150ms, box-shadow 150ms;
}

.app-nav a:hover {
  color: var(--text);
}

.app-nav a.is-active {
  color: var(--text);
  background: var(--surface);
  box-shadow: var(--shadow-1);
}

/* Route transition: opacity only, no movement, so reduced-motion needs no
 * special case beyond the global duration clamp. */

.app-main {
  flex: 1;
  width: 100%;
}

.app-footer {
  padding: 48px 0 28px;
  border-top: 1px solid var(--line);
  color: var(--text-dim);
  font-size: 13.5px;
}

/* Brand takes the wide share; the two link columns sit right, each as wide as its longest
   label, so the footer ends where the page content ends instead of spreading four thin
   columns across 1280px. */
.foot-grid {
  display: grid;
  grid-template-columns: minmax(0, 1fr) auto auto;
  column-gap: 72px;
  row-gap: 32px;
  align-items: start;
}

.foot-brand {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  gap: 12px;
}

.foot-tag {
  margin: 0;
  max-width: 34ch;
  line-height: 1.55;
}

.foot-col {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.foot-head {
  margin: 0 0 4px;
  font-family: var(--font-mono);
  font-size: 11px;
  letter-spacing: 0.06em;
  text-transform: uppercase;
  color: var(--text-dim);
}

.foot-col a {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  color: var(--text);
  text-decoration: none;
  font-weight: 500;
  transition: color 150ms;
}

.foot-col a:hover {
  color: var(--accent-text);
}

.ext {
  font-size: 11px;
  opacity: 0.6;
  transition: transform 150ms ease-out, opacity 150ms;
}

.foot-col a:hover .ext {
  transform: translate(1px, -1px);
  opacity: 1;
}

.foot-meta {
  display: flex;
  justify-content: space-between;
  flex-wrap: wrap;
  gap: 8px 24px;
  margin-top: 40px;
  padding-top: 20px;
  border-top: 1px solid var(--line);
  font-family: var(--font-mono);
  font-size: 12px;
}

@media (max-width: 700px) {
  /* Brand across the top, the two link columns side by side beneath it. */
  .foot-grid {
    grid-template-columns: 1fr 1fr;
    column-gap: 24px;
  }

  .foot-brand {
    grid-column: 1 / -1;
  }

  .foot-meta {
    flex-direction: column;
  }
}

@media (max-width: 560px) {
  .app-header {
    padding: 12px 16px;
  }

  /* The mark alone: with the segmented nav the wordmark truncated to "Pla…", which is worse
     than no wordmark. Visually hidden rather than display:none so the link keeps its name. */
  .app-header .brand-text {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip-path: inset(50%);
    white-space: nowrap;
  }

  .app-nav a {
    padding: 8px 10px;
  }
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 180ms ease-out;
}

.fade-enter-from,
.fade-leave-to {
  opacity: 0;
}

@media (prefers-reduced-motion: reduce) {
  .ext {
    transition: none;
  }

  .foot-col a:hover .ext {
    transform: none;
  }
}
</style>
