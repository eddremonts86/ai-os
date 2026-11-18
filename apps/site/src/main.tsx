import { domAnimation, LazyMotion, MotionConfig } from 'motion/react'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
// The stylesheet first: it fixes the cascade-layer order before any component's CSS loads
import './index.css'
import App from './App.tsx'

// Magic UI's motion ignores prefers-reduced-motion on its own; this makes every motion animation honour it.
// LazyMotion + `m` (in animated-beam) ships only the DOM animation features: -14 kB gzip, and
// `strict` throws if a full `motion` component sneaks back in.
createRoot(document.getElementById('root')!).render(
  <StrictMode>
    <LazyMotion features={domAnimation} strict>
      <MotionConfig reducedMotion="user">
        <App />
      </MotionConfig>
    </LazyMotion>
  </StrictMode>,
)
