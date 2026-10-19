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

Il materiale vive in `content/<cartella>/`. Il file `students.json` descrive
ogni area riservata: la chiave è la cartella sotto `content/`, mentre il valore
contiene i dati dello studente e il codice di accesso.

```json
{
  "esempio": {
    "slug": "PRV23456",
    "owner": "Billy Jane",
    "owner-slug": "billy-jane"
  }
}
```

- `slug` è il codice di accesso usato nell'URL dell'esploratore.
- `owner` è il nome completo mostrato nella pagina.
- `owner-slug` è la versione abbreviata mostrata nel breadcrumb.

I codici sono 8 caratteri tra `A-Z` e `2-9`, senza `I`, `O`, `0` e `1`. Devono
restare stabili: cambiarli invalida i link già distribuiti. Anche gli
`owner-slug` devono essere unici e usare solo lettere minuscole, numeri e
trattini.

Il comando `bun run content:build` valida `students.json` e copia i file
pubblicabili in `public/files/<cartella>/`. La build di Astro genera poi una
pagina per ogni cartella:

```text
/riservato/PRV23456/
/riservato/PRV23456/esercizi/
/riservato/files/esempio/esercizi/istruzioni.txt
```

Le estensioni servibili sono elencate in `scripts/build-content.ts`. I sorgenti
`.typ` e `.tex`, i file temporanei di LaTeX e i file che possono essere eseguiti
nel browser (`.html`, `.js`) non vengono pubblicati.

Ogni pagina di cartella include un pulsante **Scarica tutto** / **Scarica
cartella**. Il download viene creato nel browser: la pagina scarica i file della
cartella e li comprime in un archivio ZIP al momento del click. In questo modo
non ci sono ZIP duplicati nel deployment di GitHub Pages e il limite di spazio
del sito resta quello dei file originali.

La voce `esempio` in `students.json` e la cartella `content/esempio/` sono solo
una demo: puoi rimuoverle quando carichi il materiale reale.

## Deploy

Ogni push su `main` avvia `.github/workflows/deploy.yml`, che:

1. installa le dipendenze con Bun;
2. esegue `bun run build` (validazione di `students.json`, staging dei file, build Astro);
3. pubblica `dist/` su GitHub Pages.

Il sito è raggiungibile su
[marini-didattica.github.io/riservato](https://marini-didattica.github.io/riservato/).

## Struttura

```text
content/         # materiale sorgente, una cartella per studente
students.json    # cartella -> dati studente e codice di accesso
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
