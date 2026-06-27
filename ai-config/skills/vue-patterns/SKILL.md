---
name: vue-patterns
description: Patrones modernos de Vue 3 — Composition API, reactivity, Pinia, Vue Router. Aplica a proyectos Vue 3, Nuxt 3+.
license: MIT
---

# Vue 3 Patterns

## Cuándo usar

Cualquier proyecto Vue 3 o Nuxt 3+. NO aplica a Vue 2 (que tiene Options API y patterns distintos).

## Principios

1. **Composition API por defecto** (no Options API).
2. **`<script setup>` siempre** (no `setup()` function).
3. **TypeScript** (`<script setup lang="ts">`).
4. **Reactivity explícita** — `ref()` para primitivos, `reactive()` para objetos.
5. **Composables** para lógica reutilizable (análogo a React hooks).

## Script setup básico

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
// ✅ ref() para primitivos Y objetos (recomendado consistente)
const count = ref(0);
const user = ref<User | null>(null);
const items = ref<Item[]>([]);

// ⚠️ reactive() solo para objetos (perdón por reactividad al destructurar)
const state = reactive({ count: 0, user: null });

// ✅ Siempre .value al usar ref en script
count.value++;
user.value = await fetchUser();

// ✅ En template, NO .value (auto-unwrap)
{{ count }}
```

## Composables (custom hooks de Vue)

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

**Reglas:**
- Nombre siempre `use*`.
- Retornar objeto con nombres semánticos.
- Aceptar `Ref<T> | T` para flexibilidad.

## Computed vs Watch

```ts
// ✅ Computed: derivar valores (cached, lazy)
const fullName = computed(() => `${user.value.firstName} ${user.value.lastName}`);
const isAdmin = computed(() => user.value?.role === 'admin');

// ✅ Watch: side effects cuando algo cambia
watch(user, (newUser) => {
  if (newUser) localStorage.setItem('lastUser', newUser.id);
}, { deep: true });

// ✅ watchEffect: side effect con deps automáticas
watchEffect(() => {
  if (user.value) document.title = user.value.name;
});
```

## Provide / Inject (en lugar de prop drilling)

```vue
<!-- Parent -->
<script setup lang="ts">
import { provide, ref } from 'vue';

const theme = ref<'light' | 'dark'>('light');
provide('theme', theme);
</script>

<!-- Child (cualquier nivel) -->
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
<!-- Componente -->
<script setup lang="ts">
import { useUserStore } from '@/stores/user';
import { storeToRefs } from 'pinia';

const userStore = useUserStore();
const { currentUser, isAuthenticated } = storeToRefs(userStore);
// Actions sin storeToRefs
const { login, logout } = userStore;
</script>
```

**Reglas:**
- Setup syntax (no Options syntax).
- `storeToRefs` para reactivity preservada.
- Actions destructurados directo del store.

## Vue Router (composición)

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
// ✅ With type-only declaration (recomendado)
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

## v-model custom

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

<!-- Uso -->
<CustomInput v-model="searchQuery" />
```

## Templates — Directivas comunes

```vue
<!-- v-if / v-else-if / v-else -->
<div v-if="isLoading">Loading...</div>
<div v-else-if="error">Error: {{ error.message }}</div>
<div v-else>{{ data }}</div>

<!-- v-for con key -->
<li v-for="item in items" :key="item.id">
  {{ item.name }}
</li>

<!-- v-bind:class (objeto) -->
<div :class="{ active: isActive, disabled: !enabled }">

<!-- v-bind:class (array) -->
<div :class="[baseClass, { active: isActive }]">

<!-- v-bind:style (objeto) -->
<div :style="{ color: textColor, fontSize: `${size}px` }">

<!-- v-on abreviado -->
<button @click="handleClick">

<!-- v-model con modificadores -->
<input v-model.trim="name" />
<form @submit.prevent="onSubmit">
```

## Lifecycle hooks

```vue
<script setup lang="ts">
import { onMounted, onBeforeUnmount, onUpdated } from 'vue';

onMounted(() => {
  // Componente montado, DOM listo
});

onBeforeUnmount(() => {
  // Cleanup
});

onUpdated(() => {
  // Después de re-render
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

Nuxt auto-importa: composables, components, utils. No necesitas importarlos.

```vue
<script setup lang="ts">
// No hace falta: import { ref, computed } from 'vue';
// No hace falta: import CustomButton from '~/components/CustomButton.vue';

const count = ref(0);  // auto-imported from vue
</script>

<template>
  <CustomButton />  <!-- auto-imported from components/ -->
</template>
```

## Nuxt 3 — Data fetching

```vue
<script setup lang="ts">
// useFetch: automático en SSR
const { data: user, error, pending, refresh } = await useFetch(`/api/users/${id}`);

// useAsyncData: control total
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

## Errores comunes

1. ❌ Olvidar `.value` en script → ✅ `count.value++` (no `count++`).
2. ❌ Destructurar reactive object (pierde reactividad) → ✅ `storeToRefs` para Pinia, `toRefs` para reactive.
3. ❌ Mutación directa de reactive object → ✅ siempre reemplazar.
4. ❌ `v-if` con `v-for` en mismo elemento → ✅ usar `template` wrapper o computed.
5. ❌ `index` como key → ✅ ID estable.
6. ❌ Olvidar `<Suspense>` con async components → ✅ wrappear siempre.
7. ❌ Usar Options API → ✅ siempre `<script setup>` + Composition API.
8. ❌ Watch sin `immediate` cuando necesita valor inicial → ✅ `immediate: true`.
9. ❌ Provide sin default value → ✅ provide default para type safety.
10. ❌ Mutations reactivas fuera de actions de Pinia → ✅ mutaciones en actions.

## Stack complementario

- **Routing:** Vue Router 4 o Nuxt 3 file-based.
- **State:** Pinia.
- **Forms:** VeeValidate + Zod, o VueUse + manual.
- **UI:** Nuxt UI, shadcn-vue, PrimeVue, Naive UI.
- **Testing:** Vitest + Vue Test Utils + Playwright.