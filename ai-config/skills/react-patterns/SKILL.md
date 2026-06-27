---
name: react-patterns
description: Patrones avanzados de React 18+ — hooks, Suspense, Server Components, composición, performance. Aplica a cualquier proyecto React moderno (Vite, Next.js, Remix).
license: MIT
---

# React Patterns (18+)

## Cuándo usar

Cualquier proyecto React 18+ que use hooks, TypeScript, y quiera patrones modernos de composición, data fetching y performance.

## Principios fundamentales

1. **Composición sobre configuración** — preferir componentes pequeños y compuestos.
2. **Colocation** — lo que cambia junto, vive junto (hook + componente en mismo archivo si es exclusivo).
3. **Server-first** (cuando aplica) — preferir Server Components/Routes sobre Client.
4. **TypeScript estricto** — `strict: true`, `noUncheckedIndexedAccess: true`.

## Patrones de composición

### Compound components

```tsx
// ✅ Para UI kits con partes que siempre se usan juntas
function Card({ children }: { children: React.ReactNode }) {
  return <div className="card">{children}</div>;
}

Card.Header = function CardHeader({ children }: { children: React.ReactNode }) {
  return <div className="card-header">{children}</div>;
};

Card.Body = function CardBody({ children }: { children: React.ReactNode }) {
  return <div className="card-body">{children}</div>;
};

// Uso:
<Card>
  <Card.Header>Title</Card.Header>
  <Card.Body>Content</Card.Body>
</Card>
```

### Render props / Function as children

```tsx
// ✅ Para componentes que exponen data/acciones al consumer
interface DataLoaderProps<T> {
  query: () => Promise<T>;
  children: (data: T) => React.ReactNode;
}

function DataLoader<T>({ query, children }: DataLoaderProps<T>) {
  const [data, setData] = useState<T | null>(null);
  useEffect(() => { query().then(setData); }, [query]);
  return data ? <>{children(data)}</> : <Spinner />;
}
```

### Children variants (slot pattern)

```tsx
// ✅ Más explícito que "children only"
interface LayoutProps {
  header: React.ReactNode;
  sidebar?: React.ReactNode;
  children: React.ReactNode;
}

function Layout({ header, sidebar, children }: LayoutProps) {
  return (
    <div className="layout">
      <header>{header}</header>
      {sidebar && <aside>{sidebar}</aside>}
      <main>{children}</main>
    </div>
  );
}
```

## Hooks — Custom hooks patterns

### Reglas de oro

1. **Siempre empezar con `use`** (linter lo requiere).
2. **NO llamar hooks condicionalmente** (regla de los hooks).
3. **Un hook = una responsabilidad**.
4. **Retornar objeto con nombres semánticos**, no array (a menos que sea tupla estable).

### Hook con cleanup

```tsx
function useEventListener<K extends keyof WindowEventMap>(
  event: K,
  handler: (e: WindowEventMap[K]) => void,
) {
  useEffect(() => {
    window.addEventListener(event, handler);
    return () => window.removeEventListener(event, handler);
  }, [event, handler]);
}
```

### Hook con reducer interno

```tsx
type State = { count: number; history: number[] };
type Action = { type: 'increment' } | { type: 'decrement' } | { type: 'reset' };

function useCounter(initial = 0) {
  const [state, dispatch] = useReducer((s: State, a: Action): State => {
    switch (a.type) {
      case 'increment': return { count: s.count + 1, history: [...s.history, s.count + 1] };
      case 'decrement': return { count: s.count - 1, history: [...s.history, s.count - 1] };
      case 'reset': return { count: initial, history: [initial] };
    }
  }, { count: initial, history: [initial] });

  return {
    count: state.count,
    history: state.history,
    increment: () => dispatch({ type: 'increment' }),
    decrement: () => dispatch({ type: 'decrement' }),
    reset: () => dispatch({ type: 'reset' }),
  };
}
```

### Hook con context

```tsx
const ThemeContext = createContext<Theme | null>(null);

export function useTheme(): Theme {
  const ctx = useContext(ThemeContext);
  if (!ctx) throw new Error('useTheme must be used within ThemeProvider');
  return ctx;
}
```

## Data fetching — Patrones

### TanStack Query (preferido)

```tsx
export function useUser(id: string) {
  return useQuery({
    queryKey: ['user', id],
    queryFn: () => api.users.get(id),
    enabled: !!id,
    staleTime: 60_000,
  });
}
```

### SWR (alternativa)

```tsx
import useSWR from 'swr';

export function useUser(id: string) {
  const { data, error, isLoading } = useSWR(`/api/users/${id}`, fetcher);
  return { user: data, error, isLoading };
}
```

### Server Component (Next.js App Router)

```tsx
// app/users/[id]/page.tsx
async function getUser(id: string) {
  const res = await fetch(`${process.env.API_URL}/users/${id}`, {
    next: { revalidate: 60 },
  });
  if (!res.ok) notFound();
  return res.json();
}

export default async function UserPage({ params }: { params: { id: string } }) {
  const user = await getUser(params.id);
  return <UserCard user={user} />;
}
```

## Suspense + Error boundaries

```tsx
import { Suspense } from 'react';
import { ErrorBoundary } from 'react-error-boundary';

function UserPage() {
  return (
    <ErrorBoundary fallback={<ErrorMessage />}>
      <Suspense fallback={<Skeleton />}>
        <UserDetails />  {/* async, will suspend */}
      </Suspense>
    </ErrorBoundary>
  );
}
```

## Performance

### Memoización (usar con cuidado)

```tsx
// ✅ Solo cuando:
// 1. Componente recibe props que cambian con frecuencia
// 2. Componente renderiza caro (lista larga, cálculos)
// 3. React DevTools Profiler muestra que vale la pena

const ExpensiveList = memo(function ExpensiveList({ items }: Props) {
  return items.map(item => <Item key={item.id} {...item} />);
});

// Para callbacks:
const handleClick = useCallback((id: string) => {
  setItems(prev => prev.filter(i => i.id !== id));
}, []);
```

**Anti-patterns:**
- ❌ `useMemo` en operaciones triviales (suma de dos números).
- ❌ `memo` en componentes que SIEMPRE re-renderizan por parent.
- ❌ `useCallback` sin dependencies correctas → bugs sutiles.

### Virtualization

```tsx
import { useVirtualizer } from '@tanstack/react-virtual';

function VirtualList({ items }: { items: Item[] }) {
  const parentRef = useRef<HTMLDivElement>(null);
  const virtualizer = useVirtualizer({
    count: items.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 50,
  });

  return (
    <div ref={parentRef} style={{ height: '400px', overflow: 'auto' }}>
      <div style={{ height: `${virtualizer.getTotalSize()}px` }}>
        {virtualizer.getVirtualItems().map(virtualItem => (
          <div key={virtualItem.key} style={{
            position: 'absolute',
            top: 0,
            left: 0,
            width: '100%',
            transform: `translateY(${virtualItem.start}px)`,
          }}>
            <Item {...items[virtualItem.index]} />
          </div>
        ))}
      </div>
    </div>
  );
}
```

### Code splitting

```tsx
import { lazy, Suspense } from 'react';

const HeavyChart = lazy(() => import('./HeavyChart'));

function Dashboard() {
  return (
    <Suspense fallback={<ChartSkeleton />}>
      <HeavyChart />
    </Suspense>
  );
}
```

## Forms

Ver `react-hook-form-zod` (skill instalada) — patrón preferido.

## Testing (Vitest + React Testing Library)

```tsx
import { render, screen, waitFor } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { describe, it, expect, vi } from 'vitest';

describe('UserCard', () => {
  it('renders user info', () => {
    render(<UserCard user={mockUser} />);
    expect(screen.getByText('John Doe')).toBeInTheDocument();
  });

  it('calls onSelect when clicked', async () => {
    const onSelect = vi.fn();
    render(<UserCard user={mockUser} onSelect={onSelect} />);
    await userEvent.click(screen.getByRole('button'));
    expect(onSelect).toHaveBeenCalledWith('123');
  });
});
```

**Reglas:**
- Test behavior, no implementación.
- Queries por `getByRole`, `getByLabelText` (accesibilidad-friendly).
- Mockear `fetch` con MSW, no `vi.fn()` para API calls.

## Accesibilidad

```tsx
// ✅ Usar elementos semánticos
<button onClick={handleClick}>Click me</button>
// ❌ NO
<div onClick={handleClick}>Click me</div>

// ✅ Labels asociados
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// ✅ aria-* solo cuando el HTML semántico no alcanza
<button aria-label="Close modal" aria-expanded={isOpen}>X</button>
```

## Errores comunes

1. ❌ `useEffect` para data fetching → ✅ TanStack Query / SWR / RSC.
2. ❌ `useEffect` para derivar state → ✅ cálculo directo o `useMemo`.
3. ❌ `props drilling` > 3 niveles → ✅ Context, Zustand, o composición.
4. ❌ `index` como key en listas → ✅ ID estable (`item.id`).
5. ❌ `setState` directo en render → ✅ `useEffect` o evento handler.
6. ❌ `any` en types → ✅ `unknown` + type guard.
7. ❌ Mutación directa de state → ✅ siempre nuevo objeto/array.
8. ❌ Olvidar `key` en listas → ✅ siempre key estable.
9. ❌ Side effects en render puro → ✅ dentro de `useEffect`.
10. ❌ Mezclar server y client state sin separar → ✅ query (server) ≠ useState (UI local).

## Stack complementario recomendado

- **Routing:** TanStack Router o Next.js App Router.
- **Forms:** react-hook-form + Zod.
- **State server:** TanStack Query.
- **State client:** Zustand.
- **UI:** shadcn/ui (Radix + Tailwind).
- **Tables:** TanStack Table.
- **Testing:** Vitest + React Testing Library + MSW + Playwright.