import { type ComponentPropsWithoutRef, type ReactNode } from "react"
import { ArrowRightIcon } from "@radix-ui/react-icons"

import { cn } from "@/lib/utils"
import { Button } from "@/components/ui/button"

interface BentoGridProps extends ComponentPropsWithoutRef<"div"> {
  children: ReactNode
  className?: string
}

interface BentoCardProps extends ComponentPropsWithoutRef<"div"> {
  name: string
  className: string
  background: ReactNode
  Icon: React.ElementType
  description: string
  href: string
  cta: string
}

const BentoGrid = ({ children, className, ...props }: BentoGridProps) => {
  return (
    <div
      className={cn(
        "grid w-full auto-rows-[22rem] grid-cols-3 gap-4",
        className
      )}
      {...props}
    >
      {children}
    </div>
  )
}

const BentoCard = ({
  name,
  className,
  background,
  Icon,
  description,
  href,
  cta,
  ...props
}: BentoCardProps) => (
  <div
    key={name}
    className={cn(
      "group relative col-span-3 flex flex-col justify-between overflow-hidden rounded-xl",
      // light styles
      "bg-background shadow-bento",
      // dark styles
      "dark:bg-background transform-gpu dark:shadow-bento-dark dark:border dark:border-white/10",
      className
    )}
    {...props}
  >
    <div>{background}</div>
    <div className="p-4">
      <div className="pointer-events-none z-10 flex transform-gpu flex-col gap-1 transition-transform duration-300 motion-reduce:transition-none motion-reduce:transform-none lg:group-hover:-translate-y-10 lg:group-focus-within:-translate-y-10">
        <Icon className="h-12 w-12 origin-left transform-gpu text-muted-foreground transition-transform duration-300 ease-in-out motion-reduce:transition-none motion-reduce:transform-none group-hover:scale-75 group-focus-within:scale-75" />
        <h3 className="text-xl font-semibold text-neutral-700 dark:text-neutral-300">
          {name}
        </h3>
        <p className="max-w-lg text-neutral-400">{description}</p>
      </div>

      <div
        className={cn(
          "pointer-events-none flex w-full translate-y-0 transform-gpu flex-row items-center transition-[transform,opacity] duration-300 motion-reduce:transition-none group-hover:translate-y-0 group-hover:opacity-100 lg:hidden"
        )}
      >
        <Button variant="link" size="sm" className="pointer-events-auto p-0" render={<a href={href} />} nativeButton={false}>{cta}<ArrowRightIcon className="ms-2 h-4 w-4 rtl:rotate-180" /></Button>
      </div>
    </div>

    <div
      className={cn(
        "pointer-events-none absolute bottom-0 hidden w-full translate-y-10 transform-gpu flex-row items-center p-4 opacity-0 transition-[transform,opacity] duration-300 motion-reduce:transition-none motion-reduce:translate-y-0 group-hover:translate-y-0 group-hover:opacity-100 group-focus-within:translate-y-0 group-focus-within:opacity-100 lg:flex"
      )}
    >
      <Button variant="link" size="sm" className="pointer-events-auto p-0" render={<a href={href} />} nativeButton={false}>{cta}<ArrowRightIcon className="ms-2 h-4 w-4 rtl:rotate-180" /></Button>
    </div>

    <div className="pointer-events-none absolute inset-0 transform-gpu transition-colors duration-300 group-hover:bg-black/3 group-hover:dark:bg-neutral-800/10" />
  </div>
)

export { BentoCard, BentoGrid }
