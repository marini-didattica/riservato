# Riservato

Area riservata del sito **Marini didattica**: un piccolo sito Astro che pubblica
materiale didattico in sola lettura, organizzato per studente e accessibile
tramite codice.

L'applicazione è deployata come GitHub Pages project site:

```text
https://marini-didattica.github.io/riservato/
```

## Sviluppo

```sh
bun install
bun run dev      # http://localhost:4321/riservato/
bun run build    # genera dist/
bun run preview  # anteprima della build
```

## Struttura

```text
src/
├── components/   # componenti Astro condivisi
├── layouts/      # BaseLayout e PageLayout
├── pages/        # pagine del sito
├── styles/       # design tokens e stili globali
└── utils/        # helper (base path, classi)
```

Il tema riprende il design system di
[marini-didattica.github.io](https://marini-didattica.github.io): stessi colori
OKLCH, font Inter, spaziature, bordi e comportamento dark mode. Il tema scuro è
condiviso tra i due siti tramite il cookie `theme` sul dominio comune.
