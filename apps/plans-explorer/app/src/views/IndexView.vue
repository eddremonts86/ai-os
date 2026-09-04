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
import FilterMenu from '@/components/FilterMenu.vue';
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

// Drives the "Clear all" pill: it only appears when there is something to clear.
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

// The sort menu is the same FacetPanel as the filters, in single mode. It speaks labels, the
// URL speaks keys; these two translate. The pill shows the current label so the choice is
// readable without opening anything.
const sortOptions = computed(() => SORT_OPTIONS.map((o) => [o.label, null] as [string, number | null]));
const sortLabel = computed(() => SORT_OPTIONS.find((o) => o.value === sortKey.value)?.label ?? SORT_OPTIONS[0].label);
function setSortByLabel(label: string | undefined) {
  const hit = SORT_OPTIONS.find((o) => o.label === label);
  if (hit) sortKey.value = hit.value;
}

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
    <!--
      Filter bar, sticky under the header. Search first because it is the primary filter;
      then one pill per dimension, each opening its own panel. The sidebar this replaced put
      four scrolling checklists in a 240px column and took a grid column with it.
    -->
    <div class="filter-bar" role="search" aria-label="Filter plans">
      <input
        v-model="query"
        type="search"
        name="q"
        class="search-input"
        placeholder="Search title, problem, tags…"
        aria-label="Search plans"
      />

      <div class="filter-menus">
        <FilterMenu label="Category" :active="categories.length" menu-id="menu-category">
          <FacetPanel
            headless
            title="Category"
            :count="categoryOptions.length"
            :options="categoryOptions"
            :selected="categories"
            @update:selected="categories = $event"
          />
        </FilterMenu>
        <FilterMenu label="Tags" :active="tags.length" menu-id="menu-tags">
          <FacetPanel
            headless
            title="Tags"
            :count="tagOptions.length"
            :options="tagOptions"
            :selected="tags"
            @update:selected="tags = $event"
          />
        </FilterMenu>
        <FilterMenu label="Tech" :active="techs.length" menu-id="menu-tech">
          <FacetPanel
            headless
            title="Tech"
            :count="techOptions.length"
            :options="techOptions"
            :selected="techs"
            @update:selected="techs = $event"
          />
        </FilterMenu>
        <FilterMenu label="Country" :active="countries.length" menu-id="menu-country">
          <FacetPanel
            headless
            title="Country"
            :count="countryOptions.length"
            :options="countryOptions"
            :selected="countries"
            @update:selected="countries = $event"
          />
        </FilterMenu>
        <FilterMenu
          label="Income"
          :active="(hasWtpOnly ? 1 : 0) + (wtpRange[0] !== 0 || wtpRange[1] !== 5000 ? 1 : 0)"
          menu-id="menu-income"
        >
          <div class="income-menu">
            <IncomeRangeSlider v-model="wtpRange" :max="5000" headless />
            <label class="wtp-only">
              <input type="checkbox" v-model="hasWtpOnly" name="wtp-only" />
              <span>Plans with stated income only</span>
            </label>
          </div>
        </FilterMenu>

        <button v-if="activeFilterCount" type="button" class="clear-btn" @click="clearAll">
          Clear all
        </button>
      </div>

      <!-- Count and sort live in the same bar: one strip above the grid, not two. -->
      <div class="bar-end">
        <div class="results-summary" role="status" aria-live="polite">
          <strong>{{ results.length }}</strong>
          <span> of </span>
          <strong>{{ plans.length }}</strong>
          <span> plans</span>
        </div>
        <FilterMenu v-slot="{ close }" :label="`Sort: ${sortLabel}`" menu-id="menu-sort">
          <FacetPanel
            headless
            single
            title="Sort"
            :count="SORT_OPTIONS.length"
            :options="sortOptions"
            :selected="[sortLabel]"
            @update:selected="setSortByLabel($event[0]); close()"
          />
        </FilterMenu>
      </div>
    </div>

    <!-- Results -->
    <section class="results">
      <h1 class="sr-only">Plans</h1>

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
  max-width: 1280px;
  margin: 0 auto;
  padding: 0 24px 48px;
}

/* ---------- filter bar ---------- */

.filter-bar {
  position: sticky;
  top: var(--header-h);
  /* Above the cards it scrolls over, below the header (z 10). Its open panel inherits this
     stacking context, which is what lets a panel paint over the grid. */
  z-index: 9;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 10px 12px;
  padding: 12px 0;
  /* Same translucent idiom as the header: cards scrolling under it stay faintly visible. */
  background: color-mix(in srgb, var(--bg) 86%, transparent);
  backdrop-filter: blur(8px);
}

@supports not (backdrop-filter: blur(8px)) {
  .filter-bar {
    background: var(--bg);
  }
}

.search-input {
  flex: 1 1 260px;
  max-width: 420px;
  min-height: 40px;
  padding: 8px 16px;
  background: var(--surface);
  border: 1px solid var(--line-strong);
  border-radius: var(--radius-pill);
  color: var(--text);
  font-size: 14px;
  box-shadow: var(--shadow-1);
  transition: border-color 150ms;
}

.search-input::placeholder {
  color: var(--text-dim);
}

.search-input:focus {
  border-color: var(--accent);
}

.filter-menus {
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  gap: 8px;
}

.income-menu {
  min-width: 300px;
}

/* Same row as a facet option, so the panel reads as one list: control, label, 44px target,
   hover wash. */
.wtp-only {
  display: flex;
  align-items: center;
  gap: 10px;
  min-height: 44px;
  margin-top: 4px;
  padding: 4px 8px;
  border-radius: var(--radius-sm);
  font-size: 13px;
  cursor: pointer;
  transition: background 100ms;
}

.wtp-only:hover {
  background: var(--surface-2);
}

.wtp-only input[type='checkbox'] {
  width: 16px;
  height: 16px;
  margin: 0;
  accent-color: var(--accent);
}

.clear-btn {
  min-height: 40px;
  padding: 0 14px;
  background: transparent;
  border: 1px solid transparent;
  border-radius: var(--radius-pill);
  color: var(--text-dim);
  font-size: 13.5px;
  font-weight: 500;
  cursor: pointer;
  transition: color 150ms, background 150ms;
}

.clear-btn:hover {
  color: var(--text);
  background: var(--surface-2);
}

/* ---------- results ---------- */

.results {
  min-width: 0;
  padding-top: 12px;
}

.bar-end {
  display: flex;
  align-items: center;
  gap: 14px;
  margin-left: auto;
}

.results-summary {
  font-size: 14px;
  color: var(--text-dim);
}

.results-summary strong {
  color: var(--text);
}

.card-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 16px;
}

/* The corpus renders every match at once — hundreds of cards, tens of thousands of DOM nodes.
   `content-visibility: auto` lets the browser skip style, layout and paint for cards outside
   the viewport while keeping every one of them in the DOM, so the result count and the
   filtered set stay exact. A JS virtualiser would also cut the node count, but it costs a
   dependency and AGENTS.md caps the bundle and rules out UI kits.
   Note this trades RENDER work, not DOM weight. Caveat: skipped subtrees are excluded from
   `innerText`, so any check that reads document text will under-report.
   contain-intrinsic-size seeds the placeholder height. Use the measured mean ROW height, not
   the median card height: grid rows size to their tallest card, and seeding the median card
   inflated the page by 34%, so the scrollbar visibly shrank as cards realised. The `auto`
   keyword makes the browser remember each card's real size once rendered. */
.card-grid > * {
  content-visibility: auto;
  contain-intrinsic-size: auto 271px;
}

/* ---------- narrow ---------- */

@media (max-width: 768px) {
  .layout {
    padding: 0 16px 40px;
  }

  .filter-bar {
    padding: 10px 0;
  }

  .search-input {
    flex-basis: 100%;
    max-width: none;
  }

  /* Pills wrap rather than scroll sideways: an overflow container would clip the panels. */
  .filter-menus {
    width: 100%;
  }

  .bar-end {
    width: 100%;
    margin-left: 0;
    justify-content: space-between;
  }
}
</style>
