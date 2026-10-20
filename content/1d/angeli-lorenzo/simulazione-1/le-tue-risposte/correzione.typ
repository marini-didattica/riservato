// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/angeli-lorenzo/simulazione-1/le-tue-risposte/correzione.typ /tmp/angeli-lorenzo.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento, griglia-correzione

#set document(title: "Correzione — Simulazione 1 — Lorenzo Angeli", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Lorenzo Angeli", 7.5, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 4.5)[
    #raw(read("domande_teoria.txt").slice(read("domande_teoria.txt").position("Domanda 1"), read("domande_teoria.txt").position("DOMANDA 2")), block: true, lang: "text")
  ]
  #commento("Elenca quattro componenti (RAM, disco rigido, CPU, ventole) con scopi essenziali; ne manca almeno una per raggiungere il minimo di cinque.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
    #raw(read("domande_teoria.txt").slice(read("domande_teoria.txt").position("DOMANDA 2"), read("domande_teoria.txt").position("Domanda 3")), block: true, lang: "text")
  ]
  #commento("Accenna a sequenze di 0 e 1 e alle lettere/parole, ma non spiega come si rappresentano i numeri né il ruolo dei byte.")
]

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)[
    #raw(read("es1.py"), block: true, lang: "python")
  ]
  #commento("Stampa i numeri pari uno per uno invece di contare quanti sono; inoltre i = i + 1 è fuori dal ciclo, quindi il programma non termina.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 0, diff: 2)[
    #raw(read("es2.py"), block: true, lang: "python")
  ]
  #commento("Il ciclo non stampa nulla e i non viene incrementato: il programma non produce l'output richiesto.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Tutti dentro l'intervallo], points: 30, score: 0, diff: 3)[
    #raw(read("es3.py"), block: true, lang: "python")
  ]
  #commento("Confronta la lista l con un intero (l > 1), operazione non valida in Python: il programma dà TypeError.")
]

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
