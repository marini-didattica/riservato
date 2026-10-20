// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/docuz-sara-maria/simulazione-1/le-tue-risposte/correzione.typ /tmp/docuz-sara-maria.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento

#set document(title: "Correzione — Simulazione 1 — Sara Maria Docuz", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Sara Maria Docuz", 6.5, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#risposta(none, category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 0)

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 0)

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)[
    #raw(read("esercizio01_py"), block: true, lang: "python")
  ]
  #commento("Controlla n % 2 invece di i % 2: non conta i pari dell'intervallo. Con n = 7 stampa 0.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)[
    #raw(read("esercizio02_py"), block: true, lang: "python")
  ]
  #commento("Il ciclo non incrementa i e non stampa nulla: va in ciclo infinito.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)[
    #raw(read("esercizio03_py"), block: true, lang: "python")
  ]
  #commento("Usa len[l] invece di len(l) e non produce l'output richiesto: il programma non è eseguibile.")
]

#v(1.1em)


= Lettura del codice (30 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Primo frammento], points: 10, score: 3, diff: 2)[
    #raw(read("snippet01_txt"), block: true, lang: "text")
  ]
  #commento("Intuisce lo scorrimento della lista, ma sbaglia la condizione (i <= 0 invece di i >= 0) e non riporta l'output.")
]

#v(1.1em)

#risposta(category: "S", tag: "Snippet", title: [Secondo frammento], points: 10, score: 0, diff: 2)[
  #raw(read("snippet02_txt.txt"), block: true, lang: "text")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "S", tag: "Snippet", title: [Terzo frammento], points: 10, score: 3.5, diff: 2)[
    #raw(read("snippet03_txt"), block: true, lang: "text")
  ]
  #commento("Comprende il ruolo di % e dei numeri pari, ma non riporta l'output e parla di conteggio invece di stampa.")
]

#v(1.1em)
