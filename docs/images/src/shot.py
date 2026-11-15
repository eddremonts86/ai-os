import sys, asyncio
from pathlib import Path
from playwright.async_api import async_playwright
async def main():
    d = Path(sys.argv[1]); out, q = sys.argv[2], sys.argv[3]
    async with async_playwright() as p:
        b = await p.chromium.launch(); pg = await b.new_page(viewport={'width': 1100, 'height': 900}, device_scale_factor=2)
        await pg.goto((d / 'term.html').as_uri() + '?' + q)
        await pg.wait_for_function("document.title==='ready'")
        await pg.locator('body').screenshot(path=str(d / out)); await b.close()
asyncio.run(main())
