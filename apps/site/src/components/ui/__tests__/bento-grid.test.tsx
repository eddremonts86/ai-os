import { render, screen } from '@testing-library/react'
import { Route } from 'lucide-react'
import { describe, expect, it } from 'vitest'
import { BentoCard, BentoGrid } from '../bento-grid'

const card = {
  name: 'One source of truth',
  description: 'Skills symlinked into six CLIs.',
  Icon: Route,
  href: 'https://example.com/skills',
  cta: 'Browse the skills',
  className: 'md:col-span-2',
  background: <div data-testid="background" />,
}

describe('BentoGrid', () => {
  it('renders its children in a grid and merges the class', () => {
    const { container } = render(<BentoGrid className="grid-cols-1" data-testid="grid"><p>child</p></BentoGrid>)
    const grid = container.firstElementChild as HTMLElement
    expect(grid.className).toContain('grid')
    expect(grid.className).toContain('grid-cols-1')
    expect(grid.getAttribute('data-testid')).toBe('grid')
    expect(screen.getByText('child')).toBeTruthy()
  })
})

describe('BentoCard', () => {
  it('shows the name as a heading, the description and the background', () => {
    render(<BentoCard {...card} />)
    expect(screen.getByRole('heading', { level: 3, name: card.name })).toBeTruthy()
    expect(screen.getByText(card.description)).toBeTruthy()
    expect(screen.getByTestId('background')).toBeTruthy()
  })

  it('offers the call to action in both the small-screen and the hover placements', () => {
    render(<BentoCard {...card} />)
    const links = screen.getAllByText(card.cta).map((label) => label.closest('a'))
    expect(links).toHaveLength(2)
    links.forEach((link) => expect(link?.getAttribute('href')).toBe(card.href))
  })

  it('merges the class and forwards other props', () => {
    const { container } = render(<BentoCard {...card} data-testid="card" />)
    const root = container.firstElementChild as HTMLElement
    expect(root.className).toContain('md:col-span-2')
    expect(root.className).toContain('col-span-3')
    expect(root.getAttribute('data-testid')).toBe('card')
  })
})
