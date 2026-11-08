// Composed, not installed: the indexed navbars were mega-menus or WebGL pieces, and the GitHub star button links
// to a repo that is still private (see build-log.json).
import { Button } from "@/components/ui/button"

const links = [
  ["How it works", "#how-it-works"],
  ["Search", "#search"],
  ["Integrate", "#integrate"],
  ["FAQ", "#faq"],
] as const

export function Navbar() {
  return (
    <header className="sticky top-0 z-50 border-b bg-background/80 backdrop-blur">
      <nav aria-label="Main" className="mx-auto flex h-14 max-w-6xl items-center gap-6 px-4">
        <a href="#" className="text-sm font-semibold tracking-tight text-foreground">
          ui<span className="text-brand">-</span>indexador
        </a>
        <ul className="ml-auto hidden items-center gap-6 text-sm text-muted-foreground md:flex">
          {links.map(([label, href]) => (
            <li key={href}><a href={href} className="hover:text-foreground">{label}</a></li>
          ))}
        </ul>
        <Button asChild size="sm" className="ml-auto md:ml-0">
          <a href="#integrate">Add to your agent</a>
        </Button>
      </nav>
    </header>
  )
}
