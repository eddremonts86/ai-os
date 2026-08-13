<script setup lang="ts">
import { computed } from 'vue';
import type { Plan } from '@/types';
import ScoreBadge from './ScoreBadge.vue';
import WtpBadge from './WtpBadge.vue';

const props = defineProps<{
  plan: Plan;
}>();

const visibleTags = computed(() => props.plan.tags.slice(0, 3));
const extraTags = computed(() => Math.max(0, props.plan.tags.length - 3));

const countryFlag = computed(() => {
  if (!props.plan.country) return null;
  // Map common country names to flag emoji (regional indicator pairs).
  const m: Record<string, string> = {
    Russia: '🇷🇺', USA: '🇺🇸', UK: '🇬🇧', Serbia: '🇷🇸', Georgia: '🇬🇪',
    Hungary: '🇭🇺', Estonia: '🇪🇪', Greece: '🇬🇷', Argentina: '🇦🇷',
    Colombia: '🇨🇴', Andorra: '🇦🇩', Spain: '🇪🇸', Germany: '🇩🇪',
    France: '🇫🇷', Italy: '🇮🇹', Brazil: '🇧🇷', Mexico: '🇲🇽',
  };
  return m[props.plan.country] ?? '🌍';
});
</script>

<template>
  <article class="plan-card">
    <header class="card-header">
      <span class="chip is-accent">{{ plan.category }}</span>
      <span v-for="t in visibleTags" :key="t" class="chip">{{ t }}</span>
      <span v-if="extraTags > 0" class="chip">+{{ extraTags }}</span>
    </header>

    <h2 class="card-title">
      <RouterLink :to="`/plans/${plan.id}`">{{ plan.title }}</RouterLink>
    </h2>

    <p class="card-excerpt">{{ plan.excerpt }}</p>

    <footer class="card-footer">
      <div class="card-meta">
        <span v-if="plan.country" class="meta-item">
          <span class="flag" aria-hidden="true">{{ countryFlag }}</span>
          {{ plan.country }}
        </span>
        <span v-if="plan.tech.length" class="meta-item tech" :title="plan.tech.join(', ')">
          {{ plan.tech.slice(0, 2).join(' + ') }}
          <span v-if="plan.tech.length > 2" class="tech-more">+{{ plan.tech.length - 2 }}</span>
        </span>
        <WtpBadge v-if="plan.wtp" :wtp="plan.wtp" size="sm" />
      </div>

      <div class="card-scores">
        <ScoreBadge kind="money" :score="plan.scores.money" size="sm" />
        <ScoreBadge kind="learn" :score="plan.scores.learn" size="sm" />
        <ScoreBadge kind="fun" :score="plan.scores.fun" size="sm" />
        <a
          v-if="plan.sourceUrl"
          :href="plan.sourceUrl"
          target="_blank"
          rel="noopener"
          class="link-out"
          :aria-label="`Open the original post for ${plan.title} in a new tab`"
        >
          <span aria-hidden="true">↗</span>
        </a>
      </div>
    </footer>
  </article>
</template>

<style scoped>
.plan-card {
  display: flex;
  flex-direction: column;
  gap: 12px;
  padding: 16px;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: var(--radius-lg);
  transition: transform 200ms ease-out, border-color 200ms ease-out, box-shadow 200ms ease-out;
}

.plan-card:hover {
  transform: translateY(-2px);
  /* Full accent, not a 30% tint: the tint measured 1.43:1 on --surface, and with
     reduced motion removing the transform this border is the only hover feedback. */
  border-color: var(--accent);
  box-shadow: var(--shadow-2);
}

.card-header {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
}

.card-title {
  margin: 0;
  font-size: 16px;
  font-weight: 600;
  letter-spacing: -0.01em;
  line-height: 1.35;
  color: var(--text);
}

.card-title a {
  text-decoration: none;
  color: inherit;
}

.card-title a:hover {
  color: var(--accent-text);
}

.card-excerpt {
  margin: 0;
  font-size: 13px;
  line-height: 1.5;
  color: var(--text-dim);
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
  min-height: 2.6em;
}

.card-footer {
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 8px;
  flex-wrap: wrap;
  margin-top: auto;
}

.card-meta {
  display: flex;
  flex-wrap: wrap;
  gap: 6px;
  align-items: center;
  font-size: 12px;
  color: var(--text-dim);
}

.meta-item {
  display: inline-flex;
  align-items: center;
  gap: 4px;
}

.flag {
  font-size: 13px;
}

.tech {
  padding: 3px 8px;
  background: var(--surface-2);
  border-radius: var(--radius-sm);
  border: 1px solid var(--line);
}

.tech-more {
  margin-left: 2px;
  opacity: 0.6;
}

.card-scores {
  display: flex;
  gap: 4px;
  align-items: center;
}

.link-out {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  /* 44px hit area, visually unchanged: the glyph is 14px and the box around it
     is transparent until hover. */
  min-width: 44px;
  min-height: 44px;
  margin: -10px -8px -10px 0;
  color: var(--text-dim);
  text-decoration: none;
  font-size: 14px;
  border-radius: var(--radius-sm);
  transition: color 150ms, background 150ms;
}

.link-out:hover {
  color: var(--accent-text);
  background: var(--surface-2);
}
</style>
