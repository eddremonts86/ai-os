---
name: react-patterns
description: Advanced React 18+ patterns — hooks, Suspense, Server Components, composition, performance. Applies to any modern React project (Vite, Next.js, Remix).
license: MIT
---

# React Patterns (18+)

## When to use

Any React 18+ project that uses hooks, TypeScript, and wants modern composition, data fetching and performance patterns.

## Fundamental principles

1. **Composition over configuration** — prefer small, composed components.
2. **Colocation** — what changes together, lives together (hook + component in same file if exclusive).
3. **Server-first** (when applicable) — prefer Server Components/Routes over Client.
4. **Strict TypeScript** — `strict: true`, `noUncheckedIndexedAccess: true`.

## Composition patterns

### Compound components

```tsx
// ✅ For UI kits with parts that are always used together
function Card({ children }: { children: React.ReactNode }) {
  return <div className="card">{children}</div>;
}

Card.Header = function CardHeader({ children }: { children: React.ReactNode }) {
  return <div className="card-header">{children}</div>;
};

Card.Body = function CardBody({ children }: { children: React.ReactNode }) {
  return <div className="card-body">{children}</div>;
};

// Usage:
<Card>
  <Card.Header>Title</Card.Header>
  <Card.Body>Content</Card.Body>
</Card>
```

### Render props / Function as children

```tsx
// ✅ For components that expose data/actions to the consumer
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
// ✅ More explicit than "children only"
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

## Hooks — Custom hook patterns

### Golden rules

1. **Always start with `use`** (linter requires it).
2. **Do NOT call hooks conditionally** (rules of hooks).
3. **One hook = one responsibility**.
4. **Return object with semantic names**, not array (unless it's a stable tuple).

### Hook with cleanup

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

### Hook with internal reducer

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

### Hook with context

```tsx
const ThemeContext = createContext<Theme | null>(null);

export function useTheme(): Theme {
  const ctx = useContext(ThemeContext);
  if (!ctx) throw new Error('useTheme must be used within ThemeProvider');
  return ctx;
}
```

## Data fetching — Patterns

### TanStack Query (preferred)

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

### SWR (alternative)

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

### Memoization (use with care)

```tsx
// ✅ Only when:
// 1. Component receives props that change frequently
// 2. Component renders expensively (long list, calculations)
// 3. React DevTools Profiler shows it's worth it

const ExpensiveList = memo(function ExpensiveList({ items }: Props) {
  return items.map(item => <Item key={item.id} {...item} />);
});

// For callbacks:
const handleClick = useCallback((id: string) => {
  setItems(prev => prev.filter(i => i.id !== id));
}, []);
```

**Anti-patterns:**
- ❌ `useMemo` on trivial operations (sum of two numbers).
- ❌ `memo` on components that ALWAYS re-render due to parent.
- ❌ `useCallback` without correct dependencies → subtle bugs.

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

See `react-hook-form-zod` (installed skill) — preferred pattern.

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

**Rules:**
- Test behavior, not implementation.
- Queries by `getByRole`, `getByLabelText` (accessibility-friendly).
- Mock `fetch` with MSW, not `vi.fn()` for API calls.

## Accessibility

```tsx
// ✅ Use semantic elements
<button onClick={handleClick}>Click me</button>
// ❌ NO
<div onClick={handleClick}>Click me</div>

// ✅ Associated labels
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// ✅ aria-* only when semantic HTML is not enough
<button aria-label="Close modal" aria-expanded={isOpen}>X</button>
```

## Common mistakes

1. ❌ `useEffect` for data fetching → ✅ TanStack Query / SWR / RSC.
2. ❌ `useEffect` to derive state → ✅ direct calculation or `useMemo`.
3. ❌ `props drilling` > 3 levels → ✅ Context, Zustand, or composition.
4. ❌ `index` as key in lists → ✅ stable ID (`item.id`).
5. ❌ `setState` directly in render → ✅ `useEffect` or event handler.
6. ❌ `any` in types → ✅ `unknown` + type guard.
7. ❌ Direct state mutation → ✅ always new object/array.
8. ❌ Forgetting `key` in lists → ✅ always stable key.
9. ❌ Side effects in pure render → ✅ inside `useEffect`.
10. ❌ Mixing server and client state without separation → ✅ query (server) ≠ useState (local UI).

## Recommended complementary stack

- **Routing:** TanStack Router or Next.js App Router.
- **Forms:** react-hook-form + Zod.
- **Server state:** TanStack Query.
- **Client state:** Zustand.
- **UI:** shadcn/ui (Radix + Tailwind).
- **Tables:** TanStack Table.
- **Testing:** Vitest + React Testing Library + MSW + Playwright.