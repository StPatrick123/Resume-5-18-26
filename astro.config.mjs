// astro.config.mjs
import { defineConfig } from 'astro/config';

// site/base prefer env vars so the GitHub Pages workflow can inject them
// from actions/configure-pages outputs without editing this file on a fork.
// Local dev (`npm run dev`) uses the fallbacks.
const site = process.env.PAGES_SITE || 'https://ada.example.com';
// actions/configure-pages emits base_path as "/repo-name" (no trailing slash).
      // Astro 6 doesn't normalize this, so import.meta.env.BASE_URL would come out
      // as "/repo-name" and string-concat code like `${BASE_URL}resume.pdf` would
      // 
       // produce "/repo-nameresume.pdf". Force a trailing slash here.
const rawBase = process.env.PAGES_BASE_PATH || '/';
const base = rawBase.endsWith('/') ? rawBase : rawBase + '/';

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
