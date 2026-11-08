import Comparison03 from "@/components/blocks/comparison-03"
import Cta06 from "@/components/blocks/cta-06"
import FAQsTwo from "@/components/blocks/faqs/faqs-section-two"
import Footer03 from "@/components/blocks/footer-03"
import { Features01 } from "@/components/features-01"
import { Hero01 } from "@/components/hero-01"
import { Navbar } from "@/components/navbar"
import { Built } from "@/sections/built"
import { How } from "@/sections/how"
import { Integrate } from "@/sections/integrate"
import { LiveSearch } from "@/sections/live-search"
import { Numbers } from "@/sections/numbers"

export default function App() {
  return (
    <>
      <a href="#main" className="sr-only focus:not-sr-only focus:absolute focus:z-[60] focus:p-3">Skip to content</a>
      <Navbar />
      <main id="main" className="bg-background text-foreground">
        <Hero01 />
        <Numbers />
        <Comparison03 />
        <How />
        <LiveSearch />
        <Features01 />
        <Integrate />
        <Built />
        <FAQsTwo />
        <Cta06 />
      </main>
      <Footer03 />
    </>
  )
}
