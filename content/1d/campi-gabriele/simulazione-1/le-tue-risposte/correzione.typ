// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/campi-gabriele/simulazione-1/le-tue-risposte/correzione.typ /tmp/campi-gabriele.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento, griglia-correzione

#set document(title: "Correzione — Simulazione 1 — Gabriele Campi", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Gabriele Campi", 53.5, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 6.5)[
    #raw(read("esercizio1.txt.txt"), block: true, lang: "text")
  ]
  #commento("Elenca cinque componenti con scopi pertinenti; qualche imprecisione sulle RAM e sul dissipatore, ma la risposta è completa.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
    #raw(read("esercizio2.txt.txt"), block: true, lang: "text")
  ]
  #commento("Descrive solo la codifica dei caratteri; non spiega come vengono immagazzinati i numeri.")
]

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 5, diff: 1)[
    #raw(read("esercizio4.py"), block: true, lang: "python")
  ]
  #commento("La logica è corretta, ma la lista è fissa (0..7) e n non viene usato: funziona solo con l'input del template.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 12, diff: 2)[
    #raw(read("esercizio5.py"), block: true, lang: "python")
  ]
  #commento("La somma è corretta, ma la lista è fissa (0..10): il programma non è generale rispetto a n.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 15, diff: 3)[
    #raw(read("esercizio6.py"), block: true, lang: "python")
  ]
  #commento("Scandisce la lista, ma usa valori fissi e non gestisce il caso a > b: con gli estremi invertiti dà il risultato sbagliato.")
]

#v(1.1em)


= Lettura del codice (30 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 10, diff: 2)[
    #raw(read("esercizio7.txt.txt"), block: true, lang: "text")
  ]
  #commento("Spiega correttamente lo scorrimento al contrario e riporta l'output completo 9, 1, 7, 3.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 2, diff: 2)[
    #raw(read("esercizio8.txt.txt"), block: true, lang: "text")
  ]
  #commento("L'output corretto è 8 5, non 8 8: lo scambio tramite c non è stato compreso.")
]

#v(1.1em)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

#v(1.1em)


= Riepilogo dei punteggi

#griglia-correzione()
