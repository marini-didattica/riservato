// @ts-check
import tailwindcss from '@tailwindcss/vite';
import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  // Deployed as a GitHub Pages project site at
  // https://marini-didattica.github.io/riservato/
  site: 'https://marini-didattica.github.io',
  base: '/riservato',
  trailingSlash: 'always',
  vite: {
    plugins: [tailwindcss()],
  },
});
