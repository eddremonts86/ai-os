<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { loadPlans, loadPlanDocument } from '@/data/load';
import type { Plan, PlanDocument } from '@/types';
import ScoreBadge from '@/components/ScoreBadge.vue';
import WtpBadge from '@/components/WtpBadge.vue';
import MarkdownReader from '@/components/MarkdownReader.vue';
import DocTabs, { type DocKey } from '@/components/DocTabs.vue';

const route = useRoute();
const router = useRouter();

const id = computed(() => String(route.params.id ?? ''));

const plan = ref<Plan | null>(null);
const docs = ref<PlanDocument | null>(null);
const loading = ref(true);
// A missing id and a failed fetch are different problems with different
// recoveries; reporting both as "Plan not found" sent users hunting for a typo
// when the real cause was the network.
const notFound = ref(false);
const error = ref<string | null>(null);
const activeTab = ref<DocKey>('SPEC');

async function loadAll(planId: string) {
  loading.value = true;
  error.value = null;
  notFound.value = false;
  plan.value = null;
  docs.value = null;
  try {
    const plans = await loadPlans();
    const found = plans.find((p) => p.id === planId);
    if (!found) {
      notFound.value = true;
      return;
    }
    plan.value = found;
    docs.value = await loadPlanDocument(planId);
    // Default tab = first available
    const d = docs.value ?? {};
    const firstAvailable = (['SPEC', 'PRODUCT', 'PLAN', 'DESIGN', 'TASKS'] as DocKey[]).find(
      (k) => typeof d[k] === 'string'
    );
    if (firstAvailable) activeTab.value = firstAvailable;
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e);
  } finally {
    loading.value = false;
  }
}

onMounted(() => loadAll(id.value));
watch(() => id.value, (newId) => loadAll(newId));

const available = computed(() => {
  const d = docs.value ?? {};
  return {
    SPEC: typeof d.SPEC === 'string',
    PRODUCT: typeof d.PRODUCT === 'string',
    PLAN: typeof d.PLAN === 'string',
    DESIGN: typeof d.DESIGN === 'string',
    TASKS: typeof d.TASKS === 'string',
  };
});

const activeSource = computed(() => {
  const d = docs.value ?? {};
  return d[activeTab.value] ?? '';
});

// Architecture diagrams served as self-contained HTML files under
// public/projects/<id>-<slug>/assets/*.html. The list comes from the indexer
// (plan.assets), not a HEAD request — the Vite dev server returns 200 + the
// SPA shell for any missing path, which made every candidate name appear to
// exist and rendered 6 wrong iframes per plan.
const planAssets = computed(() => plan.value?.assets ?? []);

// The sidebar link used to assert "View on ProblemHunt" for every plan, including the 267 whose
// url is reddit.com. Prefer the recorded source name; fall back to the host so a plan with no
// name still gets an honest label rather than a wrong one.
const sourceLabel = computed(() => {
  const name = plan.value?.sourceName;
  if (name && name !== 'manual') return name;
  const url = plan.value?.sourceUrl;
  if (!url) return 'source';
  try {
    return new URL(url).hostname.replace(/^www\./, '');
  } catch {
    return 'source';
  }
});

const countryFlag = computed(() => {
  const c = plan.value?.country;
  if (!c) return null;
  const m: Record<string, string> = {
    Russia: '🇷🇺', USA: '🇺🇸', UK: '🇬🇧', Serbia: '🇷🇸', Georgia: '🇬🇪',
    Hungary: '🇭🇺', Estonia: '🇪🇪', Greece: '🇬🇷', Argentina: '🇦🇷',
    Colombia: '🇨🇴', Andorra: '🇦🇩', Spain: '🇪🇸', Germany: '🇩🇪',
    France: '🇫🇷', Italy: '🇮🇹', Brazil: '🇧🇷', Mexico: '🇲🇽',
  };
  return m[c] ?? '🌍';
});

function goBack() {
  router.push({ path: '/plans' });
}
</script>

<template>
  <div class="plan-layout">
    <article class="plan-main">
      <button class="back-btn" @click="goBack">← All plans</button>

      <div v-if="loading" class="empty-state">
        <p>Loading plan…</p>
      </div>
      <div v-else-if="notFound" class="empty-state" role="alert">
        <h2>Plan not found</h2>
        <p>The plan id <code>{{ id }}</code> does not exist in the corpus.</p>
        <button class="back-btn" @click="goBack">← All plans</button>
      </div>
      <div v-else-if="error" class="empty-state" role="alert">
        <h2>Couldn't load this plan</h2>
        <p>{{ error }}</p>
        <button class="retry-btn" @click="loadAll(id)">Try again</button>
      </div>
      <template v-else-if="plan">
        <header class="plan-header">
          <div class="header-meta">
            <span class="chip is-accent">{{ plan.category }}</span>
            <span v-for="t in plan.tags" :key="t" class="chip">{{ t }}</span>
          </div>
          <h1 class="plan-title">{{ plan.title }}</h1>
        </header>

        <DocTabs :available="available" v-model:active="activeTab" />

        <MarkdownReader :source="activeSource" />

        <section v-if="planAssets.length" class="assets-section">
          <h2 class="assets-title">Architecture diagrams</h2>
          <div v-for="asset in planAssets" :key="asset" class="asset-frame-wrap">
            <iframe
              :src="`./projects/${plan.id}-${plan.slug}/assets/${asset}`"
              class="asset-frame"
              :title="asset"
              loading="lazy"
              sandbox="allow-same-origin"
            ></iframe>
          </div>
        </section>

        <section v-if="plan.originalExcerpt" class="original-section">
          <h2 class="original-title">Original problem (from source)</h2>
          <p class="original-text">{{ plan.originalExcerpt }}</p>
        </section>
      </template>
    </article>

    <aside v-if="plan" class="plan-sidebar">
      <section class="sidebar-section">
        <h3 class="sidebar-title">Scores</h3>
        <div class="sidebar-scores">
          <ScoreBadge kind="money" :score="plan.scores.money" />
          <ScoreBadge kind="learn" :score="plan.scores.learn" />
          <ScoreBadge kind="fun" :score="plan.scores.fun" />
        </div>
      </section>

      <section class="sidebar-section">
        <h3 class="sidebar-title">Income</h3>
        <WtpBadge v-if="plan.wtp" :wtp="plan.wtp" />
        <p v-else class="sidebar-empty">not stated</p>
      </section>

      <section v-if="plan.country" class="sidebar-section">
        <h3 class="sidebar-title">Country</h3>
        <p class="sidebar-value">
          <span class="flag">{{ countryFlag }}</span>
          {{ plan.country }}
        </p>
      </section>

      <section v-if="plan.tech.length" class="sidebar-section">
        <h3 class="sidebar-title">Tech</h3>
        <div class="sidebar-chips">
          <span v-for="t in plan.tech" :key="t" class="chip">{{ t }}</span>
        </div>
      </section>

      <section v-if="plan.date" class="sidebar-section">
        <h3 class="sidebar-title">Date</h3>
        <p class="sidebar-value">{{ plan.date }}</p>
      </section>

      <section v-if="plan.sourceUrl" class="sidebar-section">
        <h3 class="sidebar-title">Source</h3>
        <a :href="plan.sourceUrl" target="_blank" rel="noopener" class="sidebar-link">
          ↗ View on {{ sourceLabel }}
        </a>
      </section>

      <section class="sidebar-section">
        <h3 class="sidebar-title">Download</h3>
        <a
          :href="`./data/zips/${plan.id}.zip`"
          :download="`plan-${plan.id}-${plan.slug}.zip`"
          class="sidebar-link download-btn"
        >
          ↓ Download plan (.zip)
        </a>
        <p class="sidebar-empty download-hint">
          SPEC.md + PRODUCT.md + PLAN.md + DESIGN.md + TASKS.md + README.
        </p>
      </section>
    </aside>
  </div>
</template>

<style scoped>
.plan-layout {
  display: grid;
  grid-template-columns: minmax(0, 1fr) 280px;
  gap: 32px;
  max-width: 1200px;
  margin: 0 auto;
  padding: 24px;
}

@media (max-width: 900px) {
  .plan-layout {
    grid-template-columns: 1fr;
  }
}

.plan-main {
  min-width: 0;
}

.plan-sidebar {
  position: sticky;
  top: 60px;
  align-self: start;
  min-width: 0;
  max-width: 100%;
  overflow: hidden;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  padding: 16px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.back-btn {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 6px 10px;
  margin-bottom: 16px;
  background: none;
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  color: var(--text-dim);
  font-size: 13px;
  cursor: pointer;
  transition: color 150ms, border-color 150ms;
}

.back-btn:hover {
  color: var(--accent-text);
  border-color: var(--accent);
}

.plan-header {
  margin-bottom: 16px;
}

.header-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  margin-bottom: 12px;
}

.plan-title {
  margin: 0;
  font-size: 26px;
  font-weight: 700;
  letter-spacing: -0.02em;
  line-height: 1.25;
  color: var(--text);
}

.assets-section {
  margin-top: 32px;
}

.assets-title {
  font-size: 14px;
  font-weight: 600;
  letter-spacing: 0.04em;
  text-transform: uppercase;
  color: var(--text-muted);
  margin: 0 0 16px;
}

.asset-frame-wrap {
  margin-bottom: 24px;
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  overflow: hidden;
  background: var(--paper, #08090e);
}

.asset-frame {
  display: block;
  width: 100%;
  height: 720px;
  border: 0;
}

.original-section {
  margin-top: 32px;
  padding: 16px;
  background: var(--surface);
  /* Was a 3px accent-2 slab on the left edge. The block is already distinguished
     by its own surface, its eyebrow heading and its position; the slab only added
     the tell. */
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-md);
}

.original-title {
  margin: 0 0 8px;
  font-size: 12px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: var(--accent-2);
}

.original-text {
  margin: 0;
  font-size: 14px;
  line-height: 1.6;
  color: var(--text);
}

.sidebar-section {
  display: flex;
  flex-direction: column;
  gap: 6px;
}

.sidebar-title {
  margin: 0;
  font-size: 11px;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.06em;
  color: var(--text-dim);
}

.sidebar-value {
  margin: 0;
  font-size: 13px;
  color: var(--text);
}

.sidebar-empty {
  margin: 0;
  font-size: 13px;
  color: var(--text-dim);
  font-style: italic;
}

.sidebar-scores {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
}

.sidebar-chips {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
  min-width: 0;
}

.sidebar-chips .chip {
  font-size: 11px;
  max-width: 100%;
  overflow-wrap: anywhere;
  word-break: break-word;
}

.flag {
  margin-right: 4px;
}

.sidebar-link {
  color: var(--accent-text);
  text-decoration: none;
  font-size: 13px;
  border-bottom: 1px solid transparent;
  transition: border-color 150ms;
}

.sidebar-link:hover {
  border-bottom-color: var(--accent);
}

.download-btn {
  display: inline-flex;
  align-items: center;
  gap: 4px;
  padding: 8px 12px;
  background: var(--surface-2);
  border: 1px solid var(--accent);
  border-radius: var(--radius-md);
  color: var(--accent-text);
  font-weight: 500;
  transition: background 150ms, color 150ms;
}

.download-btn:hover {
  background: var(--accent);
  color: var(--bg);
  border-bottom-color: var(--accent);
}

.download-hint {
  margin-top: 4px;
  font-size: 11px;
}
</style>
