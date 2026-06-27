---
name: shadcn-patterns
description: Patrones de shadcn/ui — componentes Radix + Tailwind, cva, theming, customization. Aplica a cualquier proyecto que use shadcn/ui (incluido wave-template).
license: MIT
---

# shadcn/ui Patterns

## Cuándo usar

Cualquier proyecto con shadcn/ui instalado — basado en Radix UI primitives + Tailwind + class-variance-authority. El usuario copy-pastea componentes en `components/ui/`, no usa npm install.

## Filosofía

- **NO es un npm package.** Componentes se copian a tu repo.
- **Totalmente customizable** — son TUYOS una vez copiados.
- **Composición sobre configuración** — variantes via `cva`.
- **Accesible por default** — basado en Radix UI.
- **Tailwind nativo** — no CSS-in-JS.

## Setup

```bash
# Init
npx shadcn@latest init

# Add component
npx shadcn@latest add button
npx shadcn@latest add dialog form input
```

**components.json** (config raíz):
```json
{
  "$schema": "https://ui.shadcn.com/schema.json",
  "style": "default",
  "rsc": true,
  "tsx": true,
  "tailwind": {
    "config": "tailwind.config.ts",
    "css": "src/app/globals.css",
    "baseColor": "slate",
    "cssVariables": true
  },
  "aliases": {
    "components": "@/components",
    "utils": "@/lib/utils",
    "ui": "@/components/ui",
    "lib": "@/lib",
    "hooks": "@/hooks"
  }
}
```

## cn() utility

```ts
// lib/utils.ts
import { type ClassValue, clsx } from 'clsx';
import { twMerge } from 'tailwind-merge';

export function cn(...inputs: ClassValue[]) {
  return twMerge(clsx(inputs));
}
```

**Uso:**
```tsx
<div className={cn('base-class', isActive && 'active-class', className)} />
```

## Componentes — Patrón estructural

### Button

```tsx
// components/ui/button.tsx
import * as React from 'react';
import { Slot } from '@radix-ui/react-slot';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';

const buttonVariants = cva(
  'inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring disabled:pointer-events-none disabled:opacity-50',
  {
    variants: {
      variant: {
        default: 'bg-primary text-primary-foreground hover:bg-primary/90',
        destructive: 'bg-destructive text-destructive-foreground hover:bg-destructive/90',
        outline: 'border border-input bg-background hover:bg-accent hover:text-accent-foreground',
        secondary: 'bg-secondary text-secondary-foreground hover:bg-secondary/80',
        ghost: 'hover:bg-accent hover:text-accent-foreground',
        link: 'text-primary underline-offset-4 hover:underline',
      },
      size: {
        default: 'h-10 px-4 py-2',
        sm: 'h-9 rounded-md px-3',
        lg: 'h-11 rounded-md px-8',
        icon: 'h-10 w-10',
      },
    },
    defaultVariants: {
      variant: 'default',
      size: 'default',
    },
  },
);

export interface ButtonProps
  extends React.ButtonHTMLAttributes<HTMLButtonElement>,
    VariantProps<typeof buttonVariants> {
  asChild?: boolean;
}

const Button = React.forwardRef<HTMLButtonElement, ButtonProps>(
  ({ className, variant, size, asChild = false, ...props }, ref) => {
    const Comp = asChild ? Slot : 'button';
    return (
      <Comp
        className={cn(buttonVariants({ variant, size, className }))}
        ref={ref}
        {...props}
      />
    );
  },
);
Button.displayName = 'Button';

export { Button, buttonVariants };
```

**Reglas clave:**
- `React.forwardRef` SIEMPRE — componentes necesitan refs.
- `displayName` para debugging.
- `asChild` pattern via Slot (Radix) — permite composición con Link.
- Exportar `buttonVariants` para usar en otros componentes.
- `cn()` para combinar className externo + variantes.

### Card

```tsx
// components/ui/card.tsx
const Card = React.forwardRef<HTMLDivElement, React.HTMLAttributes<HTMLDivElement>>(
  ({ className, ...props }, ref) => (
    <div ref={ref} className={cn('rounded-lg border bg-card text-card-foreground shadow-sm', className)} {...props} />
  ),
);
Card.displayName = 'Card';

const CardHeader = React.forwardRef<HTMLDivElement, React.HTMLAttributes<HTMLDivElement>>(
  ({ className, ...props }, ref) => (
    <div ref={ref} className={cn('flex flex-col space-y-1.5 p-6', className)} {...props} />
  ),
);
CardHeader.displayName = 'CardHeader';

const CardTitle = React.forwardRef<HTMLHeadingElement, React.HTMLAttributes<HTMLHeadingElement>>(
  ({ className, ...props }, ref) => (
    <h3 ref={ref} className={cn('text-2xl font-semibold leading-none tracking-tight', className)} {...props} />
  ),
);
CardTitle.displayName = 'CardTitle';

// ... CardDescription, CardContent, CardFooter

export { Card, CardHeader, CardTitle, CardDescription, CardContent, CardFooter };
```

### Dialog (con Radix)

```tsx
// components/ui/dialog.tsx
'use client'; // Solo Next.js App Router

import * as React from 'react';
import * as DialogPrimitive from '@radix-ui/react-dialog';
import { X } from 'lucide-react';
import { cn } from '@/lib/utils';

const Dialog = DialogPrimitive.Root;
const DialogTrigger = DialogPrimitive.Trigger;
const DialogPortal = DialogPrimitive.Portal;
const DialogClose = DialogPrimitive.Close;

const DialogOverlay = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Overlay>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Overlay>
>(({ className, ...props }, ref) => (
  <DialogPrimitive.Overlay
    ref={ref}
    className={cn('fixed inset-0 z-50 bg-black/80 data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0', className)}
    {...props}
  />
));
DialogOverlay.displayName = DialogPrimitive.Overlay.displayName;

const DialogContent = React.forwardRef<
  React.ElementRef<typeof DialogPrimitive.Content>,
  React.ComponentPropsWithoutRef<typeof DialogPrimitive.Content>
>(({ className, children, ...props }, ref) => (
  <DialogPortal>
    <DialogOverlay />
    <DialogPrimitive.Content
      ref={ref}
      className={cn('fixed left-[50%] top-[50%] z-50 grid w-full max-w-lg translate-x-[-50%] translate-y-[-50%] gap-4 border bg-background p-6 shadow-lg sm:rounded-lg', className)}
      {...props}
    >
      {children}
      <DialogPrimitive.Close className="absolute right-4 top-4 rounded-sm opacity-70 hover:opacity-100">
        <X className="h-4 w-4" />
        <span className="sr-only">Close</span>
      </DialogPrimitive.Close>
    </DialogPrimitive.Content>
  </DialogPortal>
));
DialogContent.displayName = DialogPrimitive.Content.displayName;

export { Dialog, DialogTrigger, DialogContent, DialogClose };
```

## Theming — CSS variables

**app/globals.css:**
```css
@tailwind base;
@tailwind components;
@tailwind utilities;

@layer base {
  :root {
    --background: 0 0% 100%;
    --foreground: 222.2 84% 4.9%;
    --primary: 222.2 47.4% 11.2%;
    --primary-foreground: 210 40% 98%;
    --secondary: 210 40% 96.1%;
    --secondary-foreground: 222.2 47.4% 11.2%;
    --muted: 210 40% 96.1%;
    --muted-foreground: 215.4 16.3% 46.9%;
    --accent: 210 40% 96.1%;
    --accent-foreground: 222.2 47.4% 11.2%;
    --destructive: 0 84.2% 60.2%;
    --destructive-foreground: 210 40% 98%;
    --border: 214.3 31.8% 91.4%;
    --input: 214.3 31.8% 91.4%;
    --ring: 222.2 84% 4.9%;
    --radius: 0.5rem;
  }

  .dark {
    --background: 222.2 84% 4.9%;
    --foreground: 210 40% 98%;
    /* ... dark variants */
  }
}
```

**tailwind.config.ts:**
```ts
module.exports = {
  darkMode: ['class'],
  theme: {
    extend: {
      colors: {
        border: 'hsl(var(--border))',
        input: 'hsl(var(--input))',
        ring: 'hsl(var(--ring))',
        background: 'hsl(var(--background))',
        foreground: 'hsl(var(--foreground))',
        primary: {
          DEFAULT: 'hsl(var(--primary))',
          foreground: 'hsl(var(--primary-foreground))',
        },
        // ...
      },
      borderRadius: {
        lg: 'var(--radius)',
        md: 'calc(var(--radius) - 2px)',
        sm: 'calc(var(--radius) - 4px)',
      },
    },
  },
};
```

**Uso:**
```tsx
<div className="bg-background text-foreground border border-border">
  <Button className="bg-primary text-primary-foreground">Click me</Button>
</div>
```

## Composición avanzada

### asChild pattern

```tsx
// Button como Link (Next.js, TanStack Router)
<Button asChild>
  <Link to="/users/$userId" params={{ userId: '123' }}>View Profile</Link>
</Button>

// Dialog trigger como custom element
<DialogTrigger asChild>
  <Button variant="outline">Open</Button>
</DialogTrigger>
```

### Form patterns (con react-hook-form)

```tsx
'use client';

import { zodResolver } from '@hookform/resolvers/zod';
import { useForm } from 'react-hook-form';
import * as z from 'zod';
import { Button } from '@/components/ui/button';
import {
  Form, FormControl, FormDescription, FormField, FormItem, FormLabel, FormMessage,
} from '@/components/ui/form';
import { Input } from '@/components/ui/input';

const formSchema = z.object({
  username: z.string().min(2).max(50),
});

export function ProfileForm() {
  const form = useForm<z.infer<typeof formSchema>>({
    resolver: zodResolver(formSchema),
    defaultValues: { username: '' },
  });

  function onSubmit(values: z.infer<typeof formSchema>) {
    console.log(values);
  }

  return (
    <Form {...form}>
      <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-8">
        <FormField
          control={form.control}
          name="username"
          render={({ field }) => (
            <FormItem>
              <FormLabel>Username</FormLabel>
              <FormControl>
                <Input placeholder="shadcn" {...field} />
              </FormControl>
              <FormDescription>This is your public display name.</FormDescription>
              <FormMessage />
            </FormItem>
          )}
        />
        <Button type="submit">Submit</Button>
      </form>
    </Form>
  );
}
```

### Custom components (wrapper de Radix)

```tsx
// components/ui/alert.tsx
import * as React from 'react';
import { cva, type VariantProps } from 'class-variance-authority';
import { cn } from '@/lib/utils';

const alertVariants = cva(
  'relative w-full rounded-lg border p-4 [&>svg~*]:pl-7 [&>svg+div]:translate-y-[-3px] [&>svg]:absolute [&>svg]:left-4 [&>svg]:top-4 [&>svg]:text-foreground',
  {
    variants: {
      variant: {
        default: 'bg-background text-foreground',
        destructive: 'border-destructive/50 text-destructive dark:border-destructive [&>svg]:text-destructive',
      },
    },
    defaultVariants: { variant: 'default' },
  },
);

const Alert = React.forwardRef<HTMLDivElement, AlertProps>(({ className, variant, ...props }, ref) => (
  <div ref={ref} role="alert" className={cn(alertVariants({ variant }), className)} {...props} />
));
Alert.displayName = 'Alert';

const AlertTitle = React.forwardRef<HTMLHeadingElement, React.HTMLAttributes<HTMLHeadingElement>>(
  ({ className, ...props }, ref) => (
    <h5 ref={ref} className={cn('mb-1 font-medium leading-none tracking-tight', className)} {...props} />
  ),
);
AlertTitle.displayName = 'AlertTitle';

export { Alert, AlertTitle };
```

## Iconos — lucide-react

shadcn/ui usa `lucide-react` por default:

```tsx
import { ChevronRight, Mail, User } from 'lucide-react';

<Button>
  <Mail className="mr-2 h-4 w-4" /> Login with Email
</Button>
```

## Errores comunes

1. ❌ Importar de `@/components/ui/button/index` (algunos setups) → ✅ import default del archivo.
2. ❌ Olvidar `forwardRef` → ✅ siempre en componentes UI primitives.
3. ❌ Hardcodear colores Tailwind (`bg-blue-500`) → ✅ tokens semánticos (`bg-primary`).
4. ❌ Modificar archivos en `components/ui/` directamente para customizar → ✅ mejor wrapper propio encima o duplicar el componente.
5. ❌ No definir `displayName` → ✅ siempre en forwardRef.
6. ❌ `asChild` sin Slot → ✅ Slot de Radix disponible en deps.
7. ❌ Olvidar variants default → ✅ `defaultVariants` en cva.
8. ❌ Usar `cn()` mal (sin `twMerge`) → ✅ `cn()` con `clsx + twMerge`.
9. ❌ Theme provider ausente → ✅ `<ThemeProvider>` (next-themes) en root.
10. ❌ No usar `data-[state]` para animations → ✅ estados Radix accesibles para CSS.

## Customización — Estrategia

Si necesitas algo más allá de las props:

1. **Wrappers**: crea tu componente en `components/` (no en `components/ui/`):
```tsx
// components/submit-button.tsx
import { Button, ButtonProps } from '@/components/ui/button';

export function SubmitButton({ children, ...props }: ButtonProps) {
  return (
    <Button type="submit" {...props}>
      {children ?? 'Submit'}
    </Button>
  );
}
```

2. **Overrides locales**: pasa `className` para extender:
```tsx
<Button className="bg-brand-primary hover:bg-brand-primary/90">Special CTA</Button>
```

3. **Nuevos variants**: agrega al cva del componente:
```tsx
// Editar components/ui/button.tsx (es TUYO)
const buttonVariants = cva(/* ... */, {
  variants: {
    variant: {
      // ... existing
      brand: 'bg-gradient-to-r from-purple-500 to-pink-500 text-white',
    },
  },
});
```

## Stack complementario

- **Forms:** react-hook-form + zod (con `<Form>` wrapper de shadcn).
- **Toasts:** sonner.
- **Date pickers:** react-day-picker.
- **Charts:** recharts.
- **Icons:** lucide-react.
- **Theme:** next-themes (Next.js) o implementación manual.
- **Animation:** tailwindcss-animate (incluido por default).