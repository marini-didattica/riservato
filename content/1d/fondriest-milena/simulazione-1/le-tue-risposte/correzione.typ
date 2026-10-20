// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/fondriest-milena/simulazione-1/le-tue-risposte/correzione.typ /tmp/fondriest-milena.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento

#set document(title: "Correzione — Simulazione 1 — Milena Fondriest", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Milena Fondriest", 11, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 6)[
    #raw(read("domanda1.txt"), block: true, lang: "text")
  ]
  #commento("Elenca cinque componenti con scopi brevi e corretti; sufficiente.")
]

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 5, diff: 1)[
    #raw(read("es1.py"), block: true, lang: "python")
  ]
  #commento("Conta i pari, ma stampa dentro il ciclo i valori cumulativi 1, 2, 3, 4 invece del solo risultato finale 4.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)[
    #raw(read("es2.py"), block: true, lang: "python")
  ]
  #commento("Non somma (somma = somma) e i = i + i lascia i = 0: il ciclo non termina e non stampa nulla.")
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
