---
name: vue-patterns
description: Modern Vue 3 patterns — Composition API, reactivity, Pinia, Vue Router. Applies to Vue 3 projects, Nuxt 3+.
license: MIT
---

# Vue 3 Patterns

## When to use

Any Vue 3 or Nuxt 3+ project. Does NOT apply to Vue 2 (which has Options API and different patterns).

## Principles

1. **Composition API by default** (not Options API).
2. **`<script setup>` always** (not `setup()` function).
3. **TypeScript** (`<script setup lang="ts">`).
4. **Explicit reactivity** — `ref()` for primitives, `reactive()` for objects.
5. **Composables** for reusable logic (analogous to React hooks).

## Basic script setup

```vue
<script setup lang="ts">
import { ref, computed, watch } from 'vue';

interface Props {
  userId: string;
  size?: 'sm' | 'md' | 'lg';
}

const props = withDefaults(defineProps<Props>(), {
  size: 'md',
});

const emit = defineEmits<{
  select: [id: string];
}>();

const user = ref<User | null>(null);
const isLoading = ref(true);

const displayName = computed(() => user.value?.name ?? 'Unknown');

async function loadUser() {
  isLoading.value = true;
  user.value = await api.users.get(props.userId);
  isLoading.value = false;
}

watch(() => props.userId, loadUser, { immediate: true });
</script>

<template>
  <div v-if="isLoading">Loading...</div>
  <div v-else @click="emit('select', user.id)">
    {{ displayName }}
  </div>
</template>
```

## Ref vs Reactive

```ts
// ✅ ref() for primitives AND objects (consistent recommendation)
const count = ref(0);
const user = ref<User | null>(null);
const items = ref<Item[]>([]);

// ⚠️ reactive() only for objects (loses reactivity on destructuring)
const state = reactive({ count: 0, user: null });

// ✅ Always .value when using ref in script
count.value++;
user.value = await fetchUser();

// ✅ In template, NO .value (auto-unwrap)
{{ count }}
```

## Composables (Vue's custom hooks)

```ts
// composables/useUser.ts
import { ref, watchEffect } from 'vue';

export function useUser(id: Ref<string> | string) {
  const userId = computed(() => typeof id === 'string' ? id : id.value);
  const user = ref<User | null>(null);
  const error = ref<Error | null>(null);
  const isLoading = ref(false);

  async function fetchUser() {
    isLoading.value = true;
    error.value = null;
    try {
      user.value = await api.users.get(userId.value);
    } catch (e) {
      error.value = e as Error;
    } finally {
      isLoading.value = false;
    }
  }

  watchEffect(() => {
    if (userId.value) fetchUser();
  });

  return { user, error, isLoading, refresh: fetchUser };
}
```

**Rules:**
- Name always `use*`.
- Return an object with semantic names.
- Accept `Ref<T> | T` for flexibility.

## Computed vs Watch

```ts
// ✅ Computed: derive values (cached, lazy)
const fullName = computed(() => `${user.value.firstName} ${user.value.lastName}`);
const isAdmin = computed(() => user.value?.role === 'admin');

// ✅ Watch: side effects when something changes
watch(user, (newUser) => {
  if (newUser) localStorage.setItem('lastUser', newUser.id);
}, { deep: true });

// ✅ watchEffect: side effect with automatic deps
watchEffect(() => {
  if (user.value) document.title = user.value.name;
});
```

## Provide / Inject (instead of prop drilling)

```vue
<!-- Parent -->
<script setup lang="ts">
import { provide, ref } from 'vue';

const theme = ref<'light' | 'dark'>('light');
provide('theme', theme);
</script>

<!-- Child (any level) -->
<script setup lang="ts">
import { inject } from 'vue';

const theme = inject<Ref<'light' | 'dark'>>('theme', ref('light'));
</script>
```

## Pinia (state management)

```ts
// stores/user.ts
import { defineStore } from 'pinia';

export const useUserStore = defineStore('user', () => {
  const currentUser = ref<User | null>(null);
  const isAuthenticated = computed(() => currentUser.value !== null);
  
  async function login(email: string, password: string) {
    currentUser.value = await api.auth.login(email, password);
  }
  
  function logout() {
    currentUser.value = null;
  }
  
  return { currentUser, isAuthenticated, login, logout };
});
```

```vue
<!-- Component -->
<script setup lang="ts">
import { useUserStore } from '@/stores/user';
import { storeToRefs } from 'pinia';

const userStore = useUserStore();
const { currentUser, isAuthenticated } = storeToRefs(userStore);
// Actions without storeToRefs
const { login, logout } = userStore;
</script>
```

**Rules:**
- Setup syntax (not Options syntax).
- `storeToRefs` to preserve reactivity.
- Actions destructured directly from the store.

## Vue Router (composition)

```ts
import { useRoute, useRouter } from 'vue-router';

const route = useRoute();
const router = useRouter();

// Access params
const userId = computed(() => route.params.id as string);

// Navigate
function goToProfile(id: string) {
  router.push({ name: 'profile', params: { id } });
}
```

## DefineProps / DefineEmits (TypeScript)

```vue
<script setup lang="ts">
// ✅ With type-only declaration (recommended)
const props = defineProps<{
  user: User;
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
}>();

const emit = defineEmits<{
  select: [id: string];
  delete: [id: string];
}>();

// ✅ With defaults
const props = withDefaults(defineProps<{
  size?: 'sm' | 'md' | 'lg';
}>(), {
  size: 'md',
});
</script>
```

## Custom v-model

```vue
<!-- CustomInput.vue -->
<script setup lang="ts">
const props = defineProps<{ modelValue: string }>();
const emit = defineEmits<{ 'update:modelValue': [value: string] }>();

function onInput(e: Event) {
  emit('update:modelValue', (e.target as HTMLInputElement).value);
}
</script>

<template>
  <input :value="modelValue" @input="onInput" />
</template>

<!-- Usage -->
<CustomInput v-model="searchQuery" />
```

## Templates — Common directives

```vue
<!-- v-if / v-else-if / v-else -->
<div v-if="isLoading">Loading...</div>
<div v-else-if="error">Error: {{ error.message }}</div>
<div v-else>{{ data }}</div>

<!-- v-for with key -->
<li v-for="item in items" :key="item.id">
  {{ item.name }}
</li>

<!-- v-bind:class (object) -->
<div :class="{ active: isActive, disabled: !enabled }">

<!-- v-bind:class (array) -->
<div :class="[baseClass, { active: isActive }]">

<!-- v-bind:style (object) -->
<div :style="{ color: textColor, fontSize: `${size}px` }">

<!-- v-on shorthand -->
<button @click="handleClick">

<!-- v-model with modifiers -->
<input v-model.trim="name" />
<form @submit.prevent="onSubmit">
```

## Lifecycle hooks

```vue
<script setup lang="ts">
import { onMounted, onBeforeUnmount, onUpdated } from 'vue';

onMounted(() => {
  // Component mounted, DOM ready
});

onBeforeUnmount(() => {
  // Cleanup
});

onUpdated(() => {
  // After re-render
});
</script>
```

## Suspense (async components)

```vue
<template>
  <Suspense>
    <template #default>
      <AsyncUserProfile :user-id="id" />
    </template>
    <template #fallback>
      <Skeleton />
    </template>
  </Suspense>
</template>
```

## Nuxt 3 — Auto-imports

Nuxt auto-imports: composables, components, utils. You don't need to import them.

```vue
<script setup lang="ts">
// Not needed: import { ref, computed } from 'vue';
// Not needed: import CustomButton from '~/components/CustomButton.vue';

const count = ref(0);  // auto-imported from vue
</script>

<template>
  <CustomButton />  <!-- auto-imported from components/ -->
</template>
```

## Nuxt 3 — Data fetching

```vue
<script setup lang="ts">
// useFetch: automatic in SSR
const { data: user, error, pending, refresh } = await useFetch(`/api/users/${id}`);

// useAsyncData: full control
const { data, error } = await useAsyncData('users', () => $fetch('/api/users'));
</script>
```

## Nuxt 3 — Server routes

```ts
// server/api/users.get.ts
export default defineEventHandler(async (event) => {
  const session = await getUserSession(event);
  if (!session.user) throw createError({ statusCode: 401 });
  
  return await db.users.findMany({ where: { tenant: session.user.tenantId } });
});
```

## Testing (Vitest + Vue Test Utils)

```ts
import { mount } from '@vue/test-utils';
import { describe, it, expect } from 'vitest';
import UserCard from './UserCard.vue';

describe('UserCard', () => {
  it('renders user name', () => {
    const wrapper = mount(UserCard, {
      props: { user: mockUser },
    });
    expect(wrapper.text()).toContain('John');
  });

  it('emits select event on click', async () => {
    const wrapper = mount(UserCard, {
      props: { user: mockUser },
    });
    await wrapper.trigger('click');
    expect(wrapper.emitted('select')).toEqual([['123']]);
  });
});
```

## Common mistakes

1. ❌ Forgetting `.value` in script → ✅ `count.value++` (not `count++`).
2. ❌ Destructuring a reactive object (loses reactivity) → ✅ `storeToRefs` for Pinia, `toRefs` for reactive.
3. ❌ Directly mutating a reactive object → ✅ always replace.
4. ❌ `v-if` with `v-for` on the same element → ✅ use a `template` wrapper or computed.
5. ❌ `index` as key → ✅ stable ID.
6. ❌ Forgetting `<Suspense>` with async components → ✅ always wrap.
7. ❌ Using Options API → ✅ always `<script setup>` + Composition API.
8. ❌ Watch without `immediate` when the initial value is needed → ✅ `immediate: true`.
9. ❌ Provide without a default value → ✅ provide a default for type safety.
10. ❌ Reactive mutations outside Pinia actions → ✅ mutations in actions.

## Complementary stack

- **Routing:** Vue Router 4 or Nuxt 3 file-based.
- **State:** Pinia.
- **Forms:** VeeValidate + Zod, or VueUse + manual.
- **UI:** Nuxt UI, shadcn-vue, PrimeVue, Naive UI.
- **Testing:** Vitest + Vue Test Utils + Playwright.
