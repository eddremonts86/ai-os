// Block 4/5 preview: ?hero=a|b|c&theme=<tweakcn preset>. The theme's CSS variables come from the indexer's own
// /themes/<name> endpoint, so the page is styled by the app it describes.
import { useEffect } from "react"
import { Hero01 } from "./components/hero-01"
import HeroSectionV3 from "./app/hero-section-v3/components/hero-section-v3"
import { Hero02 } from "./components/hero-02"

const params = new URLSearchParams(location.search)
const heroes = { a: Hero01, b: Hero02, c: HeroSectionV3 } as const

export default function App() {
  const theme = params.get("theme")
  const Hero = heroes[(params.get("hero") ?? "b") as keyof typeof heroes] ?? Hero02
  useEffect(() => {
    if (!theme) return
    fetch(`/themes/${theme}`).then((r) => r.json()).then((t) => {
      const style = document.createElement("style")
      style.textContent = t.css + `body{font-family:var(--font-sans)}`
      document.head.append(style)
    })
  }, [theme])
  useEffect(() => { if (params.get("dark")) document.documentElement.classList.add("dark") }, [])
  return <main className="min-h-dvh bg-background text-foreground"><Hero /></main>
}
