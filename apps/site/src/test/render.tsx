// The app mounts under <LazyMotion features={domAnimation} strict> (main.tsx); components use the lightweight `m`,
// which animates nothing without it. Tests render through the same provider.
import { render as rtlRender, type RenderOptions } from '@testing-library/react'
import { domAnimation, LazyMotion } from 'motion/react'
import type { ReactElement, ReactNode } from 'react'

const Motion = ({ children }: { children: ReactNode }) => (
  <LazyMotion features={domAnimation} strict>
    {children}
  </LazyMotion>
)

export * from '@testing-library/react'
export const render = (ui: ReactElement, options?: RenderOptions) => rtlRender(ui, { wrapper: Motion, ...options })
