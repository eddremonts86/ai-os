<script setup lang="ts">
import { ref, computed, onMounted, watch } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { loadPlans } from '@/data/load';
import {
  searchAndFilter,
  sortPlans,
  countByCategory,
  countByTags,
  countByTech,
  countByCountry,
  EMPTY_FILTERS,
  type SearchFilters,
} from '@/lib/search';
import type { Plan, SortKey } from '@/types';
import PlanCard from '@/components/PlanCard.vue';
import FacetPanel from '@/components/FacetPanel.vue';
import IncomeRangeSlider from '@/components/IncomeRangeSlider.vue';

const route = useRoute();
const router = useRouter();

const plans = ref<Plan[]>([]);
const loading = ref(true);
const error = ref<string | null>(null);

const query = ref(String(route.query.q ?? ''));
const categories = ref<string[]>(parseList(route.query.cat));
const tags = ref<string[]>(parseList(route.query.tag));
const techs = ref<string[]>(parseList(route.query.tech));
const countries = ref<string[]>(parseList(route.query.country));
const hasWtpOnly = ref(route.query.wtp === '1');
const wtpRange = ref<[number, number]>([
  parseInt(String(route.query.wtpMin ?? '0'), 10) || 0,
  parseInt(String(route.query.wtpMax ?? '5000'), 10) || 5000,
]);
const sortKey = ref<SortKey>((route.query.sort as SortKey) || 'money-desc');

function parseList(v: unknown): string[] {
  if (!v) return [];
  return String(v).split(',').map((s) => s.trim()).filter(Boolean);
}

// Debounced URL sync
let syncTimer: ReturnType<typeof setTimeout> | null = null;
function syncUrl() {
  if (syncTimer) clearTimeout(syncTimer);
  syncTimer = setTimeout(() => {
    router.replace({
      query: {
        ...(query.value ? { q: query.value } : {}),
        ...(categories.value.length ? { cat: categories.value.join(',') } : {}),
        ...(tags.value.length ? { tag: tags.value.join(',') } : {}),
        ...(techs.value.length ? { tech: techs.value.join(',') } : {}),
        ...(countries.value.length ? { country: countries.value.join(',') } : {}),
        ...(hasWtpOnly.value ? { wtp: '1' } : {}),
        ...(wtpRange.value[0] !== 0 || wtpRange.value[1] !== 5000
          ? { wtpMin: String(wtpRange.value[0]), wtpMax: String(wtpRange.value[1]) }
          : {}),
        ...(sortKey.value !== 'money-desc' ? { sort: sortKey.value } : {}),
      },
    });
  }, 150);
}

watch([query, categories, tags, techs, countries, hasWtpOnly, wtpRange, sortKey], syncUrl, { deep: true });

const filters = computed<SearchFilters>(() => ({
  query: query.value,
  categories: categories.value,
  tags: tags.value,
  tech: techs.value,
  countries: countries.value,
  hasWtpOnly: hasWtpOnly.value,
  wtpRange: wtpRange.value[0] === 0 && wtpRange.value[1] === 5000 ? null : wtpRange.value,
}));

const results = computed(() => sortPlans(searchAndFilter(plans.value, filters.value), sortKey.value));

// Facet data (counts computed on the unfiltered set so the panel reflects the full corpus).
const categoryOptions = computed(() => [...countByCategory(plans.value).entries()].sort((a, b) => b[1] - a[1]));
const tagOptions = computed(() => [...countByTags(plans.value).entries()].sort((a, b) => b[1] - a[1]).slice(0, 20));
const techOptions = computed(() => [...countByTech(plans.value).entries()].sort((a, b) => b[1] - a[1]).slice(0, 20));
const countryOptions = computed(() => [...countByCountry(plans.value).entries()].sort((a, b) => b[1] - a[1]));

function clearAll() {
  query.value = '';
  categories.value = [];
  tags.value = [];
  techs.value = [];
  countries.value = [];
  hasWtpOnly.value = false;
  wtpRange.value = [0, 5000];
  sortKey.value = 'money-desc';
}

// Mobile filter disclosure. On a phone the sidebar rendered as a 732px nested
// scroller stacked ABOVE the results, so the whole first screen was filters and
// zero plans. Collapsed by default there; always open from the tablet breakpoint up.
const filtersOpen = ref(false);

// Shown on the toggle so a collapsed panel never hides the fact that filters are
// active — the results count alone does not tell you why it is 12 instead of 525.
const activeFilterCount = computed(() =>
  categories.value.length +
  tags.value.length +
  techs.value.length +
  countries.value.length +
  (hasWtpOnly.value ? 1 : 0) +
  (wtpRange.value[0] !== 0 || wtpRange.value[1] !== 5000 ? 1 : 0) +
  (query.value ? 1 : 0),
);

const SORT_OPTIONS: { value: SortKey; label: string }[] = [
  { value: 'money-desc', label: 'Money score ↓' },
  { value: 'learn-desc', label: 'Learn score ↓' },
  { value: 'fun-desc', label: 'Fun score ↓' },
  { value: 'mrrMid-desc', label: 'Income ↓' },
  { value: 'date-desc', label: 'Newest' },
  { value: 'title-asc', label: 'Title A–Z' },
];

async function load() {
  loading.value = true;
  error.value = null;
  try {
    plans.value = await loadPlans();
  } catch (e) {
    error.value = e instanceof Error ? e.message : String(e);
  } finally {
    loading.value = false;
  }
}

onMounted(load);
</script>

<template>
  <div class="layout">
    <!-- Search sits outside the disclosure: it is the primary filter and must stay
         reachable when the panel is collapsed on mobile. -->
    <div class="search-wrap">
      <input
        v-model="query"
        type="search"
        name="q"
        class="search-input"
        placeholder="Search title, problem, tags…"
        aria-label="Search plans"
      />
    </div>

    <!-- Mobile-only disclosure for the rest of the filters -->
    <button
      class="filters-toggle"
      type="button"
      :aria-expanded="filtersOpen"
      aria-controls="facet-panel"
      @click="filtersOpen = !filtersOpen"
    >
      <span>{{ filtersOpen ? 'Hide filters' : 'Filters' }}</span>
      <span v-if="activeFilterCount" class="filters-badge">{{ activeFilterCount }}</span>
    </button>

    <!-- Sidebar with facets -->
    <aside id="facet-panel" class="facets" :class="{ 'is-open': filtersOpen }">
      <FacetPanel
        title="Category"
        :count="categoryOptions.length"
        :options="categoryOptions"
        :selected="categories"
        @update:selected="categories = $event"
      />
      <FacetPanel
        title="Tags"
        :count="tagOptions.length"
        :options="tagOptions"
        :selected="tags"
        @update:selected="tags = $event"
      />
      <FacetPanel
        title="Tech"
        :count="techOptions.length"
        :options="techOptions"
        :selected="techs"
        @update:selected="techs = $event"
      />
      <FacetPanel
        title="Country"
        :count="countryOptions.length"
        :options="countryOptions"
        :selected="countries"
        @update:selected="countries = $event"
      />

      <IncomeRangeSlider v-model="wtpRange" :max="5000" />

      <div class="wtp-only">
        <label>
          <input type="checkbox" v-model="hasWtpOnly" name="wtp-only" />
          <span>Plans with stated income only</span>
        </label>
      </div>

      <button class="clear-btn" @click="clearAll">clear all filters</button>
    </aside>

    <!-- Results -->
    <section class="results">
      <header class="results-header">
        <h1 class="sr-only">Plans</h1>
        <div class="results-summary" role="status" aria-live="polite">
          <strong>{{ results.length }}</strong>
          <span> of </span>
          <strong>{{ plans.length }}</strong>
          <span> plans</span>
        </div>
        <div class="sort-wrap">
          <label class="sort-label">
            <span>Sort by</span>
            <select v-model="sortKey" name="sort">
              <option v-for="opt in SORT_OPTIONS" :key="opt.value" :value="opt.value">{{ opt.label }}</option>
            </select>
          </label>
        </div>
      </header>

      <div v-if="loading" class="empty-state">
        <p>Loading plans…</p>
      </div>
      <div v-else-if="error" class="empty-state" role="alert">
        <h2>Couldn't load the plans</h2>
        <p>{{ error }}</p>
        <button class="retry-btn" @click="load">Try again</button>
      </div>
      <div v-else-if="results.length === 0" class="empty-state">
        <h2>No plans match these filters</h2>
        <p>Try clearing some filters or searching for something broader.</p>
        <button class="clear-btn" @click="clearAll">clear all filters</button>
      </div>
      <div v-else class="card-grid">
        <PlanCard v-for="p in results" :key="p.id" :plan="p" />
      </div>
    </section>
  </div>
</template>

<style scoped>
.layout {
  display: grid;
  grid-template-columns: 240px 1fr;
  grid-template-areas:
    'search results'
    'facets results';
  /* min-content on row 1 is load-bearing: .results spans both rows and is ~50,000px
     tall, and without this the browser splits that height across the two rows —
     row 1 became 24,470px, stretching the search box and pushing the whole filter
     sidebar 24,565px down the page where nobody would ever find it. */
  grid-template-rows: min-content 1fr;
  align-content: start;
  gap: 12px 24px;
  max-width: 1280px;
  margin: 0 auto;
  padding: 16px 24px 48px;
}

.search-wrap {
  grid-area: search;
}

.facets {
  grid-area: facets;
}

.results {
  grid-area: results;
}


.filters-toggle {
  display: none;
}

.facets {
  position: sticky;
  top: 60px;
  align-self: start;
  /* dvh, not vh: vh counts the mobile browser chrome, so the panel claimed more
     height than was actually visible. */
  max-height: calc(100dvh - 80px);
  overflow-y: auto;
  padding-right: 8px;
}



.search-input {
  width: 100%;
  padding: 8px 12px;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  color: var(--text);
  font-size: 13px;
  transition: border-color 150ms;
}

.search-input:focus {
  border-color: var(--accent);
}

.wtp-only {
  padding: 12px 0;
  border-bottom: 1px solid var(--line);
}

.wtp-only label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  cursor: pointer;
}

.wtp-only input[type='checkbox'] {
  accent-color: var(--accent);
}

.clear-btn {
  width: 100%;
  margin-top: 12px;
  padding: 8px;
  background: var(--surface-2);
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  color: var(--text-dim);
  font-size: 12px;
  cursor: pointer;
  transition: color 150ms, border-color 150ms;
}

.clear-btn:hover {
  color: var(--accent);
  border-color: var(--accent);
}

.results {
  min-width: 0;
}

.results-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 16px;
  gap: 12px;
  flex-wrap: wrap;
}

.results-summary {
  font-size: 14px;
  color: var(--text-dim);
}

.results-summary strong {
  color: var(--text);
}

.sort-label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 12px;
  color: var(--text-dim);
}

.sort-label select {
  padding: 6px 10px;
  background: var(--surface);
  border: 1px solid var(--line);
  border-radius: var(--radius-md);
  color: var(--text);
  font-size: 13px;
  cursor: pointer;
}

.sort-label select:focus {
  border-color: var(--accent);
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 12px;
}
/* ---------- Mobile ---------- *
 * Last in the file on purpose: these override the desktop rules above at
 * equal specificity, so source order is what makes them win.
 */
@media (max-width: 768px) {
  .layout {
    grid-template-columns: 1fr;
    grid-template-areas:
      'search'
      'toggle'
      'facets'
      'results';
    padding-top: 12px;
  }

  .filters-toggle {
    grid-area: toggle;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    width: 100%;
    min-height: 44px;
    padding: 10px 16px;
    background: var(--surface);
    border: 1px solid var(--line);
    border-radius: var(--radius-md);
    color: var(--text);
    font-size: 15px;
    font-weight: 500;
  }

  .filters-badge {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 22px;
    height: 22px;
    padding: 0 6px;
    border-radius: 999px;
    background: var(--accent);
    color: #fff;
    font-size: 12px;
    font-weight: 600;
    font-variant-numeric: tabular-nums;
  }

  /* Collapsed by default, and no nested scroll region when open: the panel grows
     inline and the page scrolls, which is what a phone expects. */
  .facets {
    display: none;
    position: static;
    max-height: none;
    overflow-y: visible;
    padding-right: 0;
    margin-top: 12px;
  }

  .facets.is-open {
    display: block;
  }

}

</style>
