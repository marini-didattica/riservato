// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/valentinelli-aurora/simulazione-1/le-tue-risposte/correzione.typ /tmp/valentinelli-aurora.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento

#set document(title: "Correzione — Simulazione 1 — Aurora Valentinelli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Aurora Valentinelli", 47.5, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 2.5)[
    #raw(read("domanda01.txt"), block: true, lang: "text")
  ]
  #commento("Elenca cinque nomi, ma quasi tutti senza scopo; la risposta è solo un elenco.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 5)[
    #raw(read("domanda02.txt"), block: true, lang: "text")
  ]
  #commento("Buona: binario, combinazioni e distinzione tra numeri e caratteri.")
]

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
    #raw(read("esercizio01.py"), block: true, lang: "python")
  ]
  #commento("Corretto e generale: conta i pari da 0 a n inclusi.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 12, diff: 2)[
    #raw(read("esercizio02.py"), block: true, lang: "python")
  ]
  #commento("Esclude n dal ciclo (i < n): per n = 10 stampa 45 invece di 55.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)[
    #raw(read("esercizio03.py"), block: true, lang: "python")
  ]
  #commento("Il ciclo non incrementa a e va in ciclo infinito; inoltre la logica non verifica gli elementi della lista.")
]

#v(1.1em)


= Lettura del codice (30 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 2, diff: 2)[
    #raw(read("snippet01.txt"), block: true, lang: "text")
  ]
  #commento("Riporta solo l'output 9, incompleto: mancano 1, 7 e 3 e la spiegazione.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 8, diff: 2)[
    #raw(read("snippet02.txt"), block: true, lang: "text")
  ]
  #commento("Output corretto (8 5) e scopo dello scambio individuato, ma senza spiegare i passaggi.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 8, diff: 2)[
    #raw(read("snippet03.txt"), block: true, lang: "text")
  ]
  #commento("Output corretto (0, 2, 4, 6, 8, 10) e scopo individuato, ma senza spiegare i passaggi.")
]

#v(1.1em)
