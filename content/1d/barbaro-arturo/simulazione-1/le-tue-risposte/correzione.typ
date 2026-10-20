// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/barbaro-arturo/simulazione-1/le-tue-risposte/correzione.typ /tmp/barbaro-arturo.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento, griglia-correzione

#set document(title: "Correzione — Simulazione 1 — Arturo Barbaro", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Arturo Barbaro", 41, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 7)[
    #raw(read("domanda1.txt"), block: true, lang: "text")
  ]
  #commento("Elenca sei componenti con scopi corretti; buona la distinzione tra CPU e GPU.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
    #raw(read("domanda2.txt"), block: true, lang: "text")
  ]
  #commento("Cita byte e codice binario, ma la parte su caratteri e parole è confusa e non spiega la codifica (es. ASCII/Unicode).")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 2)[
    #raw(read("domanda3.txt"), block: true, lang: "text")
  ]
  #commento("Definizione molto sintetica: l'istruzione è un comando, ma mancano la rappresentazione binaria e la definizione di instruction set.")
]

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 9, diff: 1)[
    #raw(read("es1.py"), block: true, lang: "python")
  ]
  #commento("La formula è corretta per il conteggio, ma con n dispari stampa un numero con la virgola (4.0) invece di un intero.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 20, diff: 2)[
    #raw(read("es2.py"), block: true, lang: "python")
  ]
  #commento("Corretto e generale: somma gli interi da 1 a n, che equivale a sommare da 0 a n.")
]

#v(1.1em)

#risposta(none, category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)

#v(1.1em)


= Lettura del codice (30 punti)

#risposta(none, category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 0, diff: 2)

#v(1.1em)

#risposta(none, category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)

#v(1.1em)

#risposta(none, category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 0, diff: 2)

#v(1.1em)


= Riepilogo dei punteggi

#griglia-correzione()
