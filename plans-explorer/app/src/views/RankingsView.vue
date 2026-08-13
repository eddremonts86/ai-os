<script setup lang="ts">
import { ref, computed, onMounted } from 'vue';
import { loadPlans, loadRankings } from '@/data/load';
import type { Plan, Rankings, RankEntry } from '@/types';
import ScoreBadge from '@/components/ScoreBadge.vue';
import WtpBadge from '@/components/WtpBadge.vue';

const plans = ref<Plan[]>([]);
const rankings = ref<Rankings | null>(null);
const loading = ref(true);
const error = ref<string | null>(null);

const planById = computed(() => {
  const map = new Map<string, Plan>();
  for (const p of plans.value) map.set(p.id, p);
  return map;
});

// Build an "appears in N rankings" set so we can badge cross-ranking plans.
const multiRankedIds = computed(() => {
  if (!rankings.value) return new Set<string>();
  const counts = new Map<string, number>();
  for (const k of ['money', 'learn', 'fun'] as const) {
    for (const r of rankings.value[k]) counts.set(r.id, (counts.get(r.id) ?? 0) + 1);
  }
  return new Set([...counts.entries()].filter(([, n]) => n >= 2).map(([id]) => id));
});

const COLUMNS: { key: 'money' | 'learn' | 'fun'; title: string; emoji: string; description: string }[] = [
  { key: 'money', title: 'Real Revenue Potential', emoji: '💰', description: 'Plans with the clearest path to paying customers and real revenue.' },
  { key: 'learn', title: 'Learning Potential', emoji: '🧠', description: 'Plans that force hands-on work with bleeding-edge tech you can\u2019t fake.' },
  { key: 'fun', title: 'Fun to Build', emoji: '🎮', description: 'Plans with novel mechanics, sharp design constraints, or demo-worthy hooks.' },
];

function planFor(entry: RankEntry): Plan | undefined {
  return planById.value.get(entry.id);
}

function rankIn(kind: 'money' | 'learn' | 'fun', id: string): number {
  if (!rankings.value) return 0;
  const arr = rankings.value[kind];
  const idx = arr.findIndex((r) => r.id === id);
  return idx === -1 ? 0 : idx + 1;
}

async function load() {
  loading.value = true;
  error.value = null;
  try {
    const [p, r] = await Promise.all([loadPlans(), loadRankings()]);
    plans.value = p;
    rankings.value = r;
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e);
  } finally {
    loading.value = false;
  }
}

onMounted(load);
</script>

<template>
  <div class="rankings-page">
    <header class="rankings-header">
      <h1 class="page-title">Top 5 rankings</h1>
      <p class="page-subtitle">
        Auto-ranked from <code>projects/TOP_PROJECTS.md</code>. Updated by the
        <code>problemhunt-scraper</code> cron. Plans that appear in multiple rankings are
        marked with a badge.
      </p>
    </header>

    <div v-if="loading" class="empty-state">
      <p>Loading rankings…</p>
    </div>
    <div v-else-if="error" class="empty-state" role="alert">
      <h2>Couldn't load the rankings</h2>
      <p>{{ error }}</p>
      <button class="retry-btn" @click="load">Try again</button>
    </div>
    <div v-else-if="rankings" class="rankings-grid">
      <section v-for="col in COLUMNS" :key="col.key" class="rank-column">
        <header class="column-header">
          <div class="column-title">
            <span class="emoji" aria-hidden="true">{{ col.emoji }}</span>
            <h2>{{ col.title }}</h2>
          </div>
          <p class="column-description">{{ col.description }}</p>
        </header>

        <ol class="rank-list">
          <li v-for="entry in rankings[col.key]" :key="entry.id" class="rank-item">
            <div class="rank-number">{{ rankIn(col.key, entry.id) }}</div>

            <div class="rank-content">
              <div class="rank-header">
                <RouterLink :to="`/plans/${entry.id}`" class="rank-title">
                  {{ planFor(entry)?.title ?? `Plan ${entry.id}` }}
                </RouterLink>
                <span
                  v-if="multiRankedIds.has(entry.id)"
                  class="rank-badge is-multi"
                  :title="'appears in multiple rankings'"
                >
                  ⭐ in {{ [col.key, ...(['money', 'learn', 'fun'] as const).filter(k => k !== col.key && rankings && rankings[k].some(r => r.id === entry.id))].join(' + ') }}
                </span>
              </div>

              <p class="rank-hook">{{ entry.hook }}</p>

              <div v-if="planFor(entry)" class="rank-meta">
                <ScoreBadge :kind="col.key" :score="entry.score" />
                <ScoreBadge kind="money" :score="planFor(entry)!.scores.money" size="sm" />
                <ScoreBadge kind="learn" :score="planFor(entry)!.scores.learn" size="sm" />
                <ScoreBadge kind="fun" :score="planFor(entry)!.scores.fun" size="sm" />
                <WtpBadge v-if="planFor(entry)?.wtp" :wtp="planFor(entry)!.wtp" size="sm" />
                <a
                  v-if="planFor(entry)?.sourceUrl"
                  :href="planFor(entry)?.sourceUrl ?? undefined"
                  target="_blank"
                  rel="noopener"
                  class="link-out"
                >↗</a>
              </div>
            </div>
          </li>
        </ol>
      </section>
    </div>
  </div>
</template>

<style scoped>
.rankings-page {
  max-width: 1280px;
  margin: 0 auto;
  padding: 16px 24px 64px;
}

.rankings-header {
  margin-bottom: 24px;
}

.rankings-header .page-title {
  margin-top: 16px;
}

.rankings-header code {
  font-family: var(--font-mono);
  font-size: 0.9em;
  padding: 1px 6px;
  background: var(--surface-2);
  border-radius: 4px;
  color: var(--accent);
}

.rankings-grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 20px;
}

@media (max-width: 1024px) {
  .rankings-grid {
    grid-template-columns: 1fr;
  }
}

.rank-column {
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  padding: 20px;
  display: flex;
  flex-direction: column;
  gap: 16px;
}

.column-header {
  border-bottom: 1px solid var(--line);
  padding-bottom: 12px;
}

.column-title {
  display: flex;
  align-items: center;
  gap: 8px;
}

.column-title h2 {
  margin: 0;
  font-size: 16px;
  font-weight: 700;
  letter-spacing: -0.01em;
  color: var(--text);
}

.emoji {
  font-size: 18px;
}

.column-description {
  margin: 4px 0 0;
  font-size: 12px;
  color: var(--text-dim);
  line-height: 1.5;
}

.rank-list {
  list-style: none;
  padding: 0;
  margin: 0;
  display: flex;
  flex-direction: column;
  gap: 12px;
  counter-reset: rank;
}

.rank-item {
  display: grid;
  grid-template-columns: 32px 1fr;
  gap: 12px;
  padding: 12px;
  background: var(--surface-2);
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  transition: border-color 150ms, transform 150ms;
}

.rank-item:hover {
  border-color: rgba(124, 92, 255, 0.3);
  transform: translateX(2px);
}

.rank-number {
  font-family: var(--font-mono);
  font-size: 22px;
  font-weight: 700;
  color: var(--accent);
  line-height: 1;
  text-align: center;
}

.rank-content {
  display: flex;
  flex-direction: column;
  gap: 6px;
  min-width: 0;
}

.rank-header {
  display: flex;
  align-items: center;
  gap: 6px;
  flex-wrap: wrap;
}

.rank-title {
  color: var(--text);
  font-size: 14px;
  font-weight: 600;
  text-decoration: none;
  line-height: 1.35;
  flex: 1;
  min-width: 0;
}

.rank-title:hover {
  color: var(--accent);
}

.rank-badge.is-multi {
  display: inline-flex;
  align-items: center;
  padding: 2px 8px;
  border-radius: 999px;
  background: rgba(245, 165, 36, 0.1);
  border: 1px solid rgba(245, 165, 36, 0.3);
  color: var(--warn);
  font-size: 10px;
  font-weight: 600;
  white-space: nowrap;
}

.rank-hook {
  margin: 0;
  font-size: 12px;
  color: var(--text-dim);
  line-height: 1.5;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.rank-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 4px;
  align-items: center;
  margin-top: 2px;
}

.link-out {
  color: var(--text-dim);
  text-decoration: none;
  font-size: 12px;
  padding: 2px 4px;
  border-radius: var(--radius-sm);
}

.link-out:hover {
  color: var(--accent);
  background: var(--surface);
}
</style>
