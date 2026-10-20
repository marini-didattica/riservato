// Compile from the riservato repository root, writing the PDF outside content/:
// typst compile --root . content/1d/rosati-martino/simulazione-1/le-tue-risposte/correzione.typ /tmp/rosati-martino.pdf

#import "../../../../typst-theme/src/lib.typ": theme
#import "../../../../typst-components/src/lib.typ": intestazione-correzione, risposta, commento

#set document(title: "Correzione — Simulazione 1 — Martino Rosati", author: "Marini Mattia")
#show: doc => theme(doc, footer-text: "Correzione — Simulazione 1")

#intestazione-correzione("Martino Rosati", 9.5, title: "Correzione — Simulazione 1", subtitle: "Classe 1D · 20 ottobre 2026")

#v(0.7em)
#text(size: 9.5pt, fill: luma(100), style: "italic")[
  La prova vale 110 punti: i primi 100 determinano il voto in decimi
  (`min(totale, 100) / 10`), i successivi 10 valgono la lode.
]

= Teoria (20 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Le componenti di un computer], points: 7, score: 5)[
    #raw(read("domanda1.txt"), block: true, lang: "text")
  ]
  #commento("Elenca cinque componenti con scopi in parte imprecisi; la memoria è descritta in modo vago.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Numeri, caratteri e parole], points: 8, score: 2)[
    #raw(read("domanda2.txt"), block: true, lang: "text")
  ]
  #commento("Si limita a byte e codice binario; non spiega caratteri e parole.")
]

#v(1.1em)

#block(breakable: false, width: 100%)[
  #risposta(category: "D", tag: "Domanda", title: [Istruzioni e instruction set], points: 5, score: 2.5)[
    #raw(read("domanda3.txt"), block: true, lang: "text")
  ]
  #commento("Dà una definizione parziale di istruzione e confonde l'instruction set con il codice finale.")
]

#v(1.1em)


= Scrittura del codice (60 punti)

#block(breakable: false, width: 100%)[
  #risposta(category: "E", tag: "Esercizio", title: [Conta i numeri pari], points: 10, score: 0, diff: 1)[
    #raw(read("es1.py"), block: true, lang: "python")
  ]
  #commento("Il codice ha errori di sintassi (if i+1==[...], elif: senza condizione) e non è eseguibile.")
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
