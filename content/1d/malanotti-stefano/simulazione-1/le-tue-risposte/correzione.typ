// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/malanotti-stefano/simulazione-1/le-tue-risposte/correzione.typ /tmp/malanotti-stefano.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento, griglia-correzione

#set document(title: "Correzione — Simulazione 1 — Stefano Malanotti", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Stefano Malanotti", 22, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 5)[
    #raw(read("domanda01.txt"), block: true, lang: "text")
  ]
  #commento("Elenca cinque componenti, ma usa CAM al posto di RAM e ha qualche imprecisione; i ruoli sono complessivamente chiari.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 5)[
    #raw(read("domanda02.txt"), block: true, lang: "text")
  ]
  #commento("Discreta: cita binario, byte e caratteri; manca un accenno alla virgola mobile e alla codifica dei caratteri.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 2)[
    #raw(read("domanda03.txt"), block: true, lang: "text")
  ]
  #commento("Confusa: descrive un'istruzione come una lista di codici, ma non definisce l'instruction set.")
]

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
    #raw(read("esercizio01.py"), block: true, lang: "python")
  ]
  #commento("Corretto e generale: conta i pari da 0 a n inclusi.")
]

#v(1.1em)

#risposta(none, category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)

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
