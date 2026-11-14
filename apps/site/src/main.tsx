import { domAnimation, LazyMotion, MotionConfig } from 'motion/react'
import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import App from './App.tsx'
import './index.css'

// Magic UI's motion ignores prefers-reduced-motion on its own; this makes every motion animation honour it.
// LazyMotion + `m` (in terminal and animated-beam) ships only the DOM animation features: -14 kB gzip, and
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
