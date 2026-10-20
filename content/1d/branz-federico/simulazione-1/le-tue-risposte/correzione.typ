// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/branz-federico/simulazione-1/le-tue-risposte/correzione.typ /tmp/branz-federico.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento

#set document(title: "Correzione — Simulazione 1 — Federico Branz", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Federico Branz", 39.5, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 6.5)[
    #raw(read("esercizi_teoria_1_2_3.txt").slice(read("esercizi_teoria_1_2_3.txt").position("1. PROCESSORE"), read("esercizi_teoria_1_2_3.txt").position("2. Vengono")), block: true, lang: "text")
  ]
  #commento("Elenca cinque componenti con scopi validi; la scheda madre è descritta come cervello, ma il ruolo di coordinamento è accettabile.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 3)[
    #raw(read("esercizi_teoria_1_2_3.txt").slice(read("esercizi_teoria_1_2_3.txt").position("2. Vengono"), read("esercizi_teoria_1_2_3.txt").position("3.")), block: true, lang: "text")
  ]
  #commento("Confonde la rappresentazione binaria con una disposizione in liste e tabelle numerate; la parte su caratteri e parole è accettabile.")
]

#v(1.1em)

#risposta(none, category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 0)

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 10, diff: 1)[
    #raw(read("es1.py"), block: true, lang: "python")
  ]
  #commento("Corretto e generale: conta i pari da 0 a n inclusi.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [La somma da 0 a n], points: 20, score: 20, diff: 2)[
    #raw(read("es2.py"), block: true, lang: "python")
  ]
  #commento("Corretto e generale: somma da 1 a n, quindi anche lo 0 non cambia il risultato.")
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
