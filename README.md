# Riservato

Area riservata del sito **Marini didattica**: un piccolo sito Astro che pubblica
materiale didattico in sola lettura, organizzato per studente e accessibile
tramite codice.

La pagina di accesso vive nel sito principale, nella sezione
[Area riservata](https://marini-didattica.github.io/area-riservata/). Questo
repository pubblica l'esploratore dei file e il materiale vero e proprio.

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

## Materiale e codici

Il materiale vive in `content/<cartella>/`. Il file `manifest.json` associa ogni
codice alla cartella corrispondente:

```json
{
  "PRV23456": "esempio"
}
```

I codici sono 8 caratteri tra `A-Z` e `2-9`, senza `I`, `O`, `0` e `1`. Devono
restare stabili: cambiarli invalida i link già distribuiti.

Il comando `bun run content:build` valida il manifest e copia i file pubblicabili
in `public/files/<cartella>/`. La build di Astro genera poi una pagina per ogni
cartella:

```text
/riservato/PRV23456/
/riservato/PRV23456/esercizi/
/riservato/files/esempio/esercizi/istruzioni.txt
```

Le estensioni servibili sono elencate in `scripts/build-content.ts`. I sorgenti
`.typ` e `.tex`, i file temporanei di LaTeX e i file che possono essere eseguiti
nel browser (`.html`, `.js`) non vengono pubblicati.

La cartella `content/esempio/` e la voce `PRV23456` sono solo una demo: puoi
rimuoverle quando carichi il materiale reale.

## Deploy

Ogni push su `main` avvia `.github/workflows/deploy.yml`, che:

1. installa le dipendenze con Bun;
2. esegue `bun run build` (validazione del manifest, staging dei file, build Astro);
3. pubblica `dist/` su GitHub Pages.

Il sito è raggiungibile su
[marini-didattica.github.io/riservato](https://marini-didattica.github.io/riservato/).

## Struttura

```text
content/         # materiale sorgente, una cartella per studente
manifest.json    # codice -> cartella
scripts/         # validazione e staging del contenuto
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
