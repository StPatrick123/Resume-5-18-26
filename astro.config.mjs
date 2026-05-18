// astro.config.mjs
import { defineConfig } from 'astro/config';

// site/base prefer env vars so the GitHub Pages workflow can inject them
// from actions/configure-pages outputs without editing this file on a fork.
// Local dev (`npm run dev`) uses the fallbacks.
const site = process.env.PAGES_SITE || 'https://ada.example.com';
const base = process.env.PAGES_BASE_PATH || '/';

export default defineConfig({
  site,
  base,
  output: 'static',
  build: {
    assets: 'assets',
  },
  markdown: {
    smartypants: true,
    gfm: true,
  },
});
