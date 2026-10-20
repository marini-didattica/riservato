// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/quatrale-lorenzo/simulazione-1/le-tue-risposte/correzione.typ /tmp/quatrale-lorenzo.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento, griglia-correzione

#set document(title: "Correzione — Simulazione 1 — Lorenzo Quatrale", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Lorenzo Quatrale", 4, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 3)[
    #raw(read("Untitled-1.txt"), block: true, lang: "text")
  ]
  #commento("Elenca cinque voci, ma confonde RAM e ROM e considera l'hardware come componente; i ruoli sono imprecisi.")
]

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 1, diff: 1)[
    #raw(read("Es1.py"), block: true, lang: "python")
  ]
  #commento("Usa n/2 invece di n % 2: non riconosce i pari e stampa 1.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)[
    #raw(read("es2.py"), block: true, lang: "python")
  ]
  #commento("Il ciclo incrementa n ma non calcola né stampa la somma.")
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
