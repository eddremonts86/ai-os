import { Hero01 } from "@/components/hero-01"
import { Navbar } from "@/components/navbar"

export default function App() {
  return (
    <>
      <a href="#main" className="sr-only focus:not-sr-only focus:absolute focus:p-3">Skip to content</a>
      <Navbar />
      <main id="main" className="bg-background text-foreground">
        <Hero01 />
      </main>
    </>
  )
}
