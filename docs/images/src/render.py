import sys, asyncio
from pathlib import Path
from playwright.async_api import async_playwright
async def main():
    d = Path(sys.argv[1])
    async with async_playwright() as p:
        b = await p.chromium.launch()
        for name, html, w, h, cls in [(a.split(':')[0], a.split(':')[1], int(a.split(':')[2]), int(a.split(':')[3]), a.split(':')[4] if len(a.split(':'))>4 else '') for a in sys.argv[2:]]:
            pg = await b.new_page(viewport={'width': w, 'height': h}, device_scale_factor=2)
            await pg.goto((d / html).as_uri())
            if cls: await pg.evaluate(f"document.body.classList.add('{cls}')")
            await pg.wait_for_timeout(400)
            await pg.screenshot(path=str(d / name))
        await b.close()
asyncio.run(main())
