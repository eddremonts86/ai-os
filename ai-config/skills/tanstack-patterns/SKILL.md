---
name: tanstack-patterns
description: TanStack ecosystem patterns — Query, Router, Table, Start. Unified guide for projects using the full TanStack stack (like wave-template).
license: MIT
---

# TanStack Patterns (Unified)

## When to use

Projects using the TanStack ecosystem: Query (data), Router (file-based routing), Table (headless tables), Form (forms), Start (SSR/SSG). Particularly projects based on `wave-template`.

## TanStack Query — Data fetching

### Setup

```ts
// main.tsx (Vite + React)
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ReactQueryDevtools } from '@tanstack/react-query-devtools';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: 60_000,
      retry: (failureCount, error) => {
        if (error instanceof ApiError && error.status >= 400 && error.status < 500) return false;
        return failureCount < 3;
      },
    },
  },
});

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <RouterProvider router={router} />
      <ReactQueryDevtools initialIsOpen={false} />
    </QueryClientProvider>
  );
}
```

### Queries — Conventions

```ts
// ✅ Hierarchical query key (entity, filter, pagination)
export function useUsers(filter?: UserFilter) {
  return useQuery({
    queryKey: ['users', filter],
    queryFn: () => api.users.getAll(filter),
    staleTime: 5 * 60 * 1000,
  });
}

export function useUser(id: string) {
  return useQuery({
    queryKey: ['users', id],
    queryFn: () => api.users.get(id),
    enabled: !!id,
  });
}
```

### Mutations + invalidation

```ts
export function useUpdateUser() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (data: UpdateUserInput) => api.users.update(data.id, data),
    onSuccess: (updatedUser) => {
      // Invalidate list
      qc.invalidateQueries({ queryKey: ['users'] });
      // Optimistically update specific
      qc.setQueryData(['users', updatedUser.id], updatedUser);
    },
    onError: (error) => {
      toast.error(error.message);
    },
  });
}
```

### Infinite queries

```ts
export function useInfiniteUsers() {
  return useInfiniteQuery({
    queryKey: ['users', 'infinite'],
    queryFn: ({ pageParam = 0 }) => api.users.getAll({ offset: pageParam, limit: 20 }),
    getNextPageParam: (lastPage) => lastPage.nextOffset ?? undefined,
    initialPageParam: 0,
  });
}

// Usage
const { data, fetchNextPage, hasNextPage, isFetchingNextPage } = useInfiniteUsers();
```

### Optimistic updates

```ts
export function useToggleLike() {
  const qc = useQueryClient();
  return useMutation({
    mutationFn: (postId: string) => api.posts.like(postId),
    onMutate: async (postId) => {
      await qc.cancelQueries({ queryKey: ['post', postId] });
      const previous = qc.getQueryData<Post>(['post', postId]);
      qc.setQueryData<Post>(['post', postId], (old) =>
        old ? { ...old, liked: !old.liked, likes: old.liked ? old.likes - 1 : old.likes + 1 } : old
      );
      return { previous };
    },
    onError: (_err, postId, context) => {
      if (context?.previous) qc.setQueryData(['post', postId], context.previous);
    },
    onSettled: (_data, _err, postId) => {
      qc.invalidateQueries({ queryKey: ['post', postId] });
    },
  });
}
```

### Dependent queries

```ts
export function useUserProjects(userId: string | undefined) {
  const { data: user } = useUser(userId!);
  return useQuery({
    queryKey: ['projects', user?.orgId],
    queryFn: () => api.projects.getByOrg(user!.orgId),
    enabled: !!user?.orgId,
  });
}
```

## TanStack Router — File-based routing

### Structure

```
src/routes/
├── __root.tsx                    # Root layout
├── index.tsx                     # /
├── about.tsx                     # /about
├── users/
│   ├── index.tsx                 # /users
│   └── $userId/
│       ├── index.tsx             # /users/:userId
│       ├── edit.tsx              # /users/:userId/edit
│       └── projects/
│           └── index.tsx         # /users/:userId/projects
└── _authed/                      # Layout group (does not affect URL)
    ├── route.tsx                 # Auth check layout
    └── dashboard/
        └── index.tsx             # /dashboard (with auth guard)
```

### Loader pattern (data fetching in route)

```tsx
// routes/users/$userId/index.tsx
import { createFileRoute } from '@tanstack/react-router';

export const Route = createFileRoute('/users/$userId/')({
  loader: async ({ params }) => {
    return await api.users.get(params.userId);
  },
  component: UserPage,
  pendingComponent: () => <UserSkeleton />,
  errorComponent: ({ error }) => <ErrorMessage error={error} />,
});

function UserPage() {
  const user = Route.useLoaderData();
  return <UserCard user={user} />;
}
```

### Search params validation (Zod)

```tsx
export const Route = createFileRoute('/users/')({
  validateSearch: (search) => z.object({
    page: z.number().int().positive().default(1),
    filter: z.string().optional(),
  }).parse(search),
});

function UsersPage() {
  const { page, filter } = Route.useSearch();
  const navigate = Route.useNavigate();
  
  return (
    <>
      <input
        value={filter ?? ''}
        onChange={(e) => navigate({ search: { page: 1, filter: e.target.value } })}
      />
      <UserList page={page} filter={filter} />
    </>
  );
}
```

### Auth-guarded routes

```tsx
// routes/_authed/route.tsx
export const Route = createFileRoute('/_authed')({
  beforeLoad: async ({ location }) => {
    const session = await getSession();
    if (!session) {
      throw redirect({
        to: '/login',
        search: { redirect: location.href },
      });
    }
    return { session };
  },
});
```

### Type-safe navigation

```tsx
// Automatic type-safe Link
<Link to="/users/$userId" params={{ userId: '123' }}>Profile</Link>

// Navigate programmatically
const navigate = useNavigate();
navigate({ to: '/users/$userId', params: { userId: '123' } });

// Search params
navigate({ to: '/users', search: { page: 2, filter: 'active' } });
```

## TanStack Table — Headless tables

### Basic setup

```tsx
import { useReactTable, getCoreRowModel, flexRender, ColumnDef } from '@tanstack/react-table';

interface User {
  id: string;
  name: string;
  email: string;
  role: 'admin' | 'user';
}

const columns: ColumnDef<User>[] = [
  {
    accessorKey: 'name',
    header: 'Name',
    cell: ({ row }) => <strong>{row.original.name}</strong>,
  },
  {
    accessorKey: 'email',
    header: 'Email',
  },
  {
    accessorKey: 'role',
    header: 'Role',
    cell: ({ getValue }) => {
      const role = getValue() as User['role'];
      return <Badge variant={role === 'admin' ? 'default' : 'secondary'}>{role}</Badge>;
    },
  },
  {
    id: 'actions',
    header: 'Actions',
    cell: ({ row }) => (
      <Button onClick={() => deleteUser(row.original.id)} variant="destructive">
        Delete
      </Button>
    ),
  },
];

function UsersTable({ data }: { data: User[] }) {
  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
  });

  return (
    <table>
      <thead>
        {table.getHeaderGroups().map((headerGroup) => (
          <tr key={headerGroup.id}>
            {headerGroup.headers.map((header) => (
              <th key={header.id}>
                {flexRender(header.column.columnDef.header, header.getContext())}
              </th>
            ))}
          </tr>
        ))}
      </thead>
      <tbody>
        {table.getRowModel().rows.map((row) => (
          <tr key={row.id}>
            {row.getVisibleCells().map((cell) => (
              <td key={cell.id}>
                {flexRender(cell.column.columnDef.cell, cell.getContext())}
              </td>
            ))}
          </tr>
        ))}
      </tbody>
    </table>
  );
}
```

### Sorting + filtering + pagination

```tsx
import {
  getCoreRowModel,
  getSortedRowModel,
  getFilteredRowModel,
  getPaginationRowModel,
  SortingState,
} from '@tanstack/react-table';

function UsersTable({ data }: { data: User[] }) {
  const [sorting, setSorting] = useState<SortingState>([]);
  const [globalFilter, setGlobalFilter] = useState('');

  const table = useReactTable({
    data,
    columns,
    state: { sorting, globalFilter },
    onSortingChange: setSorting,
    onGlobalFilterChange: setGlobalFilter,
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
    getFilteredRowModel: getFilteredRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    initialState: { pagination: { pageSize: 20 } },
  });

  return (
    <>
      <input
        value={globalFilter}
        onChange={(e) => setGlobalFilter(e.target.value)}
        placeholder="Search..."
      />
      <table>{/* ... */}</table>
      <Pagination table={table} />
    </>
  );
}
```

### Custom column with filter

```tsx
{
  accessorKey: 'name',
  header: ({ column }) => (
    <button onClick={() => column.toggleSorting()}>
      Name {column.getIsSorted() === 'asc' ? '↑' : column.getIsSorted() === 'desc' ? '↓' : ''}
    </button>
  ),
  filterFn: 'includesString', // built-in
  cell: ({ row }) => <UserCard user={row.original} />,
}
```

## Integration with shadcn/ui (DataTable pattern)

```tsx
// components/ui/data-table.tsx
function DataTable<TData, TValue>({
  columns,
  data,
}: DataTableProps<TData, TValue>) {
  const [sorting, setSorting] = useState<SortingState>([]);
  
  const table = useReactTable({
    data,
    columns,
    getCoreRowModel: getCoreRowModel(),
    getPaginationRowModel: getPaginationRowModel(),
    getSortedRowModel: getSortedRowModel(),
    onSortingChange: setSorting,
    state: { sorting },
  });

  return (
    <div className="rounded-md border">
      <Table>
        <TableHeader>
          {table.getHeaderGroups().map((headerGroup) => (
            <TableRow key={headerGroup.id}>
              {headerGroup.headers.map((header) => (
                <TableHead key={header.id}>
                  {flexRender(header.column.columnDef.header, header.getContext())}
                </TableHead>
              ))}
            </TableRow>
          ))}
        </TableHeader>
        <TableBody>
          {table.getRowModel().rows?.length ? (
            table.getRowModel().rows.map((row) => (
              <TableRow key={row.id}>
                {row.getVisibleCells().map((cell) => (
                  <TableCell key={cell.id}>
                    {flexRender(cell.column.columnDef.cell, cell.getContext())}
                  </TableCell>
                ))}
              </TableRow>
            ))
          ) : (
            <TableRow>
              <TableCell colSpan={columns.length} className="h-24 text-center">
                No results.
              </TableCell>
            </TableRow>
          )}
        </TableBody>
      </Table>
    </div>
  );
}
```

## Common mistakes

1. ❌ Forgetting hierarchical `queryKey` → ✅ always `[entity, ...filters]`.
2. ❌ `staleTime: 0` (default) → ✅ explicit based on use case.
3. ❌ Mutation without `onSuccess` invalidation → ✅ always invalidate.
4. ❌ Path param without type validation → ✅ Zod in `validateSearch`.
5. ❌ `useNavigate` without type safety → ✅ import `useNavigate` from the router.
6. ❌ Table without `getRowId` when there's reorder/editable → ✅ always define it.
7. ❌ `accessorKey` with dot notation without config → ✅ use `accessorFn` for nested.
8. ❌ Query that depends on another without `enabled` → ✅ always use dependent queries with enabled.
9. ❌ Not using `placeholderData: keepPreviousData` in paginated → ✅ smooth UX.
10. ❌ Infinite query without `getNextPageParam` → ✅ always define it.

## Performance tips

```tsx
// Keep previous data while loading new page
const { data } = useQuery({
  queryKey: ['users', page],
  queryFn: () => api.users.getPage(page),
  placeholderData: keepPreviousData,
});

// Prefetch on hover
const qc = useQueryClient();
function UserCard({ userId }: { userId: string }) {
  return (
    <Link
      to="/users/$userId"
      params={{ userId }}
      onMouseEnter={() => qc.prefetchQuery({
        queryKey: ['users', userId],
        queryFn: () => api.users.get(userId),
      })}
    >
      View
    </Link>
  );
}

// Selectors to avoid re-renders
const userName = useQuery({
  queryKey: ['user', id],
  queryFn: () => api.users.get(id),
  select: (user) => user.name,  // Only re-render if name changes
});
```
