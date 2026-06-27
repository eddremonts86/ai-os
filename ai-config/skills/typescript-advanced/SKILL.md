---
name: typescript-advanced
description: TypeScript avanzado — generics, conditional types, satisfies, template literals, utility types. Para proyectos con `strict: true` que quieren exprimir el type system.
license: MIT
---

# TypeScript Advanced Patterns

## Cuándo usar

Cualquier proyecto con TypeScript strict que quiera patrones avanzados para mejor type safety, menos `any`, y APIs más expresivas.

## `satisfies` (TypeScript 4.9+)

```ts
// ✅ Valida estructura SIN perder tipos literales
const config = {
  apiUrl: 'https://api.example.com',
  retries: 3,
  features: {
    darkMode: true,
    analytics: false,
  },
} satisfies AppConfig;

// Acceso con tipos literales preservados
config.features.darkMode  // boolean (no `boolean | undefined`)
```

**vs `as const`:** `satisfies` valida estructura, `as const` hace readonly + literales. Combinables:

```ts
const config = {
  apiUrl: 'https://api.example.com',
  retries: 3,
} as const satisfies AppConfig;
```

## Generics — Patrones

### Básico

```ts
function identity<T>(value: T): T {
  return value;
}

const num = identity(42);      // number
const str = identity('hello'); // string
```

### Con constraints

```ts
function getProperty<T, K extends keyof T>(obj: T, key: K): T[K] {
  return obj[key];
}

const user = { name: 'John', age: 30 };
const name = getProperty(user, 'name'); // string
```

### Con default

```ts
interface ApiResponse<T = unknown, E = ApiError> {
  data?: T;
  error?: E;
}
```

### Múltiples type params

```ts
function merge<T extends object, U extends object>(a: T, b: U): T & U {
  return { ...a, ...b };
}
```

## Utility types built-in

```ts
// Partial: todas las props opcionales
type UpdateUserInput = Partial<User>;

// Required: todas las props requeridas
type CompleteUser = Required<User>;

// Pick: subset de props
type UserPreview = Pick<User, 'id' | 'name'>;

// Omit: todas excepto
type UserWithoutPassword = Omit<User, 'password'>;

// Record: mapa de keys a values
type UserMap = Record<string, User>;

// Readonly: no se puede mutar
type FrozenUser = Readonly<User>;
```

## Conditional types

```ts
// Tipo que depende de otro
type IsString<T> = T extends string ? true : false;

type A = IsString<'hello'>; // true
type B = IsString<42>;      // false

// Inferir tipo de array
type ElementOf<T> = T extends (infer U)[] ? U : never;

type E = ElementOf<string[]>; // string

// Distribuir sobre unions
type ToArray<T> = T extends unknown ? T[] : never;

type A = ToArray<string | number>; // string[] | number[]
```

## Mapped types

```ts
// Hacer todas las props readonly
type Readonly<T> = {
  readonly [K in keyof T]: T[K];
};

// Hacer todas las props opcionales
type Optional<T> = {
  [K in keyof T]?: T[K];
};

// Remover readonly
type Mutable<T> = {
  -readonly [K in keyof T]: T[K];
};

// Remover optional
type Required<T> = {
  [K in keyof T]-?: T[K];
};

// Remover keys específicas
type OmitByType<T, V> = {
  [K in keyof T as T[K] extends V ? never : K]: T[K];
};

type UserWithoutDates = OmitByType<User, Date>;
// { id: string, name: string }  (excluye createdAt: Date)
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
// Evitar pasar UserId donde se espera OrderId
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
    default: return assertNever(status); // Si agregas un case, esto falla
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
  // Ahora `user` es User (no undefined)
  console.log(user.name);
}
```

## Function overloads

```ts
// Overloads: diferentes signatures según args
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
// Extraer tipo de retorno
type ReturnTypeOf<T> = T extends (...args: any[]) => infer R ? R : never;

type A = ReturnTypeOf<() => string>; // string

// Extraer tipo de Promise
type UnwrapPromise<T> = T extends Promise<infer U> ? U : T;

type A = UnwrapPromise<Promise<string>>; // string
type B = UnwrapPromise<string>;          // string

// Extraer elementos de tuple
type First<T extends any[]> = T extends [infer F, ...any[]] ? F : never;
type A = First<[string, number, boolean]>; // string
```

## `as const` y readonly arrays

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

// Schema-driven validation + types sincronizados
const user = userSchema.parse(inputData);
```

## TypeScript con React

### Component props genéricos

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

// Uso:
<Select<User>
  options={users}
  value={currentUser}
  onChange={setCurrentUser}
  getLabel={(u) => u.name}
/>
```

### forwardRef con generics

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

## Errores comunes

1. ❌ Usar `any` → ✅ `unknown` + type guard.
2. ❌ `as` para fix rápido → ✅ `satisfies` o narrowing real.
3. ❌ `// @ts-ignore` → ✅ `// @ts-expect-error` con comentario explicativo.
4. ❌ Optional chaining en types → ✅ `T extends undefined ? never : T`.
5. ❌ Función genérica sin constraint → ✅ `T extends SomeType` cuando uses métodos.
6. ❌ Union no exhaustivo en switch → ✅ `assertNever(x)` en default.
7. ❌ Destructurar pierde narrowing → ✅ check primero, luego destructurar.
8. ❌ `null` vs `undefined` mezclados → ✅ usar uno consistente (TS config: `strictNullChecks`).
9. ❌ `enum` (no tree-shakable) → ✅ string literal unions.
10. ❌ Tipos circulares sin lazy → ✅ `type X = Y | string; interface Y { x?: X }`.

## tsconfig.json recomendado

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
// ✅ Solo runtime
import { useState } from 'react';

// ✅ Solo types (eliminado en build, más rápido)
import type { User } from './types';

// ✅ Combined (default de TS)
import { useState, type Dispatch } from 'react';
```

## Recursos externos

- TypeScript Handbook: https://www.typescriptlang.org/docs/handbook/
- Type Challenges: https://github.com/type-challenges/type-challenges
- Zod: https://zod.dev/
- tRPC: https://trpc.io/ (end-to-end typesafe APIs)