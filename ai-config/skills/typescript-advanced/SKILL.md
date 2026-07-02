---
name: typescript-advanced
description: Advanced TypeScript — generics, conditional types, satisfies, template literals, utility types. For projects with `strict: true` that want to squeeze the type system.
license: MIT
---

# TypeScript Advanced Patterns

## When to use

Any TypeScript strict project that wants advanced patterns for better type safety, less `any`, and more expressive APIs.

## `satisfies` (TypeScript 4.9+)

```ts
// ✅ Validates structure WITHOUT losing literal types
const config = {
  apiUrl: 'https://api.example.com',
  retries: 3,
  features: {
    darkMode: true,
    analytics: false,
  },
} satisfies AppConfig;

// Access with literal types preserved
config.features.darkMode  // boolean (not `boolean | undefined`)
```

**vs `as const`:** `satisfies` validates structure, `as const` makes it readonly + literal. Combinable:

```ts
const config = {
  apiUrl: 'https://api.example.com',
  retries: 3,
} as const satisfies AppConfig;
```

## Generics — Patterns

### Basic

```ts
function identity<T>(value: T): T {
  return value;
}

const num = identity(42);      // number
const str = identity('hello'); // string
```

### With constraints

```ts
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const user = { name: 'John', age: 30 };
const name = getProperty(user, 'name'); // string
```

### With default

```ts
interface ApiResponse<T = unknown, E = ApiError> {
  data?: T;
  error?: E;
}
```

### Multiple type params

```ts
function merge<T extends object, U extends object>(a: T, b: U): T & U {
  return { ...a, ...b };
}
```

## Built-in utility types

```ts
// Partial: all props optional
type UpdateUserInput = Partial<User>;

// Required: all props required
type CompleteUser = Required<User>;

// Pick: subset of props
type UserPreview = Pick<User, 'id' | 'name'>;

// Omit: all except
type UserWithoutPassword = Omit<User, 'password'>;

// Record: map of keys to values
type UserMap = Record<string, User>;

// Readonly: cannot be mutated
type FrozenUser = Readonly<User>;
```

## Conditional types

```ts
// Type that depends on another
type IsString<T> = T extends string ? true : false;

type A = IsString<'hello'>; // true
type B = IsString<42>;      // false

// Infer array element type
type ElementOf<T> = T extends (infer U)[] ? U : never;

type E = ElementOf<string[]>; // string

// Distribute over unions
type ToArray<T> = T extends unknown ? T[] : never;

type A = ToArray<string | number>; // string[] | number[]
```

## Mapped types

```ts
// Make all props readonly
type Readonly<T> = {
  readonly [K in keyof T]: T[K];
};

// Make all props optional
type Optional<T> = {
  [K in keyof T]?: T[K];
};

// Remove readonly
type Mutable<T> = {
  -readonly [K in keyof T]: T[K];
};

// Remove optional
type Required<T> = {
  [K in keyof T]-?: T[K];
};

// Remove specific keys
type OmitByType<T, V> = {
  [K in keyof T as T[K] extends V ? never : K]: T[K];
};

type UserWithoutDates = OmitByType<User, Date>;
// { id: string, name: string }  (excludes createdAt: Date)
```

## Template literal types

```ts
type EventName<T extends string> = `on${Capitalize<T>}`;

type ButtonEvents = EventName<'click' | 'focus'>;
// 'onClick' | 'onFocus'

type CSSUnit = `${number}${'px' | 'rem' | 'em'}`;
// `${number}px` | `${number}rem` | `${number}em`

// URL builder
type ApiRoute<T extends string> = `/api/${T}`;
type UserRoute = ApiRoute<'users'>; // '/api/users'
```

## Branded types (nominal typing)

```ts
// Avoid passing UserId where OrderId is expected
type UserId = string & { readonly __brand: 'UserId' };
type OrderId = string & { readonly __brand: 'OrderId' };

function createUserId(id: string): UserId {
  return id as UserId;
}

function getOrder(id: OrderId) { /* ... */ }

const userId = createUserId('123');
getOrder(userId); // ❌ Type error!
```

## Discriminated unions

```ts
type Result<T, E = Error> =
  | { success: true; value: T }
  | { success: false; error: E };

function handle(result: Result<User>) {
  if (result.success) {
    console.log(result.value.name);  // Type: User
  } else {
    console.error(result.error.message); // Type: Error
  }
}

// Exhaustiveness check
function assertNever(x: never): never {
  throw new Error('Unexpected object: ' + x);
}

type Status = 'pending' | 'approved' | 'rejected';

function getLabel(status: Status): string {
  switch (status) {
    case 'pending': return 'Pending';
    case 'approved': return 'Approved';
    case 'rejected': return 'Rejected';
    default: return assertNever(status); // If you add a case, this fails
  }
}
```

## Type guards

```ts
// typeof
function process(value: string | number) {
  if (typeof value === 'string') return value.toUpperCase();
  return value.toFixed(2);
}

// instanceof
function handle(err: unknown) {
  if (err instanceof ApiError) return err.status;
  return 500;
}

// Custom type guard
interface User { type: 'user'; name: string }
interface Admin { type: 'admin'; permissions: string[] }
type Person = User | Admin;

function isAdmin(p: Person): p is Admin {
  return p.type === 'admin';
}

function greet(p: Person) {
  if (isAdmin(p)) {
    console.log(p.permissions); // Type: Admin
  }
}
```

## Assertion functions

```ts
function assertDefined<T>(value: T | undefined | null, msg = 'Required'): asserts value is T {
  if (value === undefined || value === null) throw new Error(msg);
}

function processUser(user: User | undefined) {
  assertDefined(user, 'User must be provided');
  // Now `user` is User (not undefined)
  console.log(user.name);
}
```

## Function overloads

```ts
// Overloads: different signatures depending on args
function createDate(timestamp: number): Date;
function createDate(year: number, month: number, day: number): Date;
function createDate(a: number, b?: number, c?: number): Date {
  if (b !== undefined && c !== undefined) {
    return new Date(a, b - 1, c);
  }
  return new Date(a);
}

const d1 = createDate(1234567890);
const d2 = createDate(2024, 1, 15);
```

## `infer` keyword

```ts
// Extract return type
type ReturnTypeOf<T> = T extends (...args: any[]) => infer R ? R : never;

type A = ReturnTypeOf<() => string>; // string

// Extract Promise type
type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;

type A = UnwrapPromise<Promise<string>>; // string
type B = UnwrapPromise<string>;          // string

// Extract tuple elements
type First<T extends any[]> = T extends [infer F, ...any[]] ? F : never;
type A = First<[string, number, boolean]>; // string
```

## `as const` and readonly arrays

```ts
const colors = ['red', 'green', 'blue'] as const;
type Color = (typeof colors)[number]; // 'red' | 'green' | 'blue'

function setColor(c: Color) { /* ... */ }
setColor('red');     // ✅
setColor('purple');  // ❌ Type error
```

## Variadic tuple types

```ts
type Concat<T extends any[], U extends any[]> = [...T, ...U];

type A = Concat<[1, 2], [3, 4]>; // [1, 2, 3, 4]

// Partial application
type PartialApply<T extends any[], U extends any[]> = 
  T extends [...infer F, ...infer R] ? [...F, ...U, ...R] : never;

type A = PartialApply<[string, number, boolean], [string]>;
// [string, string, boolean]
```

## Zod + TypeScript

```ts
import { z } from 'zod';

const userSchema = z.object({
  id: z.string().uuid(),
  name: z.string().min(2),
  email: z.string().email(),
  age: z.number().int().positive().optional(),
});

type User = z.infer<typeof userSchema>;
// { id: string, name: string, email: string, age?: number }

// Schema-driven validation + synchronized types
const user = userSchema.parse(inputData);
```

## TypeScript with React

### Generic component props

```tsx
interface SelectProps<T> {
  options: T[];
  value: T;
  onChange: (value: T) => void;
  getLabel: (option: T) => string;
}

function Select<T>({ options, value, onChange, getLabel }: SelectProps<T>) {
  return (
    <select value={getLabel(value)} onChange={(e) => {
      const selected = options.find(o => getLabel(o) === e.target.value);
      if (selected) onChange(selected);
    }}>
      {options.map(opt => (
        <option key={getLabel(opt)} value={getLabel(opt)}>{getLabel(opt)}</option>
      ))}
    </select>
  );
}

// Usage:
<Select<User>
  options={users}
  value={currentUser}
  onChange={setCurrentUser}
  getLabel={(u) => u.name}
/>
```

### forwardRef with generics

```tsx
import { forwardRef, ComponentPropsWithoutRef } from 'react';

const Select = forwardRef(<T,>(
  props: SelectProps<T>,
  ref: React.ForwardedRef<HTMLSelectElement>,
) => {
  return <select ref={ref} {...props} />;
});
Select.displayName = 'Select';
```

### Polymorphic components

```tsx
type AsProp = 'button' | 'a' | 'div';

interface BoxProps<T extends AsProp = 'div'> {
  as?: T;
  children: React.ReactNode;
}

function Box<T extends AsProp = 'div'>({ as, children, ...props }: BoxProps<T>) {
  const Tag = as as React.ElementType;
  return <Tag {...props}>{children}</Tag>;
}
```

## Common mistakes

1. ❌ Using `any` → ✅ `unknown` + type guard.
2. ❌ `as` as a quick fix → ✅ `satisfies` or real narrowing.
3. ❌ `// @ts-ignore` → ✅ `// @ts-expect-error` with an explanatory comment.
4. ❌ Optional chaining in types → ✅ `T extends undefined ? never : T`.
5. ❌ Generic function without constraint → ✅ `T extends SomeType` when using methods.
6. ❌ Non-exhaustive union in switch → ✅ `assertNever(x)` in default.
7. ❌ Destructuring loses narrowing → ✅ check first, then destructure.
8. ❌ `null` vs `undefined` mixed → ✅ use one consistently (TS config: `strictNullChecks`).
9. ❌ `enum` (not tree-shakable) → ✅ string literal unions.
10. ❌ Circular types without laziness → ✅ `type X = Y | string; interface Y { x?: X }`.

## Recommended tsconfig.json

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "module": "ESNext",
    "moduleResolution": "bundler",
    "strict": true,
    "noUncheckedIndexedAccess": true,
    "noImplicitOverride": true,
    "noFallthroughCasesInSwitch": true,
    "noUnusedLocals": true,
    "noUnusedParameters": true,
    "exactOptionalPropertyTypes": true,
    "esModuleInterop": true,
    "skipLibCheck": true,
    "forceConsistentCasingInFileNames": true,
    "isolatedModules": true,
    "verbatimModuleSyntax": true,
    "resolveJsonModule": true
  }
}
```

## Performance tip — `import type`

```ts
// ✅ Runtime only
import { useState } from 'react';

// ✅ Types only (removed at build time, faster)
import type { User } from './types';

// ✅ Combined (TS default)
import { useState, type Dispatch } from 'react';
```

## External resources

- TypeScript Handbook: https://www.typescriptlang.org/docs/handbook/
- Type Challenges: https://github.com/type-challenges/type-challenges
- Zod: https://zod.dev/
- tRPC: https://trpc.io/ (end-to-end typesafe APIs)
